// -------------------------------------------------------------------------------
//
//         DXライブラリ        データタイプ定義ヘッダファイル
//
//                 Ver 3.22a
//
// -------------------------------------------------------------------------------
module dxlib_d.dxdatatype;


// インクルード ------------------------------------------------------------------
public import dxlib_d.dxcompileconfig;
public import dxlib_d.dxdatatype;
public import core.stdc.stdio;

//ifdef WINDOWS_DESKTOP_OS
//version (Windows) {
	public import dxlib_d.dxdatayypewin;
//}

//ifdef __ANDROID__
//version (Android) {
	public import dxlib_d.dxdatatypeandroid;
//}

//#ifdef __APPLE__
//version (iOS) {
	//#include "TargetConditionals.h"

	//#if TARGET_OS_IPHONE
		public import dxlib_d.dxdatatypeios;
	//#endif
//}

extern (C++, DxLib) {
	// マクロ定義 --------------------------------------------------------------------

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
