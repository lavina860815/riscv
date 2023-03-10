/* -*- mode: c; c-basic-offset: 4; indent-tabs-mode: nil -*- */
/*
 * Please do not edit this file.
 * It was generated using rpcgen.
 */

#include "iprop.h"
#ifdef __GNUC__
#pragma GCC diagnostic ignored "-Wunused-variable"
#endif

static bool_t
xdr_int16_t (XDR *xdrs, int16_t *objp)
{
    int32_t *buf;

    if (!xdr_short (xdrs, objp))
        return FALSE;
    return TRUE;
}

static bool_t
xdr_int32_t (XDR *xdrs, int32_t *objp)
{
    int32_t *buf;

    if (!xdr_int (xdrs, objp))
        return FALSE;
    return TRUE;
}

static bool_t
xdr_uint32_t (XDR *xdrs, uint32_t *objp)
{
    int32_t *buf;

    if (!xdr_u_int (xdrs, objp))
        return FALSE;
    return TRUE;
}

bool_t
xdr_utf8str_t (XDR *xdrs, utf8str_t *objp)
{
    int32_t *buf;

    if (!xdr_bytes (xdrs, (char **)&objp->utf8str_t_val, (u_int *) &objp->utf8str_t_len, ~0))
        return FALSE;
    return TRUE;
}

bool_t
xdr_kdb_sno_t (XDR *xdrs, kdb_sno_t *objp)
{
    int32_t *buf;

    if (!xdr_uint32_t (xdrs, objp))
        return FALSE;
    return TRUE;
}

bool_t
xdr_kdbe_time_t (XDR *xdrs, kdbe_time_t *objp)
{
    int32_t *buf;

    if (!xdr_uint32_t (xdrs, &objp->seconds))
        return FALSE;
    if (!xdr_uint32_t (xdrs, &objp->useconds))
        return FALSE;
    return TRUE;
}

bool_t
xdr_kdbe_key_t (XDR *xdrs, kdbe_key_t *objp)
{
    int32_t *buf;

    if (!xdr_int32_t (xdrs, &objp->k_ver))
        return FALSE;
    if (!xdr_int32_t (xdrs, &objp->k_kvno))
        return FALSE;
    if (!xdr_array (xdrs, (char **)&objp->k_enctype.k_enctype_val, (u_int *) &objp->k_enctype.k_enctype_len, ~0,
                    sizeof (int32_t), (xdrproc_t) xdr_int32_t))
        return FALSE;
    if (!xdr_array (xdrs, (char **)&objp->k_contents.k_contents_val, (u_int *) &objp->k_contents.k_contents_len, ~0,
                    sizeof (utf8str_t), (xdrproc_t) xdr_utf8str_t))
        return FALSE;
    return TRUE;
}

bool_t
xdr_kdbe_data_t (XDR *xdrs, kdbe_data_t *objp)
{
    int32_t *buf;

    if (!xdr_int32_t (xdrs, &objp->k_magic))
        return FALSE;
    if (!xdr_utf8str_t (xdrs, &objp->k_data))
        return FALSE;
    return TRUE;
}

bool_t
xdr_kdbe_princ_t (XDR *xdrs, kdbe_princ_t *objp)
{
    int32_t *buf;

    if (!xdr_utf8str_t (xdrs, &objp->k_realm))
        return FALSE;
    if (!xdr_array (xdrs, (char **)&objp->k_components.k_components_val, (u_int *) &objp->k_components.k_components_len, ~0,
                    sizeof (kdbe_data_t), (xdrproc_t) xdr_kdbe_data_t))
        return FALSE;
    if (!xdr_int32_t (xdrs, &objp->k_nametype))
        return FALSE;
    return TRUE;
}

bool_t
xdr_kdbe_tl_t (XDR *xdrs, kdbe_tl_t *objp)
{
    int32_t *buf;

    if (!xdr_int16_t (xdrs, &objp->tl_type))
        return FALSE;
    if (!xdr_bytes (xdrs, (char **)&objp->tl_data.tl_data_val, (u_int *) &objp->tl_data.tl_data_len, ~0))
        return FALSE;
    return TRUE;
}

bool_t
xdr_kdbe_pw_hist_t (XDR *xdrs, kdbe_pw_hist_t *objp)
{
    int32_t *buf;

    if (!xdr_array (xdrs, (char **)&objp->kdbe_pw_hist_t_val, (u_int *) &objp->kdbe_pw_hist_t_len, ~0,
                    sizeof (kdbe_key_t), (xdrproc_t) xdr_kdbe_key_t))
        return FALSE;
    return TRUE;
}

