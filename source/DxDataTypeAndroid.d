// -------------------------------------------------------------------------------
//
//         DXライブラリ        Nintendo Switch用データタイプ定義ヘッダファイル
//
//                 Ver 3.22c
//
// -------------------------------------------------------------------------------
module dxlib_d.dxdatatypeandroid;


version (Android):

extern (C):
nothrow @nogc:

// インクルード ------------------------------------------------------------------
public import dxlib_d.dxcompileconfig;
private static import core.stdc.stddef;
private static import core.stdc.stdint;
private static import std.traits;
private static import dxlib_d.dxlib;

//extern (C++, DxLib) {
// マクロ定義 --------------------------------------------------------------------

// センサー
enum
{
	/**
	 * 加速度センサー
	 */
	DX_ANDROID_SENSOR_ACCELEROMETER = 0,

	/**
	 * 磁界センサー
	 */
	DX_ANDROID_SENSOR_MAGNETIC_FIELD = 1,

	/**
	 * ジャイロスコープセンサー
	 */
	DX_ANDROID_SENSOR_GYROSCOPE = 2,

	/**
	 * 照度センサー
	 */
	DX_ANDROID_SENSOR_LIGHT = 3,

	/**
	 * 近接センサー
	 */
	DX_ANDROID_SENSOR_PROXIMITY = 4,

	/**
	 * 加圧センサー
	 */
	DX_ANDROID_SENSOR_PRESSURE = 5,

	/**
	 * 温度センサー
	 */
	DX_ANDROID_SENSOR_AMBIENT_TEMPERATURE = 6,

	DX_ANDROID_SENSOR_NUM = 7,
}

// 環境依存キーワードなど
/+
#ifndef FASTCALL
	#define FASTCALL
#endif
+/

alias HBITMAP = void*;
alias HINSTANCE = void*;
alias LPSTR = char*;

enum TRUE = 1;
enum FALSE = 0;
alias BOOL = int;

version (Unicode) {
	alias TCHAR = core.stdc.stddef.wchar_t;
} else {
	alias TCHAR = char;
}

version (Unicode) {
	/+
	#define _T(x) L##x
	+/
} else {
	/+
	#define _T(x) x
	+/
}

version (Unicode) {
	/+
	#define TEXT(x) L##x
	+/
} else {
	/+
	#define TEXT(x) x
	+/
}

/+
#define NEAR
#define FAR
#define WINAPI
+/

alias LONG = int;
alias LPLONG = int*;

alias LONGLONG = core.stdc.stdint.int64_t;
alias ULONGLONG = core.stdc.stdint.uint64_t;
alias BYTE = core.stdc.stdint.uint8_t;
alias WORD = core.stdc.stdint.uint16_t;
alias DWORD = core.stdc.stdint.uint32_t;
alias LPDWORD = core.stdc.stdint.uint32_t*;

//#ifdef __LP64__
version (D_LP64) {
	alias DWORD_PTR = core.stdc.stdint.uint64_t;
} else {
	alias DWORD_PTR = core.stdc.stdint.uint32_t;
}

alias LONG_PTR = core.stdc.stdint.int32_t;

enum _FPCLASS_SNAN = 0x0001;
enum _FPCLASS_QNAN = 0x0002;
enum _FPCLASS_NINF = 0x0004;
enum _FPCLASS_NN = 0x0008;
enum _FPCLASS_ND = 0x0010;
enum _FPCLASS_NZ = 0x0020;
enum _FPCLASS_PZ = 0x0040;
enum _FPCLASS_PD = 0x0080;
enum _FPCLASS_PN = 0x0100;
enum _FPCLASS_PINF = 0x0200;

enum FILE_ATTRIBUTE_DIRECTORY = 0x00000010;

enum BI_RGB = 0L;
enum BI_RLE8 = 1L;
enum BI_RLE4 = 2L;
enum BI_BITFIELDS = 3L;

