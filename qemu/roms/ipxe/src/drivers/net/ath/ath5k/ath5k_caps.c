/*
 * Copyright (c) 2004-2008 Reyk Floeter <reyk@openbsd.org>
 * Copyright (c) 2006-2008 Nick Kossifidis <mickflemm@gmail.com>
 * Copyright (c) 2007-2008 Jiri Slaby <jirislaby@gmail.com>
 *
 * Lightly modified for iPXE, July 2009, by Joshua Oreman <oremanj@rwcr.net>.
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 */

FILE_LICENCE ( MIT );

/**************\
* Capabilities *
\**************/

#include "ath5k.h"
#include "reg.h"
#include "base.h"

/*
 * Fill the capabilities struct
 * TODO: Merge this with EEPROM code when we are done with it
 */
int ath5k_hw_set_capabilities(struct ath5k_hw *ah)
{
	u16 ee_header;

	/* Capabilities stored in the EEPROM */
	ee_header = ah->ah_capabilities.cap_eeprom.ee_header;

	if (ah->ah_version == AR5K_AR5210) {
		/*
		 * Set radio capabilities
		 * (The AR5110 only supports the middle 5GHz band)
		 */
		ah->ah_capabilities.cap_range.range_5ghz_min = 5120;
		ah->ah_capabilities.cap_range.range_5ghz_max = 5430;
		ah->ah_capabilities.cap_range.range_2ghz_min = 0;
		ah->ah_capabilities.cap_range.range_2ghz_max = 0;

		/* Set supported modes */
		ah->ah_capabilities.cap_mode |= AR5K_MODE_BIT_11A;
		ah->ah_capabilities.cap_mode |= AR5K_MODE_BIT_11A_TURBO;
	} else {
		/*
		 * XXX The tranceiver supports frequencies from 4920 to 6100GHz
		 * XXX and from 2312 to 2732GHz. There are problems with the
		 * XXX current ieee80211 implementation because the IEEE
		 * XXX channel mapping does not support negative channel
		 * XXX numbers (2312MHz is channel -19). Of course, this
		 * XXX doesn't matter because these channels are out of range
		 * XXX but some regulation domains like MKK (Japan) will
		 * XXX support frequencies somewhere around 4.8GHz.
		 */

		/*
		 * Set radio capabilities
		 */

		if (AR5K_EEPROM_HDR_11A(ee_header)) {
			/* 4920 */
			ah->ah_capabilities.cap_range.range_5ghz_min = 5005;
			ah->ah_capabilities.cap_range.range_5ghz_max = 6100;

			/* Set supported modes */
			ah->ah_capabilities.cap_mode |= AR5K_MODE_BIT_11A;
			ah->ah_capabilities.cap_mode |= AR5K_MODE_BIT_11A_TURBO;
			if (ah->ah_version == AR5K_AR5212)
				ah->ah_capabilities.cap_mode |=
					AR5K_MODE_BIT_11G_TURBO;
		}

		/* Enable  802.11b if a 2GHz capable radio (2111/5112) is
		 * connected */
		if (AR5K_EEPROM_HDR_11B(ee_header) ||
		    (AR5K_EEPROM_HDR_11G(ee_header) &&
		     ah->ah_version != AR5K_AR5211)) {
			/* 2312 */
			ah->ah_capabilities.cap_range.range_2ghz_min = 2412;
			ah->ah_capabilities.cap_range.range_2ghz_max = 2732;

			if (AR5K_EEPROM_HDR_11B(ee_header))
				ah->ah_capabilities.cap_mode |=
					AR5K_MODE_BIT_11B;

			if (AR5K_EEPROM_HDR_11G(ee_header) &&
			    ah->ah_version != AR5K_AR5211)
				ah->ah_capabilities.cap_mode |=
					AR5K_MODE_BIT_11G;
		}
	}

	/* GPIO */
	ah->ah_gpio_npins = AR5K_NUM_GPIO;

	/* Set number of supported TX queues */
	ah->ah_capabilities.cap_queues.q_tx_num = 1;

	return 0;
}

/* Main function used by the driver part to check caps */
int ath5k_hw_get_capability(struct ath5k_hw *ah,
		enum ath5k_capability_type cap_type,
		u32 capability __unused, u32 *result)
{
	switch (cap_type) {
	case AR5K_CAP_NUM_TXQUEUES:
		if (result) {
			*result = 1;
			goto yes;
		}
	case AR5K_CAP_VEOL:
		goto yes;
	case AR5K_CAP_COMPRESSION:
		if (ah->ah_version == AR5K_AR5212)
			goto yes;
		else
			goto no;
	case AR5K_CAP_BURST:
		goto yes;
	case AR5K_CAP_TPC:
		goto yes;
	case AR5K_CAP_BSSIDMASK:
		if (ah->ah_version == AR5K_AR5212)
			goto yes;
		else
			goto no;
	case AR5K_CAP_XR:
		if (ah->ah_version == AR5K_AR5212)
			goto yes;
		else
			goto no;
	default:
		goto no;
	}

no:
	return -EINVAL;
yes:
	return 0;
}
