/* Copyright 2013-2014 IBM Corp.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * 	http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
 * implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <stdlib.h>
#include <string.h>
#include <ipmi.h>
#include <time.h>
#include <time-utils.h>
#include <device.h>
#include <opal.h>
#include <rtc.h>

static enum {idle, waiting, updated, error} time_status;

static void get_sel_time_error(struct ipmi_msg *msg)
{
	time_status = error;
	ipmi_free_msg(msg);
}

static void get_sel_time_complete(struct ipmi_msg *msg)
{
	struct tm tm;
	le32 result;
	time_t time;

	memcpy(&result, msg->data, 4);
	time = le32_to_cpu(result);
	gmtime_r(&time, &tm);
	rtc_cache_update(&tm);
	time_status = updated;
	ipmi_free_msg(msg);
}

static int64_t ipmi_get_sel_time(void)
{
	struct ipmi_msg *msg;

	msg = ipmi_mkmsg(IPMI_DEFAULT_INTERFACE, IPMI_GET_SEL_TIME,
			 get_sel_time_complete, NULL, NULL, 0, 4);
	if (!msg)
		return OPAL_HARDWARE;

	msg->error = get_sel_time_error;

	return ipmi_queue_msg(msg);
}

static int64_t ipmi_set_sel_time(uint32_t _tv)
{
	struct ipmi_msg *msg;
	const le32 tv = cpu_to_le32(_tv);

	msg = ipmi_mkmsg_simple(IPMI_SET_SEL_TIME, (void*)&tv, sizeof(tv));
	if (!msg)
		return OPAL_HARDWARE;

	return ipmi_queue_msg(msg);
}

static int64_t ipmi_opal_rtc_read(uint32_t *y_m_d,
				 uint64_t *h_m_s_m)
{
	int ret = 0;

	if (!y_m_d || !h_m_s_m)
		return OPAL_PARAMETER;

	switch(time_status) {
	case idle:
		if (ipmi_get_sel_time() < 0)
			return OPAL_HARDWARE;
		time_status = waiting;
		ret = OPAL_BUSY_EVENT;
		break;

	case waiting:
		ret = OPAL_BUSY_EVENT;
		break;

	case updated:
		rtc_cache_get_datetime(y_m_d, h_m_s_m);
		time_status = idle;
		ret = OPAL_SUCCESS;
		break;

	case error:
		time_status = idle;
		ret = OPAL_HARDWARE;
		break;
	}

	return ret;
}

static int64_t ipmi_opal_rtc_write(uint32_t year_month_day,
				  uint64_t hour_minute_second_millisecond)
{
	time_t t;
	struct tm tm;

	datetime_to_tm(year_month_day, hour_minute_second_millisecond, &tm);
	t = mktime(&tm);
	if (ipmi_set_sel_time(t))
		return OPAL_HARDWARE;

	return OPAL_SUCCESS;
}

void ipmi_rtc_init(void)
{
	struct dt_node *np = dt_new(opal_node, "rtc");
	dt_add_property_strings(np, "compatible", "ibm,opal-rtc");

	opal_register(OPAL_RTC_READ, ipmi_opal_rtc_read, 2);
	opal_register(OPAL_RTC_WRITE, ipmi_opal_rtc_write, 2);

	/* Initialise the rtc cache */
	ipmi_get_sel_time();
}
