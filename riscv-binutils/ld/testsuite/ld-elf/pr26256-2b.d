#source: pr26256-2.s
#ld: -e _start
#nm: -n
#xfail: [is_generic]
#notarget: fr30-*-* iq2000-*-* ip2k-*-* xstormy16-*-*
# These targets place .linkorder sections before .text sections.

#...
[0-9a-f]+ T text0
#...
[0-9a-f]+ T text1
#...
[0-9a-f]+ R linkorder2
#...
[0-9a-f]+ R linkorder3
#...
[0-9a-f]+ R linkorder4
#...
[0-9a-f]+ R linkorder0
#...
[0-9a-f]+ R linkorder1
#pass
