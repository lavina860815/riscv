#source: pr26978a.s
#source: pr26978b.s
#target: [check_shared_lib_support]
#as:
#ld: -shared --version-script=pr26979.ver
#readelf: -sW

#failif
#...
.*foo@v1
#pass
