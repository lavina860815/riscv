// SPDX-License-Identifier: MIT
/*
 * Copyright (C) 2016 The Android Open Source Project
 */

#include "avb_footer.h"
#include "avb_util.h"

bool avb_footer_validate_and_byteswap(const AvbFooter* src, AvbFooter* dest) {
  avb_memcpy(dest, src, sizeof(AvbFooter));

  dest->version_major = avb_be32toh(dest->version_major);
  dest->version_minor = avb_be32toh(dest->version_minor);

  dest->original_image_size = avb_be64toh(dest->original_image_size);
  dest->vbmeta_offset = avb_be64toh(dest->vbmeta_offset);
  dest->vbmeta_size = avb_be64toh(dest->vbmeta_size);

  /* Check that magic is correct. */
  if (avb_safe_memcmp(dest->magic, AVB_FOOTER_MAGIC, AVB_FOOTER_MAGIC_LEN) !=
      0) {
    avb_error("Footer magic is incorrect.\n");
    return false;
  }

  /* Ensure we don't attempt to access any fields if the footer major
   * version is not supported.
   */
  if (dest->version_major > AVB_FOOTER_VERSION_MAJOR) {
    avb_error("No support for footer version.\n");
    return false;
  }

  return true;
}
