#readelf: -SWg
#name: linked-to section 3

#...
 +\[ *[0-9]+\] +__patchable_function_entries +PROGBITS +[0-9a-f]+ +[0-9a-f]+ +0+[248] +00 +WALG +.*
#...
 +\[ *[0-9]+\] +__patchable_function_entries +PROGBITS +[0-9a-f]+ +[0-9a-f]+ +0+[248] +00 +WALG +.*
#...
COMDAT group section \[[ 0-9]+\] `.group' \[foo\] contains [0-9]+ sections:
   \[Index\]    Name
#...
   \[[ 0-9]+\]   __patchable_function_entries
#...
COMDAT group section \[[ 0-9]+\] `.group' \[bar\] contains [0-9]+ sections:
#...
   \[[ 0-9]+\]   __patchable_function_entries
#pass
