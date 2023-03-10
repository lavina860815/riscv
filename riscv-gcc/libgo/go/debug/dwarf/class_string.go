// Code generated by "stringer -type=Class"; DO NOT EDIT.

package dwarf

import "strconv"

func _() {
	// An "invalid array index" compiler error signifies that the constant values have changed.
	// Re-run the stringer command to generate them again.
	var x [1]struct{}
	_ = x[ClassUnknown-0]
	_ = x[ClassAddress-1]
	_ = x[ClassBlock-2]
	_ = x[ClassConstant-3]
	_ = x[ClassExprLoc-4]
	_ = x[ClassFlag-5]
	_ = x[ClassLinePtr-6]
	_ = x[ClassLocListPtr-7]
	_ = x[ClassMacPtr-8]
	_ = x[ClassRangeListPtr-9]
	_ = x[ClassReference-10]
	_ = x[ClassReferenceSig-11]
	_ = x[ClassString-12]
	_ = x[ClassReferenceAlt-13]
	_ = x[ClassStringAlt-14]
}

const _Class_name = "ClassUnknownClassAddressClassBlockClassConstantClassExprLocClassFlagClassLinePtrClassLocListPtrClassMacPtrClassRangeListPtrClassReferenceClassReferenceSigClassStringClassReferenceAltClassStringAlt"

var _Class_index = [...]uint8{0, 12, 24, 34, 47, 59, 68, 80, 95, 106, 123, 137, 154, 165, 182, 196}

func (i Class) String() string {
	if i < 0 || i >= Class(len(_Class_index)-1) {
		return "Class(" + strconv.FormatInt(int64(i), 10) + ")"
	}
	return _Class_name[_Class_index[i]:_Class_index[i+1]]
}