bool_t
xdr_kdbe_attr_type_t (XDR *xdrs, kdbe_attr_type_t *objp)
{
    int32_t *buf;

    if (!xdr_enum (xdrs, (enum_t *) objp))
        return FALSE;
    return TRUE;
}

bool_t
xdr_kdbe_val_t (XDR *xdrs, kdbe_val_t *objp)
{
    int32_t *buf;

    if (!xdr_kdbe_attr_type_t (xdrs, &objp->av_type))
        return FALSE;
    switch (objp->av_type) {
    case AT_ATTRFLAGS:
        if (!xdr_uint32_t (xdrs, &objp->kdbe_val_t_u.av_attrflags))
            return FALSE;
        break;
    case AT_MAX_LIFE:
        if (!xdr_uint32_t (xdrs, &objp->kdbe_val_t_u.av_max_life))
            return FALSE;
        break;
    case AT_MAX_RENEW_LIFE:
        if (!xdr_uint32_t (xdrs, &objp->kdbe_val_t_u.av_max_renew_life))
            return FALSE;
        break;
    case AT_EXP:
        if (!xdr_uint32_t (xdrs, &objp->kdbe_val_t_u.av_exp))
            return FALSE;
        break;
    case AT_PW_EXP:
        if (!xdr_uint32_t (xdrs, &objp->kdbe_val_t_u.av_pw_exp))
            return FALSE;
        break;
    case AT_LAST_SUCCESS:
        if (!xdr_uint32_t (xdrs, &objp->kdbe_val_t_u.av_last_success))
            return FALSE;
        break;
    case AT_LAST_FAILED:
        if (!xdr_uint32_t (xdrs, &objp->kdbe_val_t_u.av_last_failed))
            return FALSE;
        break;
    case AT_FAIL_AUTH_COUNT:
        if (!xdr_uint32_t (xdrs, &objp->kdbe_val_t_u.av_fail_auth_count))
            return FALSE;
        break;
    case AT_PRINC:
        if (!xdr_kdbe_princ_t (xdrs, &objp->kdbe_val_t_u.av_princ))
            return FALSE;
        break;
    case AT_KEYDATA:
        if (!xdr_array (xdrs, (char **)&objp->kdbe_val_t_u.av_keydata.av_keydata_val, (u_int *) &objp->kdbe_val_t_u.av_keydata.av_keydata_len, ~0,
                        sizeof (kdbe_key_t), (xdrproc_t) xdr_kdbe_key_t))
            return FALSE;
        break;
    case AT_TL_DATA:
        if (!xdr_array (xdrs, (char **)&objp->kdbe_val_t_u.av_tldata.av_tldata_val, (u_int *) &objp->kdbe_val_t_u.av_tldata.av_tldata_len, ~0,
                        sizeof (kdbe_tl_t), (xdrproc_t) xdr_kdbe_tl_t))
            return FALSE;
        break;
    case AT_LEN:
        if (!xdr_int16_t (xdrs, &objp->kdbe_val_t_u.av_len))
            return FALSE;
        break;
    case AT_PW_LAST_CHANGE:
        if (!xdr_uint32_t (xdrs, &objp->kdbe_val_t_u.av_pw_last_change))
            return FALSE;
        break;
    case AT_MOD_PRINC:
        if (!xdr_kdbe_princ_t (xdrs, &objp->kdbe_val_t_u.av_mod_princ))
            return FALSE;
        break;
    case AT_MOD_TIME:
        if (!xdr_uint32_t (xdrs, &objp->kdbe_val_t_u.av_mod_time))
            return FALSE;
        break;
    case AT_MOD_WHERE:
        if (!xdr_utf8str_t (xdrs, &objp->kdbe_val_t_u.av_mod_where))
            return FALSE;
        break;
    case AT_PW_POLICY:
        if (!xdr_utf8str_t (xdrs, &objp->kdbe_val_t_u.av_pw_policy))
            return FALSE;
        break;
    case AT_PW_POLICY_SWITCH:
        if (!xdr_bool (xdrs, &objp->kdbe_val_t_u.av_pw_policy_switch))
            return FALSE;
        break;
    case AT_PW_HIST_KVNO:
        if (!xdr_uint32_t (xdrs, &objp->kdbe_val_t_u.av_pw_hist_kvno))
            return FALSE;
        break;
    case AT_PW_HIST:
        if (!xdr_array (xdrs, (char **)&objp->kdbe_val_t_u.av_pw_hist.av_pw_hist_val, (u_int *) &objp->kdbe_val_t_u.av_pw_hist.av_pw_hist_len, ~0,
                        sizeof (kdbe_pw_hist_t), (xdrproc_t) xdr_kdbe_pw_hist_t))
            return FALSE;
        break;
    default:
        if (!xdr_bytes (xdrs, (char **)&objp->kdbe_val_t_u.av_extension.av_extension_val, (u_int *) &objp->kdbe_val_t_u.av_extension.av_extension_len, ~0))
            return FALSE;
        break;
    }
    return TRUE;
}

