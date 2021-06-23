// -------------------------------------------------------------------------------
//
//         DXライブラリ        データタイプ定義ヘッダファイル
//
//                 Ver 3.22c
//
// -------------------------------------------------------------------------------
module dxlib_d.DxDataType;


// インクルード ------------------------------------------------------------------
public import core.stdc.stdio;
public import dxlib_d.DxCompileConfig;
public import dxlib_d.DxDataType;
public import dxlib_d.DxDataTypeAndroid;
public import dxlib_d.DxDataTypeiOS;
public import dxlib_d.DxDataTypeWin;

//version (iOS) {
	//#include "TargetConditionals.h"
//}

pragma(inline, true)
pure nothrow @safe @nogc @live
void SETRECT(ref .RECT Dest, .LONG Left, .LONG Top, .LONG Right, .LONG Bottom)

	do
	{
		Dest.left = Left;
		Dest.top = Top;
		Dest.right = Right;
		Dest.bottom = Bottom;
	}

extern (C++, DxLib) {
	// マクロ定義 --------------------------------------------------------------------

	/+
	version (USE_ULL) {
		#define ULL_NUM(x) (x##ULL)
		#define LL_NUM(x) (x##LL)
		#define ULL_PARAM(x) x##ULL
		#define LL_PARAM(x) x##LL
	} else {
		#define ULL_NUM(x) ((ULONGLONG) x)
		#define LL_NUM(x) ((LONGLONG) x)
		#define ULL_PARAM(x) x
		#define LL_PARAM(x) x
	}
	+/

	// 構造体定義 --------------------------------------------------------------------

	// RGBA色構造体
	struct RGBCOLOR
	{
		ubyte Blue;
		ubyte Green;
		ubyte Red;
		ubyte Alpha;
	}

	// テーブル-----------------------------------------------------------------------

	// 内部大域変数宣言 --------------------------------------------------------------

	// 関数プロトタイプ宣言-----------------------------------------------------------
}