pragma(inline, true)
pure nothrow @safe @nogc
.DWORD MAKEFOURCC(C0, C1, C2, C3)(C0 ch0, C1 ch1, C2 ch2, C3 ch3)
	if ((std.traits.isNumeric!(C1)) && (std.traits.isNumeric!(C2)) && (std.traits.isNumeric!(C3)) && (std.traits.isNumeric!(C3)))

	do
	{
		return (cast(.DWORD)(cast(.BYTE)(ch0))) | (cast(.DWORD)(cast(.BYTE)(ch1)) << 8) | (cast(.DWORD)(cast(.BYTE)(ch2)) << 16) | (cast(.DWORD)(cast(.BYTE)(ch3)) << 24);
	}

// ATRAC9 を使用した読み込み処理
enum DX_READSOUNDFUNCTION_AT9 = 1 << (dxlib_d.dxlib.DX_READSOUNDFUNCTION_DEFAULT_NUM + 0);

// 構造体定義 --------------------------------------------------------------------

package struct tagRECT
{
	.LONG left;
	.LONG top;
	.LONG right;
	.LONG bottom;
}

public alias RECT = .tagRECT;
public alias PRECT = .tagRECT*;
public alias NPRECT = /* NEAR */ .tagRECT*;
public alias LPRECT = /* FAR */ .tagRECT*;

package struct tagPOINT
{
	.LONG x;
	.LONG y;
}

public alias POINT = .tagPOINT;
public alias PPOINT = .tagPOINT*;
public alias NPPOINT = /* NEAR */ .tagPOINT*;
public alias LPPOINT = /* FAR */ .tagPOINT*;

package struct tagSIZE
{
	.LONG cx;
	.LONG cy;
}

public alias SIZE = .tagSIZE;
public alias PSIZE = .tagSIZE*;
public alias LPSIZE = .tagSIZE*;

align(2)
package struct tagBITMAPFILEHEADER
{
align(2):
	.WORD bfType;
	.DWORD bfSize;
	.WORD bfReserved1;
	.WORD bfReserved2;
	.DWORD bfOffBits;
}

public alias BITMAPFILEHEADER = .tagBITMAPFILEHEADER;
public alias LPBITMAPFILEHEADER = /* FAR */ .tagBITMAPFILEHEADER*;
public alias PBITMAPFILEHEADER = .tagBITMAPFILEHEADER*;

package struct tagRGBQUAD
{
	.BYTE rgbBlue;
	.BYTE rgbGreen;
	.BYTE rgbRed;
	.BYTE rgbReserved;
}

public alias RGBQUAD = .tagRGBQUAD;

package struct tagBITMAPINFOHEADER
{
	.DWORD biSize;
	.LONG biWidth;
	.LONG biHeight;
	.WORD biPlanes;
	.WORD biBitCount;
	.DWORD biCompression;
	.DWORD biSizeImage;
	.LONG biXPelsPerMeter;
	.LONG biYPelsPerMeter;
	.DWORD biClrUsed;
	.DWORD biClrImportant;
}

public alias BITMAPINFOHEADER = .tagBITMAPINFOHEADER;
public alias LPBITMAPINFOHEADER = /* FAR */ .tagBITMAPINFOHEADER*;
public alias PBITMAPINFOHEADER = .tagBITMAPINFOHEADER*;

package struct tagBITMAPINFO
{
	.BITMAPINFOHEADER bmiHeader;
	.RGBQUAD[1] bmiColors;
}

public alias BITMAPINFO = .tagBITMAPINFO;
public alias LPBITMAPINFO = /* FAR */ .tagBITMAPINFO*;
public alias PBITMAPINFO = .tagBITMAPINFO*;

// テーブル-----------------------------------------------------------------------

// 内部大域変数宣言 --------------------------------------------------------------

// 関数プロトタイプ宣言-----------------------------------------------------------

//}
