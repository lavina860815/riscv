// Code generated by "stringer -type Tag -trimprefix=Tag"; DO NOT EDIT.

package dwarf

import "strconv"

func _() {
	// An "invalid array index" compiler error signifies that the constant values have changed.
	// Re-run the stringer command to generate them again.
	var x [1]struct{}
	_ = x[TagArrayType-1]
	_ = x[TagClassType-2]
	_ = x[TagEntryPoint-3]
	_ = x[TagEnumerationType-4]
	_ = x[TagFormalParameter-5]
	_ = x[TagImportedDeclaration-8]
	_ = x[TagLabel-10]
	_ = x[TagLexDwarfBlock-11]
	_ = x[TagMember-13]
	_ = x[TagPointerType-15]
	_ = x[TagReferenceType-16]
	_ = x[TagCompileUnit-17]
	_ = x[TagStringType-18]
	_ = x[TagStructType-19]
	_ = x[TagSubroutineType-21]
	_ = x[TagTypedef-22]
	_ = x[TagUnionType-23]
	_ = x[TagUnspecifiedParameters-24]
	_ = x[TagVariant-25]
	_ = x[TagCommonDwarfBlock-26]
	_ = x[TagCommonInclusion-27]
	_ = x[TagInheritance-28]
	_ = x[TagInlinedSubroutine-29]
	_ = x[TagModule-30]
	_ = x[TagPtrToMemberType-31]
	_ = x[TagSetType-32]
	_ = x[TagSubrangeType-33]
	_ = x[TagWithStmt-34]
	_ = x[TagAccessDeclaration-35]
	_ = x[TagBaseType-36]
	_ = x[TagCatchDwarfBlock-37]
	_ = x[TagConstType-38]
	_ = x[TagConstant-39]
	_ = x[TagEnumerator-40]
	_ = x[TagFileType-41]
	_ = x[TagFriend-42]
	_ = x[TagNamelist-43]
	_ = x[TagNamelistItem-44]
	_ = x[TagPackedType-45]
	_ = x[TagSubprogram-46]
	_ = x[TagTemplateTypeParameter-47]
	_ = x[TagTemplateValueParameter-48]
	_ = x[TagThrownType-49]
	_ = x[TagTryDwarfBlock-50]
	_ = x[TagVariantPart-51]
	_ = x[TagVariable-52]
	_ = x[TagVolatileType-53]
	_ = x[TagDwarfProcedure-54]
	_ = x[TagRestrictType-55]
	_ = x[TagInterfaceType-56]
	_ = x[TagNamespace-57]
	_ = x[TagImportedModule-58]
	_ = x[TagUnspecifiedType-59]
	_ = x[TagPartialUnit-60]
	_ = x[TagImportedUnit-61]
	_ = x[TagMutableType-62]
	_ = x[TagCondition-63]
	_ = x[TagSharedType-64]
	_ = x[TagTypeUnit-65]
	_ = x[TagRvalueReferenceType-66]
	_ = x[TagTemplateAlias-67]
	_ = x[TagCoarrayType-68]
	_ = x[TagGenericSubrange-69]
	_ = x[TagDynamicType-70]
	_ = x[TagAtomicType-71]
	_ = x[TagCallSite-72]
	_ = x[TagCallSiteParameter-73]
	_ = x[TagSkeletonUnit-74]
	_ = x[TagImmutableType-75]
}

const (
	_Tag_name_0 = "ArrayTypeClassTypeEntryPointEnumerationTypeFormalParameter"
	_Tag_name_1 = "ImportedDeclaration"
	_Tag_name_2 = "LabelLexDwarfBlock"
	_Tag_name_3 = "Member"
	_Tag_name_4 = "PointerTypeReferenceTypeCompileUnitStringTypeStructType"
	_Tag_name_5 = "SubroutineTypeTypedefUnionTypeUnspecifiedParametersVariantCommonDwarfBlockCommonInclusionInheritanceInlinedSubroutineModulePtrToMemberTypeSetTypeSubrangeTypeWithStmtAccessDeclarationBaseTypeCatchDwarfBlockConstTypeConstantEnumeratorFileTypeFriendNamelistNamelistItemPackedTypeSubprogramTemplateTypeParameterTemplateValueParameterThrownTypeTryDwarfBlockVariantPartVariableVolatileTypeDwarfProcedureRestrictTypeInterfaceTypeNamespaceImportedModuleUnspecifiedTypePartialUnitImportedUnitMutableTypeConditionSharedTypeTypeUnitRvalueReferenceTypeTemplateAliasCoarrayTypeGenericSubrangeDynamicTypeAtomicTypeCallSiteCallSiteParameterSkeletonUnitImmutableType"
)

var (
	_Tag_index_0 = [...]uint8{0, 9, 18, 28, 43, 58}
	_Tag_index_2 = [...]uint8{0, 5, 18}
	_Tag_index_4 = [...]uint8{0, 11, 24, 35, 45, 55}
	_Tag_index_5 = [...]uint16{0, 14, 21, 30, 51, 58, 74, 89, 100, 117, 123, 138, 145, 157, 165, 182, 190, 205, 214, 222, 232, 240, 246, 254, 266, 276, 286, 307, 329, 339, 352, 363, 371, 383, 397, 409, 422, 431, 445, 460, 471, 483, 494, 503, 513, 521, 540, 553, 564, 579, 590, 600, 608, 625, 637, 650}
)

func (i Tag) String() string {
	switch {
	case 1 <= i && i <= 5:
		i -= 1
		return _Tag_name_0[_Tag_index_0[i]:_Tag_index_0[i+1]]
	case i == 8:
		return _Tag_name_1
	case 10 <= i && i <= 11:
		i -= 10
		return _Tag_name_2[_Tag_index_2[i]:_Tag_index_2[i+1]]
	case i == 13:
		return _Tag_name_3
	case 15 <= i && i <= 19:
		i -= 15
		return _Tag_name_4[_Tag_index_4[i]:_Tag_index_4[i+1]]
	case 21 <= i && i <= 75:
		i -= 21
		return _Tag_name_5[_Tag_index_5[i]:_Tag_index_5[i+1]]
	default:
		return "Tag(" + strconv.FormatInt(int64(i), 10) + ")"
	}
}