bool_t
xdr_kdbe_t (XDR *xdrs, kdbe_t *objp)
{
    int32_t *buf;

    if (!xdr_array (xdrs, (char **)&objp->kdbe_t_val, (u_int *) &objp->kdbe_t_len, ~0,
                    sizeof (kdbe_val_t), (xdrproc_t) xdr_kdbe_val_t))
        return FALSE;
    return TRUE;
}

bool_t
xdr_kdb_incr_update_t (XDR *xdrs, kdb_incr_update_t *objp)
{
    int32_t *buf;

    if (!xdr_utf8str_t (xdrs, &objp->kdb_princ_name))
        return FALSE;
    if (!xdr_kdb_sno_t (xdrs, &objp->kdb_entry_sno))
        return FALSE;
    if (!xdr_kdbe_time_t (xdrs, &objp->kdb_time))
        return FALSE;
    if (!xdr_kdbe_t (xdrs, &objp->kdb_update))
        return FALSE;
    if (!xdr_bool (xdrs, &objp->kdb_deleted))
        return FALSE;
    if (!xdr_bool (xdrs, &objp->kdb_commit))
        return FALSE;
    if (!xdr_array (xdrs, (char **)&objp->kdb_kdcs_seen_by.kdb_kdcs_seen_by_val, (u_int *) &objp->kdb_kdcs_seen_by.kdb_kdcs_seen_by_len, ~0,
                    sizeof (utf8str_t), (xdrproc_t) xdr_utf8str_t))
        return FALSE;
    if (!xdr_bytes (xdrs, (char **)&objp->kdb_futures.kdb_futures_val, (u_int *) &objp->kdb_futures.kdb_futures_len, ~0))
        return FALSE;
    return TRUE;
}

bool_t
xdr_kdb_ulog_t (XDR *xdrs, kdb_ulog_t *objp)
{
    int32_t *buf;

    if (!xdr_array (xdrs, (char **)&objp->kdb_ulog_t_val, (u_int *) &objp->kdb_ulog_t_len, ~0,
                    sizeof (kdb_incr_update_t), (xdrproc_t) xdr_kdb_incr_update_t))
        return FALSE;
    return TRUE;
}

bool_t
xdr_update_status_t (XDR *xdrs, update_status_t *objp)
{
    int32_t *buf;

    if (!xdr_enum (xdrs, (enum_t *) objp))
        return FALSE;
    return TRUE;
}

bool_t
xdr_kdb_last_t (XDR *xdrs, kdb_last_t *objp)
{
    int32_t *buf;

    if (!xdr_kdb_sno_t (xdrs, &objp->last_sno))
        return FALSE;
    if (!xdr_kdbe_time_t (xdrs, &objp->last_time))
        return FALSE;
    return TRUE;
}

bool_t
xdr_kdb_incr_result_t (XDR *xdrs, kdb_incr_result_t *objp)
{
    int32_t *buf;

    if (!xdr_kdb_last_t (xdrs, &objp->lastentry))
        return FALSE;
    if (!xdr_kdb_ulog_t (xdrs, &objp->updates))
        return FALSE;
    if (!xdr_update_status_t (xdrs, &objp->ret))
        return FALSE;
    return TRUE;
}

bool_t
xdr_kdb_fullresync_result_t (XDR *xdrs, kdb_fullresync_result_t *objp)
{
    int32_t *buf;

    if (!xdr_kdb_last_t (xdrs, &objp->lastentry))
        return FALSE;
    if (!xdr_update_status_t (xdrs, &objp->ret))
        return FALSE;
    return TRUE;
}
