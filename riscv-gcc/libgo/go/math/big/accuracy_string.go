// Code generated by "stringer -type=Accuracy"; DO NOT EDIT.

package big

import "strconv"

const _Accuracy_name = "BelowExactAbove"

var _Accuracy_index = [...]uint8{0, 5, 10, 15}

func (i Accuracy) String() string {
	i -= -1
	if i < 0 || i >= Accuracy(len(_Accuracy_index)-1) {
		return "Accuracy(" + strconv.FormatInt(int64(i+-1), 10) + ")"
	}
	return _Accuracy_name[_Accuracy_index[i]:_Accuracy_index[i+1]]
}
