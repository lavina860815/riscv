/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * Copyright (C) 2012 Samsung Electronics
 * R. Chandrasekar < rcsekar@samsung.com>
 */

#ifndef __SOUND_H__
#define __SOUND_H__

/* sound codec enum */
enum sound_compat {
	AUDIO_COMPAT_SPI,
	AUDIO_COMPAT_I2C,
};

/* Codec information structure to store the info from device tree */
struct sound_codec_info {
	int i2c_bus;
	int i2c_dev_addr;
};

/**
 * struct sound_uc_priv - private uclass information about each sound device
 *
 * This is used to line the codec and i2s together
 *
 * @codec: Codec that is used for this sound device
 * @i2s: I2S bus that is used for this sound device
 * @setup_done: true if setup() has been called
 */
struct sound_uc_priv {
	struct udevice *codec;
	struct udevice *i2s;
	int setup_done;
};

/**
 * Generates square wave sound data for 1 second
 *
 * @sample_rate: Sample rate in Hz
 * @data: data buffer pointer
 * @size: size of the buffer in bytes
 * @freq: frequency of the wave
 * @channels: Number of channels to use
 */
void sound_create_square_wave(uint sample_rate, unsigned short *data, int size,
			      uint freq, uint channels);

/*
 * The sound uclass brings together a data transport (currently only I2C) and a
 * codec (currently connected over I2C).
 */

/* Operations for sound */
struct sound_ops {
	/**
	 * setup() - Set up to play a sound
	 */
	int (*setup)(struct udevice *dev);

	/**
	 * play() - Play a beep
	 *
	 * @dev: Sound device
	 * @data: Data buffer to play
	 * @data_size: Size of data buffer in bytes
	 * @return 0 if OK, -ve on error
	 */
	int (*play)(struct udevice *dev, void *data, uint data_size);
};

#define sound_get_ops(dev)	((struct sound_ops *)(dev)->driver->ops)

/**
 * setup() - Set up to play a sound
 */
int sound_setup(struct udevice *dev);

/**
 * play() - Play a beep
 *
 * @dev: Sound device
 * @msecs: Duration of beep in milliseconds
 * @frequency_hz: Frequency of the beep in Hertz
 * @return 0 if OK, -ve on error
 */
int sound_beep(struct udevice *dev, int msecs, int frequency_hz);

/**
 * sound_find_codec_i2s() - Called by sound drivers to locate codec and i2s
 *
 * This finds the audio codec and i2s devices and puts them in the uclass's
 * private data for this device.
 */
int sound_find_codec_i2s(struct udevice *dev);

#endif  /* __SOUND__H__ */
