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


#include <skiboot.h>
#include <lock.h>
#include <rtc.h>
#include <timebase.h>

static struct lock rtc_tod_lock = LOCK_UNLOCKED;

static struct {
	struct tm	tm;
	unsigned long	tb;
	bool		valid;
} rtc_tod_cache;

void rtc_cache_update(struct tm *tm)
{
	lock(&rtc_tod_lock);
	rtc_tod_cache.tb = mftb();
	rtc_tod_cache.tm = *tm;
	rtc_tod_cache.valid = true;
	unlock(&rtc_tod_lock);
}

int rtc_cache_get(struct tm *tm)
{
	unsigned long cache_age_sec;

	lock(&rtc_tod_lock);

	if (!rtc_tod_cache.valid) {
		unlock(&rtc_tod_lock);
		return -1;
	}

	cache_age_sec = tb_to_msecs(mftb() - rtc_tod_cache.tb) / 1000;
	*tm = rtc_tod_cache.tm;
	unlock(&rtc_tod_lock);

	tm->tm_sec += cache_age_sec;
	mktime(tm);

	return 0;
}

int rtc_cache_get_datetime(uint32_t *year_month_day,
		uint64_t *hour_minute_second_millisecond)
{
	struct tm tm;

	if (rtc_cache_get(&tm) < 0)
		return -1;

	tm_to_datetime(&tm, year_month_day, hour_minute_second_millisecond);

	return 0;
}
