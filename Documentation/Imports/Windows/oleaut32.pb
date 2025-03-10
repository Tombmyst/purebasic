﻿XIncludeFile "common.pbi"

Import "oleaut32.lib"
       Api(BSTR_UserFree, (arg1, arg2), 8)
       Api(BSTR_UserMarshal, (arg1, arg2, arg3), 12)
       Api(BSTR_UserSize, (arg1, arg2, arg3), 12)
       Api(BSTR_UserUnmarshal, (arg1, arg2, arg3), 12)
       Api(BstrFromVector, (arg1, arg2), 8)
       Api(ClearCustData, (arg1), 4)
       Api(CreateDispTypeInfo, (arg1, arg2, arg3), 12)
       Api(CreateErrorInfo, (arg1), 4)
       Api(CreateStdDispatch, (arg1, arg2, arg3, arg4), 16)
       Api(CreateTypeLib, (arg1, arg2, arg3), 12)
       Api(CreateTypeLib2, (arg1, arg2, arg3), 12)
       Api(DispCallFunc, (arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8), 32)
       Api(DispGetIDsOfNames, (arg1, arg2, arg3, arg4), 16)
       Api(DispGetParam, (arg1, arg2, arg3, arg4, arg5), 20)
       Api(DispInvoke, (arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8), 32)
       Api(DosDateTimeToVariantTime, (arg1, arg2, arg3), 12)
       Api(GetActiveObject, (arg1, arg2, arg3), 12)
       Api(GetAltMonthNames, (arg1, arg2), 8)
       Api(GetErrorInfo, (arg1, arg2), 8)
       AnsiWide(LHashValOfNameSys, (arg1, arg2, arg3), 12)
       Api(LoadRegTypeLib, (arg1, arg2, arg3, arg4, arg5), 20)
       Api(LoadTypeLib, (arg1, arg2), 8)
       Api(LoadTypeLibEx, (arg1, arg2, arg3), 12)
       Api(LPSAFEARRAY_Marshal, (arg1, arg2, arg3, arg4), 16)
       Api(LPSAFEARRAY_Size, (arg1, arg2, arg3, arg4), 16)
       Api(LPSAFEARRAY_Unmarshal, (arg1, arg2, arg3, arg4), 16)
       Api(LPSAFEARRAY_UserFree, (arg1, arg2), 8)
       Api(LPSAFEARRAY_UserMarshal, (arg1, arg2, arg3), 12)
       Api(LPSAFEARRAY_UserSize, (arg1, arg2, arg3), 12)
       Api(LPSAFEARRAY_UserUnmarshal, (arg1, arg2, arg3), 12)
       Api(OaBuildVersion, (), 0)
       Api(OACreateTypeLib2, (arg1, arg2, arg3), 12)
       Api(OleCreateFontIndirect, (arg1, arg2, arg3), 12)
       Api(OleCreatePictureIndirect, (arg1, arg2, arg3, arg4), 16)
       Api(OleCreatePropertyFrame, (arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11), 44)
       Api(OleCreatePropertyFrameIndirect, (arg1), 4)
       Api(OleIconToCursor, (arg1, arg2), 8)
       Api(OleLoadPicture, (arg1, arg2, arg3, arg4, arg5), 20)
       Api(OleLoadPictureFile, (arg1, arg2, arg3, arg4, arg5), 20)
       Api(OleLoadPicturePath, (arg1, arg2, arg3, arg4, arg5, arg6), 24)
       Api(OleSavePictureFile, (arg1, arg2), 8)
       Api(OleTranslateColor, (arg1, arg2, arg3), 12)
       Api(QueryPathOfRegTypeLib, (arg1, arg2, arg3, arg4, arg5), 20)
       Api(RegisterActiveObject, (arg1, arg2, arg3, arg4), 16)
       Api(RegisterTypeLib, (arg1, arg2, arg3), 12)
       Api(RevokeActiveObject, (arg1, arg2), 8)
       Api(SafeArrayAccessData, (arg1, arg2), 8)
       Api(SafeArrayAllocData, (arg1), 4)
       Api(SafeArrayAllocDescriptor, (arg1, arg2), 8)
       Api(SafeArrayAllocDescriptorEx, (arg1, arg2, arg3), 12)
       Api(SafeArrayCopy, (arg1, arg2), 8)
       Api(SafeArrayCopyData, (arg1, arg2), 8)
       Api(SafeArrayCreate, (arg1, arg2, arg3), 12)
       Api(SafeArrayCreateVector, (arg1, arg2, arg3), 12)
       Api(SafeArrayDestroy, (arg1), 4)
       Api(SafeArrayDestroyData, (arg1), 4)
       Api(SafeArrayDestroyDescriptor, (arg1), 4)
       Api(SafeArrayGetDim, (arg1), 4)
       Api(SafeArrayGetElement, (arg1, arg2, arg3), 12)
       Api(SafeArrayGetElemsize, (arg1), 4)
       Api(SafeArrayGetLBound, (arg1, arg2, arg3), 12)
       Api(SafeArrayGetUBound, (arg1, arg2, arg3), 12)
       Api(SafeArrayGetVartype, (arg1, arg2), 8)
       Api(SafeArrayLock, (arg1), 4)
       Api(SafeArrayPtrOfIndex, (arg1, arg2, arg3), 12)
       Api(SafeArrayPutElement, (arg1, arg2, arg3), 12)
       Api(SafeArrayRedim, (arg1, arg2), 8)
       Api(SafeArrayUnaccessData, (arg1), 4)
       Api(SafeArrayUnlock, (arg1), 4)
       Api(SetErrorInfo, (arg1, arg2), 8)
       Api(SysAllocString, (arg1), 4)
       Api(SysAllocStringByteLen, (arg1, arg2), 8)
       Api(SysAllocStringLen, (arg1, arg2), 8)
       Api(SysFreeString, (arg1), 4)
       Api(SysReAllocString, (arg1, arg2), 8)
       Api(SysReAllocStringLen, (arg1, arg2, arg3), 12)
       Api(SysStringByteLen, (arg1), 4)
       Api(SysStringLen, (arg1), 4)
       Api(SystemTimeToVariantTime, (arg1, arg2), 8)
       Api(UnRegisterTypeLib, (arg1, arg2, arg3, arg4, arg5), 20)
       Api(UserBSTR_free_inst, (arg1), 4)
       Api(UserBSTR_free_local, (arg1), 4)
       Api(UserBSTR_from_local, (arg1, arg2), 8)
       Api(UserBSTR_to_local, (arg1, arg2), 8)
       Api(UserEXCEPINFO_free_inst, (arg1), 4)
       Api(UserEXCEPINFO_free_local, (arg1), 4)
       Api(UserEXCEPINFO_from_local, (arg1, arg2), 8)
       Api(UserEXCEPINFO_to_local, (arg1, arg2), 8)
       Api(UserHWND_free_inst, (arg1), 4)
       Api(UserHWND_free_local, (arg1), 4)
       Api(UserHWND_from_local, (arg1, arg2), 8)
       Api(UserHWND_to_local, (arg1, arg2), 8)
       Api(UserMSG_free_inst, (arg1), 4)
       Api(UserMSG_free_local, (arg1), 4)
       Api(UserMSG_from_local, (arg1, arg2), 8)
       Api(UserMSG_to_local, (arg1, arg2), 8)
       Api(UserVARIANT_free_inst, (arg1), 4)
       Api(UserVARIANT_free_local, (arg1), 4)
       Api(UserVARIANT_from_local, (arg1, arg2), 8)
       Api(UserVARIANT_to_local, (arg1, arg2), 8)
       Api(VarBoolFromCy, (arg1, arg2, arg3), 12)
       Api(VarBoolFromDate, (arg1, arg2, arg3), 12)
       Api(VarBoolFromDec, (arg1, arg2), 8)
       Api(VarBoolFromDisp, (arg1, arg2, arg3), 12)
       Api(VarBoolFromI1, (arg1, arg2), 8)
       Api(VarBoolFromI2, (arg1, arg2), 8)
       Api(VarBoolFromI4, (arg1, arg2), 8)
       Api(VarBoolFromR4, (arg1, arg2), 8)
       Api(VarBoolFromR8, (arg1, arg2, arg3), 12)
       Api(VarBoolFromStr, (arg1, arg2, arg3, arg4), 16)
       Api(VarBoolFromUI1, (arg1, arg2), 8)
       Api(VarBoolFromUI2, (arg1, arg2), 8)
       Api(VarBoolFromUI4, (arg1, arg2), 8)
       Api(VarBstrFromBool, (arg1, arg2, arg3, arg4), 16)
       Api(VarBstrFromCy, (arg1, arg2, arg3, arg4, arg5), 20)
       Api(VarBstrFromDate, (arg1, arg2, arg3, arg4, arg5), 20)
       Api(VarBstrFromDec, (arg1, arg2, arg3, arg4), 16)
       Api(VarBstrFromDisp, (arg1, arg2, arg3, arg4), 16)
       Api(VarBstrFromI1, (arg1, arg2, arg3, arg4), 16)
       Api(VarBstrFromI2, (arg1, arg2, arg3, arg4), 16)
       Api(VarBstrFromI4, (arg1, arg2, arg3, arg4), 16)
       Api(VarBstrFromR4, (arg1, arg2, arg3, arg4), 16)
       Api(VarBstrFromR8, (arg1, arg2, arg3, arg4, arg5), 20)
       Api(VarBstrFromUI1, (arg1, arg2, arg3, arg4), 16)
       Api(VarBstrFromUI2, (arg1, arg2, arg3, arg4), 16)
       Api(VarBstrFromUI4, (arg1, arg2, arg3, arg4), 16)
       Api(VarCyFromBool, (arg1, arg2), 8)
       Api(VarCyFromDate, (arg1, arg2, arg3), 12)
       Api(VarCyFromDec, (arg1, arg2), 8)
       Api(VarCyFromDisp, (arg1, arg2, arg3), 12)
       Api(VarCyFromI1, (arg1, arg2), 8)
       Api(VarCyFromI2, (arg1, arg2), 8)
       Api(VarCyFromI4, (arg1, arg2), 8)
       Api(VarCyFromR4, (arg1, arg2), 8)
       Api(VarCyFromR8, (arg1, arg2, arg3), 12)
       Api(VarCyFromStr, (arg1, arg2, arg3, arg4), 16)
       Api(VarCyFromUI1, (arg1, arg2), 8)
       Api(VarCyFromUI2, (arg1, arg2), 8)
       Api(VarCyFromUI4, (arg1, arg2), 8)
       Api(VarDateFromBool, (arg1, arg2), 8)
       Api(VarDateFromCy, (arg1, arg2, arg3), 12)
       Api(VarDateFromDec, (arg1, arg2), 8)
       Api(VarDateFromDisp, (arg1, arg2, arg3), 12)
       Api(VarDateFromI1, (arg1, arg2), 8)
       Api(VarDateFromI2, (arg1, arg2), 8)
       Api(VarDateFromI4, (arg1, arg2), 8)
       Api(VarDateFromR4, (arg1, arg2), 8)
       Api(VarDateFromR8, (arg1, arg2, arg3), 12)
       Api(VarDateFromStr, (arg1, arg2, arg3, arg4), 16)
       Api(VarDateFromUdate, (arg1, arg2, arg3), 12)
       Api(VarDateFromUI1, (arg1, arg2), 8)
       Api(VarDateFromUI2, (arg1, arg2), 8)
       Api(VarDateFromUI4, (arg1, arg2), 8)
       Api(VarDecFromBool, (arg1, arg2), 8)
       Api(VarDecFromCy, (arg1, arg2, arg3), 12)
       Api(VarDecFromDate, (arg1, arg2, arg3), 12)
       Api(VarDecFromDisp, (arg1, arg2, arg3), 12)
       Api(VarDecFromI1, (arg1, arg2), 8)
       Api(VarDecFromI2, (arg1, arg2), 8)
       Api(VarDecFromI4, (arg1, arg2), 8)
       Api(VarDecFromR4, (arg1, arg2), 8)
       Api(VarDecFromR8, (arg1, arg2, arg3), 12)
       Api(VarDecFromStr, (arg1, arg2, arg3, arg4), 16)
       Api(VarDecFromUI1, (arg1, arg2), 8)
       Api(VarDecFromUI2, (arg1, arg2), 8)
       Api(VarDecFromUI4, (arg1, arg2), 8)
       Api(VarI1FromBool, (arg1, arg2), 8)
       Api(VarI1FromCy, (arg1, arg2, arg3), 12)
       Api(VarI1FromDate, (arg1, arg2, arg3), 12)
       Api(VarI1FromDec, (arg1, arg2), 8)
       Api(VarI1FromDisp, (arg1, arg2, arg3), 12)
       Api(VarI1FromI2, (arg1, arg2), 8)
       Api(VarI1FromI4, (arg1, arg2), 8)
       Api(VarI1FromR4, (arg1, arg2), 8)
       Api(VarI1FromR8, (arg1, arg2, arg3), 12)
       Api(VarI1FromStr, (arg1, arg2, arg3, arg4), 16)
       Api(VarI1FromUI1, (arg1, arg2), 8)
       Api(VarI1FromUI2, (arg1, arg2), 8)
       Api(VarI1FromUI4, (arg1, arg2), 8)
       Api(VarI2FromBool, (arg1, arg2), 8)
       Api(VarI2FromCy, (arg1, arg2, arg3), 12)
       Api(VarI2FromDate, (arg1, arg2, arg3), 12)
       Api(VarI2FromDec, (arg1, arg2), 8)
       Api(VarI2FromDisp, (arg1, arg2, arg3), 12)
       Api(VarI2FromI1, (arg1, arg2), 8)
       Api(VarI2FromI4, (arg1, arg2), 8)
       Api(VarI2FromR4, (arg1, arg2), 8)
       Api(VarI2FromR8, (arg1, arg2, arg3), 12)
       Api(VarI2FromStr, (arg1, arg2, arg3, arg4), 16)
       Api(VarI2FromUI1, (arg1, arg2), 8)
       Api(VarI2FromUI2, (arg1, arg2), 8)
       Api(VarI2FromUI4, (arg1, arg2), 8)
       Api(VarI4FromBool, (arg1, arg2), 8)
       Api(VarI4FromCy, (arg1, arg2, arg3), 12)
       Api(VarI4FromDate, (arg1, arg2, arg3), 12)
       Api(VarI4FromDec, (arg1, arg2), 8)
       Api(VarI4FromDisp, (arg1, arg2, arg3), 12)
       Api(VarI4FromI1, (arg1, arg2), 8)
       Api(VarI4FromI2, (arg1, arg2), 8)
       Api(VarI4FromR4, (arg1, arg2), 8)
       Api(VarI4FromR8, (arg1, arg2, arg3), 12)
       Api(VarI4FromStr, (arg1, arg2, arg3, arg4), 16)
       Api(VarI4FromUI1, (arg1, arg2), 8)
       Api(VarI4FromUI2, (arg1, arg2), 8)
       Api(VarI4FromUI4, (arg1, arg2), 8)
       Api(VARIANT_UserFree, (arg1, arg2), 8)
       Api(VARIANT_UserMarshal, (arg1, arg2, arg3), 12)
       Api(VARIANT_UserSize, (arg1, arg2, arg3), 12)
       Api(VARIANT_UserUnmarshal, (arg1, arg2, arg3), 12)
       Api(VariantChangeType, (arg1, arg2, arg3, arg4), 16)
       Api(VariantChangeTypeEx, (arg1, arg2, arg3, arg4, arg5), 20)
       Api(VariantClear, (arg1), 4)
       Api(VariantCopy, (arg1, arg2), 8)
       Api(VariantCopyInd, (arg1, arg2), 8)
       Api(VariantInit, (arg1), 4)
       Api(VariantTimeToDosDateTime, (arg1.d, arg3, arg4), 16)
       Api(VariantTimeToSystemTime, (arg1.d, arg2), 12)
       Api(VarNumFromParseNum, (arg1, arg2, arg3, arg4), 16)
       Api(VarParseNumFromStr, (arg1, arg2, arg3, arg4, arg5), 20)
       Api(VarR4FromBool, (arg1, arg2), 8)
       Api(VarR4FromCy, (arg1, arg2, arg3), 12)
       Api(VarR4FromDate, (arg1, arg2, arg3), 12)
       Api(VarR4FromDec, (arg1, arg2), 8)
       Api(VarR4FromDisp, (arg1, arg2, arg3), 12)
       Api(VarR4FromI1, (arg1, arg2), 8)
       Api(VarR4FromI2, (arg1, arg2), 8)
       Api(VarR4FromI4, (arg1, arg2), 8)
       Api(VarR4FromR8, (arg1, arg2, arg3), 12)
       Api(VarR4FromStr, (arg1, arg2, arg3, arg4), 16)
       Api(VarR4FromUI1, (arg1, arg2), 8)
       Api(VarR4FromUI2, (arg1, arg2), 8)
       Api(VarR4FromUI4, (arg1, arg2), 8)
       Api(VarR8FromBool, (arg1, arg2), 8)
       Api(VarR8FromCy, (arg1, arg2, arg3), 12)
       Api(VarR8FromDate, (arg1, arg2, arg3), 12)
       Api(VarR8FromDec, (arg1, arg2), 8)
       Api(VarR8FromDisp, (arg1, arg2, arg3), 12)
       Api(VarR8FromI1, (arg1, arg2), 8)
       Api(VarR8FromI2, (arg1, arg2), 8)
       Api(VarR8FromI4, (arg1, arg2), 8)
       Api(VarR8FromR4, (arg1, arg2), 8)
       Api(VarR8FromStr, (arg1, arg2, arg3, arg4), 16)
       Api(VarR8FromUI1, (arg1, arg2), 8)
       Api(VarR8FromUI2, (arg1, arg2), 8)
       Api(VarR8FromUI4, (arg1, arg2), 8)
       Api(VarUdateFromDate, (arg1, arg2, arg3, arg4), 16)
       Api(VarUI1FromBool, (arg1, arg2), 8)
       Api(VarUI1FromCy, (arg1, arg2, arg3), 12)
       Api(VarUI1FromDate, (arg1, arg2, arg3), 12)
       Api(VarUI1FromDec, (arg1, arg2), 8)
       Api(VarUI1FromDisp, (arg1, arg2, arg3), 12)
       Api(VarUI1FromI1, (arg1, arg2), 8)
       Api(VarUI1FromI2, (arg1, arg2), 8)
       Api(VarUI1FromI4, (arg1, arg2), 8)
       Api(VarUI1FromR4, (arg1, arg2), 8)
       Api(VarUI1FromR8, (arg1, arg2, arg3), 12)
       Api(VarUI1FromStr, (arg1, arg2, arg3, arg4), 16)
       Api(VarUI1FromUI2, (arg1, arg2), 8)
       Api(VarUI1FromUI4, (arg1, arg2), 8)
       Api(VarUI2FromBool, (arg1, arg2), 8)
       Api(VarUI2FromCy, (arg1, arg2, arg3), 12)
       Api(VarUI2FromDate, (arg1, arg2, arg3), 12)
       Api(VarUI2FromDec, (arg1, arg2), 8)
       Api(VarUI2FromDisp, (arg1, arg2, arg3), 12)
       Api(VarUI2FromI1, (arg1, arg2), 8)
       Api(VarUI2FromI2, (arg1, arg2), 8)
       Api(VarUI2FromI4, (arg1, arg2), 8)
       Api(VarUI2FromR4, (arg1, arg2), 8)
       Api(VarUI2FromR8, (arg1, arg2, arg3), 12)
       Api(VarUI2FromStr, (arg1, arg2, arg3, arg4), 16)
       Api(VarUI2FromUI1, (arg1, arg2), 8)
       Api(VarUI2FromUI4, (arg1, arg2), 8)
       Api(VarUI4FromBool, (arg1, arg2), 8)
       Api(VarUI4FromCy, (arg1, arg2, arg3), 12)
       Api(VarUI4FromDate, (arg1, arg2, arg3), 12)
       Api(VarUI4FromDec, (arg1, arg2), 8)
       Api(VarUI4FromDisp, (arg1, arg2, arg3), 12)
       Api(VarUI4FromI1, (arg1, arg2), 8)
       Api(VarUI4FromI2, (arg1, arg2), 8)
       Api(VarUI4FromI4, (arg1, arg2), 8)
       Api(VarUI4FromR4, (arg1, arg2), 8)
       Api(VarUI4FromR8, (arg1, arg2, arg3), 12)
       Api(VarUI4FromStr, (arg1, arg2, arg3, arg4), 16)
       Api(VarUI4FromUI1, (arg1, arg2), 8)
       Api(VarUI4FromUI2, (arg1, arg2), 8)
       Api(VectorFromBstr, (arg1, arg2), 8)
EndImport
