# source: tls-1.s
# ld: --entry foo -q
# nm: -r

#...
[0-9a-f]+ N __wrs_rtp_tls_vars_start
#...
0000000c A __wrs_rtp_tls_vars_size
#...
[0-9a-f]+ N __wrs_rtp_tls_data_start
#...
00000004 A __wrs_rtp_tls_data_size
#...
00000004 A __wrs_rtp_tls_data_align
#...
[0-9a-f]+ N ___wrs_rtp_tls_vars_start
#...
0000000c A ___wrs_rtp_tls_vars_size
#...
[0-9a-f]+ N ___wrs_rtp_tls_data_start
#...
00000004 A ___wrs_rtp_tls_data_size
#...
00000004 A ___wrs_rtp_tls_data_align
#pass
