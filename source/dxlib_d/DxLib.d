// -------------------------------------------------------------------------------
//
//         DXライブラリ        ヘッダファイル
//
//                 Ver 3.22c
//
// -------------------------------------------------------------------------------
module dxlib_d.DxLib;


private static import core.stdc.config;
private static import core.stdc.stdarg;
public import dxlib_d.DxCompileConfig;
public import dxlib_d.DxDataType;

nothrow @nogc:

// DXライブラリのバージョン

/**
 * DXライブラリのバージョン
 */
enum DXLIB_VERSION = 0x322C;

version (Unicode) {
	enum DXLIB_VERSION_STR_T = "3.22c"w;
} else {
	enum DXLIB_VERSION_STR_T = "3.22c";
}

enum DXLIB_VERSION_STR_W = "3.22c"w;

// 設定 -----------------------------------------------------------------------

version (DX_MAKE) {
} else {
	// 描画関連の関数を一切使用されない場合は以下のコメントを外して下さい
	//version = DX_NOTUSE_DRAWFUNCTION;
}

// 定義---------------------------------------------------------------------------

/**
 * π
 */
enum
{
	/**
	 * π
	 */
	DX_PI = 3.1415926535897932384626433832795,

	/**
	 * π
	 */
	DX_PI_F = 3.1415926535897932384626433832795f,

	/**
	 * π
	 */
	DX_TWO_PI = 3.1415926535897932384626433832795 * 2.0,

	/**
	 * π
	 */
	DX_TWO_PI_F = 3.1415926535897932384626433832795f * 2.0f,
}

/**
 * ?
 */
alias DX_CHAR = char;

/**
 * 最大数
 */
enum
{
	/**
	 * 同時に持てるグラフィックハンドルの最大数( ハンドルエラーチェックのマスクに使用しているので 0x040000 以下の 2 のべき乗にして下さい )
	 */
	MAX_IMAGE_NUM = 0x040000,

	/**
	 * 画像分割の最大数
	 */
	MAX_IMAGE_DIVNUM = 64,

	/**
	 * シャドウマップデータの最大数
	 */
	MAX_SHADOWMAP_NUM = 8192,

	/**
	 * 同時に持てるソフトイメージハンドルの最大数( ハンドルエラーチェックのマスクに使用しているので 0x040000 以下の 2 のべき乗にして下さい )
	 */
	MAX_SOFTIMAGE_NUM = 8192,

	/**
	 * 同時に持てるサウンドハンドルの最大数
	 */
	MAX_SOUND_NUM = 32768,

	/**
	 * 同時に持てるソフトウエアサウンドハンドルの最大数
	 */
	MAX_SOFTSOUND_NUM = 8192,

	/**
	 * 同時に持てるミュージックハンドルの最大数
	 */
	MAX_MUSIC_NUM = 256,

	/**
	 * 同時に持てるムービーハンドルの最大数
	 */
	MAX_MOVIE_NUM = 100,

	/**
	 * 同時に持てるマスクハンドルの最大数
	 */
	MAX_MASK_NUM = 32768,

	/**
	 * 同時に持てるフォントハンドルの最大数
	 */
	MAX_FONT_NUM = 40,

	/**
	 * 同時に持てる文字列入力ハンドルの最大数
	 */
	MAX_INPUT_NUM = 256,

	/**
	 * 同時に持てる通信ハンドルの最大数
	 */
	MAX_SOCKET_NUM = 8192,

	/**
	 * 同時に持てるライトハンドルの最大数
	 */
	MAX_LIGHT_NUM = 4096,

	/**
	 * 同時に持てるシェーダーハンドルの最大数
	 */
	MAX_SHADER_NUM = 4096,

	/**
	 * 同時に持てる定数バッファハンドルの最大数
	 */
	MAX_CONSTANT_BUFFER_NUM = 32768,

	/**
	 * 同時に持てる3Dモデル基本データハンドルの最大数
	 */
	MAX_MODEL_BASE_NUM = 32768,

	/**
	 * 同時に持てる3Dモデルデータハンドルの最大数
	 */
	MAX_MODEL_NUM = 32768,

	/**
	 * 同時に持てる頂点バッファハンドルの最大数
	 */
	MAX_VERTEX_BUFFER_NUM = 16384,

	/**
	 * 同時に持てるインデックスバッファの最大数
	 */
	MAX_INDEX_BUFFER_NUM = 16384,

	/**
	 * 同時に持てるファイルハンドルの最大数
	 */
	MAX_FILE_NUM = 32768,

	/**
	 * 同時に持てる Live2D Cubism 4 Model ハンドルの最大数
	 */
	MAX_LIVE2D_CUBISM4_MODEL_NUM = 32768,

	/**
	 * ジョイパッドの最大数
	 */
	MAX_JOYPAD_NUM = 16,

	/**
	 * ユーザーが登録できるグラフィックロード関数の最大数
	 */
	MAX_USERIMAGEREAD_FUNCNUM = 10,
}

/**
 * デフォルト値
 */
enum
{
	/**
	 * デフォルトの画面の幅
	 */
	DEFAULT_SCREEN_SIZE_X = 640,

	/**
	 * デフォルトの画面の高さ
	 */
	DEFAULT_SCREEN_SIZE_Y = 480,

	/**
	 * デフォルトの色ビット深度
	 */
	DEFAULT_COLOR_BITDEPTH = 16,

	/**
	 * デフォルトのZバッファビット深度
	 */
	DEFAULT_ZBUFFER_BITDEPTH = 16,

	/**
	 * デフォルトの視野角
	 */
	DEFAULT_FOV = 60.0F * 3.1415926535897932384626433832795F / 180.0F,

	/**
	 * tan( FOV * 0.5 )
	 */
	DEFAULT_TAN_FOV_HALF = 0.57735026918962576450914878050196F,

	/**
	 * NEARクリップ面
	 */
	DEFAULT_NEAR = 0.0F,

	/**
	 * FARクリップ面
	 */
	DEFAULT_FAR = 20000.0F,

	/**
	 * デフォルトフォントを示す値
	 */
	DX_DEFAULT_FONT_HANDLE = -2,

	/**
	 * フォントのデフォルトのサイズ
	 */
	DEFAULT_FONT_SIZE = 16,

	/**
	 * フォントのデフォルトの太さ
	 */
	DEFAULT_FONT_THINCK = 6,

	/**
	 * フォントのデフォルトの形態
	 */
	DEFAULT_FONT_TYPE = DX_FONTTYPE_NORMAL,

	/**
	 * フォントのデフォルトの太さ
	 */
	DEFAULT_FONT_EDGESIZE = 1,
}

/**
 * WINDOWSのバージョンマクロ
 */
enum
{
	/**
	 * WINDOWSのバージョンマクロ
	 */
	DX_WINDOWSVERSION_31 = 0x0000,

	/**
	 * WINDOWSのバージョンマクロ
	 */
	DX_WINDOWSVERSION_95 = 0x0001,

	/**
	 * WINDOWSのバージョンマクロ
	 */
	DX_WINDOWSVERSION_98 = 0x0002,

	/**
	 * WINDOWSのバージョンマクロ
	 */
	DX_WINDOWSVERSION_ME = 0x0003,

	/**
	 * WINDOWSのバージョンマクロ
	 */
	DX_WINDOWSVERSION_NT31 = 0x0104,

	/**
	 * WINDOWSのバージョンマクロ
	 */
	DX_WINDOWSVERSION_NT40 = 0x0105,

	/**
	 * WINDOWSのバージョンマクロ
	 */
	DX_WINDOWSVERSION_2000 = 0x0106,

	/**
	 * WINDOWSのバージョンマクロ
	 */
	DX_WINDOWSVERSION_XP = 0x0107,

	/**
	 * WINDOWSのバージョンマクロ
	 */
	DX_WINDOWSVERSION_VISTA = 0x0108,

	/**
	 * WINDOWSのバージョンマクロ
	 */
	DX_WINDOWSVERSION_7 = 0x0109,

	/**
	 * WINDOWSのバージョンマクロ
	 */
	DX_WINDOWSVERSION_8 = 0x010A,

	/**
	 * WINDOWSのバージョンマクロ
	 */
	DX_WINDOWSVERSION_8_1 = 0x010B,

	/**
	 * WINDOWSのバージョンマクロ
	 */
	DX_WINDOWSVERSION_10 = 0x010C,

	/**
	 * WINDOWSのバージョンマクロ
	 */
	DX_WINDOWSVERSION_NT_TYPE = 0x0100,
}

/**
 * DirectXのバージョン
 */
enum
{
	/**
	 * DirectXのバージョン
	 */
	DX_DIRECTXVERSION_NON = 0,

	/**
	 * DirectXのバージョン
	 */
	DX_DIRECTXVERSION_1 = 0x010000,

	/**
	 * DirectXのバージョン
	 */
	DX_DIRECTXVERSION_2 = 0x020000,

	/**
	 * DirectXのバージョン
	 */
	DX_DIRECTXVERSION_3 = 0x030000,

	/**
	 * DirectXのバージョン
	 */
	DX_DIRECTXVERSION_4 = 0x040000,

	/**
	 * DirectXのバージョン
	 */
	DX_DIRECTXVERSION_5 = 0x050000,

	/**
	 * DirectXのバージョン
	 */
	DX_DIRECTXVERSION_6 = 0x060000,

	/**
	 * DirectXのバージョン
	 */
	DX_DIRECTXVERSION_6_1 = 0x060100,

	/**
	 * DirectXのバージョン
	 */
	DX_DIRECTXVERSION_7 = 0x070000,

	/**
	 * DirectXのバージョン
	 */
	DX_DIRECTXVERSION_8 = 0x080000,

	/**
	 * DirectXのバージョン
	 */
	DX_DIRECTXVERSION_8_1 = 0x080100,
}

/**
 * Direct3Dのバージョン
 */
enum
{
	/**
	 * Direct3Dのバージョン
	 */
	DX_DIRECT3D_NONE = 0,

	/**
	 * Direct3Dのバージョン
	 */
	DX_DIRECT3D_9 = 1,

	/**
	 * Direct3Dのバージョン
	 */
	DX_DIRECT3D_9EX = 2,

	/**
	 * Direct3Dのバージョン
	 */
	DX_DIRECT3D_11 = 3,
}

/**
 * Direct3D11 の Feature Level
 */
enum
{
	/**
	 * Direct3D11 の Feature Level
	 */
	DX_DIRECT3D_11_FEATURE_LEVEL_9_1 = 0x9100,

	/**
	 * Direct3D11 の Feature Level
	 */
	DX_DIRECT3D_11_FEATURE_LEVEL_9_2 = 0x9200,

	/**
	 * Direct3D11 の Feature Level
	 */
	DX_DIRECT3D_11_FEATURE_LEVEL_9_3 = 0x9300,

	/**
	 * Direct3D11 の Feature Level
	 */
	DX_DIRECT3D_11_FEATURE_LEVEL_10_0 = 0xA000,

	/**
	 * Direct3D11 の Feature Level
	 */
	DX_DIRECT3D_11_FEATURE_LEVEL_10_1 = 0xA100,

	/**
	 * Direct3D11 の Feature Level
	 */
	DX_DIRECT3D_11_FEATURE_LEVEL_11_0 = 0xB000,

	/**
	 * Direct3D11 の Feature Level
	 */
	DX_DIRECT3D_11_FEATURE_LEVEL_11_1 = 0xB100,
}

/**
 * 文字セット
 */
enum
{
	/**
	 * デフォルト文字セット
	 */
	DX_CHARSET_DEFAULT = 0,

	/**
	 * シフトJIS
	 */
	DX_CHARSET_SHFTJIS = 1,

	/**
	 * ハングル文字セット
	 */
	DX_CHARSET_HANGEUL = 2,

	/**
	 * 繁体文字セット
	 */
	DX_CHARSET_BIG5 = 3,

	/**
	 * 簡体文字セット
	 */
	DX_CHARSET_GB2312 = 4,

	/**
	 * 欧文(ラテン文字の文字コード)
	 */
	DX_CHARSET_WINDOWS_1252 = 5,

	/**
	 * 欧文(ラテン文字の文字コード)
	 */
	DX_CHARSET_ISO_IEC_8859_15 = 6,

	/**
	 * UTF-8
	 */
	DX_CHARSET_UTF8 = 7,

	/**
	 * 文字セットの数
	 */
	DX_CHARSET_NUM = 8,
}

/**
 * 文字コード形式
 */
enum
{
	/**
	 * シフトJISコード
	 */
	DX_CHARCODEFORMAT_SHIFTJIS = 932,

	/**
	 * 簡体字文字コード
	 */
	DX_CHARCODEFORMAT_GB2312 = 936,

	/**
	 * ハングル文字コード
	 */
	DX_CHARCODEFORMAT_UHC = 949,

	/**
	 * 繁体文字コード
	 */
	DX_CHARCODEFORMAT_BIG5 = 950,

	/**
	 * UTF-16 リトルエンディアン
	 */
	DX_CHARCODEFORMAT_UTF16LE = 1200,

	/**
	 * UTF-16 ビッグエンディアン
	 */
	DX_CHARCODEFORMAT_UTF16BE = 1201,

	/**
	 * 欧文(ラテン文字の文字コード)
	 */
	DX_CHARCODEFORMAT_WINDOWS_1252 = 1252,

	/**
	 * 欧文(ラテン文字の文字コード)
	 */
	DX_CHARCODEFORMAT_ISO_IEC_8859_15 = 32764,

	/**
	 * UTF-8
	 */
	DX_CHARCODEFORMAT_UTF8 = 65001,

	/**
	 * アスキー文字コード
	 */
	DX_CHARCODEFORMAT_ASCII = 32765,

	/**
	 * UTF-32 リトルエンディアン
	 */
	DX_CHARCODEFORMAT_UTF32LE = 32766,

	/**
	 * UTF-32 ビッグエンディアン
	 */
	DX_CHARCODEFORMAT_UTF32BE = 32767,
}

/**
 * MIDIの演奏モード定義
 */
enum
{
	/**
	 * MCIによる演奏
	 */
	DX_MIDIMODE_MCI = 0,

	/**
	 * DirectMusicによる演奏
	 */
	DX_MIDIMODE_DM = 1,

	/**
	 * DirectMusic(リバーブあり)による演奏
	 */
	DX_MIDIMODE_DIRECT_MUSIC_REVERB = 1,

	/**
	 * DirectMusic(リバーブなし)による演奏
	 */
	DX_MIDIMODE_DIRECT_MUSIC_NORMAL = 2,

	/**
	 * MIDIの演奏モードの数
	 */
	DX_MIDIMODE_NUM = 3,
}

/**
 * 描画モード定義
 */
enum
{
	/**
	 * ネアレストネイバー法で描画
	 */
	DX_DRAWMODE_NEAREST = 0,

	/**
	 * バイリニア法で描画する
	 */
	DX_DRAWMODE_BILINEAR = 1,

	/**
	 * 異方性フィルタリング法で描画する
	 */
	DX_DRAWMODE_ANISOTROPIC = 2,

	/**
	 * それ以外
	 */
	DX_DRAWMODE_OTHER = 3,

	/**
	 * 描画モードの数
	 */
	DX_DRAWMODE_NUM = 4,
}

/**
 * フォントのタイプ
 */
enum
{
	/**
	 * ノーマルフォント
	 */
	DX_FONTTYPE_NORMAL = 0x00,

	/**
	 * エッジつきフォント
	 */
	DX_FONTTYPE_EDGE = 0x01,

	/**
	 * アンチエイリアスフォント( 標準機能アンチエイリアス )
	 */
	DX_FONTTYPE_ANTIALIASING = 0x02,

	/**
	 * アンチエイリアスフォント( 4x4サンプリング )
	 */
	DX_FONTTYPE_ANTIALIASING_4X4 = 0x12,

	/**
	 * アンチエイリアスフォント( 8x8サンプリング )
	 */
	DX_FONTTYPE_ANTIALIASING_8X8 = 0x22,

	/**
	 * アンチエイリアス&エッジ付きフォント( 標準機能アンチエイリアス )
	 */
	DX_FONTTYPE_ANTIALIASING_EDGE = 0x03,

	/**
	 * アンチエイリアス&エッジ付きフォント( 4x4サンプリング )
	 */
	DX_FONTTYPE_ANTIALIASING_EDGE_4X4 = 0x13,

	/**
	 * アンチエイリアス&エッジ付きフォント( 8x8サンプリング )
	 */
	DX_FONTTYPE_ANTIALIASING_EDGE_8X8 = 0x23,
}

/**
 * フォント画像の階調ビット数
 */
enum
{
	/**
	 * フォント画像の階調ビット数
	 */
	DX_FONTIMAGE_BIT_1 = 0,

	/**
	 * フォント画像の階調ビット数
	 */
	DX_FONTIMAGE_BIT_4 = 1,

	/**
	 * フォント画像の階調ビット数
	 */
	DX_FONTIMAGE_BIT_8 = 2,
}

/**
 * 描画ブレンドモード定義
 */
enum
	{
	/**
	 * ノーブレンド
	 */
	DX_BLENDMODE_NOBLEND = 0,

	/**
	 * αブレンド
	 */
	DX_BLENDMODE_ALPHA = 1,

	/**
	 * 加算ブレンド
	 */
	DX_BLENDMODE_ADD = 2,

	/**
	 * 減算ブレンド
	 */
	DX_BLENDMODE_SUB = 3,

	/**
	 * 乗算ブレンド
	 */
	DX_BLENDMODE_MUL = 4,

	// (内部処理用)

	/**
	 * 内部処理用減算ブレンド2
	 */
	DX_BLENDMODE_SUB2 = 5,

	// 境界線ぼかし
	//DX_BLENDMODE_BLINEALPHA = 7,

	/**
	 * XORブレンド( ソフトウエアレンダリングモードでのみ有効 )
	 */
	DX_BLENDMODE_XOR = 6,

	/**
	 * カラーは更新されない
	 */
	DX_BLENDMODE_DESTCOLOR = 8,

	/**
	 * 描画先の色の反転値を掛ける
	 */
	DX_BLENDMODE_INVDESTCOLOR = 9,

	/**
	 * 描画元の色を反転する
	 */
	DX_BLENDMODE_INVSRC = 10,

	/**
	 * アルファチャンネル考慮付き乗算ブレンド
	 */
	DX_BLENDMODE_MULA = 11,

	/**
	 * αブレンドの描画元の輝度を最大4倍にできるモード
	 */
	DX_BLENDMODE_ALPHA_X4 = 12,

	/**
	 * 加算ブレンドの描画元の輝度を最大4倍にできるモード
	 */
	DX_BLENDMODE_ADD_X4 = 13,

	/**
	 * 描画元のカラーでそのまま描画される
	 */
	DX_BLENDMODE_SRCCOLOR = 14,

	/**
	 * 半加算ブレンド
	 */
	DX_BLENDMODE_HALF_ADD = 15,

	/**
	 * 内部処理用減算ブレンド1
	 */
	DX_BLENDMODE_SUB1 = 16,

	/**
	 * 乗算済みαブレンドモードのαブレンド
	 */
	DX_BLENDMODE_PMA_ALPHA = 17,

	/**
	 * 乗算済みαブレンドモードの加算ブレンド
	 */
	DX_BLENDMODE_PMA_ADD = 18,

	/**
	 * 乗算済みαブレンドモードの減算ブレンド
	 */
	DX_BLENDMODE_PMA_SUB = 19,

	/**
	 * 乗算済みαブレンドモードの描画元の色を反転する
	 */
	DX_BLENDMODE_PMA_INVSRC = 20,

	/**
	 * 乗算済みαブレンドモードのαブレンドの描画元の輝度を最大4倍にできるモード
	 */
	DX_BLENDMODE_PMA_ALPHA_X4 = 21,

	/**
	 * 乗算済みαブレンドモードの加算ブレンドの描画元の輝度を最大4倍にできるモード
	 */
	DX_BLENDMODE_PMA_ADD_X4 = 22,

	/**
	 * Live2D のブレンドモード Zero 用
	 */
	DX_BLENDMODE_LIVE2D_ZERO = 23,

	/**
	 * Live2D のブレンドモード Normal 用
	 */
	DX_BLENDMODE_LIVE2D_NORMAL = 24,

	/**
	 * Live2D のブレンドモード Add 用
	 */
	DX_BLENDMODE_LIVE2D_ADD = 25,

	/**
	 * Live2D のブレンドモード Mult 用
	 */
	DX_BLENDMODE_LIVE2D_MULT = 26,

	/**
	 * Live2D のブレンドモード Mask 用
	 */
	DX_BLENDMODE_LIVE2D_MASK = 27,

	/**
	 * ブレンドモードの数
	 */
	DX_BLENDMODE_NUM = 28,
}

/**
 * DrawGraphF 等の浮動小数点値で座標を指定する関数における座標タイプ
 */
enum
{
	/**
	 * Direct3D9タイプ( -0.5f の補正を行わないとテクスチャのピクセルが綺麗にマップされないタイプ )
	 */
	DX_DRAWFLOATCOORDTYPE_DIRECT3D9 = 0,

	/**
	 * Direct3D10タイプ( -0.5f の補正を行わななくてもテクスチャのピクセルが綺麗にマップされるタイプ )
	 */
	DX_DRAWFLOATCOORDTYPE_DIRECT3D10 = 1,
}

/**
 * 画像合成タイプ
 */
enum
{
	/**
	 * 通常合成
	 */
	DX_BLENDGRAPHTYPE_NORMAL = 0,

	/**
	 * ワイプ処理
	 */
	DX_BLENDGRAPHTYPE_WIPE = 1,

	/**
	 * ブレンド画像のα値と元画像のα値を掛け合わせる
	 */
	DX_BLENDGRAPHTYPE_ALPHA = 2,

	/**
	 * ?
	 */
	DX_BLENDGRAPHTYPE_NUM = 3,
}

/**
 * 画像合成座標タイプ
 */
enum
{
	/**
	 * 描画する画像基準で合成画像の座標を決定
	 */
	DX_BLENDGRAPH_POSMODE_DRAWGRAPH = 0,

	/**
	 * スクリーン座標基準で合成画像の座標を決定
	 */
	DX_BLENDGRAPH_POSMODE_SCREEN = 1,

	/**
	 * ?
	 */
	DX_BLENDGRAPH_POSMODE_NUM = 2,
}

/**
 * グラフィックフィルタータイプ
 */
enum
{
	/**
	 * モノトーンフィルタ
	 */
	DX_GRAPH_FILTER_MONO = 0,

	/**
	 * ガウスフィルタ
	 */
	DX_GRAPH_FILTER_GAUSS = 1,

	/**
	 * 縮小フィルタ
	 */
	DX_GRAPH_FILTER_DOWN_SCALE = 2,

	/**
	 * 明るさクリップフィルタ
	 */
	DX_GRAPH_FILTER_BRIGHT_CLIP = 3,

	/**
	 * 指定の明るさ領域を拡大するフィルタ
	 */
	DX_GRAPH_FILTER_BRIGHT_SCALE = 4,

	/**
	 * 色相・彩度・明度フィルタ
	 */
	DX_GRAPH_FILTER_HSB = 5,

	/**
	 * 階調の反転フィルタ
	 */
	DX_GRAPH_FILTER_INVERT = 6,

	/**
	 * レベル補正フィルタ
	 */
	DX_GRAPH_FILTER_LEVEL = 7,

	/**
	 * 2階調化フィルタ
	 */
	DX_GRAPH_FILTER_TWO_COLOR = 8,

	/**
	 * グラデーションマップフィルタ
	 */
	DX_GRAPH_FILTER_GRADIENT_MAP = 9,

	/**
	 * 色の置換
	 */
	DX_GRAPH_FILTER_REPLACEMENT = 10,

	/**
	 * 通常のアルファチャンネル付き画像を乗算済みアルファ画像に変換するフィルタ
	 */
	DX_GRAPH_FILTER_PREMUL_ALPHA = 11,

	/**
	 * 乗算済みα画像を通常のアルファチャンネル付き画像に変換するフィルタ
	 */
	DX_GRAPH_FILTER_INTERP_ALPHA = 12,

	/**
	 * YUVカラーをRGBカラーに変換するフィルタ
	 */
	DX_GRAPH_FILTER_YUV_TO_RGB = 13,

	/**
	 * YUVカラーをRGBカラーに変換するフィルタ( UV成分が Y成分の半分・又は4分の1( 横・縦片方若しくは両方 )の解像度しかない場合用 )
	 */
	DX_GRAPH_FILTER_Y2UV1_TO_RGB = 14,

	/**
	 * YUVカラーをRGBカラーに変換するフィルタ( 且つ右側半分のRの値をアルファ値として扱う )
	 */
	DX_GRAPH_FILTER_YUV_TO_RGB_RRA = 15,

	/**
	 * YUVカラーをRGBカラーに変換するフィルタ( UV成分が Y成分の半分・又は4分の1( 横・縦片方若しくは両方 )の解像度しかない場合用 )( 且つ右側半分のRの値をアルファ値として扱う )
	 */
	DX_GRAPH_FILTER_Y2UV1_TO_RGB_RRA = 16,

	/**
	 * バイキュービックを使用した拡大・縮小フィルタ
	 */
	DX_GRAPH_FILTER_BICUBIC_SCALE = 17,

	/**
	 * Lanczos-3を使用した拡大・縮小フィルタ
	 */
	DX_GRAPH_FILTER_LANCZOS3_SCALE = 18,

	/**
	 * 明るさクリップフィルタ(乗算済みアルファ画像用)
	 */
	DX_GRAPH_FILTER_PMA_BRIGHT_CLIP = 19,

	/**
	 * 指定の明るさ領域を拡大するフィルタ(乗算済みアルファ画像用)
	 */
	DX_GRAPH_FILTER_PMA_BRIGHT_SCALE = 20,

	/**
	 * 色相・彩度・明度フィルタ(乗算済みアルファ画像用)
	 */
	DX_GRAPH_FILTER_PMA_HSB = 21,

	/**
	 * 階調の反転フィルタ(乗算済みアルファ画像用)
	 */
	DX_GRAPH_FILTER_PMA_INVERT = 22,

	/**
	 * レベル補正フィルタ(乗算済みアルファ画像用)
	 */
	DX_GRAPH_FILTER_PMA_LEVEL = 23,

	/**
	 * 2階調化フィルタ(乗算済みアルファ画像用)
	 */
	DX_GRAPH_FILTER_PMA_TWO_COLOR = 24,

	/**
	 * グラデーションマップフィルタ(乗算済みアルファ画像用)
	 */
	DX_GRAPH_FILTER_PMA_GRADIENT_MAP = 25,

	/**
	 * 色の置換(乗算済みアルファ画像用)
	 */
	DX_GRAPH_FILTER_PMA_REPLACEMENT = 26,

	/**
	 * グラフィックフィルタータイプの数
	 */
	DX_GRAPH_FILTER_NUM = 27,
}

/**
 * グラフィックブレンドタイプ
 */
enum
{
	/**
	 * 通常
	 */
	DX_GRAPH_BLEND_NORMAL = 0,

	/**
	 * RGBAの要素を選択して合成
	 */
	DX_GRAPH_BLEND_RGBA_SELECT_MIX = 1,

	/**
	 * 乗算
	 */
	DX_GRAPH_BLEND_MULTIPLE = 2,

	/**
	 * 減算
	 */
	DX_GRAPH_BLEND_DIFFERENCE = 3,

	/**
	 * 加算
	 */
	DX_GRAPH_BLEND_ADD = 4,

	/**
	 * スクリーン
	 */
	DX_GRAPH_BLEND_SCREEN = 5,

	/**
	 * オーバーレイ
	 */
	DX_GRAPH_BLEND_OVERLAY = 6,

	/**
	 * 覆い焼き
	 */
	DX_GRAPH_BLEND_DODGE = 7,

	/**
	 * 焼き込み
	 */
	DX_GRAPH_BLEND_BURN = 8,

	/**
	 * 比較(暗)
	 */
	DX_GRAPH_BLEND_DARKEN = 9,

	/**
	 * 比較(明)
	 */
	DX_GRAPH_BLEND_LIGHTEN = 10,

	/**
	 * ソフトライト
	 */
	DX_GRAPH_BLEND_SOFTLIGHT = 11,

	/**
	 * ハードライト
	 */
	DX_GRAPH_BLEND_HARDLIGHT = 12,

	/**
	 * 除外
	 */
	DX_GRAPH_BLEND_EXCLUSION = 13,

	/**
	 * αチャンネル付き画像の通常合成
	 */
	DX_GRAPH_BLEND_NORMAL_ALPHACH = 14,

	/**
	 * αチャンネル付き画像の加算合成
	 */
	DX_GRAPH_BLEND_ADD_ALPHACH = 15,

	/**
	 * アルファチャンネルのみの乗算
	 */
	DX_GRAPH_BLEND_MULTIPLE_A_ONLY = 16,

	/**
	 * 通常( 乗算済みα画像用 )
	 */
	DX_GRAPH_BLEND_PMA_NORMAL = 17,

	/**
	 * RGBAの要素を選択して合成( 乗算済みα画像用 )
	 */
	DX_GRAPH_BLEND_PMA_RGBA_SELECT_MIX = 18,

	/**
	 * 乗算( 乗算済みα画像用 )
	 */
	DX_GRAPH_BLEND_PMA_MULTIPLE = 19,

	/**
	 * 減算( 乗算済みα画像用 )
	 */
	DX_GRAPH_BLEND_PMA_DIFFERENCE = 20,

	/**
	 * 加算( 乗算済みα画像用 )
	 */
	DX_GRAPH_BLEND_PMA_ADD = 21,

	/**
	 * スクリーン( 乗算済みα画像用 )
	 */
	DX_GRAPH_BLEND_PMA_SCREEN = 22,

	/**
	 * オーバーレイ( 乗算済みα画像用 )
	 */
	DX_GRAPH_BLEND_PMA_OVERLAY = 23,

	/**
	 * 覆い焼き( 乗算済みα画像用 )
	 */
	DX_GRAPH_BLEND_PMA_DODGE = 24,

	/**
	 * 焼き込み( 乗算済みα画像用 )
	 */
	DX_GRAPH_BLEND_PMA_BURN = 25,

	/**
	 * 比較(暗)( 乗算済みα画像用 )
	 */
	DX_GRAPH_BLEND_PMA_DARKEN = 26,

	/**
	 * 比較(明)( 乗算済みα画像用 )
	 */
	DX_GRAPH_BLEND_PMA_LIGHTEN = 27,

	/**
	 * ソフトライト( 乗算済みα画像用 )
	 */
	DX_GRAPH_BLEND_PMA_SOFTLIGHT = 28,

	/**
	 * ハードライト( 乗算済みα画像用 )
	 */
	DX_GRAPH_BLEND_PMA_HARDLIGHT = 29,

	/**
	 * 除外( 乗算済みα画像用 )
	 */
	DX_GRAPH_BLEND_PMA_EXCLUSION = 30,

	/**
	 * αチャンネル付き画像の通常合成( 乗算済みα画像用 )
	 */
	DX_GRAPH_BLEND_PMA_NORMAL_ALPHACH = 31,

	/**
	 * αチャンネル付き画像の加算合成( 乗算済みα画像用 )
	 */
	DX_GRAPH_BLEND_PMA_ADD_ALPHACH = 32,

	/**
	 * アルファチャンネルのみの乗算( 乗算済みα画像用 )
	 */
	DX_GRAPH_BLEND_PMA_MULTIPLE_A_ONLY = 33,

	/**
	 * ?
	 */
	DX_GRAPH_BLEND_NUM = 34,
}

/**
 * DX_GRAPH_BLEND_RGBA_SELECT_MIX 用の色選択用定義
 */
enum
{
	/**
	 * 元画像の赤成分
	 */
	DX_RGBA_SELECT_SRC_R = 0,

	/**
	 * 元画像の緑成分
	 */
	DX_RGBA_SELECT_SRC_G = 1,

	/**
	 * 元画像の青成分
	 */
	DX_RGBA_SELECT_SRC_B = 2,

	/**
	 * 元画像のα成分
	 */
	DX_RGBA_SELECT_SRC_A = 3,

	/**
	 * ブレンド画像の赤成分
	 */
	DX_RGBA_SELECT_BLEND_R = 4,

	/**
	 * ブレンド画像の緑成分
	 */
	DX_RGBA_SELECT_BLEND_G = 5,

	/**
	 * ブレンド画像の青成分
	 */
	DX_RGBA_SELECT_BLEND_B = 6,

	/**
	 * ブレンド画像のα成分
	 */
	DX_RGBA_SELECT_BLEND_A = 7,

	/**
	 * 元画像の赤成分を反転したもの
	 */
	DX_RGBA_SELECT_SRC_INV_R = 8,

	/**
	 * 元画像の緑成分を反転したもの
	 */
	DX_RGBA_SELECT_SRC_INV_G = 9,

	/**
	 * 元画像の青成分を反転したもの
	 */
	DX_RGBA_SELECT_SRC_INV_B = 10,

	/**
	 * 元画像のα成分を反転したもの
	 */
	DX_RGBA_SELECT_SRC_INV_A = 11,

	/**
	 * ブレンド画像の赤成分を反転したもの
	 */
	DX_RGBA_SELECT_BLEND_INV_R = 12,

	/**
	 * ブレンド画像の緑成分を反転したもの
	 */
	DX_RGBA_SELECT_BLEND_INV_G = 13,

	/**
	 * ブレンド画像の青成分を反転したもの
	 */
	DX_RGBA_SELECT_BLEND_INV_B = 14,

	/**
	 * ブレンド画像のα成分を反転したもの
	 */
	DX_RGBA_SELECT_BLEND_INV_A = 15,
}

/**
 * フィルモード
 */
enum
{
	/**
	 * ワイヤーフレーム
	 */
	DX_FILL_WIREFRAME = 2,

	/**
	 * ポリゴン
	 */
	DX_FILL_SOLID = 3,
}

/**
 * ポリゴンカリングモード
 */
enum
{
	/**
	 * カリングなし
	 */
	DX_CULLING_NONE = 0,

	/**
	 * 背面を左回りでカリング
	 */
	DX_CULLING_LEFT = 1,

	/**
	 * 背面を右回りでカリング
	 */
	DX_CULLING_RIGHT = 2,

	/**
	 * カリングモードの数
	 */
	DX_CULLING_NUM = 3,
}

/**
 * クリッピング方向
 */
enum
{
	/**
	 * 画面左方向にクリップ
	 */
	DX_CAMERACLIP_LEFT = 0x01,

	/**
	 * 画面右方向にクリップ
	 */
	DX_CAMERACLIP_RIGHT = 0x02,

	/**
	 * 画面下方向にクリップ
	 */
	DX_CAMERACLIP_BOTTOM = 0x04,

	/**
	 * 画面上方向にクリップ
	 */
	DX_CAMERACLIP_TOP = 0x08,

	/**
	 * 画面後方向にクリップ
	 */
	DX_CAMERACLIP_BACK = 0x10,

	/**
	 * 画面前方向にクリップ
	 */
	DX_CAMERACLIP_FRONT = 0x20,
}

/**
 * MV1モデルの頂点タイプ
 */
enum
{
	/**
	 * 1フレームの影響を受ける頂点
	 */
	DX_MV1_VERTEX_TYPE_1FRAME = 0,

	/**
	 * 1〜4フレームの影響を受ける頂点
	 */
	DX_MV1_VERTEX_TYPE_4FRAME = 1,

	/**
	 * 5〜8フレームの影響を受ける頂点
	 */
	DX_MV1_VERTEX_TYPE_8FRAME = 2,

	/**
	 * 9フレーム以上の影響を受ける頂点
	 */
	DX_MV1_VERTEX_TYPE_FREE_FRAME = 3,

	/**
	 * 法線マップ用の情報が含まれる1フレームの影響を受ける頂点
	 */
	DX_MV1_VERTEX_TYPE_NMAP_1FRAME = 4,

	/**
	 * 法線マップ用の情報が含まれる1〜4フレームの影響を受ける頂点
	 */
	DX_MV1_VERTEX_TYPE_NMAP_4FRAME = 5,

	/**
	 * 法線マップ用の情報が含まれる5〜8フレームの影響を受ける頂点
	 */
	DX_MV1_VERTEX_TYPE_NMAP_8FRAME = 6,

	/**
	 * 法線マップ用の情報が含まれる9フレーム以上の影響を受ける頂点
	 */
	DX_MV1_VERTEX_TYPE_NMAP_FREE_FRAME = 7,

	/**
	 * 頂点タイプの数
	 */
	DX_MV1_VERTEX_TYPE_NUM = 8,
}

/**
 * メッシュの種類
 */
enum
{
	/**
	 * 普通のメッシュ
	 */
	DX_MV1_MESHCATEGORY_NORMAL = 0,

	/**
	 * 輪郭線描画用メッシュ
	 */
	DX_MV1_MESHCATEGORY_OUTLINE = 1,

	/**
	 * 輪郭線描画用メッシュ( オリジナルシェーダーでの描画用 )
	 */
	DX_MV1_MESHCATEGORY_OUTLINE_ORIG_SHADER = 2,

	/**
	 * メッシュの種類の数
	 */
	DX_MV1_MESHCATEGORY_NUM = 3,
}

/**
 * シェイプ率の適用タイプ
 */
enum
{
	/**
	 * 元の値に加算
	 */
	DX_MV1_SHAPERATE_ADD = 0,

	/**
	 * 元の値に上書き
	 */
	DX_MV1_SHAPERATE_OVERWRITE = 1,
}

/**
 * MV1ファイルの保存タイプ
 */
enum
{
	/**
	 * メッシュ情報のみ保存
	 */
	MV1_SAVETYPE_MESH = 0x0001,

	/**
	 * アニメーション情報のみ保存
	 */
	MV1_SAVETYPE_ANIM = 0x0002,

	/**
	 * 通常保存
	 */
	MV1_SAVETYPE_NORMAL = MV1_SAVETYPE_MESH | MV1_SAVETYPE_ANIM,
}

/**
 * アニメーションキーデータタイプ
 */
enum
{
	/**
	 * 回転
	 */
	MV1_ANIMKEY_DATATYPE_ROTATE = 0,

	/**
	 * 回転X
	 */
	MV1_ANIMKEY_DATATYPE_ROTATE_X = 1,

	/**
	 * 回転Y
	 */
	MV1_ANIMKEY_DATATYPE_ROTATE_Y = 2,

	/**
	 * 回転Z
	 */
	MV1_ANIMKEY_DATATYPE_ROTATE_Z = 3,

	/**
	 * 拡大
	 */
	MV1_ANIMKEY_DATATYPE_SCALE = 5,

	/**
	 * スケールX
	 */
	MV1_ANIMKEY_DATATYPE_SCALE_X = 6,

	/**
	 * スケールY
	 */
	MV1_ANIMKEY_DATATYPE_SCALE_Y = 7,

	/**
	 * スケールZ
	 */
	MV1_ANIMKEY_DATATYPE_SCALE_Z = 8,

	/**
	 * 平行移動
	 */
	MV1_ANIMKEY_DATATYPE_TRANSLATE = 10,

	/**
	 * 平行移動X
	 */
	MV1_ANIMKEY_DATATYPE_TRANSLATE_X = 11,

	/**
	 * 平行移動Y
	 */
	MV1_ANIMKEY_DATATYPE_TRANSLATE_Y = 12,

	/**
	 * 平行移動Z
	 */
	MV1_ANIMKEY_DATATYPE_TRANSLATE_Z = 13,

	/**
	 * 4×4行列の4列目( 0,0,0,1 )固定版
	 */
	MV1_ANIMKEY_DATATYPE_MATRIX4X4C = 15,

	/**
	 * 3×3行列
	 */
	MV1_ANIMKEY_DATATYPE_MATRIX3X3 = 17,

	/**
	 * シェイプ
	 */
	MV1_ANIMKEY_DATATYPE_SHAPE = 18,

	/**
	 * その他
	 */
	MV1_ANIMKEY_DATATYPE_OTHRE = 20,
}

/**
 * タイムタイプ
 */
enum
{
	/**
	 * 時間情報は全体で1つ
	 */
	MV1_ANIMKEY_TIME_TYPE_ONE = 0,

	/**
	 * 時間情報は各キーに1つ
	 */
	MV1_ANIMKEY_TIME_TYPE_KEY = 1,
}

/**
 * アニメーションキータイプ
 */
enum
{
	/**
	 * クォータニオン( Xファイルタイプ )
	 */
	MV1_ANIMKEY_TYPE_QUATERNION_X = 0,

	/**
	 * ベクター
	 */
	MV1_ANIMKEY_TYPE_VECTOR = 1,

	/**
	 * 4×4行列の4列目( 0,0,0,1 )固定版
	 */
	MV1_ANIMKEY_TYPE_MATRIX4X4C = 2,

	/**
	 * 3×3行列
	 */
	MV1_ANIMKEY_TYPE_MATRIX3X3 = 3,

	/**
	 * フラット
	 */
	MV1_ANIMKEY_TYPE_FLAT = 4,

	/**
	 * 線形補間
	 */
	MV1_ANIMKEY_TYPE_LINEAR = 5,

	/**
	 * 混合
	 */
	MV1_ANIMKEY_TYPE_BLEND = 6,

	/**
	 * クォータニオン( VMDタイプ )
	 */
	MV1_ANIMKEY_TYPE_QUATERNION_VMD = 7,
}

/**
 * 描画先画面指定用定義
 */
enum
{
	/**
	 * ?
	 */
	DX_SCREEN_FRONT = 0xFFFFFFFC,

	/**
	 * ?
	 */
	DX_SCREEN_BACK = 0xFFFFFFFE,

	/**
	 * ?
	 */
	DX_SCREEN_WORK = 0xFFFFFFFD,

	/**
	 * ?
	 */
	DX_SCREEN_TEMPFRONT = 0xFFFFFFF0,

	/**
	 * ?
	 */
	DX_SCREEN_OTHER = 0xFFFFFFFA,
}

/**
 * グラフィックなしハンドル
 */
enum DX_NONE_GRAPH = 0xFFFFFFFB;

/**
 * グラフィック減色時の画像劣化緩和処理モード
 */
enum
{
	/**
	 * 画像劣化緩和処理を行わない
	 */
	DX_SHAVEDMODE_NONE = 0,

	/**
	 * ディザリング
	 */
	DX_SHAVEDMODE_DITHER = 1,

	/**
	 * 誤差拡散
	 */
	DX_SHAVEDMODE_DIFFUS = 2,
}

/**
 * 画像の保存タイプ
 */
enum
{
	/**
	 * bitmap
	 */
	DX_IMAGESAVETYPE_BMP = 0,

	/**
	 * jpeg
	 */
	DX_IMAGESAVETYPE_JPEG = 1,

	/**
	 * Png
	 */
	DX_IMAGESAVETYPE_PNG = 2,

	/**
	 * Direct Draw Surface
	 */
	DX_IMAGESAVETYPE_DDS = 3,
}

/**
 * サウンド再生形態指定用定義
 */
enum
{
	/**
	 * ループ再生ビット
	 */
	DX_PLAYTYPE_LOOPBIT = 0x0002,

	/**
	 * バックグラウンド再生ビット
	 */
	DX_PLAYTYPE_BACKBIT = 0x0001,

	/**
	 * ノーマル再生
	 */
	DX_PLAYTYPE_NORMAL = 0,

	/**
	 * バックグラウンド再生
	 */
	DX_PLAYTYPE_BACK = DX_PLAYTYPE_BACKBIT,

	/**
	 * ループ再生
	 */
	DX_PLAYTYPE_LOOP = DX_PLAYTYPE_LOOPBIT | DX_PLAYTYPE_BACKBIT,
}

/**
 * 動画再生タイプ定義
 */
enum
{
	/**
	 * ボタンキャンセルあり
	 */
	DX_MOVIEPLAYTYPE_BCANCEL = 0,

	/**
	 * ボタンキャンセルなし
	 */
	DX_MOVIEPLAYTYPE_NORMAL = 1,
}

/**
 * サウンドのタイプ
 */
enum
{
	/**
	 * ノーマルサウンド形式
	 */
	DX_SOUNDTYPE_NORMAL = 0,

	/**
	 * ストリーム風サウンド形式
	 */
	DX_SOUNDTYPE_STREAMSTYLE = 1,
}

/**
 * サウンドデータタイプのマクロ
 */
enum
{
	/**
	 * 圧縮された全データは再生が始まる前にサウンドメモリにすべて解凍され、格納される
	 */
	DX_SOUNDDATATYPE_MEMNOPRESS = 0,

	/**
	 * 圧縮された全データはシステムメモリに格納され、再生しながら逐次解凍され、最終的にすべてサウンドメモリに格納される(その後システムメモリに存在する圧縮データは破棄される)
	 */
	DX_SOUNDDATATYPE_MEMNOPRESS_PLUS = 1,

	/**
	 * 圧縮された全データはシステムメモリに格納され、再生する部分だけ逐次解凍しながらサウンドメモリに格納する(鳴らし終わると解凍したデータは破棄されるので何度も解凍処理が行われる)
	 */
	DX_SOUNDDATATYPE_MEMPRESS = 2,

	/**
	 * 圧縮されたデータの再生する部分だけファイルから逐次読み込み解凍され、サウンドメモリに格納される(鳴らし終わると解凍したデータは破棄されるので何度も解凍処理が行われる)
	 */
	DX_SOUNDDATATYPE_FILE = 3,
}

/**
 * サウンドの取得する再生時間タイプ
 */
enum
{
	/**
	 * 低レベルAPIを使用してより正確な再生時間を取得する
	 */
	DX_SOUNDCURRENTTIME_TYPE_LOW_LEVEL = 0,

	/**
	 * APIは使用せず、ソフトウェア処理レベルでの再生時間を取得する
	 */
	DX_SOUNDCURRENTTIME_TYPE_SOFT = 1,
}

/**
 * 読み込み処理のタイプ
 */
enum
{
	/**
	 * PCM の読み込み処理
	 */
	DX_READSOUNDFUNCTION_PCM = 1 << 0,

	/**
	 * Ogg Vorbis の読み込み処理
	 */
	DX_READSOUNDFUNCTION_OGG = 1 << 1,

	/**
	 * Opus の読み込み処理
	 */
	DX_READSOUNDFUNCTION_OPUS = 1 << 2,

	/**
	 * 環境非依存の読み込み処理タイプの数
	 */
	DX_READSOUNDFUNCTION_DEFAULT_NUM = 3,
}

/**
 * 3Dサウンドリバーブエフェクトのプリセット
 */
enum
{
	/**
	 * デフォルト
	 */
	DX_REVERB_PRESET_DEFAULT = 0,

	/**
	 * 一般的な空間
	 */
	DX_REVERB_PRESET_GENERIC = 1,

	/**
	 * 精神病患者室(?)
	 */
	DX_REVERB_PRESET_PADDEDCELL = 2,

	/**
	 * 部屋
	 */
	DX_REVERB_PRESET_ROOM = 3,

	/**
	 * バスルーム
	 */
	DX_REVERB_PRESET_BATHROOM = 4,

	/**
	 * リビングルーム
	 */
	DX_REVERB_PRESET_LIVINGROOM = 5,

	/**
	 * 石の部屋
	 */
	DX_REVERB_PRESET_STONEROOM = 6,

	/**
	 * 講堂
	 */
	DX_REVERB_PRESET_AUDITORIUM = 7,

	/**
	 * コンサートホール
	 */
	DX_REVERB_PRESET_CONCERTHALL = 8,

	/**
	 * 洞穴
	 */
	DX_REVERB_PRESET_CAVE = 9,

	/**
	 * 舞台
	 */
	DX_REVERB_PRESET_ARENA = 10,

	/**
	 * 格納庫
	 */
	DX_REVERB_PRESET_HANGAR = 11,

	/**
	 * カーペットが敷かれた玄関
	 */
	DX_REVERB_PRESET_CARPETEDHALLWAY = 12,

	/**
	 * 玄関
	 */
	DX_REVERB_PRESET_HALLWAY = 13,

	/**
	 * 石の廊下
	 */
	DX_REVERB_PRESET_STONECORRIDOR = 14,

	/**
	 * 裏通り
	 */
	DX_REVERB_PRESET_ALLEY = 15,

	/**
	 * 森
	 */
	DX_REVERB_PRESET_FOREST = 16,

	/**
	 * 都市
	 */
	DX_REVERB_PRESET_CITY = 17,

	/**
	 * 山
	 */
	DX_REVERB_PRESET_MOUNTAINS = 18,

	/**
	 * 採石場
	 */
	DX_REVERB_PRESET_QUARRY = 19,

	/**
	 * 平原
	 */
	DX_REVERB_PRESET_PLAIN = 20,

	/**
	 * 駐車場
	 */
	DX_REVERB_PRESET_PARKINGLOT = 21,

	/**
	 * 下水管
	 */
	DX_REVERB_PRESET_SEWERPIPE = 22,

	/**
	 * 水面下
	 */
	DX_REVERB_PRESET_UNDERWATER = 23,

	/**
	 * 小部屋
	 */
	DX_REVERB_PRESET_SMALLROOM = 24,

	/**
	 * 中部屋
	 */
	DX_REVERB_PRESET_MEDIUMROOM = 25,

	/**
	 * 大部屋
	 */
	DX_REVERB_PRESET_LARGEROOM = 26,

	/**
	 * 中ホール
	 */
	DX_REVERB_PRESET_MEDIUMHALL = 27,

	/**
	 * 大ホール
	 */
	DX_REVERB_PRESET_LARGEHALL = 28,

	/**
	 * 板
	 */
	DX_REVERB_PRESET_PLATE = 29,

	/**
	 * プリセットの数
	 */
	DX_REVERB_PRESET_NUM = 30,
}

/**
 * マスク透過色モード
 */
enum
{
	/**
	 * マスク画像の白い部分を透過色とする
	 */
	DX_MASKTRANS_WHITE = 0,

	/**
	 * マスク画像の黒い部分を透過色とする
	 */
	DX_MASKTRANS_BLACK = 1,

	/**
	 * 透過色なし
	 */
	DX_MASKTRANS_NONE = 2,
}

/**
 * マスク画像チャンネル
 */
enum
{
	/**
	 * アルファ
	 */
	DX_MASKGRAPH_CH_A = 0,

	/**
	 * 赤
	 */
	DX_MASKGRAPH_CH_R = 1,

	/**
	 * 緑
	 */
	DX_MASKGRAPH_CH_G = 2,

	/**
	 * 青
	 */
	DX_MASKGRAPH_CH_B = 3,
}

/**
 * Zバッファ書き込みモード
 */
enum
{
	/**
	 * 書き込めないようにマスクする
	 */
	DX_ZWRITE_MASK = 0,

	/**
	 * 書き込めるようにマスクをクリアする
	 */
	DX_ZWRITE_CLEAR = 1,
}

/**
 * 比較モード
 */
enum
{
	/**
	 * FALSE
	 */
	DX_CMP_NEVER = 1,

	/**
	 * Src <  Dest        DrawAlpha <  TestParam
	 */
	DX_CMP_LESS = 2,

	/**
	 * Src == Dest        DrawAlpha == TestParam
	 */
	DX_CMP_EQUAL = 3,

	/**
	 * Src <= Dest        DrawAlpha <= TestParam
	 */
	DX_CMP_LESSEQUAL = 4,

	/**
	 * Src >  Dest        DrawAlpha >  TestParam
	 */
	DX_CMP_GREATER = 5,

	/**
	 * Src != Dest        DrawAlpha != TestParam
	 */
	DX_CMP_NOTEQUAL = 6,

	/**
	 * Src >= Dest        DrawAlpha >= TestParam
	 */
	DX_CMP_GREATEREQUAL = 7,

	/**
	 * TRUE
	 */
	DX_CMP_ALWAYS = 8,

	/**
	 * ?
	 */
	DX_ZCMP_DEFAULT = DX_CMP_LESSEQUAL,

	/**
	 * ?
	 */
	DX_ZCMP_REVERSE = DX_CMP_GREATEREQUAL,
}

/**
 * シェーディングモード
 */
enum
{
	/**
	 * D_D3DSHADE_FLAT
	 */
	DX_SHADEMODE_FLAT = 1,

	/**
	 * D_D3DSHADE_GOURAUD
	 */
	DX_SHADEMODE_GOURAUD = 2,
}

/**
 * フォグモード
 */
enum
{
	/**
	 * D_D3DFOG_NONE
	 */
	DX_FOGMODE_NONE = 0,

	/**
	 * D_D3DFOG_EXP
	 */
	DX_FOGMODE_EXP = 1,

	/**
	 * D_D3DFOG_EXP2
	 */
	DX_FOGMODE_EXP2 = 2,

	/**
	 * D_D3DFOG_LINEAR
	 */
	DX_FOGMODE_LINEAR = 3,
}

/**
 * マテリアルタイプ
 */
enum
{
	/**
	 * 標準マテリアル
	 */
	DX_MATERIAL_TYPE_NORMAL = 0,

	/**
	 * トゥーンレンダリング用マテリアル
	 */
	DX_MATERIAL_TYPE_TOON = 1,

	/**
	 * トゥーンレンダリング用マテリアル_タイプ2( MMD互換 )
	 */
	DX_MATERIAL_TYPE_TOON_2 = 2,

	/**
	 * マテリアルのスペキュラ色の輝度の指定の範囲の値を 0.0f 〜 1.0f の値に正規化して書き込むマテリアル
	 */
	DX_MATERIAL_TYPE_MAT_SPEC_LUMINANCE_UNORM = 3,

	/**
	 * DX_MATERIAL_TYPE_MAT_SPEC_LUMINANCE_UNORM に『指定の値未満の場合は書き込む値を 0.0f にする』という処理を加えたマテリアル
	 */
	DX_MATERIAL_TYPE_MAT_SPEC_LUMINANCE_CLIP_UNORM = 4,

	/**
	 * マテリアルのスペキュラ色の輝度が指定の閾値以上 の場合は 1.0f を、未満の場合は 0.0f を書き込むマテリアル
	 */
	DX_MATERIAL_TYPE_MAT_SPEC_LUMINANCE_CMP_GREATEREQUAL = 5,

	/**
	 * マテリアルのスペキュラハイライトの鮮明度の指定の範囲の値を 0.0f 〜 1.0f の値に正規化して書き込むマテリアル
	 */
	DX_MATERIAL_TYPE_MAT_SPEC_POWER_UNORM = 6,

	/**
	 * DX_MATERIAL_TYPE_MAT_SPEC_POWER_UNORM に『指定の値未満の場合は書き込む値を 0.0f にする』という処理を加えたマテリアル
	 */
	DX_MATERIAL_TYPE_MAT_SPEC_POWER_CLIP_UNORM = 7,

	/**
	 * マテリアルのスペキュラハイライトの鮮明度が指定の閾値以上 の場合は 1.0f を、未満の場合は 0.0f を書き込むマテリアル
	 */
	DX_MATERIAL_TYPE_MAT_SPEC_POWER_CMP_GREATEREQUAL = 8,

	/**
	 * ?
	 */
	DX_MATERIAL_TYPE_NUM = 9,
}

/**
 * マテリアルブレンドタイプ
 */
enum
{
	/**
	 * アルファ合成
	 */
	DX_MATERIAL_BLENDTYPE_TRANSLUCENT = 0,

	/**
	 * 加算
	 */
	DX_MATERIAL_BLENDTYPE_ADDITIVE = 1,

	/**
	 * 乗算
	 */
	DX_MATERIAL_BLENDTYPE_MODULATE = 2,

	/**
	 * 無効
	 */
	DX_MATERIAL_BLENDTYPE_NONE = 3,
}

/**
 * テクスチャアドレスタイプ
 */
enum
{
	/**
	 * D_D3DTADDRESS_WRAP
	 */
	DX_TEXADDRESS_WRAP = 1,

	/**
	 * D_D3DTADDRESS_MIRROR
	 */
	DX_TEXADDRESS_MIRROR = 2,

	/**
	 * D_D3DTADDRESS_CLAMP
	 */
	DX_TEXADDRESS_CLAMP = 3,

	/**
	 * D_D3DTADDRESS_BORDER
	 */
	DX_TEXADDRESS_BORDER = 4,

	/**
	 * テクスチャアドレスタイプの数
	 */
	DX_TEXADDRESS_NUM = 5,
}

/**
 * シェーダータイプ
 */
enum
{
	/**
	 * 頂点シェーダー
	 */
	DX_SHADERTYPE_VERTEX = 0,

	/**
	 * ピクセルシェーダー
	 */
	DX_SHADERTYPE_PIXEL = 1,

	/**
	 * ジオメトリシェーダー
	 */
	DX_SHADERTYPE_GEOMETRY = 2,

	/**
	 * コンピュートシェーダー
	 */
	DX_SHADERTYPE_COMPUTE = 3,

	/**
	 * ドメインシェーダー
	 */
	DX_SHADERTYPE_DOMAIN = 4,

	/**
	 * ハルシェーダー
	 */
	DX_SHADERTYPE_HULL = 5,
}

/**
 * 頂点データタイプ
 */
enum
{
	/**
	 * VERTEX3D構造体形式
	 */
	DX_VERTEX_TYPE_NORMAL_3D = 0,

	/**
	 * VERTEX3DSHADER構造体形式
	 */
	DX_VERTEX_TYPE_SHADER_3D = 1,

	/**
	 * ?
	 */
	DX_VERTEX_TYPE_NUM = 2,
}

/**
 * インデックスデータタイプ
 */
enum
{
	/**
	 * 16bitインデックス
	 */
	DX_INDEX_TYPE_16BIT = 0,

	/**
	 * 32bitインデックス
	 */
	DX_INDEX_TYPE_32BIT = 1,
}

/**
 * モデルファイル読み込み時の物理演算モード
 */
enum
{
	/**
	 * 物理演算を使用しない
	 */
	DX_LOADMODEL_PHYSICS_DISABLE = 1,

	/**
	 * 読み込み時に計算
	 */
	DX_LOADMODEL_PHYSICS_LOADCALC = 0,

	/**
	 * 実行時計算
	 */
	DX_LOADMODEL_PHYSICS_REALTIME = 2,
}

/**
 * モデルファイル読み込み時の物理演算無効名前ワードのモード
 */
enum
{
	/**
	 * 全てのファイルに対して無効名ワードを適用する
	 */
	DX_LOADMODEL_PHYSICS_DISABLENAMEWORD_ALWAYS = 0,

	/**
	 * vmdファイル名に NP を含めた「物理演算無効」のファイルに対してのみ無効名ワードを適用する( この場合、無効名ワードが適用されない剛体については物理演算が行われる )
	 */
	DX_LOADMODEL_PHYSICS_DISABLENAMEWORD_DISABLEPHYSICSFILEONLY = 1,

	/**
	 * ?
	 */
	DX_LOADMODEL_PHYSICS_DISABLENAMEWORD_NUM = 2,
}

/**
 * PMD, PMX ファイル読み込み時のアニメーションの FPS モード( 主に IK 部分の精度に影響します )
 */
enum
{
	/**
	 * アニメーションを 30FPS で読み込む( IK部分の精度:低  データサイズ:小 )( デフォルト )
	 */
	DX_LOADMODEL_PMD_PMX_ANIMATION_FPSMODE_30 = 0,

	/**
	 * アニメーションを 60FPS で読み込む( IK部分の精度:高  データサイズ:大 )
	 */
	DX_LOADMODEL_PMD_PMX_ANIMATION_FPSMODE_60 = 1,
}

/**
 * モデルの半透明要素がある箇所に関する描画モード
 */
enum
{
	/**
	 * 半透明かどうか関係なく描画する
	 */
	DX_SEMITRANSDRAWMODE_ALWAYS = 0,

	/**
	 * 半透明のもののみ描画する
	 */
	DX_SEMITRANSDRAWMODE_SEMITRANS_ONLY = 1,

	/**
	 * 半透明ではないもののみ描画する
	 */
	DX_SEMITRANSDRAWMODE_NOT_SEMITRANS_ONLY = 2,
}

/**
 * キューブマップの面番号
 */
enum
{
	/**
	 * ?
	 */
	DX_CUBEMAP_FACE_POSITIVE_X = 0,

	/**
	 * ?
	 */
	DX_CUBEMAP_FACE_NEGATIVE_X = 1,

	/**
	 * ?
	 */
	DX_CUBEMAP_FACE_POSITIVE_Y = 2,

	/**
	 * ?
	 */
	DX_CUBEMAP_FACE_NEGATIVE_Y = 3,

	/**
	 * ?
	 */
	DX_CUBEMAP_FACE_POSITIVE_Z = 4,

	/**
	 * ?
	 */
	DX_CUBEMAP_FACE_NEGATIVE_Z = 5,
}

/**
 * ポリゴン描画タイプ
 */
enum
{
	/**
	 * D_D3DPT_POINTLIST
	 */
	DX_PRIMTYPE_POINTLIST = 1,

	/**
	 * D_D3DPT_LINELIST
	 */
	DX_PRIMTYPE_LINELIST = 2,

	/**
	 * D_D3DPT_LINESTRIP
	 */
	DX_PRIMTYPE_LINESTRIP = 3,

	/**
	 * D_D3DPT_TRIANGLELIST
	 */
	DX_PRIMTYPE_TRIANGLELIST = 4,

	/**
	 * D_D3DPT_TRIANGLESTRIP
	 */
	DX_PRIMTYPE_TRIANGLESTRIP = 5,

	/**
	 * D_D3DPT_TRIANGLEFAN
	 */
	DX_PRIMTYPE_TRIANGLEFAN = 6,

	/**
	 * ?
	 */
	DX_PRIMTYPE_MIN = 1,

	/**
	 * ?
	 */
	DX_PRIMTYPE_MAX = 6,
}

/**
 * ライトタイプ
 */
enum
{
	/**
	 * D_D3DLIGHT_POINT
	 */
	DX_LIGHTTYPE_D3DLIGHT_POINT = 1,

	/**
	 * D_D3DLIGHT_SPOT
	 */
	DX_LIGHTTYPE_D3DLIGHT_SPOT = 2,

	/**
	 * D_D3DLIGHT_DIRECTIONAL
	 */
	DX_LIGHTTYPE_D3DLIGHT_DIRECTIONAL = 3,

	/**
	 * D_D3DLIGHT_POINT
	 */
	DX_LIGHTTYPE_POINT = 1,

	/**
	 * D_D3DLIGHT_SPOT
	 */
	DX_LIGHTTYPE_SPOT = 2,

	/**
	 * D_D3DLIGHT_DIRECTIONAL
	 */
	DX_LIGHTTYPE_DIRECTIONAL = 3,
}

/**
 * グラフィックイメージフォーマットの定義
 */
enum
{
	/**
	 * 16色パレットカラー標準
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_PAL4 = 0,

	/**
	 * 256色パレットカラー標準
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_PAL8 = 1,

	/**
	 * αチャンネルつき16色パレットカラー標準
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_ALPHA_PAL4 = 2,

	/**
	 * αチャンネルつき256色パレットカラー標準
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_ALPHA_PAL8 = 3,

	/**
	 * αテストつき16色パレットカラー標準
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_ALPHATEST_PAL4 = 4,

	/**
	 * αテストつき256色パレットカラー標準
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_ALPHATEST_PAL8 = 5,

	/**
	 * 16ビットカラー標準
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_RGB16 = 6,

	/**
	 * 32ビットカラー標準
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_RGB32 = 7,

	/**
	 * αチャンネル付き16ビットカラー
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_ALPHA_RGB16 = 8,

	/**
	 * αチャンネル付き32ビットカラー
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_ALPHA_RGB32 = 9,

	/**
	 * αテスト付き16ビットカラー
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_ALPHATEST_RGB16 = 10,

	/**
	 * αテスト付き32ビットカラー
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_ALPHATEST_RGB32 = 11,

	/**
	 * DXT1
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_DXT1 = 12,

	/**
	 * DXT2
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_DXT2 = 13,

	/**
	 * DXT3
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_DXT3 = 14,

	/**
	 * DXT4
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_DXT4 = 15,

	/**
	 * DXT5
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_DXT5 = 16,

	/**
	 * BC7 UNORM
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_BC7_UNORM = 17,

	/**
	 * BC7 UNORM SRGB
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_BC7_UNORM_SRGB = 18,

	/**
	 * プラットフォーム依存フォーマット0
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_PLATFORM0 = 19,

	/**
	 * プラットフォーム依存フォーマット1
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_PLATFORM1 = 20,

	/**
	 * プラットフォーム依存フォーマット2
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_PLATFORM2 = 21,

	/**
	 * プラットフォーム依存フォーマット3
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_PLATFORM3 = 22,

	/**
	 * YUVフォーマット
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_YUV = 23,

	/**
	 * ARGB整数16ビット型カラー
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_ABGR_I16 = 24,

	/**
	 * ARGB浮動小数点16ビット型カラー
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_ABGR_F16 = 25,

	/**
	 * ARGB浮動小数点32ビット型カラー
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_ABGR_F32 = 26,

	/**
	 * 1チャンネル整数8ビット型カラー
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_ONE_I8 = 27,

	/**
	 * 1チャンネル整数16ビット型カラー
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_ONE_I16 = 28,

	/**
	 * 1チャンネル浮動少数16ビット型カラー
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_ONE_F16 = 29,

	/**
	 * 1チャンネル浮動少数32ビット型カラー
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_ONE_F32 = 30,

	/**
	 * 2チャンネル整数8ビット型カラー
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_TWO_I8 = 31,

	/**
	 * 2チャンネル整数16ビット型カラー
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_TWO_I16 = 32,

	/**
	 * 2チャンネル浮動少数16ビット型カラー
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_TWO_F16 = 33,

	/**
	 * 2チャンネル浮動少数32ビット型カラー
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_TWO_F32 = 34,

	/**
	 * 描画可能16ビットカラー
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_DRAWVALID_RGB16 = 35,

	/**
	 * 描画可能32ビットカラー
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_DRAWVALID_RGB32 = 36,

	/**
	 * 描画可能α付き32ビットカラー
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_DRAWVALID_ALPHA_RGB32 = 37,

	/**
	 * 描画可能ARGB整数16ビット型カラー
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_DRAWVALID_ABGR_I16 = 38,

	/**
	 * 描画可能ARGB浮動小数点16ビット型カラー
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_DRAWVALID_ABGR_F16 = 39,

	/**
	 * 描画可能ARGB浮動小数点32ビット型カラー
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_DRAWVALID_ABGR_F32 = 40,

	/**
	 * 描画可能1チャンネル整数8ビット型カラー
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_DRAWVALID_ONE_I8 = 41,

	/**
	 * 描画可能1チャンネル整数16ビット型カラー
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_DRAWVALID_ONE_I16 = 42,

	/**
	 * 描画可能1チャンネル浮動少数16ビット型カラー
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_DRAWVALID_ONE_F16 = 43,

	/**
	 * 描画可能1チャンネル浮動少数32ビット型カラー
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_DRAWVALID_ONE_F32 = 44,

	/**
	 * 描画可能2チャンネル整数8ビット型カラー
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_DRAWVALID_TWO_I8 = 45,

	/**
	 * 描画可能2チャンネル整数16ビット型カラー
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_DRAWVALID_TWO_I16 = 46,

	/**
	 * 描画可能2チャンネル浮動少数16ビット型カラー
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_DRAWVALID_TWO_F16 = 47,

	/**
	 * 描画可能2チャンネル浮動少数32ビット型カラー
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_DRAWVALID_TWO_F32 = 48,

	/**
	 * ?
	 */
	DX_GRAPHICSIMAGE_FORMAT_3D_NUM = 49,

	/**
	 * 標準( DirectDrawSurface の場合はこれのみ )
	 */
	DX_GRAPHICSIMAGE_FORMAT_2D = 50,

	/**
	 * R5G6B5( MEMIMG 用 )
	 */
	DX_GRAPHICSIMAGE_FORMAT_R5G6B5 = 51,

	/**
	 * X8A8R5G6B5( MEMIMG 用 )
	 */
	DX_GRAPHICSIMAGE_FORMAT_X8A8R5G6B5 = 52,

	/**
	 * X8R8G8B8( MEMIMG 用 )
	 */
	DX_GRAPHICSIMAGE_FORMAT_X8R8G8B8 = 53,

	/**
	 * A8R8G8B8( MEMIMG 用 )
	 */
	DX_GRAPHICSIMAGE_FORMAT_A8R8G8B8 = 54,

	/**
	 * グラフィックフォーマットの種類の数
	 */
	DX_GRAPHICSIMAGE_FORMAT_NUM = 55,
}

/**
 * 基本イメージのピクセルフォーマット
 */
enum
{
	/**
	 * 普通の画像
	 */
	DX_BASEIMAGE_FORMAT_NORMAL = 0,

	/**
	 * DXT1
	 */
	DX_BASEIMAGE_FORMAT_DXT1 = 1,

	/**
	 * DXT2
	 */
	DX_BASEIMAGE_FORMAT_DXT2 = 2,

	/**
	 * DXT3
	 */
	DX_BASEIMAGE_FORMAT_DXT3 = 3,

	/**
	 * DXT4
	 */
	DX_BASEIMAGE_FORMAT_DXT4 = 4,

	/**
	 * DXT5
	 */
	DX_BASEIMAGE_FORMAT_DXT5 = 5,

	/**
	 * BC7 UNORM
	 */
	DX_BASEIMAGE_FORMAT_BC7_UNORM = 6,

	/**
	 * BC7 UNORM SRGB
	 */
	DX_BASEIMAGE_FORMAT_BC7_UNORM_SRGB = 7,

	/**
	 * プラットフォーム依存フォーマット0
	 */
	DX_BASEIMAGE_FORMAT_PLATFORM0 = 8,

	/**
	 * プラットフォーム依存フォーマット1
	 */
	DX_BASEIMAGE_FORMAT_PLATFORM1 = 9,

	/**
	 * プラットフォーム依存フォーマット2
	 */
	DX_BASEIMAGE_FORMAT_PLATFORM2 = 10,

	/**
	 * プラットフォーム依存フォーマット3
	 */
	DX_BASEIMAGE_FORMAT_PLATFORM3 = 11,

	/**
	 * YUV
	 */
	DX_BASEIMAGE_FORMAT_YUV = 12,
}

/**
 * ムービーのサーフェスモード
 */
enum
{
	/**
	 * ?
	 */
	DX_MOVIESURFACE_NORMAL = 0,

	/**
	 * ?
	 */
	DX_MOVIESURFACE_OVERLAY = 1,

	/**
	 * ?
	 */
	DX_MOVIESURFACE_FULLCOLOR = 2,
}

/**
 * SetUserScreenImage で渡す画面のピクセルフォーマット
 */
enum
{
	/**
	 * R5G6B5( DXライブラリの描画関数も使用できます( ソフトウェアレンダリングモード相当 ) )
	 */
	DX_USER_SCREEN_PIXEL_FORMAT_R5G6B5 = 0,

	/**
	 * R5G5B5X1( DXライブラリの描画関数は使用できなくなります )
	 */
	DX_USER_SCREEN_PIXEL_FORMAT_R5G5B5X1 = 1,

	/**
	 * X1R5G5B5( DXライブラリの描画関数は使用できなくなります )
	 */
	DX_USER_SCREEN_PIXEL_FORMAT_X1R5G5B5 = 2,

	/**
	 * X8B8G8R8( DXライブラリの描画関数は使用できなくなります )
	 */
	DX_USER_SCREEN_PIXEL_FORMAT_X8B8G8R8 = 3,

	/**
	 * X8R8G8B8( DXライブラリの描画関数も使用できます( ソフトウェアレンダリングモード相当 ) )
	 */
	DX_USER_SCREEN_PIXEL_FORMAT_X8R8G8B8 = 4,

	/**
	 * ?
	 */
	DX_USER_SCREEN_PIXEL_FORMAT_NUM = 5,
}

/**
 * ウインドウの奥行き位置設定タイプ
 */
enum
{
	/**
	 * 通常設定
	 */
	DX_WIN_ZTYPE_NORMAL = 0,

	/**
	 * 全てのウインドウの一番奥に配置する
	 */
	DX_WIN_ZTYPE_BOTTOM = 1,

	/**
	 * 全てのウインドウの一番手前に配置する
	 */
	DX_WIN_ZTYPE_TOP = 2,

	/**
	 * 全てのウインドウの一番手前に配置する( ウインドウがアクティブではないときも最前面に表示される )
	 */
	DX_WIN_ZTYPE_TOPMOST = 3,
}

/**
 * ツールバーのボタンの状態
 */
enum
{
	/**
	 * 入力可能な状態
	 */
	TOOLBUTTON_STATE_ENABLE = 0,

	/**
	 * 押されている状態
	 */
	TOOLBUTTON_STATE_PRESSED = 1,

	/**
	 * 入力不可能な状態
	 */
	TOOLBUTTON_STATE_DISABLE = 2,

	/**
	 * 押されている状態で、入力不可能な状態
	 */
	TOOLBUTTON_STATE_PRESSED_DISABLE = 3,

	/**
	 * ツールバーのボタンの状態の数
	 */
	TOOLBUTTON_STATE_NUM = 4,
}

/**
 * ツールバーのボタンのタイプ
 */
enum
{
	/**
	 * 普通のボタン
	 */
	TOOLBUTTON_TYPE_NORMAL = 0,

	/**
	 * 押すごとにON/OFFが切り替わるボタン
	 */
	TOOLBUTTON_TYPE_CHECK = 1,

	/**
	 * 別の TOOLBUTTON_TYPE_GROUP タイプのボタンが押されるとOFFになるタイプのボタン(グループの区切りは隙間で)
	 */
	TOOLBUTTON_TYPE_GROUP = 2,

	/**
	 * 隙間(ボタンではありません)
	 */
	TOOLBUTTON_TYPE_SEP = 3,

	/**
	 * ツールバーのボタンのタイプの数
	 */
	TOOLBUTTON_TYPE_NUM = 4,
}

/**
 * 親メニューのID
 */
enum MENUITEM_IDTOP = 0xABABABAB;

/**
 * メニューに追加する際のタイプ
 */
enum
{
	/**
	 * 指定の項目の子として追加する
	 */
	MENUITEM_ADD_CHILD = 0,

	/**
	 * 指定の項目と指定の項目より1つ上の項目の間に追加する
	 */
	MENUITEM_ADD_INSERT = 1,
}

/**
 * メニューの横に付くマークタイプ
 */
enum
{
	/**
	 * 何も付け無い
	 */
	MENUITEM_MARK_NONE = 0,

	/**
	 * チェックマーク
	 */
	MENUITEM_MARK_CHECK = 1,

	/**
	 * ラジオボタン
	 */
	MENUITEM_MARK_RADIO = 2,
}

/**
 * 文字変換タイプ定義
 */
enum
{
	/**
	 * 10進数
	 */
	DX_NUMMODE_10 = 0,

	/**
	 * 16進数
	 */
	DX_NUMMODE_16 = 1,

	/**
	 * 空きを0で埋めない
	 */
	DX_STRMODE_NOT0 = 2,

	/**
	 * 空きを0で埋める
	 */
	DX_STRMODE_USE0 = 3,
}

/**
 * CheckHitKeyAll で調べる入力タイプ
 */
enum
{
	/**
	 * キー入力を調べる
	 */
	DX_CHECKINPUT_KEY = 0x0001,

	/**
	 * パッド入力を調べる
	 */
	DX_CHECKINPUT_PAD = 0x0002,

	/**
	 * マウスボタン入力を調べる
	 */
	DX_CHECKINPUT_MOUSE = 0x0004,

	/**
	 * すべての入力を調べる
	 */
	DX_CHECKINPUT_ALL = DX_CHECKINPUT_KEY | DX_CHECKINPUT_PAD | DX_CHECKINPUT_MOUSE,
}

/**
 * パッド入力取得パラメータ
 */
enum
{
	/**
	 * キー入力とパッド1入力
	 */
	DX_INPUT_KEY_PAD1 = 0x1001,

	/**
	 * パッド1入力
	 */
	DX_INPUT_PAD1 = 0x0001,

	/**
	 * パッド2入力
	 */
	DX_INPUT_PAD2 = 0x0002,

	/**
	 * パッド3入力
	 */
	DX_INPUT_PAD3 = 0x0003,

	/**
	 * パッド4入力
	 */
	DX_INPUT_PAD4 = 0x0004,

	/**
	 * パッド5入力
	 */
	DX_INPUT_PAD5 = 0x0005,

	/**
	 * パッド6入力
	 */
	DX_INPUT_PAD6 = 0x0006,

	/**
	 * パッド7入力
	 */
	DX_INPUT_PAD7 = 0x0007,

	/**
	 * パッド8入力
	 */
	DX_INPUT_PAD8 = 0x0008,

	/**
	 * パッド9入力
	 */
	DX_INPUT_PAD9 = 0x0009,

	/**
	 * パッド10入力
	 */
	DX_INPUT_PAD10 = 0x000A,

	/**
	 * パッド11入力
	 */
	DX_INPUT_PAD11 = 0x000B,

	/**
	 * パッド12入力
	 */
	DX_INPUT_PAD12 = 0x000C,

	/**
	 * パッド13入力
	 */
	DX_INPUT_PAD13 = 0x000D,

	/**
	 * パッド14入力
	 */
	DX_INPUT_PAD14 = 0x000E,

	/**
	 * パッド15入力
	 */
	DX_INPUT_PAD15 = 0x000F,

	/**
	 * パッド16入力
	 */
	DX_INPUT_PAD16 = 0x0010,

	/**
	 * キー入力
	 */
	DX_INPUT_KEY = 0x1000,

	/**
	 * タッチの同時接触検出対応最大数
	 */
	TOUCHINPUTPOINT_MAX = 16,
}

/**
 * パッド入力定義
 */
enum
{
	/**
	 * ↓チェックマスク
	 */
	PAD_INPUT_DOWN = 0x00000001,

	/**
	 * ←チェックマスク
	 */
	PAD_INPUT_LEFT = 0x00000002,

	/**
	 * →チェックマスク
	 */
	PAD_INPUT_RIGHT = 0x00000004,

	/**
	 * ↑チェックマスク
	 */
	PAD_INPUT_UP = 0x00000008,

	/**
	 * Aボタンチェックマスク
	 */
	PAD_INPUT_A = 0x00000010,

	/**
	 * Bボタンチェックマスク
	 */
	PAD_INPUT_B = 0x00000020,

	/**
	 * Cボタンチェックマスク
	 */
	PAD_INPUT_C = 0x00000040,

	/**
	 * Xボタンチェックマスク
	 */
	PAD_INPUT_X = 0x00000080,

	/**
	 * Yボタンチェックマスク
	 */
	PAD_INPUT_Y = 0x00000100,

	/**
	 * Zボタンチェックマスク
	 */
	PAD_INPUT_Z = 0x00000200,

	/**
	 * Lボタンチェックマスク
	 */
	PAD_INPUT_L = 0x00000400,

	/**
	 * Rボタンチェックマスク
	 */
	PAD_INPUT_R = 0x00000800,

	/**
	 * STARTボタンチェックマスク
	 */
	PAD_INPUT_START = 0x00001000,

	/**
	 * Mボタンチェックマスク
	 */
	PAD_INPUT_M = 0x00002000,

	/**
	 * ?
	 */
	PAD_INPUT_D = 0x00004000,

	/**
	 * ?
	 */
	PAD_INPUT_F = 0x00008000,

	/**
	 * ?
	 */
	PAD_INPUT_G = 0x00010000,

	/**
	 * ?
	 */
	PAD_INPUT_H = 0x00020000,

	/**
	 * ?
	 */
	PAD_INPUT_I = 0x00040000,

	/**
	 * ?
	 */
	PAD_INPUT_J = 0x00080000,

	/**
	 * ?
	 */
	PAD_INPUT_K = 0x00100000,

	/**
	 * ?
	 */
	PAD_INPUT_LL = 0x00200000,

	/**
	 * ?
	 */
	PAD_INPUT_N = 0x00400000,

	/**
	 * ?
	 */
	PAD_INPUT_O = 0x00800000,

	/**
	 * ?
	 */
	PAD_INPUT_P = 0x01000000,

	/**
	 * ?
	 */
	PAD_INPUT_RR = 0x02000000,

	/**
	 * ?
	 */
	PAD_INPUT_S = 0x04000000,

	/**
	 * ?
	 */
	PAD_INPUT_T = 0x08000000,

	/**
	 * ?
	 */
	PAD_INPUT_U = 0x10000000,

	/**
	 * ?
	 */
	PAD_INPUT_V = 0x20000000,

	/**
	 * ?
	 */
	PAD_INPUT_W = 0x40000000,

	/**
	 * ?
	 */
	PAD_INPUT_XX = 0x80000000,

	/**
	 * ?
	 */
	PAD_INPUT_1 = 0x00000010,

	/**
	 * ?
	 */
	PAD_INPUT_2 = 0x00000020,

	/**
	 * ?
	 */
	PAD_INPUT_3 = 0x00000040,

	/**
	 * ?
	 */
	PAD_INPUT_4 = 0x00000080,

	/**
	 * ?
	 */
	PAD_INPUT_5 = 0x00000100,

	/**
	 * ?
	 */
	PAD_INPUT_6 = 0x00000200,

	/**
	 * ?
	 */
	PAD_INPUT_7 = 0x00000400,

	/**
	 * ?
	 */
	PAD_INPUT_8 = 0x00000800,

	/**
	 * ?
	 */
	PAD_INPUT_9 = 0x00001000,

	/**
	 * ?
	 */
	PAD_INPUT_10 = 0x00002000,

	/**
	 * ?
	 */
	PAD_INPUT_11 = 0x00004000,

	/**
	 * ?
	 */
	PAD_INPUT_12 = 0x00008000,

	/**
	 * ?
	 */
	PAD_INPUT_13 = 0x00010000,

	/**
	 * ?
	 */
	PAD_INPUT_14 = 0x00020000,

	/**
	 * ?
	 */
	PAD_INPUT_15 = 0x00040000,

	/**
	 * ?
	 */
	PAD_INPUT_16 = 0x00080000,

	/**
	 * ?
	 */
	PAD_INPUT_17 = 0x00100000,

	/**
	 * ?
	 */
	PAD_INPUT_18 = 0x00200000,

	/**
	 * ?
	 */
	PAD_INPUT_19 = 0x00400000,

	/**
	 * ?
	 */
	PAD_INPUT_20 = 0x00800000,

	/**
	 * ?
	 */
	PAD_INPUT_21 = 0x01000000,

	/**
	 * ?
	 */
	PAD_INPUT_22 = 0x02000000,

	/**
	 * ?
	 */
	PAD_INPUT_23 = 0x04000000,

	/**
	 * ?
	 */
	PAD_INPUT_24 = 0x08000000,

	/**
	 * ?
	 */
	PAD_INPUT_25 = 0x10000000,

	/**
	 * ?
	 */
	PAD_INPUT_26 = 0x20000000,

	/**
	 * ?
	 */
	PAD_INPUT_27 = 0x40000000,

	/**
	 * ?
	 */
	PAD_INPUT_28 = 0x80000000,
}

/**
 * XInputボタン入力定義
 */
enum
{
	/**
	 * デジタル方向ボタン上
	 */
	XINPUT_BUTTON_DPAD_UP = 0,

	/**
	 * デジタル方向ボタン下
	 */
	XINPUT_BUTTON_DPAD_DOWN = 1,

	/**
	 * デジタル方向ボタン左
	 */
	XINPUT_BUTTON_DPAD_LEFT = 2,

	/**
	 * デジタル方向ボタン右
	 */
	XINPUT_BUTTON_DPAD_RIGHT = 3,

	/**
	 * STARTボタン
	 */
	XINPUT_BUTTON_START = 4,

	/**
	 * BACKボタン
	 */
	XINPUT_BUTTON_BACK = 5,

	/**
	 * 左スティック押し込み
	 */
	XINPUT_BUTTON_LEFT_THUMB = 6,

	/**
	 * 右スティック押し込み
	 */
	XINPUT_BUTTON_RIGHT_THUMB = 7,

	/**
	 * LBボタン
	 */
	XINPUT_BUTTON_LEFT_SHOULDER = 8,

	/**
	 * RBボタン
	 */
	XINPUT_BUTTON_RIGHT_SHOULDER = 9,

	/**
	 * Aボタン
	 */
	XINPUT_BUTTON_A = 12,

	/**
	 * Bボタン
	 */
	XINPUT_BUTTON_B = 13,

	/**
	 * Xボタン
	 */
	XINPUT_BUTTON_X = 14,

	/**
	 * Yボタン
	 */
	XINPUT_BUTTON_Y = 15,
}

/**
 * マウス入力定義
 */
enum
{
	/**
	 * マウス左ボタン
	 */
	MOUSE_INPUT_LEFT = 0x0001,

	/**
	 * マウス右ボタン
	 */
	MOUSE_INPUT_RIGHT = 0x0002,

	/**
	 * マウス中央ボタン
	 */
	MOUSE_INPUT_MIDDLE = 0x0004,

	/**
	 * マウス1ボタン
	 */
	MOUSE_INPUT_1 = 0x0001,

	/**
	 * マウス2ボタン
	 */
	MOUSE_INPUT_2 = 0x0002,

	/**
	 * マウス3ボタン
	 */
	MOUSE_INPUT_3 = 0x0004,

	/**
	 * マウス4ボタン
	 */
	MOUSE_INPUT_4 = 0x0008,

	/**
	 * マウス5ボタン
	 */
	MOUSE_INPUT_5 = 0x0010,

	/**
	 * マウス6ボタン
	 */
	MOUSE_INPUT_6 = 0x0020,

	/**
	 * マウス7ボタン
	 */
	MOUSE_INPUT_7 = 0x0040,

	/**
	 * マウス8ボタン
	 */
	MOUSE_INPUT_8 = 0x0080,
}

/**
 * マウスのログ情報タイプ
 */
enum
{
	/**
	 * ボタンを押した
	 */
	MOUSE_INPUT_LOG_DOWN = 0,

	/**
	 * ボタンを離した
	 */
	MOUSE_INPUT_LOG_UP = 1,
}

/**
 * キー定義
 */
enum
{
	/**
	 * BackSpaceキー    D_DIK_BACK
	 */
	KEY_INPUT_BACK = 0x0E,

	/**
	 * Tabキー            D_DIK_TAB
	 */
	KEY_INPUT_TAB = 0x0F,

	/**
	 * Enterキー        D_DIK_RETURN
	 */
	KEY_INPUT_RETURN = 0x1C,

	/**
	 * 左Shiftキー        D_DIK_LSHIFT
	 */
	KEY_INPUT_LSHIFT = 0x2A,

	/**
	 * 右Shiftキー        D_DIK_RSHIFT
	 */
	KEY_INPUT_RSHIFT = 0x36,

	/**
	 * 左Ctrlキー        D_DIK_LCONTROL
	 */
	KEY_INPUT_LCONTROL = 0x1D,

	/**
	 * 右Ctrlキー        D_DIK_RCONTROL
	 */
	KEY_INPUT_RCONTROL = 0x9D,

	/**
	 * Escキー            D_DIK_ESCAPE
	 */
	KEY_INPUT_ESCAPE = 0x01,

	/**
	 * スペースキー        D_DIK_SPACE
	 */
	KEY_INPUT_SPACE = 0x39,

	/**
	 * PageUpキー        D_DIK_PGUP
	 */
	KEY_INPUT_PGUP = 0xC9,

	/**
	 * PageDownキー        D_DIK_PGDN
	 */
	KEY_INPUT_PGDN = 0xD1,

	/**
	 * Endキー            D_DIK_END
	 */
	KEY_INPUT_END = 0xCF,

	/**
	 * Homeキー            D_DIK_HOME
	 */
	KEY_INPUT_HOME = 0xC7,

	/**
	 * 左キー            D_DIK_LEFT
	 */
	KEY_INPUT_LEFT = 0xCB,

	/**
	 * 上キー            D_DIK_UP
	 */
	KEY_INPUT_UP = 0xC8,

	/**
	 * 右キー            D_DIK_RIGHT
	 */
	KEY_INPUT_RIGHT = 0xCD,

	/**
	 * 下キー            D_DIK_DOWN
	 */
	KEY_INPUT_DOWN = 0xD0,

	/**
	 * Insertキー        D_DIK_INSERT
	 */
	KEY_INPUT_INSERT = 0xD2,

	/**
	 * Deleteキー        D_DIK_DELETE
	 */
	KEY_INPUT_DELETE = 0xD3,

	/**
	 * -キー            D_DIK_MINUS
	 */
	KEY_INPUT_MINUS = 0x0C,

	/**
	 * ¥キー            D_DIK_YEN
	 */
	KEY_INPUT_YEN = 0x7D,

	/**
	 * ^キー            D_DIK_PREVTRACK
	 */
	KEY_INPUT_PREVTRACK = 0x90,

	/**
	 * .キー            D_DIK_PERIOD
	 */
	KEY_INPUT_PERIOD = 0x34,

	/**
	 * /キー            D_DIK_SLASH
	 */
	KEY_INPUT_SLASH = 0x35,

	/**
	 * 左Altキー        D_DIK_LALT
	 */
	KEY_INPUT_LALT = 0x38,

	/**
	 * 右Altキー        D_DIK_RALT
	 */
	KEY_INPUT_RALT = 0xB8,

	/**
	 * ScrollLockキー    D_DIK_SCROLL
	 */
	KEY_INPUT_SCROLL = 0x46,

	/**
	 * ;キー            D_DIK_SEMICOLON
	 */
	KEY_INPUT_SEMICOLON = 0x27,

	/**
	 * :キー            D_DIK_COLON
	 */
	KEY_INPUT_COLON = 0x92,

	/**
	 * [キー            D_DIK_LBRACKET
	 */
	KEY_INPUT_LBRACKET = 0x1A,

	/**
	 * ]キー            D_DIK_RBRACKET
	 */
	KEY_INPUT_RBRACKET = 0x1B,

	/**
	 * @キー            D_DIK_AT
	 */
	KEY_INPUT_AT = 0x91,

	/**
	 * ＼キー            D_DIK_BACKSLASH
	 */
	KEY_INPUT_BACKSLASH = 0x2B,

	/**
	 * ,キー            D_DIK_COMMA
	 */
	KEY_INPUT_COMMA = 0x33,

	/**
	 * 漢字キー            D_DIK_KANJI
	 */
	KEY_INPUT_KANJI = 0x94,

	/**
	 * 変換キー            D_DIK_CONVERT
	 */
	KEY_INPUT_CONVERT = 0x79,

	/**
	 * 無変換キー        D_DIK_NOCONVERT
	 */
	KEY_INPUT_NOCONVERT = 0x7B,

	/**
	 * カナキー            D_DIK_KANA
	 */
	KEY_INPUT_KANA = 0x70,

	/**
	 * アプリケーションメニューキー        D_DIK_APPS
	 */
	KEY_INPUT_APPS = 0xDD,

	/**
	 * CaspLockキー        D_DIK_CAPSLOCK
	 */
	KEY_INPUT_CAPSLOCK = 0x3A,

	/**
	 * PrintScreenキー    D_DIK_SYSRQ
	 */
	KEY_INPUT_SYSRQ = 0xB7,

	/**
	 * PauseBreakキー    D_DIK_PAUSE
	 */
	KEY_INPUT_PAUSE = 0xC5,

	/**
	 * 左Winキー        D_DIK_LWIN
	 */
	KEY_INPUT_LWIN = 0xDB,

	/**
	 * 右Winキー        D_DIK_RWIN
	 */
	KEY_INPUT_RWIN = 0xDC,

	/**
	 * テンキーNumLockキー        D_DIK_NUMLOCK
	 */
	KEY_INPUT_NUMLOCK = 0x45,

	/**
	 * テンキー0                D_DIK_NUMPAD0
	 */
	KEY_INPUT_NUMPAD0 = 0x52,

	/**
	 * テンキー1                D_DIK_NUMPAD1
	 */
	KEY_INPUT_NUMPAD1 = 0x4F,

	/**
	 * テンキー2                D_DIK_NUMPAD2
	 */
	KEY_INPUT_NUMPAD2 = 0x50,

	/**
	 * テンキー3                D_DIK_NUMPAD3
	 */
	KEY_INPUT_NUMPAD3 = 0x51,

	/**
	 * テンキー4                D_DIK_NUMPAD4
	 */
	KEY_INPUT_NUMPAD4 = 0x4B,

	/**
	 * テンキー5                D_DIK_NUMPAD5
	 */
	KEY_INPUT_NUMPAD5 = 0x4C,

	/**
	 * テンキー6                D_DIK_NUMPAD6
	 */
	KEY_INPUT_NUMPAD6 = 0x4D,

	/**
	 * テンキー7                D_DIK_NUMPAD7
	 */
	KEY_INPUT_NUMPAD7 = 0x47,

	/**
	 * テンキー8                D_DIK_NUMPAD8
	 */
	KEY_INPUT_NUMPAD8 = 0x48,

	/**
	 * テンキー9                D_DIK_NUMPAD9
	 */
	KEY_INPUT_NUMPAD9 = 0x49,

	/**
	 * テンキー*キー            D_DIK_MULTIPLY
	 */
	KEY_INPUT_MULTIPLY = 0x37,

	/**
	 * テンキー+キー            D_DIK_ADD
	 */
	KEY_INPUT_ADD = 0x4E,

	/**
	 * テンキー-キー            D_DIK_SUBTRACT
	 */
	KEY_INPUT_SUBTRACT = 0x4A,

	/**
	 * テンキー.キー            D_DIK_DECIMAL
	 */
	KEY_INPUT_DECIMAL = 0x53,

	/**
	 * テンキー/キー            D_DIK_DIVIDE
	 */
	KEY_INPUT_DIVIDE = 0xB5,

	/**
	 * テンキーのエンターキー    D_DIK_NUMPADENTER
	 */
	KEY_INPUT_NUMPADENTER = 0x9C,

	/**
	 * F1キー            D_DIK_F1
	 */
	KEY_INPUT_F1 = 0x3B,

	/**
	 * F2キー            D_DIK_F2
	 */
	KEY_INPUT_F2 = 0x3C,

	/**
	 * F3キー            D_DIK_F3
	 */
	KEY_INPUT_F3 = 0x3D,

	/**
	 * F4キー            D_DIK_F4
	 */
	KEY_INPUT_F4 = 0x3E,

	/**
	 * F5キー            D_DIK_F5
	 */
	KEY_INPUT_F5 = 0x3F,

	/**
	 * F6キー            D_DIK_F6
	 */
	KEY_INPUT_F6 = 0x40,

	/**
	 * F7キー            D_DIK_F7
	 */
	KEY_INPUT_F7 = 0x41,

	/**
	 * F8キー            D_DIK_F8
	 */
	KEY_INPUT_F8 = 0x42,

	/**
	 * F9キー            D_DIK_F9
	 */
	KEY_INPUT_F9 = 0x43,

	/**
	 * F10キー        D_DIK_F10
	 */
	KEY_INPUT_F10 = 0x44,

	/**
	 * F11キー        D_DIK_F11
	 */
	KEY_INPUT_F11 = 0x57,

	/**
	 * F12キー        D_DIK_F12
	 */
	KEY_INPUT_F12 = 0x58,

	/**
	 * Aキー            D_DIK_A
	 */
	KEY_INPUT_A = 0x1E,

	/**
	 * Bキー            D_DIK_B
	 */
	KEY_INPUT_B = 0x30,

	/**
	 * Cキー            D_DIK_C
	 */
	KEY_INPUT_C = 0x2E,

	/**
	 * Dキー            D_DIK_D
	 */
	KEY_INPUT_D = 0x20,

	/**
	 * Eキー            D_DIK_E
	 */
	KEY_INPUT_E = 0x12,

	/**
	 * Fキー            D_DIK_F
	 */
	KEY_INPUT_F = 0x21,

	/**
	 * Gキー            D_DIK_G
	 */
	KEY_INPUT_G = 0x22,

	/**
	 * Hキー            D_DIK_H
	 */
	KEY_INPUT_H = 0x23,

	/**
	 * Iキー            D_DIK_I
	 */
	KEY_INPUT_I = 0x17,

	/**
	 * Jキー            D_DIK_J
	 */
	KEY_INPUT_J = 0x24,

	/**
	 * Kキー            D_DIK_K
	 */
	KEY_INPUT_K = 0x25,

	/**
	 * Lキー            D_DIK_L
	 */
	KEY_INPUT_L = 0x26,

	/**
	 * Mキー            D_DIK_M
	 */
	KEY_INPUT_M = 0x32,

	/**
	 * Nキー            D_DIK_N
	 */
	KEY_INPUT_N = 0x31,

	/**
	 * Oキー            D_DIK_O
	 */
	KEY_INPUT_O = 0x18,

	/**
	 * Pキー            D_DIK_P
	 */
	KEY_INPUT_P = 0x19,

	/**
	 * Qキー            D_DIK_Q
	 */
	KEY_INPUT_Q = 0x10,

	/**
	 * Rキー            D_DIK_R
	 */
	KEY_INPUT_R = 0x13,

	/**
	 * Sキー            D_DIK_S
	 */
	KEY_INPUT_S = 0x1F,

	/**
	 * Tキー            D_DIK_T
	 */
	KEY_INPUT_T = 0x14,

	/**
	 * Uキー            D_DIK_U
	 */
	KEY_INPUT_U = 0x16,

	/**
	 * Vキー            D_DIK_V
	 */
	KEY_INPUT_V = 0x2F,

	/**
	 * Wキー            D_DIK_W
	 */
	KEY_INPUT_W = 0x11,

	/**
	 * Xキー            D_DIK_X
	 */
	KEY_INPUT_X = 0x2D,

	/**
	 * Yキー            D_DIK_Y
	 */
	KEY_INPUT_Y = 0x15,

	/**
	 * Zキー            D_DIK_Z
	 */
	KEY_INPUT_Z = 0x2C,

	/**
	 * 0キー            D_DIK_0
	 */
	KEY_INPUT_0 = 0x0B,

	/**
	 * 1キー            D_DIK_1
	 */
	KEY_INPUT_1 = 0x02,

	/**
	 * 2キー            D_DIK_2
	 */
	KEY_INPUT_2 = 0x03,

	/**
	 * 3キー            D_DIK_3
	 */
	KEY_INPUT_3 = 0x04,

	/**
	 * 4キー            D_DIK_4
	 */
	KEY_INPUT_4 = 0x05,

	/**
	 * 5キー            D_DIK_5
	 */
	KEY_INPUT_5 = 0x06,

	/**
	 * 6キー            D_DIK_6
	 */
	KEY_INPUT_6 = 0x07,

	/**
	 * 7キー            D_DIK_7
	 */
	KEY_INPUT_7 = 0x08,

	/**
	 * 8キー            D_DIK_8
	 */
	KEY_INPUT_8 = 0x09,

	/**
	 * 9キー            D_DIK_9
	 */
	KEY_INPUT_9 = 0x0A,
}

/**
 * アスキーコントロールキーコード
 */
enum
{
	/**
	 * バックスペース
	 */
	CTRL_CODE_BS = 0x08,

	/**
	 * タブ
	 */
	CTRL_CODE_TAB = 0x09,

	/**
	 * 改行
	 */
	CTRL_CODE_CR = 0x0D,

	/**
	 * DELキー
	 */
	CTRL_CODE_DEL = 0x10,

	/**
	 * コピー
	 */
	CTRL_CODE_COPY = 0x03,

	/**
	 * ペースト
	 */
	CTRL_CODE_PASTE = 0x16,

	/**
	 * カット
	 */
	CTRL_CODE_CUT = 0x18,

	/**
	 * 全て選択
	 */
	CTRL_CODE_ALL = 0x01,

	/**
	 * ←キー
	 */
	CTRL_CODE_LEFT = 0x1D,

	/**
	 * →キー
	 */
	CTRL_CODE_RIGHT = 0x1C,

	/**
	 * ↑キー
	 */
	CTRL_CODE_UP = 0x1E,

	/**
	 * ↓キー
	 */
	CTRL_CODE_DOWN = 0x1F,

	/**
	 * HOMEボタン
	 */
	CTRL_CODE_HOME = 0x1A,

	/**
	 * ENDボタン
	 */
	CTRL_CODE_END = 0x19,

	/**
	 * PAGE UP
	 */
	CTRL_CODE_PAGE_UP = 0x17,

	/**
	 * PAGE DOWN
	 */
	CTRL_CODE_PAGE_DOWN = 0x15,

	/**
	 * ESCキー
	 */
	CTRL_CODE_ESC = 0x1B,

	/**
	 * 制御コード敷居値
	 */
	CTRL_CODE_CMP = 0x20,
}

/**
 * SetKeyInputStringColor2 に渡す色変更対象を指定するための識別子
 */
enum
{
	/**
	 * 入力文字列の色
	 */
	DX_KEYINPSTRCOLOR_NORMAL_STR = 0,

	/**
	 * 入力文字列の縁の色
	 */
	DX_KEYINPSTRCOLOR_NORMAL_STR_EDGE = 1,

	/**
	 * IME非使用時のカーソルの色
	 */
	DX_KEYINPSTRCOLOR_NORMAL_CURSOR = 2,

	/**
	 * 入力文字列の選択部分( SHIFTキーを押しながら左右キーで選択 )の色
	 */
	DX_KEYINPSTRCOLOR_SELECT_STR = 3,

	/**
	 * 入力文字列の選択部分( SHIFTキーを押しながら左右キーで選択 )の縁の色
	 */
	DX_KEYINPSTRCOLOR_SELECT_STR_EDGE = 4,

	/**
	 * 入力文字列の選択部分( SHIFTキーを押しながら左右キーで選択 )の周りの色
	 */
	DX_KEYINPSTRCOLOR_SELECT_STR_BACK = 5,

	/**
	 * IME使用時の入力文字列の色
	 */
	DX_KEYINPSTRCOLOR_IME_STR = 6,

	/**
	 * IME使用時の入力文字列の縁の色
	 */
	DX_KEYINPSTRCOLOR_IME_STR_EDGE = 7,

	/**
	 * IME使用時の入力文字列の周りの色
	 */
	DX_KEYINPSTRCOLOR_IME_STR_BACK = 8,

	/**
	 * IME使用時のカーソルの色
	 */
	DX_KEYINPSTRCOLOR_IME_CURSOR = 9,

	/**
	 * IME使用時の変換文字列の下線の色
	 */
	DX_KEYINPSTRCOLOR_IME_LINE = 10,

	/**
	 * IME使用時の選択対象の変換候補文字列の色
	 */
	DX_KEYINPSTRCOLOR_IME_SELECT_STR = 11,

	/**
	 * IME使用時の選択対象の変換候補文字列の縁の色
	 */
	DX_KEYINPSTRCOLOR_IME_SELECT_STR_EDGE = 12,

	/**
	 * IME使用時の選択対象の変換候補文字列の周りの色
	 */
	DX_KEYINPSTRCOLOR_IME_SELECT_STR_BACK = 13,

	/**
	 * IME使用時の変換候補ウインドウ内の文字列の色
	 */
	DX_KEYINPSTRCOLOR_IME_CONV_WIN_STR = 14,

	/**
	 * IME使用時の変換候補ウインドウ内の文字列の縁の色
	 */
	DX_KEYINPSTRCOLOR_IME_CONV_WIN_STR_EDGE = 15,

	/**
	 * IME使用時の変換候補ウインドウ内で選択している文字列の色
	 */
	DX_KEYINPSTRCOLOR_IME_CONV_WIN_SELECT_STR = 16,

	/**
	 * IME使用時の変換候補ウインドウ内で選択している文字列の縁の色
	 */
	DX_KEYINPSTRCOLOR_IME_CONV_WIN_SELECT_STR_EDGE = 17,

	/**
	 * IME使用時の変換候補ウインドウ内で選択している文字列の周りの色
	 */
	DX_KEYINPSTRCOLOR_IME_CONV_WIN_SELECT_STR_BACK = 18,

	/**
	 * IME使用時の変換候補ウインドウの縁の色
	 */
	DX_KEYINPSTRCOLOR_IME_CONV_WIN_EDGE = 19,

	/**
	 * IME使用時の変換候補ウインドウの下地の色
	 */
	DX_KEYINPSTRCOLOR_IME_CONV_WIN_BACK = 20,

	/**
	 * IME使用時の入力モード文字列の色(『全角ひらがな』等)
	 */
	DX_KEYINPSTRCOLOR_IME_MODE_STR = 21,

	/**
	 * IME使用時の入力モード文字列の縁の色
	 */
	DX_KEYINPSTRCOLOR_IME_MODE_STR_EDGE = 22,

	/**
	 * ?
	 */
	DX_KEYINPSTRCOLOR_NUM = 23,
}

/**
 * 文字列入力処理の入力文字数が限界に達している状態で、文字列の末端部分で入力が行われた場合の処理モード
 */
enum
{
	/**
	 * 文字数が限界に達している状態で文字列の末端で文字が入力された場合は、最後の文字を上書き( デフォルト )
	 */
	DX_KEYINPSTR_ENDCHARAMODE_OVERWRITE = 0,

	/**
	 * 文字数が限界に達している状態で文字列の末端で文字が入力された場合は、何も変化しない
	 */
	DX_KEYINPSTR_ENDCHARAMODE_NOTCHANGE = 1,
}

/**
 * フルスクリーン解像度モード定義
 */
enum
{
	/**
	 * モニターの画面モードをデスクトップ画面と同じにしてDXライブラリ画面を拡大して表示するモード
	 */
	DX_FSRESOLUTIONMODE_DESKTOP = 0,

	/**
	 * モニターの解像度をDXライブラリ画面の解像度に合わせるモード
	 */
	DX_FSRESOLUTIONMODE_NATIVE = 1,

	/**
	 * モニターの解像度を最大にしてDXライブラリ画面を拡大して表示するモード
	 */
	DX_FSRESOLUTIONMODE_MAXIMUM = 2,
}

/**
 * フルスクリーン拡大モード定義
 */
enum
{
	/**
	 * バイリニアモード( ピクセルが滲んでピクセルとピクセルの区切りがはっきりしない )
	 */
	DX_FSSCALINGMODE_BILINEAR = 0,

	/**
	 * 最近点モード( ピクセルが四角くくっきり表示される )
	 */
	DX_FSSCALINGMODE_NEAREST = 1,
}

/**
 * SetGraphMode 戻り値定義
 */
enum
{
	/**
	 * 画面変更は成功した
	 */
	DX_CHANGESCREEN_OK = 0,

	/**
	 * 画面の変更は失敗し、元の画面モードに戻された
	 */
	DX_CHANGESCREEN_RETURN = -1,

	/**
	 * 画面の変更は失敗しデフォルトの画面モードに変更された
	 */
	DX_CHANGESCREEN_DEFAULT = -2,

	/**
	 * 画面の変更は成功したが、リフレッシュレートの変更は失敗した
	 */
	DX_CHANGESCREEN_REFRESHNORMAL = -3,
}

// ストリームデータ読み込み処理コード簡略化関連
/+
#define STTELL(st) ((st)->ReadShred.Tell((st)->DataPoint))
#define STSEEK(st, pos, type) ((st)->ReadShred.Seek((st)->DataPoint, (pos), (type)))
#define STREAD(buf, length, num, st) ((st)->ReadShred.Read((buf), (length), (num), (st)->DataPoint))
#define STWRITE(buf, length, num, st) ((st)->ReadShred.Write((buf), (length), (num), (st)->DataPoint))
#define STEOF(st) ((st)->ReadShred.Eof((st)->DataPoint))
#define STCLOSE(st) ((st)->ReadShred.Close((st)->DataPoint))
+/

/**
 * ストリームデータ制御のシークタイプ定義
 */
enum
{
	/**
	 * ?
	 */
	STREAM_SEEKTYPE_SET = SEEK_SET,

	/**
	 * ?
	 */
	STREAM_SEEKTYPE_END = SEEK_END,

	/**
	 * ?
	 */
	STREAM_SEEKTYPE_CUR = SEEK_CUR,
}

/**
 * グラフィックロード時のイメージタイプ
 */
enum
{
	/**
	 * イメージはファイルである
	 */
	LOADIMAGE_TYPE_FILE = 0,

	/**
	 * イメージはメモリである
	 */
	LOADIMAGE_TYPE_MEM = 1,

	/**
	 * イメージは無い
	 */
	LOADIMAGE_TYPE_NONE = -1,
}

version (DX_NON_NETWORK) {
} else {
	/**
	 * HTTP エラー
	 */
	enum
	{
		/**
		 * サーバーエラー
		 */
		HTTP_ERR_SERVER = 0,

		/**
		 * ファイルが見つからなかった
		 */
		HTTP_ERR_NOTFOUND = 1,

		/**
		 * メモリ確保の失敗
		 */
		HTTP_ERR_MEMORY = 2,

		/**
		 * 途中で切断された
		 */
		HTTP_ERR_LOST = 3,

		/**
		 * エラーは報告されていない
		 */
		HTTP_ERR_NONE = -1,
	}

	/**
	 * HTTP 処理の結果
	 */
	enum
	{
		/**
		 * 処理完了
		 */
		HTTP_RES_COMPLETE = 0,

		/**
		 * 処理中止
		 */
		HTTP_RES_STOP = 1,

		/**
		 * エラー終了
		 */
		HTTP_RES_ERROR = 2,

		/**
		 * 現在進行中
		 */
		HTTP_RES_NOW = -1,
	}
}

// データ型定義-------------------------------------------------------------------

// WAVEFORMATEX の定義
version (_WAVEFORMATEX_) {
} else {
	package struct tWAVEFORMATEX
	{
		/**
		 * フォーマット( WAVE_FORMAT_PCM( 値は 1 ) 等 )
		 */
		dxlib_d.DxDataType.WORD wFormatTag;

		/**
		 * チャンネル数
		 */
		dxlib_d.DxDataType.WORD nChannels;

		/**
		 * 1秒辺りのサンプル数
		 */
		dxlib_d.DxDataType.DWORD nSamplesPerSec;

		/**
		 * 1秒辺りのバイト数( PCMの場合 nSamplesPerSec * nBlockAlign )
		 */
		dxlib_d.DxDataType.DWORD nAvgBytesPerSec;

		/**
		 * 全チャンネルの1サンプルを合わせたバイト数( wBitsPerSample / 8 * nChannels )
		 */
		dxlib_d.DxDataType.WORD nBlockAlign;

		/**
		 * 1サンプル辺りのビット数
		 */
		dxlib_d.DxDataType.WORD wBitsPerSample;

		/**
		 * 拡張情報のバイト数( 拡張情報が無い場合は 0 )
		 */
		dxlib_d.DxDataType.WORD cbSize;
	}

	public alias WAVEFORMATEX = .tWAVEFORMATEX;
	public alias PWAVEFORMATEX = .tWAVEFORMATEX*;
	public alias NPWAVEFORMATEX = /* NEAR */ .tWAVEFORMATEX*;
	public alias LPWAVEFORMATEX = /* FAR */ .tWAVEFORMATEX*;
}

// WAVEFORMAT の定義
version (WAVE_FORMAT_PCM) {
} else {
	package struct waveformat_tag
	{
		/**
		 * フォーマット( WAVE_FORMAT_PCM( 値は 1 ) 等 )
		 */
		dxlib_d.DxDataType.WORD wFormatTag;

		/**
		 * チャンネル数
		 */
		dxlib_d.DxDataType.WORD nChannels;

		/**
		 * 1秒辺りのサンプル数
		 */
		dxlib_d.DxDataType.DWORD nSamplesPerSec;

		/**
		 * 1秒辺りのバイト数( PCMの場合 nSamplesPerSec * nBlockAlign )
		 */
		dxlib_d.DxDataType.DWORD nAvgBytesPerSec;

		/**
		 * 全チャンネルの1サンプルを合わせたバイト数( wBitsPerSample / 8 * nChannels )
		 */
		dxlib_d.DxDataType.WORD nBlockAlign;
	}

	public alias WAVEFORMAT = .waveformat_tag;
	public alias PWAVEFORMAT = .waveformat_tag*;
	public alias NPWAVEFORMAT = /* NEAR */ .waveformat_tag*;
	public alias LPWAVEFORMAT = /* FAR */ .waveformat_tag*;

	enum WAVE_FORMAT_PCM = 1;
}

extern (C++, DxLib) {
	/**
	 * IME入力文字列の描画に必要な情報の内の文節情報
	 */
	package struct tagIMEINPUTCLAUSEDATA
	{
		/**
		 * 何文字目から
		 */
		int Position;

		/**
		 * 何文字か
		 */
		int Length;
	}

	public alias IMEINPUTCLAUSEDATA = .tagIMEINPUTCLAUSEDATA;
	public alias LPIMEINPUTCLAUSEDATA = .tagIMEINPUTCLAUSEDATA*;

	/**
	 * IME入力文字列の描画に必要な情報
	 */
	package struct tagIMEINPUTDATA
	{
		/**
		 * 入力中の文字列
		 */
		const (dxlib_d.DxDataType.TCHAR)* InputString;

		/**
		 * カーソルの入力文字列中の位置(バイト単位)
		 */
		int CursorPosition;

		/**
		 * 文節情報
		 */
		const (.IMEINPUTCLAUSEDATA)* ClauseData;

		/**
		 * 文節情報の数
		 */
		int ClauseNum;

		/**
		 * 選択中の分節( -1 の場合はどの文節にも属していない( 末尾にカーソルがある ) )
		 */
		int SelectClause;

		/**
		 * 変換候補の数( 0の場合は変換中ではない )
		 */
		int CandidateNum;

		/**
		 * 変換候補文字列リスト( 例:n番目の候補を描画する場合  DrawString(0, 0, data.CandidateList[ n ], GetColor(255,255,255)); )
		 */
		const (dxlib_d.DxDataType.TCHAR)** CandidateList;

		/**
		 * 選択中の変換候補
		 */
		int SelectCandidate;

		/**
		 * 文字変換中かどうか( TRUE:変換中  FALSE:変換中ではない( 文字単位でカーソルが移動できる状態 ) )
		 */
		int ConvertFlag;
	}

	public alias IMEINPUTDATA = .tagIMEINPUTDATA;
	public alias LPIMEINPUTDATA = .tagIMEINPUTDATA*;

	/**
	 * 描画文字列1文字の情報
	 */
	package struct tagDRAWCHARINFO
	{
		/**
		 * 文字
		 */
		dxlib_d.DxDataType.TCHAR[14] Char = '\0';

		/**
		 * 文字のバイト数
		 */
		dxlib_d.DxDataType.WORD Bytes;

		/**
		 * 描画位置 X
		 */
		float DrawX = 0;

		/**
		 * 描画位置 Y
		 */
		float DrawY = 0;

		/**
		 * 描画サイズ Y
		 */
		float SizeX = 0;

		/**
		 * 描画サイズ Y
		 */
		float SizeY = 0;
	}

	public alias DRAWCHARINFO = .tagDRAWCHARINFO;
	public alias LPDRAWCHARINFO = .tagDRAWCHARINFO*;

	/**
	 * 画面モード情報データ型
	 */
	package struct tagDISPLAYMODEDATA
	{
		/**
		 * 水平解像度
		 */
		int Width;

		/**
		 * 垂直解像度
		 */
		int Height;

		/**
		 * 色ビット深度
		 */
		int ColorBitDepth;

		/**
		 * リフレッシュレート( -1 の場合は規定値 )
		 */
		int RefreshRate;
	}

	public alias DISPLAYMODEDATA = .tagDISPLAYMODEDATA;
	public alias LPDISPLAYMODEDATA = .tagDISPLAYMODEDATA*;

	/**
	 * タイムデータ型
	 */
	package struct tagDATEDATA
	{
		/**
		 * 年
		 */
		int Year;

		/**
		 * 月
		 */
		int Mon;

		/**
		 * 日
		 */
		int Day;

		/**
		 * 時間
		 */
		int Hour;

		/**
		 * 分
		 */
		int Min;

		/**
		 * 秒
		 */
		int Sec;
	}

	public alias DATEDATA = .tagDATEDATA;
	public alias LPDATEDATA = .tagDATEDATA*;

	/**
	 * ファイル情報構造体
	 */
	package struct tagFILEINFO
	{
		/**
		 * オブジェクト名
		 */
		dxlib_d.DxDataType.TCHAR[260] Name = '\0';

		/**
		 * ディレクトリかどうか( TRUE:ディレクトリ  FALSE:ファイル )
		 */
		int DirFlag;

		/**
		 * サイズ
		 */
		dxlib_d.DxDataType.LONGLONG Size;

		/**
		 * 作成日時
		 */
		.DATEDATA CreationTime;

		/**
		 * 最終更新日時
		 */
		.DATEDATA LastWriteTime;
	}

	public alias FILEINFO = .tagFILEINFO;
	public alias LPFILEINFO = .tagFILEINFO*;

	/**
	 * ファイル情報構造体( wchar_t 版 )
	 */
	package struct tagFILEINFOW
	{
		/**
		 * オブジェクト名
		 */
		.wchar_t[260] Name = '\0';

		/**
		 * ディレクトリかどうか( TRUE:ディレクトリ  FALSE:ファイル )
		 */
		int DirFlag;

		/**
		 * サイズ
		 */
		dxlib_d.DxDataType.LONGLONG Size;

		/**
		 * 作成日時
		 */
		.DATEDATA CreationTime;

		/**
		 * 最終更新日時
		 */
		.DATEDATA LastWriteTime;
	}

	public alias FILEINFOW = .tagFILEINFOW;
	public alias LPFILEINFOW = .tagFILEINFOW*;

	/**
	 * 行列構造体
	 */
	package struct tagMATRIX
	{
		float[4][4] m = [[0. 0, 0, 0], [0. 0, 0, 0], [0. 0, 0, 0], [0. 0, 0, 0]];
	}

	public alias MATRIX = .tagMATRIX;
	public alias LPMATRIX = .tagMATRIX*;

	package struct tagMATRIX_D
	{
		double[4][4] m = [[0. 0, 0, 0], [0. 0, 0, 0], [0. 0, 0, 0], [0. 0, 0, 0]];
	}

	public alias MATRIX_D = .tagMATRIX_D;
	public alias LPMATRIX_D = .tagMATRIX_D*;

	/**
	 * ベクトルデータ型
	 */
	package struct tagVECTOR
	{
		float x = 0;
		float y = 0;
		float z = 0;
	}

	public alias VECTOR = .tagVECTOR;
	public alias LPVECTOR = .tagVECTOR*;
	public alias FLOAT3 = .tagVECTOR;
	public alias LPFLOAT3 = .tagVECTOR*;

	package struct tagVECTOR_D
	{
		double x = 0;
		double y = 0;
		double z = 0;
	}

	public alias VECTOR_D = .tagVECTOR_D;
	public alias LPVECTOR_D = .tagVECTOR_D*;
	public alias DOUBLE3 = .tagVECTOR_D;
	public alias LPDOUBLE3 = .tagVECTOR_D*;

	/**
	 * FLOAT2個データ型
	 */
	package struct tagFLOAT2
	{
		float u = 0;
		float v = 0;
	}

	public alias FLOAT2 = .tagFLOAT2;

	/**
	 * float 型のカラー値
	 */
	package struct tagCOLOR_F
	{
		float r = 0;
		float g = 0;
		float b = 0;
		float a = 0;
	}

	public alias COLOR_F = .tagCOLOR_F;
	public alias LPCOLOR_F = .tagCOLOR_F*;

	/**
	 * ubyte 型のカラー値
	 */
	package struct tagCOLOR_U8
	{
		dxlib_d.DxDataType.BYTE b;
		dxlib_d.DxDataType.BYTE g;
		dxlib_d.DxDataType.BYTE r;
		dxlib_d.DxDataType.BYTE a;
	}

	public alias COLOR_U8 = .tagCOLOR_U8;

	/**
	 * FLOAT4個データ型
	 */
	package struct tagFLOAT4
	{
		float x = 0;
		float y = 0;
		float z = 0;
		float w = 0;
	}

	public alias FLOAT4 = .tagFLOAT4;
	public alias LPFLOAT4 = .tagFLOAT4*;

	/**
	 * DOUBLE4個データ型
	 */
	package struct tagDOUBLE4
	{
		double x = 0;
		double y = 0;
		double z = 0;
		double w = 0;
	}

	public alias DOUBLE4 = .tagDOUBLE4;
	public alias LPDOUBLE4 = .tagDOUBLE4*;

	/**
	 * INT4個データ型
	 */
	package struct tagINT4
	{
		int x;
		int y;
		int z;
		int w;
	}

	public alias INT4 = .tagINT4;

	version (DX_NOTUSE_DRAWFUNCTION) {
	} else {
		/**
		 * 2D描画に使用する頂点データ型(DrawPrimitive2D用)
		 */
		package struct tagVERTEX2D
		{
			.VECTOR pos;
			float rhw = 0;
			.COLOR_U8 dif;
			float u = 0;
			float v = 0;
		}

		public alias VERTEX2D = .tagVERTEX2D;
		public alias LPVERTEX2D = .tagVERTEX2D*;

		/**
		 * 2D描画に使用する頂点データ型(DrawPrimitive2DToShader用)
		 */
		package struct tagVERTEX2DSHADER
		{
			.VECTOR pos;
			float rhw = 0;
			.COLOR_U8 dif;
			.COLOR_U8 spc;
			float u = 0;
			float v = 0;
			float su = 0;
			float sv = 0;
		}

		public alias VERTEX2DSHADER = .tagVERTEX2DSHADER;
		public alias LPVERTEX2DSHADER = .tagVERTEX2DSHADER*;

		/**
		 * 2D描画に使用する頂点データ型(公開用)
		 */
		package struct tagVERTEX
		{
			float x = 0;
			float y = 0;
			float u = 0;
			float v = 0;
			ubyte b;
			ubyte g;
			ubyte r;
			ubyte a;
		}

		public alias VERTEX = .tagVERTEX;

		/**
		 * 3D描画に使用する頂点データ型( 旧バージョンのもの )
		 */
		package struct tagVERTEX_3D
		{
			.VECTOR pos;
			ubyte b;
			ubyte g;
			ubyte r;
			ubyte a;
			float u = 0;
			float v = 0;
		}

		public alias VERTEX_3D = .tagVERTEX_3D;
		public alias LPVERTEX_3D = .tagVERTEX_3D*;

		/**
		 * 3D描画に使用する頂点データ型
		 */
		package struct tagVERTEX3D
		{
			/**
			 * 座標
			 */
			.VECTOR pos;

			/**
			 * 法線
			 */
			.VECTOR norm;

			/**
			 * ディフューズカラー
			 */
			.COLOR_U8 dif;

			/**
			 * スペキュラカラー
			 */
			.COLOR_U8 spc;

			/**
			 * テクスチャ座標
			 */
			float u = 0;

			/**
			 * テクスチャ座標
			 */
			float v = 0;

			/**
			 * 補助テクスチャ座標
			 */
			float su = 0;

			/**
			 * 補助テクスチャ座標
			 */
			float sv = 0;
		}

		public alias VERTEX3D = .tagVERTEX3D;
		public alias LPVERTEX3D = .tagVERTEX3D*;

		/**
		 * 3D描画に使用する頂点データ型( DrawPrimitive3DToShader用 )
		 * 注意…メンバ変数に追加があるかもしれませんので、宣言時の初期化( VERTEX3DSHADER Vertex = { 0.0f, 0.0f, ... というようなもの )はしない方が良いです
		 */
		package struct tagVERTEX3DSHADER
		{
			/**
			 * 座標
			 */
			.VECTOR pos;

			/**
			 * 補助座標
			 */
			.FLOAT4 spos;

			/**
			 * 法線
			 */
			.VECTOR norm;

			/**
			 * 接線
			 */
			.VECTOR tan;

			/**
			 * 従法線
			 */
			.VECTOR binorm;

			/**
			 * ディフューズカラー
			 */
			.COLOR_U8 dif;

			/**
			 * スペキュラカラー
			 */
			.COLOR_U8 spc;

			/**
			 * テクスチャ座標
			 */
			float u = 0;

			/**
			 * テクスチャ座標
			 */
			float v = 0;

			/**
			 * 補助テクスチャ座標
			 */
			float su = 0;

			/**
			 * 補助テクスチャ座標
			 */
			float sv = 0;
		}

		public alias VERTEX3DSHADER = .tagVERTEX3DSHADER;
		public alias LPVERTEX3DSHADER = .tagVERTEX3DSHADER*;

		/**
		 * ライトパラメータ
		 */
		package struct tagLIGHTPARAM
		{
			/**
			 * ライトのタイプ( DX_LIGHTTYPE_D3DLIGHT_POINT 等 )
			 */
			int LightType;

			/**
			 * ディフューズカラー
			 */
			.COLOR_F Diffuse;

			/**
			 * スペキュラカラー
			 */
			.COLOR_F Specular;

			/**
			 * アンビエント色
			 */
			.COLOR_F Ambient;

			/**
			 * 位置
			 */
			.VECTOR Position;

			/**
			 * 方向
			 */
			.VECTOR Direction;

			/**
			 * 有効距離
			 */
			float Range = 0;

			/**
			 * フォールオフ 1.0f にしておくのが好ましい
			 */
			float Falloff = 0;

			/**
			 * 距離による減衰係数0
			 */
			float Attenuation0 = 0;

			/**
			 * 距離による減衰係数1
			 */
			float Attenuation1 = 0;

			/**
			 * 距離による減衰係数2
			 */
			float Attenuation2 = 0;

			/**
			 * スポットライトの内部コーンの照明角度( ラジアン )
			 */
			float Theta = 0;

			/**
			 * スポットライトの外部コーンの照明角度
			 */
			float Phi = 0;
		}

		alias LIGHTPARAM = .tagLIGHTPARAM;

		/**
		 * マテリアルパラメータ
		 */
		package struct tagMATERIALPARAM
		{
			/**
			 * ディフューズカラー
			 */
			.COLOR_F Diffuse;

			/**
			 * アンビエントカラー
			 */
			.COLOR_F Ambient;

			/**
			 * スペキュラカラー
			 */
			.COLOR_F Specular;

			/**
			 * エミッシブカラー
			 */
			.COLOR_F Emissive;

			/**
			 * スペキュラハイライトの鮮明度
			 */
			float Power = 0;
		}

		alias MATERIALPARAM = .tagMATERIALPARAM;
	}

	/**
	 * ラインヒットチェック結果格納用構造体
	 */
	package struct tagHITRESULT_LINE
	{
		/**
		 * 当たったかどうか( 1:当たった  0:当たらなかった )
		 */
		int HitFlag;

		/**
		 * 当たった座標
		 */
		.VECTOR Position;
	}

	public alias HITRESULT_LINE = .tagHITRESULT_LINE;

	/**
	 * ラインヒットチェック結果格納用構造体
	 */
	package struct tagHITRESULT_LINE_D
	{
		/**
		 * 当たったかどうか( 1:当たった  0:当たらなかった )
		 */
		int HitFlag;

		/**
		 * 当たった座標
		 */
		.VECTOR_D Position;
	}

	public alias HITRESULT_LINE_D = .tagHITRESULT_LINE_D;

	/**
	 * 関数 Segment_Segment_Analyse の結果を受け取る為の構造体
	 */
	package struct tagSEGMENT_SEGMENT_RESULT
	{
		/**
		 * 線分Aと線分Bが最も接近する座標間の距離の二乗
		 */
		float SegA_SegB_MinDist_Square = 0;

		/**
		 * 線分Aと線分Bに最も接近する座標の線分Aの t ( 0.0f 〜 1.0f 、最近点座標 = (( SegAPos2 - SegAPos1 ) * t) + SegAPos1 )
		 */
		float SegA_MinDist_Pos1_Pos2_t = 0;

		/**
		 * 線分Bが線分Aに最も接近する座標の線分Bの t ( 0.0f 〜 1.0f 、最近点座標 = (( SegBPos2 - SegBPos1 ) * t) + SegBPos1 )
		 */
		float SegB_MinDist_Pos1_Pos2_t = 0;

		/**
		 * 線分Aが線分Bに最も接近する線分A上の座標
		 */
		.VECTOR SegA_MinDist_Pos;

		/**
		 * 線分Bが線分Aに最も接近する線分B上の座標
		 */
		.VECTOR SegB_MinDist_Pos;
	}

	public alias SEGMENT_SEGMENT_RESULT = .tagSEGMENT_SEGMENT_RESULT;

	/**
	 * 関数 Segment_Segment_Analyse の結果を受け取る為の構造体
	 */
	package struct tagSEGMENT_SEGMENT_RESULT_D
	{
		/**
		 * 線分Aと線分Bが最も接近する座標間の距離の二乗
		 */
		double SegA_SegB_MinDist_Square = 0;

		/**
		 * 線分Aと線分Bに最も接近する座標の線分Aの t ( 0.0 〜 1.0 、最近点座標 = (( SegAPos2 - SegAPos1 ) * t) + SegAPos1 )
		 */
		double SegA_MinDist_Pos1_Pos2_t = 0;

		/**
		 * 線分Bが線分Aに最も接近する座標の線分Bの t ( 0.0 〜 1.0 、最近点座標 = (( SegBPos2 - SegBPos1 ) * t) + SegBPos1 )
		 */
		double SegB_MinDist_Pos1_Pos2_t = 0;

		/**
		 * 線分Aが線分Bに最も接近する線分A上の座標
		 */
		.VECTOR_D SegA_MinDist_Pos;

		/**
		 * 線分Bが線分Aに最も接近する線分B上の座標
		 */
		.VECTOR_D SegB_MinDist_Pos;
	}

	public alias SEGMENT_SEGMENT_RESULT_D = .tagSEGMENT_SEGMENT_RESULT_D;

	/**
	 * 関数 Segment_Point_Analyse の結果を受け取る為の構造体
	 */
	package struct tagSEGMENT_POINT_RESULT
	{
		/**
		 * 線分と点が最も接近する座標間の距離の二乗
		 */
		float Seg_Point_MinDist_Square = 0;

		/**
		 * 線分が点に最も接近する座標の線分の t ( 0.0f 〜 1.0f 、最近点座標 = (( SegPos2 - SegPos1 ) * t) + SegPos1 )
		 */
		float Seg_MinDist_Pos1_Pos2_t = 0;

		/**
		 * 線分が点に最も接近する線分上の座標
		 */
		.VECTOR Seg_MinDist_Pos;
	}

	public alias SEGMENT_POINT_RESULT = .tagSEGMENT_POINT_RESULT;

	/**
	 * 関数 Segment_Point_Analyse の結果を受け取る為の構造体
	 */
	package struct tagSEGMENT_POINT_RESULT_D
	{
		/**
		 * 線分と点が最も接近する座標間の距離の二乗
		 */
		double Seg_Point_MinDist_Square = 0;

		/**
		 * 線分が点に最も接近する座標の線分の t ( 0.0 〜 1.0 、最近点座標 = (( SegPos2 - SegPos1 ) * t) + SegPos1 )
		 */
		double Seg_MinDist_Pos1_Pos2_t = 0;

		/**
		 * 線分が点に最も接近する線分上の座標
		 */
		.VECTOR_D Seg_MinDist_Pos;
	}

	public alias SEGMENT_POINT_RESULT_D = .tagSEGMENT_POINT_RESULT_D;

	/**
	 * 関数 Segment_Triangle_Analyse の結果を受け取る為の構造体
	 */
	package struct tagSEGMENT_TRIANGLE_RESULT
	{
		/**
		 * 線分と三角形が最も接近する座標間の距離の二乗
		 */
		float Seg_Tri_MinDist_Square = 0;

		/**
		 * 線分が三角形に最も接近する座標の線分の t ( 0.0f 〜 1.0f 、最近点座標 = (( SegPos2 - SegPos1 ) * t) + SegPos1 )
		 */
		float Seg_MinDist_Pos1_Pos2_t = 0;

		/**
		 * 線分が三角形に最も接近する線分上の座標
		 */
		.VECTOR Seg_MinDist_Pos;

		/**
		 * 三角形が線分に最も接近する座標の三角形座標1の重み( 最近点座標 = (TriPos1 * TriPos1_w) + (TriPos2 * TriPos2_w) + (TriPos3 * TriPos3_w) )
		 */
		float Tri_MinDist_Pos1_w = 0;

		/**
		 * 三角形が線分に最も接近する座標の三角形座標2の重み
		 */
		float Tri_MinDist_Pos2_w = 0;

		/**
		 * 三角形が線分に最も接近する座標の三角形座標3の重み
		 */
		float Tri_MinDist_Pos3_w = 0;

		/**
		 * 三角形が線分に最も接近する三角形上の座標
		 */
		.VECTOR Tri_MinDist_Pos;
	}

	public alias SEGMENT_TRIANGLE_RESULT = .tagSEGMENT_TRIANGLE_RESULT;

	/**
	 * 関数 Segment_Triangle_Analyse の結果を受け取る為の構造体
	 */
	package struct tagSEGMENT_TRIANGLE_RESULT_D
	{
		/**
		 * 線分と三角形が最も接近する座標間の距離の二乗
		 */
		double Seg_Tri_MinDist_Square = 0;

		/**
		 * 線分が三角形に最も接近する座標の線分の t ( 0.0 〜 1.0 、最近点座標 = (( SegPos2 - SegPos1 ) * t) + SegPos1 )
		 */
		double Seg_MinDist_Pos1_Pos2_t = 0;

		/**
		 * 線分が三角形に最も接近する線分上の座標
		 */
		.VECTOR_D Seg_MinDist_Pos;

		/**
		 * 三角形が線分に最も接近する座標の三角形座標1の重み( 最近点座標 = (TriPos1 * TriPos1_w) + (TriPos2 * TriPos2_w) + (TriPos3 * TriPos3_w) )
		 */
		double Tri_MinDist_Pos1_w = 0;

		/**
		 * 三角形が線分に最も接近する座標の三角形座標2の重み
		 */
		double Tri_MinDist_Pos2_w = 0;

		/**
		 * 三角形が線分に最も接近する座標の三角形座標3の重み
		 */
		double Tri_MinDist_Pos3_w = 0;

		/**
		 * 三角形が線分に最も接近する三角形上の座標
		 */
		.VECTOR_D Tri_MinDist_Pos;
	}

	public alias SEGMENT_TRIANGLE_RESULT_D = .tagSEGMENT_TRIANGLE_RESULT_D;

	/**
	 * 関数 Triangle_Point_Analyse の結果を受け取る為の構造体
	 */
	package struct tagTRIANGLE_POINT_RESULT
	{
		/**
		 * 三角形と点が最も接近する座標間の距離の二乗
		 */
		float Tri_Pnt_MinDist_Square = 0;

		/**
		 * 三角形が点に最も接近する座標の三角形座標1の重み( 最近点座標 = (TriPos1 * TriPos1_w) + (TriPos2 * TriPos2_w) + (TriPos3 * TriPos3_w) )
		 */
		float Tri_MinDist_Pos1_w = 0;

		/**
		 * 三角形が点に最も接近する座標の三角形座標2の重み
		 */
		float Tri_MinDist_Pos2_w = 0;

		/**
		 * 三角形が点に最も接近する座標の三角形座標3の重み
		 */
		float Tri_MinDist_Pos3_w = 0;

		/**
		 * 三角形が点に最も接近する三角形上の座標
		 */
		.VECTOR Tri_MinDist_Pos;
	}

	public alias TRIANGLE_POINT_RESULT = .tagTRIANGLE_POINT_RESULT;

	/**
	 * 関数 Triangle_Point_Analyse の結果を受け取る為の構造体
	 */
	package struct tagTRIANGLE_POINT_RESULT_D
	{
		/**
		 * 三角形と点が最も接近する座標間の距離の二乗
		 */
		double Tri_Pnt_MinDist_Square = 0;

		/**
		 * 三角形が点に最も接近する座標の三角形座標1の重み( 最近点座標 = (TriPos1 * TriPos1_w) + (TriPos2 * TriPos2_w) + (TriPos3 * TriPos3_w) )
		 */
		double Tri_MinDist_Pos1_w = 0;

		/**
		 * 三角形が点に最も接近する座標の三角形座標2の重み
		 */
		double Tri_MinDist_Pos2_w = 0;

		/**
		 * 三角形が点に最も接近する座標の三角形座標3の重み
		 */
		double Tri_MinDist_Pos3_w = 0;

		/**
		 * 三角形が点に最も接近する三角形上の座標
		 */
		.VECTOR_D Tri_MinDist_Pos;
	}

	public alias TRIANGLE_POINT_RESULT_D = .tagTRIANGLE_POINT_RESULT_D;

	/**
	 * 関数 Plane_Point_Analyse の結果を受け取る為の構造体
	 */
	package struct tagPLANE_POINT_RESULT
	{
		/**
		 * 点が平面の法線の側にあるかどうか( 1:法線の側にある  0:法線と反対側にある )
		 */
		int Pnt_Plane_Normal_Side;

		/**
		 * 平面と点の距離
		 */
		float Plane_Pnt_MinDist_Square = 0;

		/**
		 * 平面上の点との最近点座標
		 */
		.VECTOR Plane_MinDist_Pos;
	}

	public alias PLANE_POINT_RESULT = .tagPLANE_POINT_RESULT;

	/**
	 * 関数 Plane_Point_Analyse の結果を受け取る為の構造体
	 */
	package struct tagPLANE_POINT_RESULT_D
	{
		/**
		 * 点が平面の法線の側にあるかどうか( 1:法線の側にある  0:法線と反対側にある )
		 */
		int Pnt_Plane_Normal_Side;

		/**
		 * 平面と点の距離
		 */
		double Plane_Pnt_MinDist_Square = 0;

		/**
		 * 平面上の点との最近点座標
		 */
		.VECTOR_D Plane_MinDist_Pos;
	}

	public alias PLANE_POINT_RESULT_D = .tagPLANE_POINT_RESULT_D;

	version (DX_NOTUSE_DRAWFUNCTION) {
	} else {
		/**
		 * コリジョン結果代入用ポリゴン
		 */
		package struct tagMV1_COLL_RESULT_POLY
		{
			/**
			 * ( MV1CollCheck_Line でのみ有効 )ヒットフラグ( 1:ヒットした  0:ヒットしなかった )
			 */
			int HitFlag;

			/**
			 * ( MV1CollCheck_Line でのみ有効 )ヒット座標
			 */
			.VECTOR HitPosition;

			/**
			 * 当たったポリゴンが含まれるフレームの番号
			 */
			int FrameIndex;

			/**
			 * 当たったポリゴンが含まれるメッシュの番号( メッシュ単位で判定した場合のみ有効 )
			 */
			int MeshIndex;

			/**
			 * 当たったポリゴンの番号
			 */
			int PolygonIndex;

			/**
			 * 当たったポリゴンが使用しているマテリアルの番号
			 */
			int MaterialIndex;

			/**
			 * 当たったポリゴンを形成する三点の座標
			 */
			.VECTOR[3] Position;

			/**
			 * 当たったポリゴンの法線
			 */
			.VECTOR Normal;

			/**
			 * 当たった座標は、当たったポリゴンの三点それぞれどの割合で影響しているか、の値( 当たった座標 = (Position[ 0 ] * PositionWeight[ 0 ]) + (Position[ 1 ] * PositionWeight[ 1 ]) + (Position[ 2 ] * PositionWeight[ 2 ]) )
			 */
			float[3] PositionWeight = 0;

			/**
			 * 当たったポリゴンの座標がそれぞれ最も影響を受けているフレームの番号
			 */
			int[3] PosMaxWeightFrameIndex;
		}

		public alias MV1_COLL_RESULT_POLY = .tagMV1_COLL_RESULT_POLY;

		/**
		 * コリジョン結果代入用ポリゴン配列
		 */
		package struct tagMV1_COLL_RESULT_POLY_DIM
		{
			/**
			 * ヒットしたポリゴンの数
			 */
			int HitNum;

			/**
			 * ヒットしたポリゴンの配列( HitNum個分存在する )
			 */
			.MV1_COLL_RESULT_POLY* Dim;
		}

		public alias MV1_COLL_RESULT_POLY_DIM = .tagMV1_COLL_RESULT_POLY_DIM;

		/**
		 * 参照用頂点構造体
		 */
		package struct tagMV1_REF_VERTEX
		{
			/**
			 * 位置
			 */
			.VECTOR Position;

			/**
			 * 法線
			 */
			.VECTOR Normal;

			/**
			 * テクスチャ座標
			 */
			.FLOAT2[2] TexCoord;

			/**
			 * ディフューズカラー
			 */
			.COLOR_U8 DiffuseColor;

			/**
			 * スペキュラカラー
			 */
			.COLOR_U8 SpecularColor;

			/**
			 * 最も大きな影響を与えているフレーム( スキニングメッシュ用 )
			 */
			int MaxWeightFrameIndex;
		}

		public alias MV1_REF_VERTEX = .tagMV1_REF_VERTEX;

		/**
		 * 参照用ポリゴン構造体
		 */
		package struct tagMV1_REF_POLYGON
		{
			/**
			 * このポリゴンが属しているフレーム
			 */
			ushort FrameIndex;

			/**
			 * このポリゴンが属しているメッシュ
			 */
			ushort MeshIndex;

			/**
			 * 使用しているマテリアル
			 */
			ushort MaterialIndex;

			/**
			 * VIndex が指すインデックスの参照先( 1:フレーム  0:モデル全体 )
			 */
			ushort VIndexTarget;

			/**
			 * 3角形ポリゴンを成す参照頂点のインデックス
			 */
			int[3] VIndex;

			/**
			 * ポリゴンを成す頂点座標の最小値
			 */
			.VECTOR MinPosition;

			/**
			 * ポリゴンを成す頂点座標の最大値
			 */
			.VECTOR MaxPosition;
		}

		public alias MV1_REF_POLYGON = .tagMV1_REF_POLYGON;

		/**
		 * 参照用ポリゴンデータ構造体
		 */
		package struct tagMV1_REF_POLYGONLIST
		{
			/**
			 * 参照用ポリゴンの数
			 */
			int PolygonNum;

			/**
			 * 頂点の数
			 */
			int VertexNum;

			/**
			 * 頂点座標の最小値
			 */
			.VECTOR MinPosition;

			/**
			 * 頂点座標の最大値
			 */
			.VECTOR MaxPosition;

			/**
			 * 参照用ポリゴン配列
			 */
			.MV1_REF_POLYGON* Polygons;

			/**
			 * 参照用頂点配列
			 */
			.MV1_REF_VERTEX* Vertexs;
		}

		public alias MV1_REF_POLYGONLIST = .tagMV1_REF_POLYGONLIST;
	}

	/**
	 * 3Dサウンドリバーブエフェクトパラメータ構造体
	 * ( 注釈は MSDN の XAUDIO2FX_REVERB_PARAMETERS 構造体の解説をほぼ引用しています )
	 */
	package struct tagSOUND3D_REVERB_PARAM
	{
		/**
		 * リバーブとなる出力の割合( 指定可能範囲 0.0f 〜 100.0f )
		 */
		float WetDryMix = 0;

		/**
		 * ダイレクト パスに対する初期反射の遅延時間、単位はミリ秒( 指定可能範囲 0 〜 300 )
		 */
		uint ReflectionsDelay;

		/**
		 * 初期反射に対するリバーブの遅延時間、単位はミリ秒( 指定可能範囲 0 〜 85 )
		 */
		dxlib_d.DxDataType.BYTE ReverbDelay;

		/**
		 * 左後方出力および右後方出力の遅延時間、単位はミリ秒( 指定可能範囲 0 〜 5 )
		 */
		dxlib_d.DxDataType.BYTE RearDelay;

		/**
		 * シミュレーション空間における視聴者に対する左入力の位置( 指定可能範囲 0 〜 30 )
		 * PositionLeft を最小値に設定した場合、左入力は視聴者の近くに配置されます。
		 * この位置では、サウンド フィールドにおいて初期反射が優勢になり、残響減衰は弱まって、振幅が小さくなります。
		 * PositionLeft を最大値に設定した場合、左入力はシミュレーション室内で視聴者から最大限遠い位置に配置されます。
		 * PositionLeft は残響減衰時間 (部屋の残響効果) に影響せず、視聴者に対する音源の見かけの位置のみに影響します。
		 */
		dxlib_d.DxDataType.BYTE PositionLeft;

		/**
		 * PositionLeft と同効果の右入力値( 指定可能範囲 0 〜 30 )、右入力にのみ影響を与える
		 */
		dxlib_d.DxDataType.BYTE PositionRight;

		/**
		 * 音源から視聴者までの距離によるインプレッションを増減させる値( 指定可能範囲 0 〜 30 )
		 */
		dxlib_d.DxDataType.BYTE PositionMatrixLeft;

		/**
		 * 音源から視聴者までの距離によるインプレッションを増減させま値( 指定可能範囲 0 〜 30 )
		 */
		dxlib_d.DxDataType.BYTE PositionMatrixRight;

		/**
		 * 個々の壁の反射特性値( 指定可能範囲 0 〜 15 )、( 堅く平らな表面をシミュレートするには小さな値を設定し、散乱性の表面をシミュレートするには大きな値を設定します。)
		 */
		dxlib_d.DxDataType.BYTE EarlyDiffusion;

		/**
		 * 個々の壁のリバーブ特性値( 指定可能範囲 0 〜 15 )、( 堅く平らな表面をシミュレートするには小さな値を設定し、散乱性の表面をシミュレートするには大きな値を設定します。)
		 */
		dxlib_d.DxDataType.BYTE LateDiffusion;

		/**
		 * 1 kHz における減衰時間を基準にして低周波数の減衰時間調整値( 指定可能範囲 0 〜 12 )
		 *
		 * 値とゲイン (dB) の関係
		 * 値          0  1  2  3  4  5  6  7  8  9 10 11 12
		 * ゲイン(dB) -8 -7 -6 -5 -4 -3 -2 -1  0 +1 +2 +3 +4
		 * LowEQGain の値が 8 の場合、低周波数の減衰時間と 1 kHz における減衰時間が等しくなることに注意してください
		 */
		dxlib_d.DxDataType.BYTE LowEQGain;

		/**
		 * LowEQGain パラメーターにより制御されるローパス フィルターの折点周波数の設定値( 指定可能範囲 0 〜 9 )
		 *
		 * 値と周波数 (Hz) の関係
		 * 値          0   1   2   3   4   5   6   7   8   9
		 * 周波数(Hz) 50 100 150 200 250 300 350 400 450 500
		 */
		dxlib_d.DxDataType.BYTE LowEQCutoff;

		/**
		 * 1 kHz における減衰時間を基準にして高周波数の減衰時間調整値( 指定可能範囲 0 〜 8 )
		 *
		 * 値とゲイン (dB) の関係
		 * 値          0  1  2  3  4  5  6  7 8
		 * ゲイン(dB) -8 -7 -6 -5 -4 -3 -2 -1 0
		 * 0 に設定すると、高周波数の音が 1 kHz の場合と同じ割合で減衰します。最大値に設定すると、高周波数の音が 1 kHz の場合よりもはるかに高い割合で減衰します。
		 */
		dxlib_d.DxDataType.BYTE HighEQGain;

		/**
		 * HighEQGain パラメーターにより制御されるハイパス フィルターの折点周波数設定値( 指定可能範囲 0 〜 14 )
		 *
		 * 値と周波数 (kHz) の関係
		 * 値          0    1    2     3    4     5    6     7    8     9   10    11   12    13   14
		 * 周波数(kHz) 1  1.5    2   2.5    3   3.5    4   4.5    5   5.5    6   6.5    7   7.5    8
		 */
		dxlib_d.DxDataType.BYTE HighEQCutoff;

		/**
		 * 室内エフェクトのローパス フィルターの折点周波数、単位は Hz ( 指定可能範囲 20.0f 〜 20000.0f )
		 */
		float RoomFilterFreq = 0;

		/**
		 * 初期反射と後期フィールド残響の両方に適用されるローパス フィルターのパス バンド強度レベル、単位は dB ( 指定可能範囲 -100.0f 〜 0.0f )
		 */
		float RoomFilterMain = 0;

		/**
		 * 折点周波数 (RoomFilterFreq) での初期反射と後期フィールド残響の両方に適用されるローパス フィルターのパス バンド強度レベル、単位は dB ( 指定可能範囲 -100.0f 〜 0.0f )
		 */
		float RoomFilterHF = 0;

		/**
		 * 初期反射の強度/レベルを調整値、単位は dB ( 指定可能範囲 -100.0f 〜 20.0f )
		 */
		float ReflectionsGain = 0;

		/**
		 * リバーブの強度/レベルを調整値、単位は dB ( 指定可能範囲 -100.0f 〜 20.0f )
		 */
		float ReverbGain = 0;

		/**
		 * 1 kHz における残響減衰時間、単位は秒 ( 指定可能範囲 0.1f 〜 上限値特になし )、これは、フル スケールの入力信号が 60 dB 減衰するまでの時間です。
		 */
		float DecayTime = 0;

		/**
		 * 後期フィールド残響のモード密度を制御値、単位はパーセント( 指定可能範囲 0.0f 〜 100.0f )
		 * 無色 (colorless) の空間では、Density を最大値 (100.0f ) に設定する必要があります。
		 * Density を小さくすると、サウンドはくぐもった音 (くし形フィルターが適用された音) になります。
		 * これはサイロをシミュレーションするときに有効なエフェクトです。
		 */
		float Density = 0;

		/**
		 * 音響空間の見かけ上のサイズ、単位はフィート( 指定可能範囲 1.0f (30.48 cm) 〜 100.0f (30.48 m) )
		 */
		float RoomSize = 0;
	}

	public alias SOUND3D_REVERB_PARAM = .tagSOUND3D_REVERB_PARAM;

	/**
	 * ストリームデータ制御用関数ポインタ構造体タイプ2
	 */
	package struct tagSTREAMDATASHREDTYPE2
	{
		dxlib_d.DxDataType.DWORD_PTR function(const (dxlib_d.DxDataType.TCHAR)* Path, int UseCacheFlag, int BlockReadFlag, int UseASyncReadFlag) Open;
		int function(dxlib_d.DxDataType.DWORD_PTR Handle) Close;
		dxlib_d.DxDataType.LONGLONG function(dxlib_d.DxDataType.DWORD_PTR Handle) Tell;
		int function(dxlib_d.DxDataType.DWORD_PTR Handle, dxlib_d.DxDataType.LONGLONG SeekPoint, int SeekType) Seek;
		size_t function(void* Buffer, size_t BlockSize, size_t DataNum, dxlib_d.DxDataType.DWORD_PTR Handle) Read;
		int function(dxlib_d.DxDataType.DWORD_PTR Handle) Eof;
		int function(dxlib_d.DxDataType.DWORD_PTR Handle) IdleCheck;
		int function(const (dxlib_d.DxDataType.TCHAR)* Path) ChDir;
		int function(dxlib_d.DxDataType.TCHAR* Buffer) GetDir;
		int function(dxlib_d.DxDataType.TCHAR* Buffer, size_t BufferSize) GetDirS;

		/**
		 * Returns: -1:エラー  -1以外:FindHandle
		 */
		dxlib_d.DxDataType.DWORD_PTR function(const (dxlib_d.DxDataType.TCHAR)* FilePath, .FILEINFO* Buffer) FindFirst;

		/**
		 * Returns: -1:エラー  0:成功
		 */
		int function(dxlib_d.DxDataType.DWORD_PTR FindHandle, .FILEINFO* Buffer) FindNext;

		/**
		 * Returns: -1:エラー  0:成功
		 */
		int function(dxlib_d.DxDataType.DWORD_PTR FindHandle) FindClose;
	}

	public alias STREAMDATASHREDTYPE2 = .tagSTREAMDATASHREDTYPE2;

	/**
	 * ストリームデータ制御用関数ポインタ構造体タイプ2の wchar_t 使用版
	 */
	package struct tagSTREAMDATASHREDTYPE2W
	{
		dxlib_d.DxDataType.DWORD_PTR function(const (.wchar_t)* Path, int UseCacheFlag, int BlockReadFlag, int UseASyncReadFlag) Open;
		int function(dxlib_d.DxDataType.DWORD_PTR Handle) Close;
		dxlib_d.DxDataType.LONGLONG function(dxlib_d.DxDataType.DWORD_PTR Handle) Tell;
		int function(dxlib_d.DxDataType.DWORD_PTR Handle, dxlib_d.DxDataType.LONGLONG SeekPoint, int SeekType) Seek;
		size_t function(void* Buffer, size_t BlockSize, size_t DataNum, dxlib_d.DxDataType.DWORD_PTR Handle) Read;
		int function(dxlib_d.DxDataType.DWORD_PTR Handle) Eof;
		int function(dxlib_d.DxDataType.DWORD_PTR Handle) IdleCheck;

		/**
		 * Returns: -1:エラー  0:DXアーカイブファイル内のファイルではない  1:DXアーカイブファイル内のファイル
		 */
		int function(dxlib_d.DxDataType.DWORD_PTR Handle) IsDXA;

		int function(const (.wchar_t)* Path) ChDir;
		int function(.wchar_t* Buffer) GetDir;
		int function(.wchar_t* Buffer, size_t BufferSize) GetDirS;

		/**
		 * Returns: -1:エラー  -1以外:FindHandle
		 */
		dxlib_d.DxDataType.DWORD_PTR function(const (.wchar_t)* FilePath, .FILEINFOW* Buffer) FindFirst;

		/**
		 * Returns: -1:エラー  0:成功
		 */
		int function(dxlib_d.DxDataType.DWORD_PTR FindHandle, .FILEINFOW* Buffer) FindNext;

		/**
		 * Returns: -1:エラー  0:成功
		 */
		int function(dxlib_d.DxDataType.DWORD_PTR FindHandle) FindClose;
	}

	public alias STREAMDATASHREDTYPE2W = .tagSTREAMDATASHREDTYPE2W;

	/**
	 * ストリームデータ制御用関数ポインタ構造体
	 */
	package struct tagSTREAMDATASHRED
	{
		dxlib_d.DxDataType.LONGLONG function(dxlib_d.DxDataType.DWORD_PTR StreamDataPoint) Tell;
		int function(dxlib_d.DxDataType.DWORD_PTR StreamDataPoint, dxlib_d.DxDataType.LONGLONG SeekPoint, int SeekType) Seek;
		size_t function(void* Buffer, size_t BlockSize, size_t DataNum, dxlib_d.DxDataType.DWORD_PTR StreamDataPoint) Read;
		// size_t function(void* Buffer, size_t BlockSize, size_t DataNum, dxlib_d.DxDataType.DWORD_PTR StreamDataPoint) Write;
		int function(dxlib_d.DxDataType.DWORD_PTR StreamDataPoint) Eof;
		int function(dxlib_d.DxDataType.DWORD_PTR StreamDataPoint) IdleCheck;
		int function(dxlib_d.DxDataType.DWORD_PTR StreamDataPoint) Close;
	}

	public alias STREAMDATASHRED = .tagSTREAMDATASHRED;
	public alias LPSTREAMDATASHRED = .tagSTREAMDATASHRED*;

	/**
	 * ストリームデータ制御用データ構造体
	 */
	package struct tagSTREAMDATA
	{
		.STREAMDATASHRED ReadShred;
		dxlib_d.DxDataType.DWORD_PTR DataPoint;
	}

	public alias STREAMDATA = .tagSTREAMDATA;

	/**
	 * パレット情報構造体
	 */
	package struct tagCOLORPALETTEDATA
	{
		ubyte Blue;
		ubyte Green;
		ubyte Red;
		ubyte Alpha;
	}

	public alias COLORPALETTEDATA = .tagCOLORPALETTEDATA;

	/**
	 * カラー構造情報構造体
	 */
	package struct tagCOLORDATA
	{
		/**
		 * フォーマット( DX_BASEIMAGE_FORMAT_NORMAL 等 )
		 */
		ubyte Format;

		/**
		 * チャンネル数
		 */
		ubyte ChannelNum;

		/**
		 * 1チャンネル辺りのビット深度
		 */
		ubyte ChannelBitDepth;

		/**
		 * 浮動小数点型かどうか( TRUE:浮動小数点型  FALSE:整数型 )
		 */
		ubyte FloatTypeFlag;

		/**
		 * 1ピクセルあたりのバイト数
		 */
		ubyte PixelByte;

		// 以下は ChannelNum 又は ChannelBitDepth が 0 の時のみ有効

		/**
		 * ビット深度
		 */
		ubyte ColorBitDepth;

		/**
		 * 使われていないビットのアドレスと幅
		 */
		ubyte NoneLoc;

		/**
		 * 使われていないビットのアドレスと幅
		 */
		ubyte NoneWidth;

		/**
		 * ビット幅
		 */
		ubyte RedWidth;

		/**
		 * ビット幅
		 */
		ubyte GreenWidth;

		/**
		 * ビット幅
		 */
		ubyte BlueWidth;

		/**
		 * ビット幅
		 */
		ubyte AlphaWidth;

		/**
		 * 配置されているビットアドレス
		 */
		ubyte RedLoc;

		/**
		 * 配置されているビットアドレス
		 */
		ubyte GreenLoc;

		/**
		 * 配置されているビットアドレス
		 */
		ubyte BlueLoc;

		/**
		 * 配置されているビットアドレス
		 */
		ubyte AlphaLoc;

		/**
		 * ビットマスク
		 */
		uint RedMask;

		/**
		 * ビットマスク
		 */
		uint GreenMask;

		/**
		 * ビットマスク
		 */
		uint BlueMask;

		/**
		 * ビットマスク
		 */
		uint AlphaMask;

		/**
		 * 使われていないビットのマスク
		 */
		uint NoneMask;

		/**
		 * 使用しているパレット番号の最大値( 0 の場合は 255 とみなす )
		 */
		int MaxPaletteNo;

		// memo: ここより上にメンバー変数を追加したら DxBaseImage.cpp の NS_GraphColorMatchBltVer2 のアセンブラでのパレットデータ参照のリテラル値を修正する必要あり

		/**
		 * パレット( ColorBitDepth が8以下の場合のみ有効 )
		 */
		.COLORPALETTEDATA[256] Palette;
	}

	public alias COLORDATA = .tagCOLORDATA;
	public alias LPCOLORDATA = .tagCOLORDATA*;

	/**
	 * 基本イメージデータ構造体
	 */
	package struct tagBASEIMAGE
	{
		/**
		 * 色情報
		 */
		.COLORDATA ColorData;

		/**
		 * 幅
		 */
		int Width;

		/**
		 * 高さ
		 */
		int Height;

		/**
		 * ピッチ
		 */
		int Pitch;

		/**
		 * グラフィックイメージ
		 */
		void* GraphData;

		/**
		 * ミップマップの数
		 */
		int MipMapCount;

		/**
		 * グラフィックイメージの数
		 */
		int GraphDataCount;
	}

	public alias BASEIMAGE = .tagBASEIMAGE;
	public alias GRAPHIMAGE = .tagBASEIMAGE;
	public alias LPGRAPHIMAGE = .tagBASEIMAGE*;

	/**
	 * ラインデータ型
	 */
	package struct tagLINEDATA
	{
		/**
		 * 座標
		 */
		int x1;

		/**
		 * 座標
		 */
		int y1;

		/**
		 * 座標
		 */
		int x2;

		/**
		 * 座標
		 */
		int y2;

		/**
		 * 色
		 */
		uint color;

		/**
		 * パラメータ
		 */
		int pal;
	}

	public alias LINEDATA = .tagLINEDATA;
	public alias LPLINEDATA = .tagLINEDATA*;

	/**
	 * 座標データ型
	 */
	package struct tagPOINTDATA
	{
		/**
		 * 座標
		 */
		int x;

		/**
		 * 座標
		 */
		int y;

		/**
		 * 色
		 */
		uint color;

		/**
		 * パラメータ
		 */
		int pal;
	}

	public alias POINTDATA = .tagPOINTDATA;
	public alias LPPOINTDATA = .tagPOINTDATA*;

	/**
	 * 立方体データ型
	 */
	package struct tagCUBEDATA
	{
		/**
		 * 座標1
		 */
		.VECTOR Pos1;

		/**
		 * 座標2
		 */
		.VECTOR Pos2;

		/**
		 * ディフューズカラー
		 */
		.COLOR_U8 DifColor;

		/**
		 * スペキュラカラー
		 */
		.COLOR_U8 SpcColor;
	}

	public alias CUBEDATA = .tagCUBEDATA;
	public alias LPCUBEDATA = .tagCUBEDATA*;

	version (DX_NOTUSE_DRAWFUNCTION) {
	} else {
		/**
		 * イメージフォーマットデータ
		 */
		package struct tagIMAGEFORMATDESC
		{
			/**
			 * テクスチャか、フラグ( TRUE:テクスチャ  FALSE:標準サーフェス )
			 */
			ubyte TextureFlag;

			/**
			 * キューブマップテクスチャか、フラグ( TRUE:キューブマップテクスチャ FALSE:それ以外 )
			 */
			ubyte CubeMapTextureFlag;

			/**
			 * αチャンネルはあるか、フラグ    ( TRUE:ある  FALSE:ない )
			 */
			ubyte AlphaChFlag;

			/**
			 * 描画可能か、フラグ( TRUE:可能  FALSE:不可能 )
			 */
			ubyte DrawValidFlag;

			/**
			 * システムメモリ上に存在しているか、フラグ( TRUE:システムメモリ上  FALSE:VRAM上 )( 標準サーフェスの時のみ有効 )
			 */
			ubyte SystemMemFlag;

			/**
			 * マネージドテクスチャを使用するか、フラグ
			 */
			ubyte UseManagedTextureFlag;

			/**
			 * テクスチャのメモリデータ配置にリニアが選択できる場合はデータ配置方式をリニアにするかどうか( TRUE:リニアが可能な場合はリニアにする  FALSE:リニアが可能な場合も特にリニアを指定しない )
			 */
			ubyte UseLinearMapTextureFlag;

			/**
			 * 環境依存のテクスチャフォーマットを直接指定するために使用するための変数( DX_TEXTUREFORMAT_DIRECT3D9_R8G8B8 など )
			 */
			ubyte PlatformTextureFormat;

			/**
			 * 基本フォーマット( DX_BASEIMAGE_FORMAT_NORMAL 等 )
			 */
			ubyte BaseFormat;

			/**
			 * ミップマップの数
			 */
			ubyte MipMapCount;

			/**
			 * αテストチャンネルはあるか、フラグ( TRUE:ある  FALSE:ない )( テクスチャの場合のみ有効 )
			 */
			ubyte AlphaTestFlag;

			/**
			 * 浮動小数点型かどうか
			 */
			ubyte FloatTypeFlag;

			/**
			 * 色深度( テクスチャの場合のみ有効 )
			 */
			ubyte ColorBitDepth;

			/**
			 * チャンネルの数
			 */
			ubyte ChannelNum;

			/**
			 * 1チャンネル辺りのビット深度( テクスチャの場合のみ有効、0 の場合は ColorBitDepth が使用される )
			 */
			ubyte ChannelBitDepth;

			/**
			 * ブレンド用画像か、フラグ
			 */
			ubyte BlendGraphFlag;

			/**
			 * パレットを使用しているか、フラグ( SystemMemFlag が TRUE の場合のみ有効 )
			 */
			ubyte UsePaletteFlag;

			/**
			 * マルチサンプリング数( 描画対象の場合使用 )
			 */
			ubyte MSSamples;

			/**
			 * マルチサンプリングクオリティ( 描画対象の場合使用 )
			 */
			ubyte MSQuality;
		}

		public alias IMAGEFORMATDESC = .tagIMAGEFORMATDESC;
	}

	/**
	 * DirectInput のジョイパッド入力情報
	 */
	package struct tagDINPUT_JOYSTATE
	{
		/**
		 * スティックのX軸パラメータ( -1000〜1000 )
		 */
		int X;

		/**
		 * スティックのY軸パラメータ( -1000〜1000 )
		 */
		int Y;

		/**
		 * スティックのZ軸パラメータ( -1000〜1000 )
		 */
		int Z;

		/**
		 * スティックのX軸回転パラメータ( -1000〜1000 )
		 */
		int Rx;

		/**
		 * スティックのY軸回転パラメータ( -1000〜1000 )
		 */
		int Ry;

		/**
		 * スティックのZ軸回転パラメータ( -1000〜1000 )
		 */
		int Rz;

		/**
		 * スライダー二つ( 0〜65535 )
		 */
		int[2] Slider;

		/**
		 * ハットスイッチ4つ( 0xFFFFFFFF:入力なし 0:上 4500:右上 9000:右 13500:右下 18000:下 22500:左下 27000:左 31500:左上 )
		 */
		uint[4] POV;

		/**
		 * ボタン32個( 押されたボタンは 128 になる )
		 */
		ubyte[32] Buttons;
	}

	public alias DINPUT_JOYSTATE = .tagDINPUT_JOYSTATE;

	/**
	 * XInput のジョイパッド入力情報
	 */
	package struct tagXINPUT_STATE
	{
		/**
		 * ボタン16個( 添字には XINPUT_BUTTON_DPAD_UP 等を使用する、0:押されていない  1:押されている )
		 */
		ubyte[16] Buttons;

		/**
		 * 左トリガー( 0〜255 )
		 */
		ubyte LeftTrigger;

		/**
		 * 右トリガー( 0〜255 )
		 */
		ubyte RightTrigger;

		/**
		 * 左スティックの横軸値( -32768 〜 32767 )
		 */
		short ThumbLX;

		/**
		 * 左スティックの縦軸値( -32768 〜 32767 )
		 */
		short ThumbLY;

		/**
		 * 右スティックの横軸値( -32768 〜 32767 )
		 */
		short ThumbRX;

		/**
		 * 右スティックの縦軸値( -32768 〜 32767 )
		 */
		short ThumbRY;
	}

	public alias XINPUT_STATE = .tagXINPUT_STATE;

	/**
	 * タッチパネルの1箇所分のタッチの情報
	 */
	package struct tagTOUCHINPUTPOINT
	{
		/**
		 * タッチされたデバイス
		 */
		dxlib_d.DxDataType.DWORD Device;

		/**
		 * タッチを判別するためのID
		 */
		dxlib_d.DxDataType.DWORD ID;

		/**
		 * タッチされた座標X
		 */
		int PositionX;

		/**
		 * タッチされた座標Y
		 */
		int PositionY;
	}

	public alias TOUCHINPUTPOINT = .tagTOUCHINPUTPOINT;

	/**
	 * タッチパネルのタッチの情報
	 */
	package struct tagTOUCHINPUTDATA
	{
		/**
		 * 情報の時間
		 */
		dxlib_d.DxDataType.LONGLONG Time;

		/**
		 * 有効なタッチ情報の数
		 */
		int PointNum;

		/**
		 * タッチ情報
		 */
		.TOUCHINPUTPOINT[TOUCHINPUTPOINT_MAX] Point;
	}

	public alias TOUCHINPUTDATA = .tagTOUCHINPUTDATA;

	/**
	 * WinSockets使用時のアドレス指定用構造体
	 */
	package struct tagIPDATA
	{
		/**
		 * アドレス値
		 */
		ubyte d1;

		/**
		 * アドレス値
		 */
		ubyte d2;

		/**
		 * アドレス値
		 */
		ubyte d3;

		/**
		 * アドレス値
		 */
		ubyte d4;
	}

	public alias IPDATA = .tagIPDATA;
	public alias LPIPDATA = .tagIPDATA*;

	package struct tagIPDATA_IPv6
	{
		union
		{
			ubyte[16] Byte;
			ushort[8] Word;
		}

		core.stdc.config.c_ulong ScopeID;
	}

	public alias IPDATA_IPv6 = .tagIPDATA_IPv6;

	// DxSystem.cpp関数プロトタイプ宣言

	// 初期化終了系関数

	/**
	 * ライブラリ初期化を行う
	 */
	extern int DxLib_Init();

	/**
	 * ライブラリ使用の後始末を行う
	 */
	extern int DxLib_End();

	/**
	 * ライブラリの内部で使用している構造体をゼロ初期化して、DxLib_Init の前に行った設定を無効化する( DxLib_Init の前でのみ有効 )
	 */
	extern int DxLib_GlobalStructInitialize();

	/**
	 * ライブラリが初期化されているかどうかを取得する
	 *
	 * Returns: TRUE:初期化されている  FALSE:されていない
	 */
	extern int DxLib_IsInit();

	// エラー関係関数

	/**
	 * 最後に発生したエラーのエラーコードを取得する
	 *
	 * Returns: 0:エラーが発生していない、又はエラーコード出力に対応したエラーが発生していない  0以外:エラーコード、DX_ERRORCODE_WIN_DESKTOP_24BIT_COLOR など
	 */
	extern int GetLastErrorCode();

	/**
	 * 最後に発生したエラーのエラーメッセージを指定の文字列バッファに取得する
	 */
	extern int GetLastErrorMessage(dxlib_d.DxDataType.TCHAR* StringBuffer, int StringBufferBytes);

	// メッセージ処理関数

	/**
	 * ウインドウズのメッセージループに代わる処理を行う
	 */
	extern int ProcessMessage();

	// 設定系関数

	/**
	 * アプリが非アクティブ状態でも処理を実行するかどうかを設定する
	 *
	 * Params:
	 *      Flag = TRUE:実行する  FALSE:停止する( デフォルト )
	 */
	extern int SetAlwaysRunFlag(int Flag);

	// ウエイト系関数

	/**
	 * 指定の時間だけ処理をとめる
	 */
	extern int WaitTimer(int WaitTime);

	version (DX_NON_INPUT) {
	} else {
		/**
		 * キーの入力待ちを行う
		 */
		extern int WaitKey();
	}

	// カウンタ及び時刻取得系関数

	/**
	 * ミリ秒単位の精度を持つカウンタの現在の値を得る
	 */
	extern int GetNowCount(int UseRDTSCFlag = dxlib_d.DxDataType.FALSE);

	/**
	 * GetNowCountの高精度バージョン( μ秒単位の精度を持つカウンタの現在の値を得る )
	 */
	extern dxlib_d.DxDataType.LONGLONG GetNowHiPerformanceCount(int UseRDTSCFlag = dxlib_d.DxDataType.FALSE);

	/**
	 * OSが提供する高精度カウンタの現在の値を得る
	 */
	extern dxlib_d.DxDataType.ULONGLONG GetNowSysPerformanceCount();

	/**
	 * OSが提供する高精度カウンタの周波数( 1秒辺りのカウント数 )を得る
	 */
	extern dxlib_d.DxDataType.ULONGLONG GetSysPerformanceFrequency();

	/**
	 * OSが提供する高精度カウンタの値を秒の値に変換する
	 */
	extern dxlib_d.DxDataType.ULONGLONG ConvSysPerformanceCountToSeconds(dxlib_d.DxDataType.ULONGLONG Count);

	/**
	 * OSが提供する高精度カウンタの値をミリ秒の値に変換する
	 */
	extern dxlib_d.DxDataType.ULONGLONG ConvSysPerformanceCountToMilliSeconds(dxlib_d.DxDataType.ULONGLONG Count);

	/**
	 * OSが提供する高精度カウンタの値をマイクロ秒の値に変換する
	 */
	extern dxlib_d.DxDataType.ULONGLONG ConvSysPerformanceCountToMicroSeconds(dxlib_d.DxDataType.ULONGLONG Count);

	/**
	 * OSが提供する高精度カウンタの値をナノ秒の値に変換する
	 */
	extern dxlib_d.DxDataType.ULONGLONG ConvSysPerformanceCountToNanoSeconds(dxlib_d.DxDataType.ULONGLONG Count);

	/**
	 * 秒の値をOSが提供する高精度カウンタの値に変換する
	 */
	extern dxlib_d.DxDataType.ULONGLONG ConvSecondsToSysPerformanceCount(dxlib_d.DxDataType.ULONGLONG Seconds);

	/**
	 * ミリ秒の値をOSが提供する高精度カウンタの値に変換する
	 */
	extern dxlib_d.DxDataType.ULONGLONG ConvMilliSecondsToSysPerformanceCount(dxlib_d.DxDataType.ULONGLONG MilliSeconds);

	/**
	 * マイクロ秒の値をOSが提供する高精度カウンタの値に変換する
	 */
	extern dxlib_d.DxDataType.ULONGLONG ConvMicroSecondsToSysPerformanceCount(dxlib_d.DxDataType.ULONGLONG MicroSeconds);

	/**
	 * ナノ秒の値をOSが提供する高精度カウンタの値に変換する
	 */
	extern dxlib_d.DxDataType.ULONGLONG ConvNanoSecondsToSysPerformanceCount(dxlib_d.DxDataType.ULONGLONG NanoSeconds);

	/**
	 * 現在時刻を取得する
	 */
	extern int GetDateTime(.DATEDATA* DateBuf);

	// 乱数取得

	/**
	 * 乱数を取得する
	 *
	 * Params:
	 *      RandMax = 返って来る値の最大値
	 */
	extern int GetRand(int RandMax);

	/**
	 * 乱数の初期値を設定する
	 */
	extern int SRand(int Seed);

	// バッテリー関連

	/**
	 * 電池の残量を % で取得する
	 *
	 * Returns: 100:フル充電状態  0:充電残量無し
	 */
	extern int GetBatteryLifePercent();

	// クリップボード関係

	/**
	 * クリップボードに格納されているテキストデータを読み出す
	 *
	 * Params:
	 *      DestBuffer = 文字列を格納するバッファの先頭アドレス
	 *
	 * Returns: -1:クリップボードにテキストデータが無い  -1以外:クリップボードに格納されている文字列データのサイズ( 単位:byte )
	 */
	extern int GetClipboardText(dxlib_d.DxDataType.TCHAR* DestBuffer);

	/**
	 * クリップボードにテキストデータを格納する
	 */
	extern int SetClipboardText(const (dxlib_d.DxDataType.TCHAR)* Text);

	/**
	 * クリップボードにテキストデータを格納する
	 */
	extern int SetClipboardTextWithStrLen(const (dxlib_d.DxDataType.TCHAR)* Text, size_t TextLength);

	// iniファイル関係

	/**
	 * GetPrivateProfileString のDXライブラリ版
	 */
	extern int GetPrivateProfileStringDx(const (dxlib_d.DxDataType.TCHAR)* AppName, const (dxlib_d.DxDataType.TCHAR)* KeyName, const (dxlib_d.DxDataType.TCHAR)* Default, dxlib_d.DxDataType.TCHAR* ReturnedStringBuffer, size_t ReturnedStringBufferBytes, const (dxlib_d.DxDataType.TCHAR)* IniFilePath, int IniFileCharCodeFormat = -1 /* DX_CHARCODEFORMAT_SHIFTJIS 等、-1 でデフォルト */);

	/**
	 * GetPrivateProfileString のDXライブラリ版
	 */
	extern int GetPrivateProfileStringDxWithStrLen(const (dxlib_d.DxDataType.TCHAR)* AppName, size_t AppNameLength, const (dxlib_d.DxDataType.TCHAR)* KeyName, size_t KeyNameLength, const (dxlib_d.DxDataType.TCHAR)* Default, size_t DefaultLength, dxlib_d.DxDataType.TCHAR* ReturnedStringBuffer, size_t ReturnedStringBufferBytes, const (dxlib_d.DxDataType.TCHAR)* IniFilePath, size_t IniFilePathLength, int IniFileCharCodeFormat = -1 /* DX_CHARCODEFORMAT_SHIFTJIS 等、-1 でデフォルト */);

	/**
	 * GetPrivateProfileInt のDXライブラリ版
	 */
	extern int GetPrivateProfileIntDx(const (dxlib_d.DxDataType.TCHAR)* AppName, const (dxlib_d.DxDataType.TCHAR)* KeyName, int Default, const (dxlib_d.DxDataType.TCHAR)* IniFilePath, int IniFileCharCodeFormat = -1 /* DX_CHARCODEFORMAT_SHIFTJIS 等、-1 でデフォルト */);

	/**
	 * GetPrivateProfileInt のDXライブラリ版
	 */
	extern int GetPrivateProfileIntDxWithStrLen(const (dxlib_d.DxDataType.TCHAR)* AppName, size_t AppNameLength, const (dxlib_d.DxDataType.TCHAR)* KeyName, size_t KeyNameLength, int Default, const (dxlib_d.DxDataType.TCHAR)* IniFilePath, size_t IniFilePathLength, int IniFileCharCodeFormat = -1 /* DX_CHARCODEFORMAT_SHIFTJIS 等、-1 でデフォルト */);

	/**
	 * GetPrivateProfileStringDx のメモリから読み込む版
	 */
	extern int GetPrivateProfileStringDxForMem(const (dxlib_d.DxDataType.TCHAR)* AppName, const (dxlib_d.DxDataType.TCHAR)* KeyName, const (dxlib_d.DxDataType.TCHAR)* Default, dxlib_d.DxDataType.TCHAR* ReturnedStringBuffer, size_t ReturnedStringBufferBytes, const (void)* IniFileImage, size_t IniFileImageBytes, int IniFileCharCodeFormat = -1 /* DX_CHARCODEFORMAT_SHIFTJIS 等、-1 でデフォルト */);

	/**
	 * GetPrivateProfileStringDx のメモリから読み込む版
	 */
	extern int GetPrivateProfileStringDxForMemWithStrLen(const (dxlib_d.DxDataType.TCHAR)* AppName, size_t AppNameLength, const (dxlib_d.DxDataType.TCHAR)* KeyName, size_t KeyNameLength, const (dxlib_d.DxDataType.TCHAR)* Default, size_t DefaultLength, dxlib_d.DxDataType.TCHAR* ReturnedStringBuffer, size_t ReturnedStringBufferBytes, const (void)* IniFileImage, size_t IniFileImageBytes, int IniFileCharCodeFormat = -1 /* DX_CHARCODEFORMAT_SHIFTJIS 等、-1 でデフォルト */);

	/**
	 * GetPrivateProfileIntDx のメモリから読み込む版
	 */
	extern int GetPrivateProfileIntDxForMem(const (dxlib_d.DxDataType.TCHAR)* AppName, const (dxlib_d.DxDataType.TCHAR)* KeyName, int Default, const (void)* IniFileImage, size_t IniFileImageBytes, int IniFileCharCodeFormat = -1 /* DX_CHARCODEFORMAT_SHIFTJIS 等、-1 でデフォルト */);

	/**
	 * GetPrivateProfileIntDx のメモリから読み込む版
	 */
	extern int GetPrivateProfileIntDxForMemWithStrLen(const (dxlib_d.DxDataType.TCHAR)* AppName, size_t AppNameLength, const (dxlib_d.DxDataType.TCHAR)* KeyName, size_t KeyNameLength, int Default, const (void)* IniFileImage, size_t IniFileImageBytes, int IniFileCharCodeFormat = -1 /* DX_CHARCODEFORMAT_SHIFTJIS 等、-1 でデフォルト */);

	version (iOS) {
		version = ENABLE_MAIL;
	} else version (Android) {
		version = ENABLE_MAIL;
	}

	version (ENABLE_MAIL) {
		/**
		 * メールアプリを送信メール編集状態で起動する
		 *
		 * Params:
		 *      MailAddr = 宛先( null で無効 )、メールアドレスが複数ある場合はカンマ『,』で区切ってください
		 *      MailCCAddr = CC の宛先( null で無効 )、メールアドレスが複数ある場合はカンマ『,』で区切ってください
		 *      MailBCCAddr = BCC の宛先( null で無効 )、メールアドレスが複数ある場合はカンマ『,』で区切ってください
		 *      Subject = タイトル( null で無効 )、メールアドレスが複数ある場合はカンマ『,』で区切ってください
		 *      Text = 本文( null で無効 )、メールアドレスが複数ある場合はカンマ『,』で区切ってください
		 */
		extern int MailApp_Send(const (dxlib_d.DxDataType.TCHAR)* MailAddr = null, const (dxlib_d.DxDataType.TCHAR)* MailCCAddr = null, const (dxlib_d.DxDataType.TCHAR)* MailBCCAddr = null, const (dxlib_d.DxDataType.TCHAR)* Subject = null, const (dxlib_d.DxDataType.TCHAR)* Text = null);

		/**
		 * メールアプリを送信メール編集状態で起動する
		 *
		 * Params:
		 *      MailAddr = 宛先( null で無効 )、メールアドレスが複数ある場合はカンマ『,』で区切ってください
		 *      MailAddrLength = ?
		 *      MailCCAddr = CC の宛先( null で無効 )、メールアドレスが複数ある場合はカンマ『,』で区切ってください
		 *      MailCCAddrLength = ?
		 *      MailBCCAddr = BCC の宛先( null で無効 )、メールアドレスが複数ある場合はカンマ『,』で区切ってください
		 *      MailBCCAddrLength = ?
		 *      Subject = タイトル( null で無効 )、メールアドレスが複数ある場合はカンマ『,』で区切ってください
		 *      Text = 本文( null で無効 )、メールアドレスが複数ある場合はカンマ『,』で区切ってください
		 */
		extern int MailApp_SendWithStrLen(const (dxlib_d.DxDataType.TCHAR)* MailAddr = null, size_t MailAddrLength = 0, const (dxlib_d.DxDataType.TCHAR)* MailCCAddr = null, size_t MailCCAddrLength = 0, const (dxlib_d.DxDataType.TCHAR)* MailBCCAddr = null, size_t MailBCCAddrLength = 0, const (dxlib_d.DxDataType.TCHAR)* Subject = null, size_t SubjectLength = 0, const (dxlib_d.DxDataType.TCHAR)* Text = null, size_t TextLength = 0);
	}

	// DxLog.cpp関数プロトタイプ宣言

	version (DX_NON_LOG) {
	} else {
		// ログファイル関数

		/**
		 * ログファイル( Log.txt ) に文字列を出力する
		 */
		extern int LogFileAdd(const (dxlib_d.DxDataType.TCHAR)* String);

		/**
		 * ログファイル( Log.txt ) に文字列を出力する
		 */
		extern int LogFileAddWithStrLen(const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength);

		/**
		 * 書式付きで ログファイル( Log.txt ) に文字列を出力する( 書式は printf と同じ )
		 */
		extern int LogFileFmtAdd(const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * ログファイル( Log.txt ) に出力する文字列の前に付けるタブの数を1つ増やす
		 */
		extern int LogFileTabAdd();

		/**
		 * ログファイル( Log.txt ) に出力する文字列の前に付けるタブの数を1つ減らす
		 */
		extern int LogFileTabSub();

		/**
		 * LogFileAdd の旧名称関数
		 */
		extern int ErrorLogAdd(const (dxlib_d.DxDataType.TCHAR)* String);

		/**
		 * LogFileFmtAdd の旧名称関数
		 */
		extern int ErrorLogFmtAdd(const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * LogFileTabAdd の旧名称関数
		 */
		extern int ErrorLogTabAdd();

		/**
		 * LogFileTabSub の旧名称関数
		 */
		extern int ErrorLogTabSub();

		/**
		 * ログファイル( Log.txt ) に出力する文字列の前に起動してからの時間を付けるかどうかを設定する
		 *
		 * Params:
		 *      UseFlag = TRUE:付ける( デフォルト)  FALSE:付けない
		 */
		extern int SetUseTimeStampFlag(int UseFlag);

		/**
		 * LogFileFmtAdd と同じ機能の関数
		 */
		extern int AppLogAdd(const (dxlib_d.DxDataType.TCHAR)* String, ...);

		// ログ出力設定関数

		/**
		 * ログファイル( Log.txt ) を作成するかどうかを設定する、DxLib_Init の前でのみ使用可能
		 *
		 * Params:
		 *      Flag = TRUE:作成する( デフォルト )  FALSE:作成しない
		 */
		extern int SetOutApplicationLogValidFlag(int Flag);

		/**
		 * ログファイルの名前を設定する( Log.txt 以外にしたい場合に使用 )
		 */
		extern int SetApplicationLogFileName(const (dxlib_d.DxDataType.TCHAR)* FileName);

		/**
		 * ログファイルの名前を設定する( Log.txt 以外にしたい場合に使用 )
		 */
		extern int SetApplicationLogFileNameWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength);

		/**
		 * ログファイル( Log.txt ) を保存するディレクトリパスを設定する
		 */
		extern int SetApplicationLogSaveDirectory(const (dxlib_d.DxDataType.TCHAR)* DirectoryPath);

		/**
		 * ログファイル( Log.txt ) を保存するディレクトリパスを設定する
		 */
		extern int SetApplicationLogSaveDirectoryWithStrLen(const (dxlib_d.DxDataType.TCHAR)* DirectoryPath, size_t DirectoryPathLength);

		/**
		 * ログファイル名に日付をつけるかどうかをセットする
		 *
		 * Params:
		 *      Flag = TRUE:付ける  FALSE:付けない( デフォルト )
		 */
		extern int SetUseDateNameLogFile(int Flag);

		version (DX_NON_PRINTF_DX) {
		} else {
			// ログ出力機能関数

			/**
			 * printfDx の結果を画面に出力するかどうかを設定する、TRUE:出力を行う  FALSE:出力を行わない( printfDx を実行すると内部で SetLogDrawOutFlag(TRUE); が呼ばれます )
			 */
			extern int SetLogDrawOutFlag(int DrawFlag);

			/**
			 * printfDx の結果を画面に出力するかどうかの設定を取得する
			 *
			 * Returns: TRUE:出力を行う  FALSE:出力を行わない
			 */
			extern int GetLogDrawFlag();

			/**
			 * printfDx の結果を画面に出力する際に使用するフォントのサイズを設定する
			 */
			extern int SetLogFontSize(int Size);

			/**
			 * printfDx の結果を画面に出力する際に使用するフォントのハンドルを変更する
			 */
			extern int SetLogFontHandle(int FontHandle);

			/**
			 * printfDx の結果を画面に出力する際の描画する領域を設定する
			 */
			extern int SetLogDrawArea(int x1, int y1, int x2, int y2);

			// 簡易画面出力関数

			/**
			 * printf と同じ引数で画面に文字列を表示するための関数
			 */
			extern int printfDx(const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

			/**
			 * puts と同じ引数で画面に文字列を表示するための関数
			 */
			extern int putsDx(const (dxlib_d.DxDataType.TCHAR)* String, int NewLine = dxlib_d.DxDataType.TRUE);

			/**
			 * puts と同じ引数で画面に文字列を表示するための関数
			 */
			extern int putsDxWithStrLen(const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, int NewLine = dxlib_d.DxDataType.TRUE);

			/**
			 * printfDx の結果をリセットするための関数
			 */
			extern int clsDx();
		}
	}

	version (DX_NON_ASYNCLOAD) {
	} else {
		// DxASyncLoad.cpp関数プロトタイプ宣言

		// 非同期読み込み関係

		/**
		 * 読み込み処理系の関数で非同期読み込みを行うかどうかを設定する( 非同期読み込みに対応している関数のみ有効 )
		 *
		 * Params:
		 *      Flag = TRUE:非同期読み込みを行う  FALSE:非同期読み込みを行わない( デフォルト )
		 */
		extern int SetUseASyncLoadFlag(int Flag);

		/**
		 * 読み込み処理系の関数で非同期読み込みを行うかどうかを取得する( 非同期読み込みに対応している関数のみ有効 )
		 *
		 * Returns: TRUE:非同期読み込みを行う  FALSE:非同期読み込みを行わない( デフォルト )
		 */
		extern int GetUseASyncLoadFlag();

		/**
		 * ハンドルの非同期読み込みが完了しているかどうかを取得する
		 *
		 * Returns: TRUE:まだ完了していない  FALSE:完了している  -1:エラー
		 */
		extern int CheckHandleASyncLoad(int Handle);

		/**
		 * ハンドルの非同期読み込み処理の戻り値を取得する( 非同期読み込み中の場合は1つ前の非同期読み込み処理の戻り値が返ってきます )
		 */
		extern int GetHandleASyncLoadResult(int Handle);

		/**
		 * ハンドルの非同期読み込み処理が完了したらハンドルを削除するフラグを立てる
		 */
		extern int SetASyncLoadFinishDeleteFlag(int Handle);

		/**
		 * 非同期読み込み中の処理の数を取得する
		 */
		extern int GetASyncLoadNum();

		/**
		 * 非同期読み込み処理を行うスレッドの数を設定する( ThreadNum に指定できる数は 1 〜 32 )
		 */
		extern int SetASyncLoadThreadNum(int ThreadNum);
	}

	// DxHandle.cpp関数プロトタイプ宣言

	/**
	 * ハンドルが削除されたときに-1が設定される変数を登録する
	 */
	extern int SetDeleteHandleFlag(int Handle, int* DeleteFlag);

	// マウス関係関数

	/**
	 * マウスポインタの表示状態を設定する( DispFlag:マウスポインタを表示するかどうか
	 *
	 * Params:
	 *      DispFlag = TRUE:表示する  FALSE:表示しない
	 */
	extern int SetMouseDispFlag(int DispFlag);

	version (DX_NON_INPUT) {
	} else {
		/**
		 * マウスポインタの位置を取得する
		 */
		extern int GetMousePoint(int* XBuf, int* YBuf);

		/**
		 * マウスポインタの位置を設定する
		 */
		extern int SetMousePoint(int PointX, int PointY);

		/**
		 * マウスのボタンの押下状態を取得する
		 */
		extern int GetMouseInput();

		/**
		 * 垂直マウスホイールの回転量を取得する
		 */
		extern int GetMouseWheelRotVol(int CounterReset = dxlib_d.DxDataType.TRUE);

		/**
		 * 水平マウスホイールの回転量を取得する
		 */
		extern int GetMouseHWheelRotVol(int CounterReset = dxlib_d.DxDataType.TRUE);

		/**
		 * 垂直マウスホイールの回転量を取得する( 戻り値が float 型 )
		 */
		extern float GetMouseWheelRotVolF(int CounterReset = dxlib_d.DxDataType.TRUE);

		/**
		 * 水平マウスホイールの回転量を取得する( 戻り値が float 型 )
		 */
		extern float GetMouseHWheelRotVolF(int CounterReset = dxlib_d.DxDataType.TRUE);

		/**
		 * マウスのボタンを押した情報を1つ取得する
		 *
		 * Params:
		 *      Button = 押されたボタン( MOUSE_INPUT_LEFT 等 )を格納する変数のアドレス
		 *      ClickX = 押された時のX座標を格納する変数のアドレス
		 *      ClickY = 押された時のY座標を格納する変数のアドレス
		 *      LogDelete = 取得した押下情報1つ分をログから削除するかどうか( TRUE:削除する  FALSE:削除しない、つまり次にこの関数が呼ばれたときに同じ値を取得することになる )
		 *
		 * Returns: 0:押された情報取得できた -1:押された情報が無かった、つまり前回の呼び出し( または起動時から最初の呼び出し )の間に一度もマウスのボタンが押されなかった
		 */
		extern int GetMouseInputLog(int* Button, int* ClickX, int* ClickY, int LogDelete = dxlib_d.DxDataType.TRUE);

		/**
		 * マウスのボタンを押したり離したりした情報を1つ取得する
		 *
		 * Params:
		 *      Button = 押されたり離されたりしたボタン( MOUSE_INPUT_LEFT 等 )を格納する変数のアドレス
		 *      ClickX = 押されたり離されたりした時のX座標を格納する変数のアドレス
		 *      ClickY = 押されたり離されたりした時のY座標を格納する変数のアドレス
		 *      LogType = 押されたのか( MOUSE_INPUT_LOG_DOWN )離されたのか( MOUSE_INPUT_LOG_UP )、等の情報を格納する変数のアドレス
		 *      LogDelete = 取得した押されたり離されたりした情報1つ分をログから削除するかどうか( TRUE:削除する  FALSE:削除しない、つまり次にこの関数が呼ばれたときに同じ値を取得することになる )
		 *
		 * Returns: 0:押されたり離されたりした情報取得できた -1:押されたり離されたりした情報が無かった、つまり前回の呼び出し( または起動時から最初の呼び出し )の間に一度もマウスのボタンが押されたり離されたりしなかった
		 */
		extern int GetMouseInputLog2(int* Button, int* ClickX, int* ClickY, int* LogType, int LogDelete = dxlib_d.DxDataType.TRUE);
	}

	// タッチパネル入力関係関数
	version (DX_NON_INPUT) {
	} else {
		/**
		 * タッチされている数を取得する
		 */
		extern int GetTouchInputNum();

		/**
		 * タッチの情報を取得する
		 */
		extern int GetTouchInput(int InputNo, int* PositionX, int* PositionY, int* ID = null, int* Device = null);

		/**
		 * ストックされているタッチ情報の数を取得する
		 */
		extern int GetTouchInputLogNum();

		/**
		 * ストックされているタッチ情報をクリアする
		 */
		extern int ClearTouchInputLog();

		/**
		 * ストックされているタッチ情報から一番古い情報をひとつ取得する
		 */
		extern .TOUCHINPUTDATA GetTouchInputLogOne(int PeekFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * ストックされているタッチ情報から古い順に指定数バッファに取得する
		 *
		 * Returns: -1:エラー  0以上:取得した情報の数
		 */
		extern int GetTouchInputLog(.TOUCHINPUTDATA* TouchData, int GetNum, int PeekFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * ストックされているタッチされ始めた情報の数を取得する
		 */
		extern int GetTouchInputDownLogNum();

		/**
		 * ストックされているタッチされ始めた情報をクリアする
		 */
		extern int ClearTouchInputDownLog();

		/**
		 * ストックされているタッチされ始めた情報から一番古い情報をひとつ取得する
		 */
		extern .TOUCHINPUTPOINT GetTouchInputDownLogOne(int PeekFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * ストックされているタッチされ始めた情報から古い順に指定数バッファに取得する
		 *
		 * Returns: -1:エラー  0以上:取得した情報の数
		 */
		extern int GetTouchInputDownLog(.TOUCHINPUTPOINT* PointData, int GetNum, int PeekFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * ストックされているタッチが離された情報の数を取得する
		 */
		extern int GetTouchInputUpLogNum();

		/**
		 * ストックされているタッチが離された情報をクリアする
		 */
		extern int ClearTouchInputUpLog();

		/**
		 * ストックされているタッチが離された情報から一番古い情報をひとつ取得する
		 */
		extern .TOUCHINPUTPOINT GetTouchInputUpLogOne(int PeekFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * ストックされているタッチが離された情報から古い順に指定数バッファに取得する
		 *
		 * Returns: -1:エラー  0以上:取得した情報の数
		 */
		extern int GetTouchInputUpLog(.TOUCHINPUTPOINT* PointData, int GetNum, int PeekFlag = dxlib_d.DxDataType.FALSE);
	}

	// DxMemory.cpp関数プロトタイプ宣言

	// メモリ確保系関数

	/**
	 * 指定のサイズのメモリを確保する
	 *
	 * Params:
	 *      AllocSize = 確保するメモリのサイズ( 単位:byte )
	 *      File = DxAllocを呼んだソースファイル名( デバッグ用 )
	 *      Line = DxAllocを呼んだソースファイル中の行番号( デバッグ用 )
	 *
	 * Returns: null:メモリの確保失敗   NULL以外:確保したメモリ領域の先頭アドレス
	 */
	extern void* DxAlloc(size_t AllocSize, const (char)* File = null, int Line = -1);

	/**
	 * 指定のサイズのメモリを確保する( アライン指定版 )
	 *
	 * Params:
	 *      AllocSize = 確保するメモリのサイズ( 単位:byte )
	 *      Alignment = 確保するメモリ領域のアドレス値の倍数
	 *      File = DxAllocを呼んだソースファイル名( デバッグ用 )
	 *      Line = DxAllocを呼んだソースファイル中の行番号( デバッグ用 )
	 *
	 * Returns: null:メモリの確保失敗   NULL以外:確保したメモリ領域の先頭アドレス
	 */
	extern void* DxAllocAligned(size_t AllocSize, size_t Alignment, const (char)* File = null, int Line = -1);

	/**
	 * 指定のサイズのメモリを確保して、0で埋める、初期化後に0で埋める以外は DxAlloc と動作は同じ
	 */
	extern void* DxCalloc(size_t AllocSize, const (char)* File = null, int Line = -1);

	/**
	 * 指定のサイズのメモリを確保して、0で埋める、初期化後に0で埋める以外は DxAllocAligned と動作は同じ
	 */
	extern void* DxCallocAligned(size_t AllocSize, size_t Alignment, const (char)* File = null, int Line = -1);

	/**
	 * メモリの再確保を行う( FileとLine の説明は DxAlloc の注釈の通り )
	 *
	 * Params:
	 *      Memory = 再確保を行うメモリ領域の先頭アドレス( DxAlloc の戻り値 )
	 *      AllocSize = 新しい確保サイズ
	 *      File = ?
	 *      Line = ?
	 *
	 * Returns: null:メモリの再確保失敗 NULL以外:再確保した新しいメモリ領域の先頭アドレス
	 */
	extern void* DxRealloc(void* Memory, size_t AllocSize, const (char)* File = null, int Line = -1);

	/**
	 * メモリの再確保を行う( アライン指定版 )( FileとLine の説明は DxAlloc の注釈の通り )
	 *
	 * Params:
	 *      Memory = 再確保を行うメモリ領域の先頭アドレス( DxAlloc の戻り値 )
	 *      AllocSize = 新しい確保サイズ
	 *      Alignment = 新しく確保するメモリ領域のアドレス値の倍数
	 *      File = ?
	 *      Line = ?
	 *
	 * Returns: null:メモリの再確保失敗 NULL以外:再確保した新しいメモリ領域の先頭アドレス
	 */
	extern void* DxReallocAligned(void* Memory, size_t AllocSize, size_t Alignment, const (char)* File = null, int Line = -1);

	/**
	 * メモリを解放する
	 *
	 * Params:
	 *      Memory = 解放するメモリ領域の先頭アドレス( DxAlloc の戻り値 )
	 */
	extern void DxFree(void* Memory);

	/**
	 * 列挙対象にするメモリの確保容量をセットする
	 */
	extern size_t DxSetAllocSizeTrap(size_t Size);

	/**
	 * DXライブラリ内でメモリ確保が行われる時に情報を出力するかどうかをセットする
	 */
	extern int DxSetAllocPrintFlag(int Flag);

	/**
	 * DxAlloc や DxCalloc で確保しているメモリサイズを取得する
	 */
	extern size_t DxGetAllocSize();

	/**
	 * DxAlloc や DxCalloc で確保しているメモリの数を取得する
	 */
	extern int DxGetAllocNum();

	/**
	 * DxAlloc や DxCalloc で確保しているメモリを列挙する
	 */
	extern void DxDumpAlloc();

	/**
	 * DxAlloc や DxCalloc で確保しているメモリの状況を描画する
	 */
	extern void DxDrawAlloc(int x, int y, int Width, int Height);

	/**
	 * 確保したメモリ情報が破壊されていないか調べる
	 *
	 * Returns: -1:破壊あり  0:なし
	 */
	extern int DxErrorCheckAlloc();

	/**
	 * メモリが確保、解放が行われる度に確保しているメモリの容量を出力するかどうかのフラグをセットする
	 */
	extern int DxSetAllocSizeOutFlag(int Flag);

	/**
	 * メモリの確保、解放が行われる度に確保しているメモリ確保情報が破損していないか調べるかどうかのフラグをセットする
	 */
	extern int DxSetAllocMemoryErrorCheckFlag(int Flag);

	// DxBaseFunc.cpp 関数プロトタイプ宣言

	// 文字コード関係

	/**
	 * 文字列の先頭の文字のバイト数を取得する
	 *
	 * Params:
	 *      CharCodeFormat = DX_CHARCODEFORMAT_SHIFTJIS 等
	 *      String = ?
	 */
	extern int GetCharBytes(int CharCodeFormat, const (void)* String);

	/**
	 * 文字列の文字コード形式を別の文字コード形式に変換する
	 *
	 * Params:
	 *      SrcCharCodeFormat = DX_CHARCODEFORMAT_SHIFTJIS 等
	 *      SrcString = ?
	 *      DestCharCodeFormat = DX_CHARCODEFORMAT_SHIFTJIS 等
	 *      DestStringBuffer = ?
	 */
	extern int ConvertStringCharCodeFormat(int SrcCharCodeFormat, const (void)* SrcString, int DestCharCodeFormat, void* DestStringBuffer);

	/**
	 * 文字列の引数の文字コード形式を設定する( 文字列描画系関数とその他一部関数を除く )( UNICODE版では無効 )
	 *
	 * Params:
	 *      CharCodeFormat = DX_CHARCODEFORMAT_SHIFTJIS 等
	 */
	extern int SetUseCharCodeFormat(int CharCodeFormat);

	/**
	 * 文字列の引数の文字コード形式を取得する( UNICODE版では無効 )
	 *
	 * Returns: 文字コード形式( DX_CHARCODEFORMAT_SHIFTJIS 等 )
	 */
	extern int GetUseCharCodeFormat();

	/**
	 * wchar_t型の文字コード形式を取得する
	 *
	 * Returns: DX_CHARCODEFORMAT_UTF16LE など
	 */
	extern int Get_wchar_t_CharCodeFormat();

	// 文字列関係

	/**
	 * strcpy と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern void strcpyDx(dxlib_d.DxDataType.TCHAR* Dest, const (dxlib_d.DxDataType.TCHAR)* Src);

	/**
	 * strcpy_s と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern void strcpy_sDx(dxlib_d.DxDataType.TCHAR* Dest, size_t DestBytes, const (dxlib_d.DxDataType.TCHAR)* Src);

	/**
	 * 位置指定付き strcpy、Pos はコピー開始位置 ( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern void strpcpyDx(dxlib_d.DxDataType.TCHAR* Dest, const (dxlib_d.DxDataType.TCHAR)* Src, int Pos);

	/**
	 * 位置指定付き strcpy_s、Pos はコピー開始位置 ( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern void strpcpy_sDx(dxlib_d.DxDataType.TCHAR* Dest, size_t DestBytes, const (dxlib_d.DxDataType.TCHAR)* Src, int Pos);

	/**
	 * 位置指定付き strcpy、Pos はコピー開始位置( 全角文字も 1 扱い ) ( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern void strpcpy2Dx(dxlib_d.DxDataType.TCHAR* Dest, const (dxlib_d.DxDataType.TCHAR)* Src, int Pos);

	/**
	 * 位置指定付き strcpy_s、Pos はコピー開始位置( 全角文字も 1 扱い ) ( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern void strpcpy2_sDx(dxlib_d.DxDataType.TCHAR* Dest, size_t DestBytes, const (dxlib_d.DxDataType.TCHAR)* Src, int Pos);

	/**
	 * strncpy と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern void strncpyDx(dxlib_d.DxDataType.TCHAR* Dest, const (dxlib_d.DxDataType.TCHAR)* Src, int Num);

	/**
	 * strncpy_s と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern void strncpy_sDx(dxlib_d.DxDataType.TCHAR* Dest, size_t DestBytes, const (dxlib_d.DxDataType.TCHAR)* Src, int Num);

	/**
	 * strncpy の Num が文字数( 全角文字も 1 扱い )になったもの、終端に必ずヌル文字が代入される( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern void strncpy2Dx(dxlib_d.DxDataType.TCHAR* Dest, const (dxlib_d.DxDataType.TCHAR)* Src, int Num);

	/**
	 * strncpy_s の Num が文字数( 全角文字も 1 扱い )になったもの、終端に必ずヌル文字が代入される( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern void strncpy2_sDx(dxlib_d.DxDataType.TCHAR* Dest, size_t DestBytes, const (dxlib_d.DxDataType.TCHAR)* Src, int Num);

	/**
	 * strncpy の文字列の終端からの文字数指定版( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern void strrncpyDx(dxlib_d.DxDataType.TCHAR* Dest, const (dxlib_d.DxDataType.TCHAR)* Src, int Num);

	/**
	 * strncpy_s の文字列の終端からの文字数指定版( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern void strrncpy_sDx(dxlib_d.DxDataType.TCHAR* Dest, size_t DestBytes, const (dxlib_d.DxDataType.TCHAR)* Src, int Num);

	/**
	 * strncpy の文字列の終端からの文字数( 全角文字も 1 扱い )指定版、終端に必ずヌル文字が代入される( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern void strrncpy2Dx(dxlib_d.DxDataType.TCHAR* Dest, const (dxlib_d.DxDataType.TCHAR)* Src, int Num);

	/**
	 * strncpy_s の文字列の終端からの文字数( 全角文字も 1 扱い )指定版、終端に必ずヌル文字が代入される( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern void strrncpy2_sDx(dxlib_d.DxDataType.TCHAR* Dest, size_t DestBytes, const (dxlib_d.DxDataType.TCHAR)* Src, int Num);

	/**
	 * strncpy のコピー開始位置指定版、Pos はコピー開始位置、Num は文字数( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern void strpncpyDx(dxlib_d.DxDataType.TCHAR* Dest, const (dxlib_d.DxDataType.TCHAR)* Src, int Pos, int Num);

	/**
	 * strncpy_s のコピー開始位置指定版、Pos はコピー開始位置、Num は文字数( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern void strpncpy_sDx(dxlib_d.DxDataType.TCHAR* Dest, size_t DestBytes, const (dxlib_d.DxDataType.TCHAR)* Src, int Pos, int Num);

	/**
	 * strncpy のコピー開始位置指定版、Pos はコピー開始位置( 全角文字も 1 扱い )、Num は文字数( 全角文字も 1 扱い )、終端に必ずヌル文字が代入される( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern void strpncpy2Dx(dxlib_d.DxDataType.TCHAR* Dest, const (dxlib_d.DxDataType.TCHAR)* Src, int Pos, int Num);

	/**
	 * strncpy_s のコピー開始位置指定版、Pos はコピー開始位置( 全角文字も 1 扱い )、Num は文字数( 全角文字も 1 扱い )、終端に必ずヌル文字が代入される( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern void strpncpy2_sDx(dxlib_d.DxDataType.TCHAR* Dest, size_t DestBytes, const (dxlib_d.DxDataType.TCHAR)* Src, int Pos, int Num);

	/**
	 * strcat と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern void strcatDx(dxlib_d.DxDataType.TCHAR* Dest, const (dxlib_d.DxDataType.TCHAR)* Src);

	/**
	 * strcat_s と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern void strcat_sDx(dxlib_d.DxDataType.TCHAR* Dest, size_t DestBytes, const (dxlib_d.DxDataType.TCHAR)* Src);

	/**
	 * strlen と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern size_t strlenDx(const (dxlib_d.DxDataType.TCHAR)* Str);

	/**
	 * strlen の戻り値が文字数( 全角文字も 1 扱い )になったもの( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern size_t strlen2Dx(const (dxlib_d.DxDataType.TCHAR)* Str);

	/**
	 * strcmp と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern int strcmpDx(const (dxlib_d.DxDataType.TCHAR)* Str1, const (dxlib_d.DxDataType.TCHAR)* Str2);

	/**
	 * stricmp と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern int stricmpDx(const (dxlib_d.DxDataType.TCHAR)* Str1, const (dxlib_d.DxDataType.TCHAR)* Str2);

	/**
	 * strncmp と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern int strncmpDx(const (dxlib_d.DxDataType.TCHAR)* Str1, const (dxlib_d.DxDataType.TCHAR)* Str2, int Num);

	/**
	 * strncmp の Num が文字数( 全角文字も 1 扱い )になったもの( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern int strncmp2Dx(const (dxlib_d.DxDataType.TCHAR)* Str1, const (dxlib_d.DxDataType.TCHAR)* Str2, int Num);

	/**
	 * strncmp の比較開始位置指定版、Pos が Str1 の比較開始位置、Num が文字数( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern int strpncmpDx(const (dxlib_d.DxDataType.TCHAR)* Str1, const (dxlib_d.DxDataType.TCHAR)* Str2, int Pos, int Num);

	/**
	 * strncmp の比較開始位置指定版、Pos が Str1 の比較開始位置( 全角文字も 1 扱い )、Num が文字数( 全角文字も 1 扱い )( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern int strpncmp2Dx(const (dxlib_d.DxDataType.TCHAR)* Str1, const (dxlib_d.DxDataType.TCHAR)* Str2, int Pos, int Num);

	/**
	 * 文字列の指定の位置の文字コードを取得する、Pos は取得する位置、CharNums は文字数を代入する変数のアドレス
	 *
	 * Returns: 文字コード( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern dxlib_d.DxDataType.DWORD strgetchrDx(const (dxlib_d.DxDataType.TCHAR)* Str, int Pos, int* CharNums = null);

	/**
	 * 文字列の指定の位置の文字コードを取得する、Pos は取得する位置( 全角文字も 1 扱い )、CharNums は文字数を代入する変数のアドレス、
	 *
	 * Returns: 文字コード( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern dxlib_d.DxDataType.DWORD strgetchr2Dx(const (dxlib_d.DxDataType.TCHAR)* Str, int Pos, int* CharNums = null);

	/**
	 * 文字列の指定の位置に文字コードを書き込む、Pos は書き込む位置、CharCode は文字コード
	 *
	 * Returns: 書き込んだ文字数( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern int strputchrDx(dxlib_d.DxDataType.TCHAR* Str, int Pos, dxlib_d.DxDataType.DWORD CharCode);

	/**
	 * 文字列の指定の位置に文字コードを書き込む、Pos は書き込む位置( 全角文字も 1 扱い )、CharCode は文字コード
	 *
	 * Returns: 書き込んだ文字数( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern int strputchr2Dx(dxlib_d.DxDataType.TCHAR* Str, int Pos, dxlib_d.DxDataType.DWORD CharCode);

	/**
	 * 文字列の指定の位置のアドレスを取得する、Pos は取得する位置 ( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern const (dxlib_d.DxDataType.TCHAR)* strposDx(const (dxlib_d.DxDataType.TCHAR)* Str, int Pos);

	/**
	 * 文字列の指定の位置のアドレスを取得する、Pos は取得する位置( 全角文字も 1 扱い ) ( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern const (dxlib_d.DxDataType.TCHAR)* strpos2Dx(const (dxlib_d.DxDataType.TCHAR)* Str, int Pos);

	/**
	 * strstr と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern const (dxlib_d.DxDataType.TCHAR)* strstrDx(const (dxlib_d.DxDataType.TCHAR)* Str1, const (dxlib_d.DxDataType.TCHAR)* Str2);

	/**
	 * strstr の戻り値が文字列先頭からの文字数( 全角文字も 1 扱い ) になったもの( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern int strstr2Dx(const (dxlib_d.DxDataType.TCHAR)* Str1, const (dxlib_d.DxDataType.TCHAR)* Str2);

	/**
	 * strrstr と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern const (dxlib_d.DxDataType.TCHAR)* strrstrDx(const (dxlib_d.DxDataType.TCHAR)* Str1, const (dxlib_d.DxDataType.TCHAR)* Str2);

	/**
	 * strrstr の戻り値が文字列先頭からの文字数( 全角文字も 1 扱い ) になったもの( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern int strrstr2Dx(const (dxlib_d.DxDataType.TCHAR)* Str1, const (dxlib_d.DxDataType.TCHAR)* Str2);

	/**
	 * strchr と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern const (dxlib_d.DxDataType.TCHAR)* strchrDx(const (dxlib_d.DxDataType.TCHAR)* Str, dxlib_d.DxDataType.DWORD CharCode);

	/**
	 * strchr の戻り値が文字列先頭からの文字数( 全角文字も 1 扱い ) になったもの( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern int strchr2Dx(const (dxlib_d.DxDataType.TCHAR)* Str, dxlib_d.DxDataType.DWORD CharCode);

	/**
	 * strrchr と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern const (dxlib_d.DxDataType.TCHAR)* strrchrDx(const (dxlib_d.DxDataType.TCHAR)* Str, dxlib_d.DxDataType.DWORD CharCode);

	/**
	 * strrchr の戻り値が文字列先頭からの文字数( 全角文字も 1 扱い ) になったもの( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern int strrchr2Dx(const (dxlib_d.DxDataType.TCHAR)* Str, dxlib_d.DxDataType.DWORD CharCode);

	/**
	 * strupr と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern dxlib_d.DxDataType.TCHAR* struprDx(dxlib_d.DxDataType.TCHAR* Str);

	/**
	 * vsprintf と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern int vsprintfDx(dxlib_d.DxDataType.TCHAR* Buffer, const (dxlib_d.DxDataType.TCHAR)* FormatString, core.stdc.stdarg.va_list Arg);

	/**
	 * vsnprintf と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern int vsnprintfDx(dxlib_d.DxDataType.TCHAR* Buffer, size_t BufferSize, const (dxlib_d.DxDataType.TCHAR)* FormatString, core.stdc.stdarg.va_list Arg);

	/**
	 * sprintf と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern int sprintfDx(dxlib_d.DxDataType.TCHAR* Buffer, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

	/**
	 * snprintf と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern int snprintfDx(dxlib_d.DxDataType.TCHAR* Buffer, size_t BufferSize, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

	/**
	 * itoa と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern dxlib_d.DxDataType.TCHAR* itoaDx(int Value, dxlib_d.DxDataType.TCHAR* Buffer, int Radix);

	/**
	 * itoa_s と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern dxlib_d.DxDataType.TCHAR* itoa_sDx(int Value, dxlib_d.DxDataType.TCHAR* Buffer, size_t BufferBytes, int Radix);

	/**
	 * atoi と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern int atoiDx(const (dxlib_d.DxDataType.TCHAR)* Str);

	/**
	 * atof と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern double atofDx(const (dxlib_d.DxDataType.TCHAR)* Str);

	/**
	 * vsscanf と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern int vsscanfDx(const (dxlib_d.DxDataType.TCHAR)* String, const (dxlib_d.DxDataType.TCHAR)* FormatString, core.stdc.stdarg.va_list Arg);

	/**
	 * sscanf と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
	 */
	extern int sscanfDx(const (dxlib_d.DxDataType.TCHAR)* String, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

	// DxNetwork.cpp関数プロトタイプ宣言

	version (DX_NON_NETWORK) {
	} else {
		// 通信関係

		/**
		 * 通信メッセージの処理をする関数
		 */
		extern int ProcessNetMessage(int RunReleaseProcess = dxlib_d.DxDataType.FALSE);

		/**
		 * DNSサーバーを使ってホスト名からIPアドレスを取得する( IPv4版 )
		 */
		extern int GetHostIPbyName(const (dxlib_d.DxDataType.TCHAR)* HostName, .IPDATA* IPDataBuf, int IPDataBufLength = 1, int* IPDataGetNum = null);

		/**
		 * DNSサーバーを使ってホスト名からIPアドレスを取得する( IPv4版 )
		 */
		extern int GetHostIPbyNameWithStrLen(const (dxlib_d.DxDataType.TCHAR)* HostName, size_t HostNameLength, .IPDATA* IPDataBuf, int IPDataBufLength = 1, int* IPDataGetNum = null);

		/**
		 * DNSサーバーを使ってホスト名からIPアドレスを取得する( IPv6版 )
		 */
		extern int GetHostIPbyName_IPv6(const (dxlib_d.DxDataType.TCHAR)* HostName, .IPDATA_IPv6* IPDataBuf, int IPDataBufLength = 1, int* IPDataGetNum = null);

		/**
		 * DNSサーバーを使ってホスト名からIPアドレスを取得する( IPv6版 )
		 */
		extern int GetHostIPbyName_IPv6WithStrLen(const (dxlib_d.DxDataType.TCHAR)* HostName, size_t HostNameLength, .IPDATA_IPv6* IPDataBuf, int IPDataBufLength = 1, int* IPDataGetNum = null);

		/**
		 * 他マシンに接続する( IPv4版 )
		 */
		extern int ConnectNetWork(.IPDATA IPData, int Port = -1);

		/**
		 * 他マシンに接続する( IPv6版 )
		 */
		extern int ConnectNetWork_IPv6(.IPDATA_IPv6 IPData, int Port = -1);

		/**
		 * 他マシンに接続する( IPv4版 )、非同期版
		 */
		extern int ConnectNetWork_ASync(.IPDATA IPData, int Port = -1);

		/**
		 * 他マシンに接続する( IPv6版 )、非同期版
		 */
		extern int ConnectNetWork_IPv6_ASync(.IPDATA_IPv6 IPData, int Port = -1);

		/**
		 * 接続を受けられる状態にする( IPv4版 )
		 */
		extern int PreparationListenNetWork(int Port = -1);

		/**
		 * 接続を受けられる状態にする( IPv6版 )
		 */
		extern int PreparationListenNetWork_IPv6(int Port = -1);

		/**
		 * 接続を受けつけ状態の解除
		 */
		extern int StopListenNetWork();

		/**
		 * 接続を終了する
		 */
		extern int CloseNetWork(int NetHandle);

		/**
		 * 接続状態を取得する
		 */
		extern int GetNetWorkAcceptState(int NetHandle);

		/**
		 * 受信データの量を得る
		 */
		extern int GetNetWorkDataLength(int NetHandle);

		/**
		 * 未送信のデータの量を得る
		 */
		extern int GetNetWorkSendDataLength(int NetHandle);

		/**
		 * 新たに接続した通信回線を得る
		 */
		extern int GetNewAcceptNetWork();

		/**
		 * 接続を切断された通信回線を得る
		 */
		extern int GetLostNetWork();

		/**
		 * 接続先のIPを得る( IPv4版 )
		 */
		extern int GetNetWorkIP(int NetHandle, .IPDATA* IpBuf);

		/**
		 * 接続先のIPを得る( IPv6版 )
		 */
		extern int GetNetWorkIP_IPv6(int NetHandle, .IPDATA_IPv6* IpBuf);

		/**
		 * 自分のIPv4を得る
		 */
		extern int GetMyIPAddress(.IPDATA* IpBuf, int IpBufLength = 1, int* IpNum = null);

		/**
		 * 自分のIPv6を得る
		 */
		extern int GetMyIPAddress_IPv6(.IPDATA_IPv6* IpBuf, int IpBufLength = 1, int* IpNum = null);

		/**
		 * 接続のタイムアウトまでの時間を設定する
		 */
		extern int SetConnectTimeOutWait(int Time);

		/**
		 * DXライブラリの通信形態を使うかどうかをセットする
		 */
		extern int SetUseDXNetWorkProtocol(int Flag);

		/**
		 * DXライブラリの通信形態を使うかどうかを取得する
		 */
		extern int GetUseDXNetWorkProtocol();

		/**
		 * SetUseDXNetWorkProtocol の別名
		 */
		extern int SetUseDXProtocol(int Flag);

		/**
		 * GetUseDXNetWorkProtocol の別名
		 */
		extern int GetUseDXProtocol();

		/**
		 * 接続が切断された直後に接続ハンドルを解放するかどうかのフラグをセットする
		 */
		extern int SetNetWorkCloseAfterLostFlag(int Flag);

		/**
		 * 接続が切断された直後に接続ハンドルを解放するかどうかのフラグを取得する
		 */
		extern int GetNetWorkCloseAfterLostFlag();

		/**
		 * HTTP通信で使用するプロキシ設定を行う
		 */
		@disable
		extern int SetProxySetting(int UseFlag, const (char)* Address, int Port);

		/**
		 * HTTP通信で使用するプロキシ設定を取得する
		 */
		@disable
		extern int GetProxySetting(int* UseFlagBuffer, char* AddressBuffer, int* PortBuffer);

		/**
		 * IEのプロキシ設定を適応する
		 */
		@disable
		extern int SetIEProxySetting();

		/**
		 * 受信したデータを読み込む
		 */
		extern int NetWorkRecv(int NetHandle, void* Buffer, int Length);

		/**
		 * 受信したデータを読み込む、読み込んだデータはバッファから削除されない
		 */
		extern int NetWorkRecvToPeek(int NetHandle, void* Buffer, int Length);

		/**
		 * 受信したデータをクリアする
		 */
		extern int NetWorkRecvBufferClear(int NetHandle);

		/**
		 * データを送信する
		 */
		extern int NetWorkSend(int NetHandle, const (void)* Buffer, int Length);

		/**
		 * UDPを使用した通信を行うソケットハンドルを作成する( RecvPort を -1 にすると送信専用のソケットハンドルになります )
		 */
		extern int MakeUDPSocket(int RecvPort = -1);

		/**
		 * UDPを使用した通信を行うソケットハンドルを作成する( RecvPort を -1 にすると送信専用のソケットハンドルになります )( IPv6版 )
		 */
		extern int MakeUDPSocket_IPv6(int RecvPort = -1);

		/**
		 * UDPを使用した通信を行うソケットハンドルを削除する
		 */
		extern int DeleteUDPSocket(int NetUDPHandle);

		/**
		 * UDPを使用した通信で指定のIPにデータを送信する、Length は最大65507、SendPort を -1 にすると MakeUDPSocket に RecvPort で渡したポートが使用されます
		 *
		 * Returns: 0以上;送信できたデータサイズ  -1:エラー  -2:送信データが大きすぎる  -3:送信準備ができていない
		 */
		extern int NetWorkSendUDP(int NetUDPHandle, .IPDATA SendIP, int SendPort, const (void)* Buffer, int Length);

		/**
		 * UDPを使用した通信で指定のIPにデータを送信する、Length は最大65507、SendPort を -1 にすると MakeUDPSocket に RecvPort で渡したポートが使用されます( IPv6版 )
		 *
		 * Returns: 0以上;送信できたデータサイズ  -1:エラー  -2:送信データが大きすぎる  -3:送信準備ができていない
		 */
		extern int NetWorkSendUDP_IPv6(int NetUDPHandle, .IPDATA_IPv6 SendIP, int SendPort, const (void)* Buffer, int Length);

		/**
		 * UDPを使用した通信でデータを受信する、Peek に TRUE を渡すと受信に成功してもデータを受信キューから削除しません
		 *
		 * Returns: 0以上:受信したデータのサイズ  -1:エラー  -2:バッファのサイズが足りない  -3:受信データがない
		 */
		extern int NetWorkRecvUDP(int NetUDPHandle, .IPDATA* RecvIP, int* RecvPort, void* Buffer, int Length, int Peek);

		/**
		 * UDPを使用した通信でデータを受信する、Peek に TRUE を渡すと受信に成功してもデータを受信キューから削除しません( IPv6版 )
		 *
		 * Returns: 0以上:受信したデータのサイズ  -1:エラー  -2:バッファのサイズが足りない  -3:受信データがない
		 */
		extern int NetWorkRecvUDP_IPv6(int NetUDPHandle, .IPDATA_IPv6* RecvIP, int* RecvPort, void* Buffer, int Length, int Peek);

		/**
		 * UDPを使用した通信でデータが送信できる状態かどうかを調べる
		 *
		 * Returns: -1:エラー  TRUE:送信可能  FALSE:送信不可能
		 */
		@disable
		extern int CheckNetWorkSendUDP(int NetUDPHandle);

		/**
		 * UDPを使用した通信で新たな受信データが存在するかどうかを調べる
		 *
		 * Returns: -1:エラー  TRUE:受信データあり  FALSE:受信データなし
		 */
		extern int CheckNetWorkRecvUDP(int NetUDPHandle);

		//使用不可

		/**
		 * HTTP を使用してネットワーク上のファイルをダウンロードする
		 */
		@disable
		extern int HTTP_FileDownload(const (char)* FileURL, const (char)* SavePath = null, void** SaveBufferP = null, int* FileSize = null, char** ParamList = null);

		/**
		 * HTTP を使用してネットワーク上のファイルのサイズを得る
		 */
		@disable
		extern int HTTP_GetFileSize(const (char)* FileURL);

		/**
		 * HTTP を使用したネットワーク上のファイルをダウンロードする処理を開始する
		 */
		@disable
		extern int HTTP_StartFileDownload(const (char)* FileURL, const (char)* SavePath, void** SaveBufferP = null, char** ParamList = null);

		/**
		 * HTTP を使用したネットワーク上のファイルのサイズを得る処理を開始する
		 */
		@disable
		extern int HTTP_StartGetFileSize(const (char)* FileURL);

		/**
		 * HTTP の処理を終了し、ハンドルを解放する
		 */
		@disable
		extern int HTTP_Close(int HttpHandle);

		/**
		 * 全てのハンドルに対して HTTP_Close を行う
		 */
		@disable
		extern int HTTP_CloseAll();

		/**
		 * HTTP 処理の現在の状態を得る( NET_RES_COMPLETE 等 )
		 */
		@disable
		extern int HTTP_GetState(int HttpHandle);

		/**
		 * HTTP 処理でエラーが発生した場合、エラーの内容を得る( HTTP_ERR_NONE 等 )
		 */
		@disable
		extern int HTTP_GetError(int HttpHandle);

		/**
		 * HTTP 処理で対象となっているファイルのサイズを得る
		 *
		 * Returns: -1:エラー・若しくはまだファイルのサイズを取得していない  0以上:ファイルのサイズ
		 */
		@disable
		extern int HTTP_GetDownloadFileSize(int HttpHandle);

		/**
		 * HTTP 処理で既にダウンロードしたファイルのサイズを取得する
		 */
		@disable
		extern int HTTP_GetDownloadedFileSize(int HttpHandle);

		/**
		 * fgets のネットワークハンドル版( -1:取得できず 0:取得できた )
		 */
		@disable
		extern int fgetsForNetHandle(int NetHandle, char* strbuffer);

		/**
		 * URLを解析する
		 */
		@disable
		extern int URLAnalys(const (char)* URL, char* HostBuf = null, char* PathBuf = null, char* FileNameBuf = null, int* PortBuf = null);

		/**
		 * HTTP に渡せない記号が使われた文字列を渡せるような文字列に変換する
		 *
		 * Returns: -1:エラー  0以上:変換後の文字列のサイズ
		 */
		@disable
		extern int URLConvert(char* URL, int ParamConvert = dxlib_d.DxDataType.TRUE, int NonConvert = dxlib_d.DxDataType.FALSE);

		/**
		 * HTTP 用パラメータリストから1つのパラメータ文字列を作成する
		 *
		 * Returns: -1:エラー  0以上:パラメータの文字列の長さ
		 */
		@disable
		extern int URLParamAnalysis(char** ParamList, char** ParamStringP);
	}

	// DxInputString.cpp関数プロトタイプ宣言

	version (DX_NON_INPUTSTRING) {
	} else {
		// 文字コードバッファ操作関係

		/**
		 * 文字コードバッファに文字コードをストックする
		 */
		extern int StockInputChar(dxlib_d.DxDataType.TCHAR CharCode);

		/**
		 * 文字コードバッファをクリアする
		 */
		extern int ClearInputCharBuf();

		/**
		 * 文字コードバッファに溜まったデータから文字コードを1つ取得する
		 */
		extern dxlib_d.DxDataType.TCHAR GetInputChar(int DeleteFlag);

		/**
		 * 文字コードバッファに溜まったデータから文字コードを1つ取得する、バッファになにも文字コードがない場合は文字コードがバッファに1文字分溜まるまで待つ
		 */
		extern dxlib_d.DxDataType.TCHAR GetInputCharWait(int DeleteFlag);

		/**
		 * 文字コードバッファに溜まったデータから1文字分取得する
		 */
		extern int GetOneChar(dxlib_d.DxDataType.TCHAR* CharBuffer, int DeleteFlag);

		/**
		 * 文字コードバッファに溜まったデータから1文字分取得する、バッファに何も文字コードがない場合は文字コードがバッファに1文字分溜まるまで待つ
		 */
		extern int GetOneCharWait(dxlib_d.DxDataType.TCHAR* CharBuffer, int DeleteFlag);

		/**
		 * 指定の文字コードがアスキーコントロールコードか調べる
		 */
		extern int GetCtrlCodeCmp(dxlib_d.DxDataType.TCHAR Char);
	}

	version (DX_NON_KEYEX) {
	} else {
		/**
		 * 画面上に入力中の文字列を描画する
		 */
		extern int DrawIMEInputString(int x, int y, int SelectStringNum, int DrawCandidateList = dxlib_d.DxDataType.TRUE);

		/**
		 * IMEを使用するかどうかを設定する
		 */
		extern int SetUseIMEFlag(int UseFlag);

		/**
		 * IMEを使用するかどうかの設定を取得する
		 */
		extern int GetUseIMEFlag();

		/**
		 * IMEで入力できる最大文字数を MakeKeyInput の設定に合わせるかどうかをセットする
		 *
		 * Params:
		 *      Flag = TRUE:あわせる  FALSE:あわせない(デフォルト)
		 */
		extern int SetInputStringMaxLengthIMESync(int Flag);

		/**
		 * IMEで一度に入力できる最大文字数を設定する( 0:制限なし  1以上:指定の文字数で制限 )
		 *
		 * Params:
		 *      Length = ?
		 */
		extern int SetIMEInputStringMaxLength(int Length);
	}

	/**
	 * 全角文字、半角文字入り乱れる中から指定の文字数での半角文字数を得る
	 */
	extern int GetStringPoint(const (dxlib_d.DxDataType.TCHAR)* String, int Point);

	/**
	 * 全角文字、半角文字入り乱れる中から指定の文字数での半角文字数を得る
	 */
	extern int GetStringPointWithStrLen(const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, int Point);

	/**
	 * 全角文字、半角文字入り乱れる中から指定の半角文字数での文字数を得る
	 */
	extern int GetStringPoint2(const (dxlib_d.DxDataType.TCHAR)* String, int Point);

	/**
	 * 全角文字、半角文字入り乱れる中から指定の半角文字数での文字数を得る
	 */
	extern int GetStringPoint2WithStrLen(const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, int Point);

	/**
	 * 全角文字、半角文字入り乱れる中から文字数を取得する
	 */
	extern int GetStringLength(const (dxlib_d.DxDataType.TCHAR)* String);

	version (DX_NON_FONT) {
	} else {
		/**
		 * 描画可能領域に収まるように改行しながら文字列を描画
		 */
		extern int DrawObtainsString(int x, int y, int AddY, const (dxlib_d.DxDataType.TCHAR)* String, uint StrColor, uint StrEdgeColor = 0, int FontHandle = -1, uint SelectBackColor = 0xFFFFFFFF, uint SelectStrColor = 0, uint SelectStrEdgeColor = 0xFFFFFFFF, int SelectStart = -1, int SelectEnd = -1);

		/**
		 * 描画可能領域に収まるように改行しながら文字列を描画
		 */
		extern int DrawObtainsNString(int x, int y, int AddY, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, uint StrColor, uint StrEdgeColor = 0, int FontHandle = -1, uint SelectBackColor = 0xFFFFFFFF, uint SelectStrColor = 0, uint SelectStrEdgeColor = 0xFFFFFFFF, int SelectStart = -1, int SelectEnd = -1);

		/**
		 * 描画可能領域に収まるように改行しながら文字列を描画( クリップが文字単位 )
		 */
		extern int DrawObtainsString_CharClip(int x, int y, int AddY, const (dxlib_d.DxDataType.TCHAR)* String, uint StrColor, uint StrEdgeColor = 0, int FontHandle = -1, uint SelectBackColor = 0xFFFFFFFF, uint SelectStrColor = 0, uint SelectStrEdgeColor = 0xFFFFFFFF, int SelectStart = -1, int SelectEnd = -1);

		/**
		 * 描画可能領域に収まるように改行しながら文字列を描画( クリップが文字単位 )
		 */
		extern int DrawObtainsNString_CharClip(int x, int y, int AddY, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, uint StrColor, uint StrEdgeColor = 0, int FontHandle = -1, uint SelectBackColor = 0xFFFFFFFF, uint SelectStrColor = 0, uint SelectStrEdgeColor = 0xFFFFFFFF, int SelectStart = -1, int SelectEnd = -1);

		/**
		 * 描画可能領域に収まるように改行しながら文字列を描画した場合の文字列の末端の座標を取得する
		 */
		extern int GetObtainsStringCharPosition(int x, int y, int AddY, const (dxlib_d.DxDataType.TCHAR)* String, int StrLen, int* PosX, int* PosY, int FontHandle = -1);

		/**
		 * 描画可能領域に収まるように改行しながら文字列を描画した場合の文字列の末端の座標を取得する( クリップが文字単位 )
		 */
		extern int GetObtainsStringCharPosition_CharClip(int x, int y, int AddY, const (dxlib_d.DxDataType.TCHAR)* String, int StrLen, int* PosX, int* PosY, int FontHandle = -1);
	}

	/**
	 * 描画可能領域に収まるように補正を加えながら矩形を描画
	 */
	extern int DrawObtainsBox(int x1, int y1, int x2, int y2, int AddY, uint Color, int FillFlag);

	version (DX_NON_KEYEX) {
	} else {
		/**
		 * 文字列の入力取得
		 */
		extern int InputStringToCustom(int x, int y, size_t BufLength, dxlib_d.DxDataType.TCHAR* StrBuffer, int CancelValidFlag, int SingleCharOnlyFlag, int NumCharOnlyFlag, int DoubleCharOnlyFlag = dxlib_d.DxDataType.FALSE, int EnableNewLineFlag = dxlib_d.DxDataType.FALSE, int DisplayCandidateList = dxlib_d.DxDataType.TRUE);

		/**
		 * 文字列の入力取得
		 */
		extern int KeyInputString(int x, int y, size_t CharMaxLength, dxlib_d.DxDataType.TCHAR* StrBuffer, int CancelValidFlag);

		/**
		 * 半角文字列のみの入力取得
		 */
		extern int KeyInputSingleCharString(int x, int y, size_t CharMaxLength, dxlib_d.DxDataType.TCHAR* StrBuffer, int CancelValidFlag);

		/**
		 * 数値の入力取得
		 */
		extern int KeyInputNumber(int x, int y, int MaxNum, int MinNum, int CancelValidFlag);

		/**
		 * IMEの入力モード文字列を取得する
		 */
		extern int GetIMEInputModeStr(dxlib_d.DxDataType.TCHAR* GetBuffer);

		/**
		 * IMEで入力中の文字列の情報を取得する
		 */
		extern const (.IMEINPUTDATA)* GetIMEInputData();

		/**
		 * ( SetKeyInputStringColor2 の旧関数 )InputString関数使用時の文字の各色を変更する
		 */
		extern int SetKeyInputStringColor(dxlib_d.DxDataType.ULONGLONG NmlStr, dxlib_d.DxDataType.ULONGLONG NmlCur, dxlib_d.DxDataType.ULONGLONG IMEStrBack, dxlib_d.DxDataType.ULONGLONG IMECur, dxlib_d.DxDataType.ULONGLONG IMELine, dxlib_d.DxDataType.ULONGLONG IMESelectStr, dxlib_d.DxDataType.ULONGLONG IMEModeStr, dxlib_d.DxDataType.ULONGLONG NmlStrE = 0, dxlib_d.DxDataType.ULONGLONG IMESelectStrE = 0, dxlib_d.DxDataType.ULONGLONG IMEModeStrE = 0, dxlib_d.DxDataType.ULONGLONG IMESelectWinE = 0xFFFFFFFFFFFFFFFFUL, dxlib_d.DxDataType.ULONGLONG IMESelectWinF = 0xFFFFFFFFFFFFFFFFUL, dxlib_d.DxDataType.ULONGLONG SelectStrBackColor = 0xFFFFFFFFFFFFFFFFUL, dxlib_d.DxDataType.ULONGLONG SelectStrColor = 0xFFFFFFFFFFFFFFFFUL, dxlib_d.DxDataType.ULONGLONG SelectStrEdgeColor = 0xFFFFFFFFFFFFFFFFUL, dxlib_d.DxDataType.ULONGLONG IMEStr = 0xFFFFFFFFFFFFFFFFUL, dxlib_d.DxDataType.ULONGLONG IMEStrE = 0xFFFFFFFFFFFFFFFFUL);

		/**
		 * InputString関数使用時の文字の各色を変更する
		 */
		extern int SetKeyInputStringColor2(int TargetColor /* DX_KEYINPSTRCOLOR_NORMAL_STR 等 */, uint Color);

		/**
		 * SetKeyInputStringColor2 で設定した色をデフォルトに戻す
		 */
		extern int ResetKeyInputStringColor2(int TargetColor /* DX_KEYINPSTRCOLOR_NORMAL_STR 等 */);

		/**
		 * キー入力文字列描画関連で使用するフォントのハンドルを変更する(-1でデフォルトのフォントハンドル)
		 */
		extern int SetKeyInputStringFont(int FontHandle);

		/**
		 * キー入力文字列処理の入力文字数が限界に達している状態で、文字列の末端部分で入力が行われた場合の処理モードを変更する
		 */
		extern int SetKeyInputStringEndCharaMode(int EndCharaMode /* DX_KEYINPSTR_ENDCHARAMODE_OVERWRITE 等 */);

		/**
		 * 入力モード文字列を描画する
		 */
		extern int DrawKeyInputModeString(int x, int y);

		/**
		 * キー入力データ初期化
		 */
		extern int InitKeyInput();

		/**
		 * 新しいキー入力ハンドルの作成
		 */
		extern int MakeKeyInput(size_t MaxStrLength, int CancelValidFlag, int SingleCharOnlyFlag, int NumCharOnlyFlag, int DoubleCharOnlyFlag = dxlib_d.DxDataType.FALSE, int EnableNewLineFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * キー入力ハンドルの削除
		 */
		extern int DeleteKeyInput(int InputHandle);

		/**
		 * 指定のキー入力ハンドルをアクティブにする( -1 を指定するとアクティブなキー入力ハンドルが無い状態になります )
		 */
		extern int SetActiveKeyInput(int InputHandle);

		/**
		 * 現在アクティブになっているキー入力ハンドルを取得する
		 */
		extern int GetActiveKeyInput();

		/**
		 * キー入力ハンドルの入力が終了しているか取得する
		 */
		extern int CheckKeyInput(int InputHandle);

		/**
		 * 入力が完了したキー入力ハンドルを再度編集状態に戻す
		 */
		extern int ReStartKeyInput(int InputHandle);

		/**
		 * キー入力ハンドル処理関数
		 */
		extern int ProcessActKeyInput();

		/**
		 * キー入力ハンドルの入力中情報の描画
		 */
		extern int DrawKeyInputString(int x, int y, int InputHandle, int DrawCandidateList = dxlib_d.DxDataType.TRUE);

		/**
		 * キー入力ハンドルの入力中文字列を描画する際の描画範囲を設定する
		 */
		extern int SetKeyInputDrawArea(int x1, int y1, int x2, int y2, int InputHandle);

		/**
		 * キー入力ハンドルの指定の領域を選択状態にする( SelectStart と SelectEnd に -1 を指定すると選択状態が解除されます )
		 */
		extern int SetKeyInputSelectArea(int SelectStart, int SelectEnd, int InputHandle);

		/**
		 * キー入力ハンドルの選択領域を取得する
		 */
		extern int GetKeyInputSelectArea(int* SelectStart, int* SelectEnd, int InputHandle);

		/**
		 * キー入力ハンドルの描画開始文字位置を設定する
		 */
		extern int SetKeyInputDrawStartPos(int DrawStartPos, int InputHandle);

		/**
		 * キー入力ハンドルの描画開始文字位置を取得する
		 */
		extern int GetKeyInputDrawStartPos(int InputHandle);

		/**
		 * キー入力ハンドルのキー入力時のカーソルの点滅する早さをセットする
		 */
		extern int SetKeyInputCursorBrinkTime(int Time);

		/**
		 * キー入力ハンドルのキー入力時のカーソルを点滅させるかどうかをセットする
		 */
		extern int SetKeyInputCursorBrinkFlag(int Flag);

		/**
		 * キー入力ハンドルに指定の文字列をセットする
		 */
		extern int SetKeyInputString(const (dxlib_d.DxDataType.TCHAR)* String, int InputHandle);

		/**
		 * キー入力ハンドルに指定の文字列をセットする
		 */
		extern int SetKeyInputStringWithStrLen(const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, int InputHandle);

		/**
		 * キー入力ハンドルに指定の数値を文字に置き換えてセットする
		 */
		extern int SetKeyInputNumber(int Number, int InputHandle);

		/**
		 * キー入力ハンドルに指定の浮動小数点値を文字に置き換えてセットする
		 */
		extern int SetKeyInputNumberToFloat(float Number, int InputHandle);

		/**
		 * キー入力ハンドルの入力中の文字列を取得する
		 */
		extern int GetKeyInputString(dxlib_d.DxDataType.TCHAR* StrBuffer, int InputHandle);

		/**
		 * キー入力ハンドルの入力中の文字列を整数値として取得する
		 */
		extern int GetKeyInputNumber(int InputHandle);

		/**
		 * キー入力ハンドルの入力中の文字列を浮動小数点値として取得する
		 */
		extern float GetKeyInputNumberToFloat(int InputHandle);

		/**
		 * キー入力ハンドルの現在のカーソル位置を設定する
		 */
		extern int SetKeyInputCursorPosition(int Position, int InputHandle);

		/**
		 * キー入力ハンドルの現在のカーソル位置を取得する
		 */
		extern int GetKeyInputCursorPosition(int InputHandle);
	}

	// DxFile.cpp関数プロトタイプ宣言

	// ファイルアクセス関数

	/**
	 * ファイルを開く
	 */
	extern int FileRead_open(const (dxlib_d.DxDataType.TCHAR)* FilePath, int ASync = dxlib_d.DxDataType.FALSE);

	/**
	 * ファイルを開く
	 */
	extern int FileRead_open_WithStrLen(const (dxlib_d.DxDataType.TCHAR)* FilePath, size_t FilePathLength, int ASync = dxlib_d.DxDataType.FALSE);

	/**
	 * メモリに展開されたファイルを開く
	 */
	extern int FileRead_open_mem(const (void)* FileImage, size_t FileImageSize);

	/**
	 * ファイルのサイズを取得する
	 */
	extern dxlib_d.DxDataType.LONGLONG FileRead_size(const (dxlib_d.DxDataType.TCHAR)* FilePath);

	/**
	 * ファイルのサイズを取得する
	 */
	extern dxlib_d.DxDataType.LONGLONG FileRead_size_WithStrLen(const (dxlib_d.DxDataType.TCHAR)* FilePath, size_t FilePathLength);

	/**
	 * ファイルを閉じる
	 */
	extern int FileRead_close(int FileHandle);

	/**
	 * ファイルポインタの読み込み位置を取得する
	 */
	extern dxlib_d.DxDataType.LONGLONG FileRead_tell(int FileHandle);

	/**
	 * ファイルポインタの読み込み位置を変更する
	 */
	extern int FileRead_seek(int FileHandle, dxlib_d.DxDataType.LONGLONG Offset, int Origin);

	/**
	 * ファイルからデータを読み込む
	 */
	extern int FileRead_read(void* Buffer, int ReadSize, int FileHandle);

	/**
	 * ファイル読み込みが完了しているかどうかを取得する
	 */
	extern int FileRead_idle_chk(int FileHandle);

	/**
	 * ファイルの読み込み位置が終端に達しているかどうかを取得する
	 */
	extern int FileRead_eof(int FileHandle);

	/**
	 * ファイルの文字コード形式を設定する( テキストファイル用 )
	 */
	extern int FileRead_set_format(int FileHandle, int CharCodeFormat /* DX_CHARCODEFORMAT_SHIFTJIS 等 */);

	/**
	 * ファイルから文字列を読み出す
	 */
	extern int FileRead_gets(dxlib_d.DxDataType.TCHAR* Buffer, int BufferSize, int FileHandle);

	/**
	 * ファイルから1文字読み出す
	 */
	extern dxlib_d.DxDataType.TCHAR FileRead_getc(int FileHandle);

	/**
	 * ファイルから書式化されたデータを読み出す
	 */
	extern int FileRead_scanf(int FileHandle, const (dxlib_d.DxDataType.TCHAR)* Format, ...);

	/**
	 * ファイル情報ハンドルを作成する
	 *
	 * Returns: -1:エラー  -1以外:ファイル情報ハンドル
	 */
	extern dxlib_d.DxDataType.DWORD_PTR FileRead_createInfo(const (dxlib_d.DxDataType.TCHAR)* ObjectPath);

	/**
	 * ファイル情報ハンドルを作成する
	 *
	 * Returns: -1:エラー  -1以外:ファイル情報ハンドル
	 */
	extern dxlib_d.DxDataType.DWORD_PTR FileRead_createInfo_WithStrLen(const (dxlib_d.DxDataType.TCHAR)* ObjectPath, size_t ObjectPathLength);

	/**
	 * ファイル情報ハンドル中のファイルの数を取得する
	 */
	extern int FileRead_getInfoNum(dxlib_d.DxDataType.DWORD_PTR FileInfoHandle);

	/**
	 * ファイル情報ハンドル中のファイルの情報を取得する
	 */
	extern int FileRead_getInfo(int Index, .FILEINFO* Buffer, dxlib_d.DxDataType.DWORD_PTR FileInfoHandle);

	/**
	 * ファイル情報ハンドルを削除する
	 */
	extern int FileRead_deleteInfo(dxlib_d.DxDataType.DWORD_PTR FileInfoHandle);

	/**
	 * 指定のファイル又はフォルダの情報を取得し、ファイル検索ハンドルも作成する
	 *
	 * Returns: -1:エラー  -1以外:ファイル検索ハンドル
	 */
	extern dxlib_d.DxDataType.DWORD_PTR FileRead_findFirst(const (dxlib_d.DxDataType.TCHAR)* FilePath, .FILEINFO* Buffer);

	/**
	 * 指定のファイル又はフォルダの情報を取得し、ファイル検索ハンドルも作成する
	 *
	 * Returns: -1:エラー  -1以外:ファイル検索ハンドル
	 */
	extern dxlib_d.DxDataType.DWORD_PTR FileRead_findFirst_WithStrLen(const (dxlib_d.DxDataType.TCHAR)* FilePath, size_t FilePathLength, .FILEINFO* Buffer);

	/**
	 * 条件の合致する次のファイルの情報を取得する
	 *
	 * Returns: -1:エラー  0:成功
	 */
	extern int FileRead_findNext(dxlib_d.DxDataType.DWORD_PTR FindHandle, .FILEINFO* Buffer);

	/**
	 * ファイル検索ハンドルを閉じる
	 *
	 * Returns: -1:エラー  0:成功
	 */
	extern int FileRead_findClose(dxlib_d.DxDataType.DWORD_PTR FindHandle);

	/**
	 * 指定のファイルの内容を全てメモリに読み込み、その情報のアクセスに必要なハンドルを返す、使い終わったらハンドルは FileRead_fullyLoad_delete で削除する必要があります
	 *
	 * Returns: -1:エラー  -1以外:ハンドル
	 */
	extern int FileRead_fullyLoad(const (dxlib_d.DxDataType.TCHAR)* FilePath);

	/**
	 * 指定のファイルの内容を全てメモリに読み込み、その情報のアクセスに必要なハンドルを返す、使い終わったらハンドルは FileRead_fullyLoad_delete で削除する必要があります
	 *
	 * Returns: -1:エラー  -1以外:ハンドル
	 */
	extern int FileRead_fullyLoad_WithStrLen(const (dxlib_d.DxDataType.TCHAR)* FilePath, size_t FilePathLength);

	/**
	 * FileRead_fullyLoad で読み込んだファイルのハンドルを削除する
	 */
	extern int FileRead_fullyLoad_delete(int FLoadHandle);

	/**
	 * FileRead_fullyLoad で読み込んだファイルの内容を格納したメモリアドレスを取得する
	 */
	extern const (void)* FileRead_fullyLoad_getImage(int FLoadHandle);

	/**
	 * FileRead_fullyLoad で読み込んだファイルのサイズを取得する
	 */
	extern dxlib_d.DxDataType.LONGLONG FileRead_fullyLoad_getSize(int FLoadHandle);

	// 設定関係関数

	/**
	 * DXライブラリでストリームデータアクセスに使用する関数がデフォルトのものか調べる
	 *
	 * Returns: TRUE:デフォルトのもの  FALSE:デフォルトではない
	 */
	extern int GetStreamFunctionDefault();

	/**
	 * DXライブラリでストリームデータアクセスに使用する関数を変更する
	 */
	extern int ChangeStreamFunction(const (.STREAMDATASHREDTYPE2)* StreamThread);

	/**
	 * DXライブラリでストリームデータアクセスに使用する関数を変更する( wchar_t 使用版 )
	 */
	extern int ChangeStreamFunctionW(const (.STREAMDATASHREDTYPE2W)* StreamThreadW);

	// 補助関係関数

	/**
	 * フルパスではないパス文字列をフルパスに変換する( CurrentDir はフルパスである必要がある(語尾に『\』があっても無くても良い) )( CurrentDir が null の場合は現在のカレントディレクトリを使用する )
	 */
	extern int ConvertFullPath(const (dxlib_d.DxDataType.TCHAR)* Src, dxlib_d.DxDataType.TCHAR* Dest, const (dxlib_d.DxDataType.TCHAR)* CurrentDir = null);

	/**
	 * フルパスではないパス文字列をフルパスに変換する( CurrentDir はフルパスである必要がある(語尾に『\』があっても無くても良い) )( CurrentDir が null の場合は現在のカレントディレクトリを使用する )
	 */
	extern int ConvertFullPathWithStrLen(const (dxlib_d.DxDataType.TCHAR)* Src, size_t SrcLength, dxlib_d.DxDataType.TCHAR* Dest, const (dxlib_d.DxDataType.TCHAR)* CurrentDir = null, size_t CurrentDirLength = 0);

	// DxInput.cpp関数プロトタイプ宣言

	version (DX_NON_INPUT) {
	} else {
		// 入力状態取得関数

		/**
		 * キーボードの押下状態を取得する
		 */
		extern int CheckHitKey(int KeyCode);

		/**
		 * どれか1つでもキーが押されているかどうかを取得
		 *
		 * Returns: 押されていたら 0 以外
		 */
		extern int CheckHitKeyAll(int CheckType = DX_CHECKINPUT_ALL);

		/**
		 * すべてのキーの押下状態を取得する
		 *
		 * Params:
		 *      KeyStateBuf = char型256個分の配列の先頭アドレス
		 */
		extern int GetHitKeyStateAll(DX_CHAR* KeyStateArray);

		/**
		 * ジョイパッドが接続されている数を取得する
		 */
		extern int GetJoypadNum();

		/**
		 * ジョイパッドのボタンの数を取得する
		 */
		extern int GetJoypadButtonNum(int InputType);

		/**
		 * ジョイパッドの入力状態を取得する
		 */
		extern int GetJoypadInputState(int InputType);

		/**
		 * ジョイパッドのアナログ的なスティック入力情報を得る
		 */
		extern int GetJoypadAnalogInput(int* XBuf, int* YBuf, int InputType);

		/**
		 * ( 使用非推奨 )ジョイパッドのアナログ的なスティック入力情報を得る(右スティック用)
		 */
		extern int GetJoypadAnalogInputRight(int* XBuf, int* YBuf, int InputType);

		/**
		 * DirectInput から得られるジョイパッドの生のデータを取得する( DX_INPUT_KEY や DX_INPUT_KEY_PAD1 など、キーボードが絡むタイプを InputType に渡すとエラーとなり -1 を返す )
		 */
		extern int GetJoypadDirectInputState(int InputType, .DINPUT_JOYSTATE* DInputState);

		/**
		 * 指定の入力デバイスが XInput に対応しているかどうかを取得する( DX_INPUT_KEY や DX_INPUT_KEY_PAD1 など、キーボードが絡むタイプを InputType に渡すとエラーとなり -1 を返す )
		 *
		 * Returns: TRUE:XInput対応の入力デバイス  FALSE:XInput非対応の入力デバイス   -1:エラー
		 */
		extern int CheckJoypadXInput(int InputType);

		/**
		 * XInput から得られる入力デバイス( Xbox360コントローラ等 )の生のデータを取得する( XInput非対応のパッドの場合はエラーとなり -1 を返す、DX_INPUT_KEY や DX_INPUT_KEY_PAD1 など、キーボードが絡むタイプを InputType に渡すとエラーとなり -1 を返す )
		 */
		extern int GetJoypadXInputState(int InputType, .XINPUT_STATE* XInputState);

		/**
		 * ジョイパッドの入力に対応したキーボードの入力を設定する
		 *
		 * Params:
		 *      InputType = 設定を変更するパッドの識別子( DX_INPUT_PAD1等 )
		 *      PadInput = 設定を変更するパッドボタンの識別子( PAD_INPUT_1 等 )
		 *      KeyInput1 = PadInput を押下したことにするキーコード( KEY_INPUT_A など )その1
		 *      KeyInput2 = その2、-1で設定なし
		 *      KeyInput3 = その3、-1で設定なし
		 *      KeyInput4 = その4、-1で設定なし
		 */
		extern int SetJoypadInputToKeyInput(int InputType, int PadInput, int KeyInput1, int KeyInput2 = -1, int KeyInput3 = -1, int KeyInput4 = -1);

		/**
		 * ジョイパッドの無効ゾーンの設定を行う( InputType:設定を変更するパッドの識別子( DX_INPUT_PAD1等 )   Zone:新しい無効ゾーン( 0.0 〜 1.0 )、デフォルト値は 0.35 )
		 *
		 * Params:
		 *      InputType = ?
		 *      Zone = ?
		 */
		extern int SetJoypadDeadZone(int InputType, double Zone);

		/**
		 * ジョイパッドの無効ゾーンの設定を取得する
		 *
		 * Params:
		 *      InputType = 設定を変更するパッドの識別子( DX_INPUT_PAD1等 )
		 *
		 * Returns: 無効ゾーン( 0.0 〜 1.0 )
		 */
		extern double GetJoypadDeadZone(int InputType);

		/**
		 * ジョイパッドの振動を開始する
		 */
		extern int StartJoypadVibration(int InputType, int Power, int Time, int EffectIndex = -1);

		/**
		 * ジョイパッドの振動を停止する
		 */
		extern int StopJoypadVibration(int InputType, int EffectIndex = -1);

		/**
		 * ジョイパッドのPOV入力の状態を得る
		 *
		 * Returns: 指定のPOVデータの角度、単位は角度の100倍( 90度なら 9000 ) 中心位置にある場合は -1 が返る
		 */
		extern int GetJoypadPOVState(int InputType, int POVNumber);

		/**
		 * ジョイパッドの再セットアップを行う( 新たに接続されたジョイパッドがあったら検出される )
		 */
		extern int ReSetupJoypad();

		/**
		 * ジョイパッドの振動機能を使用するかどうかを設定する
		 *
		 * Params:
		 *      Flag = TRUE:使用する  FALSE:使用しない
		 */
		extern int SetUseJoypadVibrationFlag(int Flag);
	}

	version (DX_NOTUSE_DRAWFUNCTION) {
	} else {
		// 画像処理系関数プロトタイプ宣言

		// グラフィックハンドル作成関係関数

		/**
		 * 指定サイズのグラフィックハンドルを作成する
		 */
		extern int MakeGraph(int SizeX, int SizeY, int NotUse3DFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * SetDrawScreen で描画対象にできるグラフィックハンドルを作成する
		 */
		extern int MakeScreen(int SizeX, int SizeY, int UseAlphaChannel = dxlib_d.DxDataType.FALSE);

		/**
		 * 指定のグラフィックハンドルの指定部分だけを抜き出して新たなグラフィックハンドルを作成する
		 */
		extern int DerivationGraph(int SrcX, int SrcY, int Width, int Height, int SrcGraphHandle);

		/**
		 * 指定のグラフィックハンドルの指定部分だけを抜き出して新たなグラフィックハンドルを作成する( float版 )
		 */
		extern int DerivationGraphF(float SrcX, float SrcY, float Width, float Height, int SrcGraphHandle);

		/**
		 * グラフィックハンドルを削除する
		 */
		extern int DeleteGraph(int GrHandle, int LogOutFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 指定のグラフィックハンドルと、同じグラフィックハンドルから派生しているグラフィックハンドル( DerivationGraph で派生したハンドル、LoadDivGraph 読み込んで作成された複数のハンドル )を一度に削除する
		 */
		extern int DeleteSharingGraph(int GrHandle);

		/**
		 * 有効なグラフィックハンドルの数を取得する
		 */
		extern int GetGraphNum();

		/**
		 * グラフィックハンドルを指定の色で塗りつぶす
		 */
		extern int FillGraph(int GrHandle, int Red, int Green, int Blue, int Alpha = 255);

		/**
		 * グラフィックハンドルの指定の範囲を指定の色で塗りつぶす
		 */
		extern int FillRectGraph(int GrHandle, int x, int y, int Width, int Height, int Red, int Green, int Blue, int Alpha = 255);

		/**
		 * 指定のグラフィックハンドルが削除された際に 1 にする変数のアドレスを設定する
		 */
		extern int SetGraphLostFlag(int GrHandle, int* LostFlag);

		/**
		 * すべてのグラフィックハンドルを削除する
		 */
		extern int InitGraph(int LogOutFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * ファイルから画像を読み込んだ全てのグラフィックハンドルについて、再度ファイルから画像を読み込む
		 */
		extern int ReloadFileGraphAll();

		// シャドウマップハンドル関係関数

		/**
		 * シャドウマップハンドルを作成する
		 */
		extern int MakeShadowMap(int SizeX, int SizeY);

		/**
		 * シャドウマップハンドルを削除する
		 */
		extern int DeleteShadowMap(int SmHandle);

		/**
		 * シャドウマップが想定するライトの方向を設定する
		 */
		extern int SetShadowMapLightDirection(int SmHandle, .VECTOR Direction);

		/**
		 * シャドウマップへの描画の準備を行う
		 */
		extern int ShadowMap_DrawSetup(int SmHandle);

		/**
		 * シャドウマップへの描画を終了する
		 */
		extern int ShadowMap_DrawEnd();

		/**
		 * 描画で使用するシャドウマップを指定する、有効なスロットは0〜2、SmHandle に -1 を渡すと指定のスロットのシャドウマップを解除
		 */
		extern int SetUseShadowMap(int SmSlotIndex, int SmHandle);

		/**
		 * シャドウマップに描画する際の範囲を設定する( この関数で描画範囲を設定しない場合は視錐台を拡大した範囲が描画範囲となる )
		 */
		extern int SetShadowMapDrawArea(int SmHandle, .VECTOR MinPosition, .VECTOR MaxPosition);

		/**
		 * SetShadowMapDrawArea の設定を解除する
		 */
		extern int ResetShadowMapDrawArea(int SmHandle);

		/**
		 * シャドウマップを使用した描画時の補正深度を設定する
		 */
		extern int SetShadowMapAdjustDepth(int SmHandle, float Depth);

		/**
		 * シャドウマップ作成時や適用時に使用するビュー行列と射影行列を乗算した行列を取得する
		 */
		extern int GetShadowMapViewProjectionMatrix(int SmHandle, .MATRIX* MatrixBuffer);

		/**
		 * シャドウマップを画面にテスト描画する
		 */
		extern int TestDrawShadowMap(int SmHandle, int x1, int y1, int x2, int y2);

		// グラフィックハンドルへの画像転送関数

		/**
		 * BMPの内容をグラフィックハンドルに転送
		 */
		extern int BltBmpToGraph(const (.COLORDATA)* BmpColorData, dxlib_d.DxDataType.HBITMAP RgbBmp, dxlib_d.DxDataType.HBITMAP AlphaBmp, int CopyPointX, int CopyPointY, int GrHandle);

		/**
		 * BMPの内容を分割作成したグラフィックハンドルたちに転送
		 */
		extern int BltBmpToDivGraph(const (.COLORDATA)* BmpColorData, dxlib_d.DxDataType.HBITMAP RgbBmp, dxlib_d.DxDataType.HBITMAP AlphaBmp, int AllNum, int XNum, int YNum, int Width, int Height, const (int)* GrHandle, int ReverseFlag);

		/**
		 * BMP か BASEIMAGE をグラフィックハンドルに転送
		 */
		extern int BltBmpOrGraphImageToGraph(const (.COLORDATA)* BmpColorData, dxlib_d.DxDataType.HBITMAP RgbBmp, dxlib_d.DxDataType.HBITMAP AlphaBmp, int BmpFlag, const (.BASEIMAGE)* RgbBaseImage, const (.BASEIMAGE)* AlphaBaseImage, int CopyPointX, int CopyPointY, int GrHandle);

		/**
		 * BMP か BASEIMAGE の指定の領域をグラフィックハンドルに転送
		 */
		extern int BltBmpOrGraphImageToGraph2(const (.COLORDATA)* BmpColorData, dxlib_d.DxDataType.HBITMAP RgbBmp, dxlib_d.DxDataType.HBITMAP AlphaBmp, int BmpFlag, const (.BASEIMAGE)* RgbBaseImage, const (.BASEIMAGE)* AlphaBaseImage, const (dxlib_d.DxDataType.RECT)* SrcRect, int DestX, int DestY, int GrHandle);

		/**
		 * BMP か BASEIMAGE を分割作成したグラフィックハンドルたちに転送
		 */
		extern int BltBmpOrGraphImageToDivGraph(const (.COLORDATA)* BmpColorData, dxlib_d.DxDataType.HBITMAP RgbBmp, dxlib_d.DxDataType.HBITMAP AlphaBmp, int BmpFlag, const (.BASEIMAGE)* RgbBaseImage, const (.BASEIMAGE)* AlphaBaseImage, int AllNum, int XNum, int YNum, int Width, int Height, const (int)* GrHandle, int ReverseFlag);

		/**
		 * BMP か BASEIMAGE を分割作成したグラフィックハンドルたちに転送( float型 )
		 */
		extern int BltBmpOrGraphImageToDivGraphF(const (.COLORDATA)* BmpColorData, dxlib_d.DxDataType.HBITMAP RgbBmp, dxlib_d.DxDataType.HBITMAP AlphaBmp, int BmpFlag, const (.BASEIMAGE)* RgbBaseImage, const (.BASEIMAGE)* AlphaBaseImage, int AllNum, int XNum, int YNum, float Width, float Height, const (int)* GrHandle, int ReverseFlag);

		// 画像からグラフィックハンドルを作成する関数

		/**
		 * 画像ファイルからグラフィックハンドルを作成する
		 */
		extern int LoadBmpToGraph(const (dxlib_d.DxDataType.TCHAR)* FileName, int TextureFlag, int ReverseFlag, int SurfaceMode = DX_MOVIESURFACE_NORMAL);

		/**
		 * 画像ファイルからグラフィックハンドルを作成する
		 */
		extern int LoadBmpToGraphWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int TextureFlag, int ReverseFlag, int SurfaceMode = DX_MOVIESURFACE_NORMAL);

		/**
		 * 画像ファイルからグラフィックハンドルを作成する
		 */
		extern int LoadGraph(const (dxlib_d.DxDataType.TCHAR)* FileName, int NotUse3DFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像ファイルからグラフィックハンドルを作成する
		 */
		extern int LoadGraphWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int NotUse3DFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像ファイルを反転したものでグラフィックハンドルを作成する
		 */
		extern int LoadReverseGraph(const (dxlib_d.DxDataType.TCHAR)* FileName, int NotUse3DFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像ファイルを反転したものでグラフィックハンドルを作成する
		 */
		extern int LoadReverseGraphWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int NotUse3DFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像ファイルを分割してグラフィックハンドルを作成する
		 */
		extern int LoadDivGraph(const (dxlib_d.DxDataType.TCHAR)* FileName, int AllNum, int XNum, int YNum, int XSize, int YSize, int* HandleArray, int NotUse3DFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像ファイルを分割してグラフィックハンドルを作成する
		 */
		extern int LoadDivGraphWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int AllNum, int XNum, int YNum, int XSize, int YSize, int* HandleArray, int NotUse3DFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像ファイルを分割してグラフィックハンドルを作成する
		 */
		extern int LoadDivGraphF(const (dxlib_d.DxDataType.TCHAR)* FileName, int AllNum, int XNum, int YNum, float XSize, float YSize, int* HandleArray, int NotUse3DFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像ファイルを分割してグラフィックハンドルを作成する
		 */
		extern int LoadDivGraphFWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int AllNum, int XNum, int YNum, float XSize, float YSize, int* HandleArray, int NotUse3DFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像ファイルを分割してグラフィックハンドルを作成する
		 */
		extern int LoadDivBmpToGraph(const (dxlib_d.DxDataType.TCHAR)* FileName, int AllNum, int XNum, int YNum, int SizeX, int SizeY, int* HandleArray, int TextureFlag, int ReverseFlag);

		/**
		 * 画像ファイルを分割してグラフィックハンドルを作成する
		 */
		extern int LoadDivBmpToGraphWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int AllNum, int XNum, int YNum, int SizeX, int SizeY, int* HandleArray, int TextureFlag, int ReverseFlag);

		/**
		 * 画像ファイルを分割してグラフィックハンドルを作成する
		 */
		extern int LoadDivBmpToGraphF(const (dxlib_d.DxDataType.TCHAR)* FileName, int AllNum, int XNum, int YNum, float SizeX, float SizeY, int* HandleArray, int TextureFlag, int ReverseFlag);

		/**
		 * 画像ファイルを分割してグラフィックハンドルを作成する
		 */
		extern int LoadDivBmpToGraphFWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int AllNum, int XNum, int YNum, float SizeX, float SizeY, int* HandleArray, int TextureFlag, int ReverseFlag);

		/**
		 * 画像ファイルを反転したものを分割してグラフィックハンドルを作成する
		 */
		extern int LoadReverseDivGraph(const (dxlib_d.DxDataType.TCHAR)* FileName, int AllNum, int XNum, int YNum, int XSize, int YSize, int* HandleArray, int NotUse3DFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像ファイルを反転したものを分割してグラフィックハンドルを作成する
		 */
		extern int LoadReverseDivGraphWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int AllNum, int XNum, int YNum, int XSize, int YSize, int* HandleArray, int NotUse3DFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像ファイルを反転したものを分割してグラフィックハンドルを作成する
		 */
		extern int LoadReverseDivGraphF(const (dxlib_d.DxDataType.TCHAR)* FileName, int AllNum, int XNum, int YNum, float XSize, float YSize, int* HandleArray, int NotUse3DFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像ファイルを反転したものを分割してグラフィックハンドルを作成する
		 */
		extern int LoadReverseDivGraphFWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int AllNum, int XNum, int YNum, float XSize, float YSize, int* HandleArray, int NotUse3DFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像ファイルからブレンド用グラフィックハンドルを作成する
		 */
		extern int LoadBlendGraph(const (dxlib_d.DxDataType.TCHAR)* FileName);

		/**
		 * 画像ファイルからブレンド用グラフィックハンドルを作成する
		 */
		extern int LoadBlendGraphWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength);

		/**
		 * メモリ上の画像イメージからグラフィックハンドルを作成する
		 */
		extern int CreateGraphFromMem(const (void)* RGBFileImage, int RGBFileImageSize, const (void)* AlphaFileImage = null, int AlphaFileImageSize = 0, int TextureFlag = dxlib_d.DxDataType.TRUE, int ReverseFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * メモリ上の画像イメージから既存のグラフィックハンドルにデータを転送する
		 */
		extern int ReCreateGraphFromMem(const (void)* RGBFileImage, int RGBFileImageSize, int GrHandle, const (void)* AlphaFileImage = null, int AlphaFileImageSize = 0, int TextureFlag = dxlib_d.DxDataType.TRUE, int ReverseFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * メモリ上の画像イメージから分割グラフィックハンドルを作成する
		 */
		extern int CreateDivGraphFromMem(const (void)* RGBFileImage, int RGBFileImageSize, int AllNum, int XNum, int YNum, int SizeX, int SizeY, int* HandleArray, int TextureFlag = dxlib_d.DxDataType.TRUE, int ReverseFlag = dxlib_d.DxDataType.FALSE, const (void)* AlphaFileImage = null, int AlphaFileImageSize = 0);

		/**
		 * メモリ上の画像イメージから分割グラフィックハンドルを作成する( float版 )
		 */
		extern int CreateDivGraphFFromMem(const (void)* RGBFileImage, int RGBFileImageSize, int AllNum, int XNum, int YNum, float SizeX, float SizeY, int* HandleArray, int TextureFlag = dxlib_d.DxDataType.TRUE, int ReverseFlag = dxlib_d.DxDataType.FALSE, const (void)* AlphaFileImage = null, int AlphaFileImageSize = 0);

		/**
		 * メモリ上の画像イメージから既存の分割グラフィックハンドルにデータを転送する
		 */
		extern int ReCreateDivGraphFromMem(const (void)* RGBFileImage, int RGBFileImageSize, int AllNum, int XNum, int YNum, int SizeX, int SizeY, const (int)* HandleArray, int TextureFlag = dxlib_d.DxDataType.TRUE, int ReverseFlag = dxlib_d.DxDataType.FALSE, const (void)* AlphaFileImage = null, int AlphaFileImageSize = 0);

		/**
		 * メモリ上の画像イメージから既存の分割グラフィックハンドルにデータを転送する( float版 )
		 */
		extern int ReCreateDivGraphFFromMem(const (void)* RGBFileImage, int RGBFileImageSize, int AllNum, int XNum, int YNum, float SizeX, float SizeY, const (int)* HandleArray, int TextureFlag = dxlib_d.DxDataType.TRUE, int ReverseFlag = dxlib_d.DxDataType.FALSE, const (void)* AlphaFileImage = null, int AlphaFileImageSize = 0);

		/**
		 * ビットマップデータからグラフィックハンドルを作成する
		 */
		extern int CreateGraphFromBmp(const (dxlib_d.DxDataType.BITMAPINFO)* RGBBmpInfo, const (void)* RGBBmpImage, const (dxlib_d.DxDataType.BITMAPINFO)* AlphaBmpInfo = null, const (void)* AlphaBmpImage = null, int TextureFlag = dxlib_d.DxDataType.TRUE, int ReverseFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * ビットマップデータから既存のグラフィックハンドルにデータを転送する
		 */
		extern int ReCreateGraphFromBmp(const (dxlib_d.DxDataType.BITMAPINFO)* RGBBmpInfo, const (void)* RGBBmpImage, int GrHandle, const (dxlib_d.DxDataType.BITMAPINFO)* AlphaBmpInfo = null, const (void)* AlphaBmpImage = null, int TextureFlag = dxlib_d.DxDataType.TRUE, int ReverseFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * ビットマップデータから分割グラフィックハンドルを作成する
		 */
		extern int CreateDivGraphFromBmp(const (dxlib_d.DxDataType.BITMAPINFO)* RGBBmpInfo, const (void)* RGBBmpImage, int AllNum, int XNum, int YNum, int SizeX, int SizeY, int* HandleArray, int TextureFlag = dxlib_d.DxDataType.TRUE, int ReverseFlag = dxlib_d.DxDataType.FALSE, const (dxlib_d.DxDataType.BITMAPINFO)* AlphaBmpInfo = null, const (void)* AlphaBmpImage = null);

		/**
		 * ビットマップデータから分割グラフィックハンドルを作成する( float版 )
		 */
		extern int CreateDivGraphFFromBmp(const (dxlib_d.DxDataType.BITMAPINFO)* RGBBmpInfo, const (void)* RGBBmpImage, int AllNum, int XNum, int YNum, float SizeX, float SizeY, int* HandleArray, int TextureFlag = dxlib_d.DxDataType.TRUE, int ReverseFlag = dxlib_d.DxDataType.FALSE, const (dxlib_d.DxDataType.BITMAPINFO)* AlphaBmpInfo = null, const (void)* AlphaBmpImage = null);

		/**
		 * ビットマップデータから既存の分割グラフィックハンドルにデータを転送する
		 */
		extern int ReCreateDivGraphFromBmp(const (dxlib_d.DxDataType.BITMAPINFO)* RGBBmpInfo, const (void)* RGBBmpImage, int AllNum, int XNum, int YNum, int SizeX, int SizeY, const (int)* HandleArray, int TextureFlag = dxlib_d.DxDataType.TRUE, int ReverseFlag = dxlib_d.DxDataType.FALSE, const (dxlib_d.DxDataType.BITMAPINFO)* AlphaBmpInfo = null, const (void)* AlphaBmpImage = null);

		/**
		 * ビットマップデータから既存の分割グラフィックハンドルにデータを転送する( float版 )
		 */
		extern int ReCreateDivGraphFFromBmp(const (dxlib_d.DxDataType.BITMAPINFO)* RGBBmpInfo, const (void)* RGBBmpImage, int AllNum, int XNum, int YNum, float SizeX, float SizeY, const (int)* HandleArray, int TextureFlag = dxlib_d.DxDataType.TRUE, int ReverseFlag = dxlib_d.DxDataType.FALSE, const (dxlib_d.DxDataType.BITMAPINFO)* AlphaBmpInfo = null, const (void)* AlphaBmpImage = null);

		/**
		 * 基本イメージデータからサイズを割り出し、それに合ったグラフィックハンドルを作成する
		 */
		extern int CreateDXGraph(const (.BASEIMAGE)* RgbBaseImage, const (.BASEIMAGE)* AlphaBaseImage, int TextureFlag);

		/**
		 * 基本イメージデータからグラフィックハンドルを作成する
		 */
		extern int CreateGraphFromGraphImage(const (.BASEIMAGE)* RgbBaseImage, int TextureFlag = dxlib_d.DxDataType.TRUE, int ReverseFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 基本イメージデータからグラフィックハンドルを作成する
		 */
		extern int CreateGraphFromGraphImage(const (.BASEIMAGE)* RgbBaseImage, const (.BASEIMAGE)* AlphaBaseImage, int TextureFlag = dxlib_d.DxDataType.TRUE, int ReverseFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 基本イメージデータから既存のグラフィックハンドルにデータを転送する
		 */
		extern int ReCreateGraphFromGraphImage(const (.BASEIMAGE)* RgbBaseImage, int GrHandle, int TextureFlag = dxlib_d.DxDataType.TRUE, int ReverseFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 基本イメージデータから既存のグラフィックハンドルにデータを転送する
		 */
		extern int ReCreateGraphFromGraphImage(const (.BASEIMAGE)* RgbBaseImage, const (.BASEIMAGE)* AlphaBaseImage, int GrHandle, int TextureFlag = dxlib_d.DxDataType.TRUE, int ReverseFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 基本イメージデータから分割グラフィックハンドルを作成する
		 */
		extern int CreateDivGraphFromGraphImage(.BASEIMAGE* RgbBaseImage, int AllNum, int XNum, int YNum, int SizeX, int SizeY, int* HandleArray, int TextureFlag = dxlib_d.DxDataType.TRUE, int ReverseFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 基本イメージデータから分割グラフィックハンドルを作成する( float版 )
		 */
		extern int CreateDivGraphFFromGraphImage(.BASEIMAGE* RgbBaseImage, int AllNum, int XNum, int YNum, float SizeX, float SizeY, int* HandleArray, int TextureFlag = dxlib_d.DxDataType.TRUE, int ReverseFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 基本イメージデータから分割グラフィックハンドルを作成する
		 */
		extern int CreateDivGraphFromGraphImage(.BASEIMAGE* RgbBaseImage, const (.BASEIMAGE)* AlphaBaseImage, int AllNum, int XNum, int YNum, int SizeX, int SizeY, int* HandleArray, int TextureFlag = dxlib_d.DxDataType.TRUE, int ReverseFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 基本イメージデータから分割グラフィックハンドルを作成する( float版 )
		 */
		extern int CreateDivGraphFFromGraphImage(.BASEIMAGE* RgbBaseImage, const (.BASEIMAGE)* AlphaBaseImage, int AllNum, int XNum, int YNum, float SizeX, float SizeY, int* HandleArray, int TextureFlag = dxlib_d.DxDataType.TRUE, int ReverseFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 基本イメージデータから既存の分割グラフィックハンドルにデータを転送する
		 */
		extern int ReCreateDivGraphFromGraphImage(.BASEIMAGE* RgbBaseImage, int AllNum, int XNum, int YNum, int SizeX, int SizeY, const (int)* HandleArray, int TextureFlag = dxlib_d.DxDataType.TRUE, int ReverseFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 基本イメージデータから既存の分割グラフィックハンドルにデータを転送する( float版 )
		 */
		extern int ReCreateDivGraphFFromGraphImage(.BASEIMAGE* RgbBaseImage, int AllNum, int XNum, int YNum, float SizeX, float SizeY, const (int)* HandleArray, int TextureFlag = dxlib_d.DxDataType.TRUE, int ReverseFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 基本イメージデータから既存の分割グラフィックハンドルにデータを転送する
		 */
		extern int ReCreateDivGraphFromGraphImage(.BASEIMAGE* RgbBaseImage, const (.BASEIMAGE)* AlphaBaseImage, int AllNum, int XNum, int YNum, int SizeX, int SizeY, const (int)* HandleArray, int TextureFlag = dxlib_d.DxDataType.TRUE, int ReverseFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 基本イメージデータから既存の分割グラフィックハンドルにデータを転送する( float版 )
		 */
		extern int ReCreateDivGraphFFromGraphImage(.BASEIMAGE* RgbBaseImage, const (.BASEIMAGE)* AlphaBaseImage, int AllNum, int XNum, int YNum, float SizeX, float SizeY, const (int)* HandleArray, int TextureFlag = dxlib_d.DxDataType.TRUE, int ReverseFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * メモリ上のビットマップイメージからグラフィックハンドルを作成する
		 */
		extern int CreateGraph(int Width, int Height, int Pitch, const (void)* RGBImage, const (void)* AlphaImage = null, int GrHandle = -1);

		/**
		 * メモリ上のビットマップイメージから分割グラフィックハンドルを作成する
		 */
		extern int CreateDivGraph(int Width, int Height, int Pitch, const (void)* RGBImage, int AllNum, int XNum, int YNum, int SizeX, int SizeY, int* HandleArray, const (void)* AlphaImage = null);

		/**
		 * メモリ上のビットマップイメージから分割グラフィックハンドルを作成する( float版 )
		 */
		extern int CreateDivGraphF(int Width, int Height, int Pitch, const (void)* RGBImage, int AllNum, int XNum, int YNum, float SizeX, float SizeY, int* HandleArray, const (void)* AlphaImage = null);

		/**
		 * メモリ上のビットマップイメージからグラフィックハンドルを再作成する
		 */
		extern int ReCreateGraph(int Width, int Height, int Pitch, const (void)* RGBImage, int GrHandle, const (void)* AlphaImage = null);

		version (DX_NON_SOFTIMAGE) {
		} else {
			/**
			 * ソフトウエアで扱うイメージからブレンド用画像グラフィックハンドルを作成する
			 *
			 * Returns: -1:エラー  -1以外:ブレンド用グラフィックハンドル
			 */
			extern int CreateBlendGraphFromSoftImage(int SIHandle);

			/**
			 * ソフトウエアで扱うイメージからグラフィックハンドルを作成する
			 *
			 * Returns: -1:エラー  -1以外:グラフィックハンドル
			 */
			extern int CreateGraphFromSoftImage(int SIHandle);

			/**
			 * ソフトウエアで扱うイメージの指定の領域を使ってグラフィックハンドルを作成する
			 *
			 * Returns: -1:エラー  -1以外:グラフィックハンドル
			 */
			extern int CreateGraphFromRectSoftImage(int SIHandle, int x, int y, int SizeX, int SizeY);

			/**
			 * ソフトウエアで扱うイメージから既存のグラフィックハンドルに画像データを転送する
			 */
			extern int ReCreateGraphFromSoftImage(int SIHandle, int GrHandle);

			/**
			 * ソフトウエアで扱うイメージから既存のグラフィックハンドルに画像データを転送する
			 */
			extern int ReCreateGraphFromRectSoftImage(int SIHandle, int x, int y, int SizeX, int SizeY, int GrHandle);

			/**
			 * ソフトウエアで扱うイメージから分割グラフィックハンドルを作成する
			 */
			extern int CreateDivGraphFromSoftImage(int SIHandle, int AllNum, int XNum, int YNum, int SizeX, int SizeY, int* HandleArray);

			/**
			 * ソフトウエアで扱うイメージから分割グラフィックハンドルを作成する( float版 )
			 */
			extern int CreateDivGraphFFromSoftImage(int SIHandle, int AllNum, int XNum, int YNum, float SizeX, float SizeY, int* HandleArray);

			/**
			 * ソフトウエアで扱うイメージから既存の分割グラフィックハンドルにデータを転送する
			 */
			extern int ReCreateDivGraphFromSoftImage(int SIHandle, int AllNum, int XNum, int YNum, int SizeX, int SizeY, const (int)* HandleArray);

			/**
			 * ソフトウエアで扱うイメージから既存の分割グラフィックハンドルにデータを転送する( float版 )
			 */
			extern int ReCreateDivGraphFFromSoftImage(int SIHandle, int AllNum, int XNum, int YNum, float SizeX, float SizeY, const (int)* HandleArray);
		}

		/**
		 * 基本イメージデータからグラフィックハンドルを作成する
		 */
		extern int CreateGraphFromBaseImage(const (.BASEIMAGE)* BaseImage);

		/**
		 * 基本イメージデータの指定の領域を使ってグラフィックハンドルを作成する
		 */
		extern int CreateGraphFromRectBaseImage(const (.BASEIMAGE)* BaseImage, int x, int y, int SizeX, int SizeY);

		/**
		 * 基本イメージデータから既存のグラフィックハンドルに画像データを転送する
		 */
		extern int ReCreateGraphFromBaseImage(const (.BASEIMAGE)* BaseImage, int GrHandle);

		/**
		 * 基本イメージデータの指定の領域を使って既存のグラフィックハンドルに画像データを転送する
		 */
		extern int ReCreateGraphFromRectBaseImage(const (.BASEIMAGE)* BaseImage, int x, int y, int SizeX, int SizeY, int GrHandle);

		/**
		 * 基本イメージデータから分割グラフィックハンドルを作成する
		 */
		extern int CreateDivGraphFromBaseImage(.BASEIMAGE* BaseImage, int AllNum, int XNum, int YNum, int SizeX, int SizeY, int* HandleArray);

		/**
		 * 基本イメージデータから分割グラフィックハンドルを作成する( float版 )
		 */
		extern int CreateDivGraphFFromBaseImage(.BASEIMAGE* BaseImage, int AllNum, int XNum, int YNum, float SizeX, float SizeY, int* HandleArray);

		/**
		 * 基本イメージデータから既存の分割グラフィックハンドルにデータを転送する
		 */
		extern int ReCreateDivGraphFromBaseImage(.BASEIMAGE* BaseImage, int AllNum, int XNum, int YNum, int SizeX, int SizeY, const (int)* HandleArray);

		/**
		 * 基本イメージデータから既存の分割グラフィックハンドルにデータを転送する( float版 )
		 */
		extern int ReCreateDivGraphFFromBaseImage(.BASEIMAGE* BaseImage, int AllNum, int XNum, int YNum, float SizeX, float SizeY, const (int)* HandleArray);

		/**
		 * 画像ファイルからグラフィックハンドルへ画像データを転送する
		 */
		extern int ReloadGraph(const (dxlib_d.DxDataType.TCHAR)* FileName, int GrHandle, int ReverseFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像ファイルからグラフィックハンドルへ画像データを転送する
		 */
		extern int ReloadGraphWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int GrHandle, int ReverseFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像ファイルからグラフィックハンドルたちへ画像データを分割転送する
		 */
		extern int ReloadDivGraph(const (dxlib_d.DxDataType.TCHAR)* FileName, int AllNum, int XNum, int YNum, int XSize, int YSize, const (int)* HandleArray, int ReverseFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像ファイルからグラフィックハンドルたちへ画像データを分割転送する
		 */
		extern int ReloadDivGraphWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int AllNum, int XNum, int YNum, int XSize, int YSize, const (int)* HandleArray, int ReverseFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像ファイルからグラフィックハンドルたちへ画像データを分割転送する( float版 )
		 */
		extern int ReloadDivGraphF(const (dxlib_d.DxDataType.TCHAR)* FileName, int AllNum, int XNum, int YNum, float XSize, float YSize, const (int)* HandleArray, int ReverseFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像ファイルからグラフィックハンドルたちへ画像データを分割転送する( float版 )
		 */
		extern int ReloadDivGraphFWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int AllNum, int XNum, int YNum, float XSize, float YSize, const (int)* HandleArray, int ReverseFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * ReloadGraph の画像反転処理追加版
		 */
		extern int ReloadReverseGraph(const (dxlib_d.DxDataType.TCHAR)* FileName, int GrHandle);

		/**
		 * ReloadGraph の画像反転処理追加版
		 */
		extern int ReloadReverseGraphWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int GrHandle);

		/**
		 * ReloadDivGraph の画像反転処理追加版
		 */
		extern int ReloadReverseDivGraph(const (dxlib_d.DxDataType.TCHAR)* FileName, int AllNum, int XNum, int YNum, int XSize, int YSize, const (int)* HandleArray);

		/**
		 * ReloadDivGraph の画像反転処理追加版
		 */
		extern int ReloadReverseDivGraphWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int AllNum, int XNum, int YNum, int XSize, int YSize, const (int)* HandleArray);

		/**
		 * ReloadDivGraph の画像反転処理追加版( float版 )
		 */
		extern int ReloadReverseDivGraphF(const (dxlib_d.DxDataType.TCHAR)* FileName, int AllNum, int XNum, int YNum, float XSize, float YSize, const (int)* HandleArray);

		/**
		 * ReloadDivGraph の画像反転処理追加版( float版 )
		 */
		extern int ReloadReverseDivGraphFWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int AllNum, int XNum, int YNum, float XSize, float YSize, const (int)* HandleArray);

		// グラフィックハンドル作成時設定係関数

		/**
		 * SetCreateGraphColorBitDepth の旧名称
		 */
		extern int SetGraphColorBitDepth(int ColorBitDepth);

		/**
		 * GetCreateGraphColorBitDepth の旧名称
		 */
		extern int GetGraphColorBitDepth();

		/**
		 * 作成するグラフィックハンドルの色深度を設定する
		 */
		extern int SetCreateGraphColorBitDepth(int BitDepth);

		/**
		 * 作成するグラフィックハンドルの色深度を取得する
		 */
		extern int GetCreateGraphColorBitDepth();

		/**
		 * 作成するグラフィックハンドルの1チャンネル辺りのビット深度を設定する
		 */
		extern int SetCreateGraphChannelBitDepth(int BitDepth);

		/**
		 * 作成するグラフィックハンドルの1チャンネル辺りのビット深度を取得する
		 */
		extern int GetCreateGraphChannelBitDepth();

		/**
		 * SetDrawScreen に引数として渡せる( 描画対象として使用できる )グラフィックハンドルを作成するかどうかを設定する
		 *
		 * Params:
		 *      Flag = TRUE:描画可能グラフィックハンドルを作成する  FLASE:通常のグラフィックハンドルを作成する( デフォルト )
		 */
		extern int SetDrawValidGraphCreateFlag(int Flag);

		/**
		 * SetDrawScreen に引数として渡せる( 描画対象として使用できる )グラフィックハンドルを作成するかどうかを設定を取得する
		 */
		extern int GetDrawValidGraphCreateFlag();

		/**
		 * SetDrawValidGraphCreateFlag の旧名称
		 */
		extern int SetDrawValidFlagOf3DGraph(int Flag);

		/**
		 * 画像ファイルからグラフィックハンドルを作成する際に画像左上の色を透過色として扱うかどうかを設定する
		 *
		 * Params:
		 *      Flag = TRUE:透過色として扱う  FALSE:透過色として扱わない( デフォルト )
		 */
		extern int SetLeftUpColorIsTransColorFlag(int Flag);

		/**
		 * 読み込む画像がパレット画像の場合、パレット画像として使用できる場合はパレット画像として使用するかどうかを設定する
		 *
		 * Params:
		 *      Flag = TRUE:パレット画像として使用できる場合はパレット画像として使用する( デフォルト )  FALSE:パレット画像として使用できる場合もパレット画像としては使用しない( 通常タイプの画像に変換して使用する )
		 */
		extern int SetUsePaletteGraphFlag(int Flag);

		/**
		 * ブレンド処理用画像を作成するかどうか( 要は画像の赤成分をα成分として扱うかどうか )の設定を行う
		 *
		 * Params:
		 *      Flag = TRUE:ブレンド画像として読み込む  FALSE:通常画像として読み込む( デフォルト )
		 */
		extern int SetUseBlendGraphCreateFlag(int Flag);

		/**
		 * ブレンド処理用画像を作成するかどうか( 要は画像の赤成分をα成分として扱うかどうか )の設定を取得する
		 */
		extern int GetUseBlendGraphCreateFlag();

		/**
		 * アルファテストを使用するグラフィックハンドルを作成するかどうかを設定する
		 *
		 * Params:
		 *      Flag = TRUE:アルファテストを使用する( デフォルト )  FALSE:アルファテストを使用しない
		 */
		extern int SetUseAlphaTestGraphCreateFlag(int Flag);

		/**
		 * アルファテストを使用するグラフィックハンドルを作成するかどうかを取得する
		 */
		extern int GetUseAlphaTestGraphCreateFlag();

		/**
		 * SetUseAlphaTestGraphCreateFlag の旧名称
		 */
		extern int SetUseAlphaTestFlag(int Flag);

		/**
		 * GetUseAlphaTestGraphCreateFlag の旧名称
		 */
		extern int GetUseAlphaTestFlag();

		/**
		 * キューブマップテクスチャを作成するかどうかのフラグを設定する
		 */
		extern int SetCubeMapTextureCreateFlag(int Flag);

		/**
		 * キューブマップテクスチャを作成するかどうかのフラグを取得する
		 */
		extern int GetCubeMapTextureCreateFlag();

		/**
		 * SetDrawBlendMode 関数の第1引数に DX_BLENDMODE_NOBLEND を代入した際に、デフォルトでは第二引数は内部で255を指定したことになるが、その自動255化をしないかどうかを設定する。αチャンネル付き画像に対して描画を行う場合のみ意味がある関数
		 *
		 * Params:
		 *      Flag = TRUE:しない(第二引数の値が使用される)   FALSE:する(第二引数の値は無視されて 255 が常に使用される)(デフォルト)
		 */
		extern int SetUseNoBlendModeParam(int Flag);

		/**
		 * SetDrawScreen の引数として渡せる( 描画対象として使用できる )αチャンネル付きグラフィックハンドルを作成するかどうかを設定する( SetDrawValidGraphCreateFlag 関数で描画対象として使用できるグラフィックハンドルを作成するように設定されていないと効果ありません )
		 *
		 * Params:
		 *      Flag = TRUE:αチャンネル付き   FALSE:αチャンネルなし( デフォルト )
		 */
		extern int SetDrawValidAlphaChannelGraphCreateFlag(int Flag);

		/**
		 * SetDrawScreen の引数として渡せる( 描画対象として使用できる )αチャンネル付きグラフィックハンドルを作成するかどうかを取得する
		 */
		extern int GetDrawValidAlphaChannelGraphCreateFlag();

		/**
		 * SetDrawScreen の引数として渡せる( 描画対象として使用できる )ピクセルフォーマットが浮動小数点型のグラフィックハンドルを作成するかどうかを設定する( SetDrawValidGraphCreateFlag 関数で描画対象として使用できるグラフィックハンドルを作成するように設定されていないと効果ありません )、グラフィックスデバイスが浮動小数点型のピクセルフォーマットに対応していない場合はグラフィックハンドルの作成に失敗する
		 *
		 * Params:
		 *      Flag = TRUE:浮動小数点型  FALSE:整数型( デフォルト )
		 */
		extern int SetDrawValidFloatTypeGraphCreateFlag(int Flag);

		/**
		 * SetDrawScreen の引数として渡せる( 描画対象として使用できる )ピクセルフォーマットが浮動小数点型のグラフィックハンドルを作成するかどうかを取得する
		 */
		extern int GetDrawValidFloatTypeGraphCreateFlag();

		/**
		 * SetDrawScreen の引数として渡せる( 描画対象として使用できる )グラフィックハンドルを作成する際に専用のZバッファも作成するかどうかを設定する
		 *
		 * Params:
		 *      Flag = TRUE:専用のZバッファを作成する( デフォルト )  FALSE:専用のZバッファは作成しない
		 */
		extern int SetDrawValidGraphCreateZBufferFlag(int Flag);

		/**
		 * SetDrawScreen の引数として渡せる( 描画対象として使用できる )グラフィックハンドルを作成する際に専用のZバッファも作成するかどうかを取得する
		 */
		extern int GetDrawValidGraphCreateZBufferFlag();

		/**
		 * SetDrawScreen の引数として渡せる( 描画対象として使用できる )グラフィックハンドルに適用するZバッファのビット深度を設定する( BitDepth:ビット深度( 指定可能な値は 16, 24, 32 の何れか( SetDrawValidGraphCreateFlag 関数で描画対象として使用できるグラフィックハンドルを作成するように設定されていないと効果ありません )
		 *
		 * Params:
		 *      BitDepth = ?
		 */
		extern int SetCreateDrawValidGraphZBufferBitDepth(int BitDepth);

		/**
		 * SetDrawScreen の引数として渡せる( 描画対象として使用できる )グラフィックハンドルに適用するZバッファのビット深度を取得する
		 */
		extern int GetCreateDrawValidGraphZBufferBitDepth();

		/**
		 * SetDrawScreen の引数として渡せる( 描画対象として使用できる )グラフィックハンドルに適用するMipMapのレベルを設定する
		 */
		extern int SetCreateDrawValidGraphMipLevels(int MipLevels);

		/**
		 * SetDrawScreen の引数として渡せる( 描画対象として使用できる )グラフィックハンドルに適用するMipMapのレベルを取得する
		 */
		extern int GetCreateDrawValidGraphMipLevels();

		/**
		 * SetDrawScreen の引数として渡せる( 描画対象として使用できる )グラフィックハンドルに適用する色のチャンネル数を設定する( ChannelNum:チャンネル数( 指定可能な値は 1, 2, 4 の何れか( SetDrawValidGraphCreateFlag 関数で描画対象として使用できるグラフィックハンドルを作成するように設定されていないと効果ありません )
		 *
		 * Params:
		 *      ChannelNum = ?
		 */
		extern int SetCreateDrawValidGraphChannelNum(int ChannelNum);

		/**
		 * SetDrawScreen の引数として渡せる( 描画対象として使用できる )グラフィックハンドルに適用する色のチャンネル数を取得する
		 */
		extern int GetCreateDrawValidGraphChannelNum();

		/**
		 * SetDrawScreen の引数として渡せる( 描画対象として使用できる )グラフィックハンドルに適用するマルチサンプリング( アンチエイリアシング )設定を行う( Samples:マルチサンプル処理に使用するドット数( 多いほど重くなります )  Quality:マルチサンプル処理の品質 )
		 *
		 * Params:
		 *      Samples = ?
		 *      Quality = ?
		 */
		extern int SetCreateDrawValidGraphMultiSample(int Samples, int Quality);

		/**
		 * SetCreateDrawValidGraphMultiSample の旧名称
		 */
		extern int SetDrawValidMultiSample(int Samples, int Quality);

		/**
		 * 指定のマルチサンプル数で使用できる最大クオリティ値を取得する( 戻り値がマイナスの場合は引数のサンプル数が使用できないことを示します )
		 */
		extern int GetMultiSampleQuality(int Samples);

		/**
		 * 透過色機能を使用するかどうかを設定する
		 *
		 * Params:
		 *      Flag = TRUE:使用する( デフォルト )  FALSE:使用しない
		 */
		extern int SetUseTransColor(int Flag);

		/**
		 * 透過色機能を使用することを前提とした画像データの読み込み処理を行うかどうかを設定する( TRUE にすると SetDrawMode(DX_DRAWMODE_BILINEAR); をした状態で DrawGraphF 等の浮動小数点型座標を受け取る関数で小数点以下の値を指定した場合に発生する描画結果の不自然を緩和する効果があります ( デフォルトは FALSE ) )
		 */
		extern int SetUseTransColorGraphCreateFlag(int Flag);

		/**
		 * SetUseAlphaChannelGraphCreateFlag の旧名称
		 */
		extern int SetUseGraphAlphaChannel(int Flag);

		/**
		 * GetUseAlphaChannelGraphCreateFlag の旧名称
		 */
		extern int GetUseGraphAlphaChannel();

		/**
		 * αチャンネル付きグラフィックハンドルを作成するかどうかを設定する
		 *
		 * Params:
		 *      Flag = TRUE:αチャンネル付き   FALSE:αチャンネル無し
		 */
		extern int SetUseAlphaChannelGraphCreateFlag(int Flag);

		/**
		 * αチャンネル付きグラフィックハンドルを作成するかどうかを取得する
		 *
		 * Returns: TRUE:αチャンネル付き   FALSE:αチャンネル無し
		 */
		extern int GetUseAlphaChannelGraphCreateFlag();

		/**
		 * Direct3D の管理テクスチャ機能を使用するグラフィックハンドルを作成するかどうかを設定する、管理機能を使用するとグラフィックスデバイスのVRAM容量以上の画像を扱うことができる代わりにシステムメモリの使用量が増えます
		 *
		 * Params:
		 *      Flag = TRUE:管理機能を使用する( デフォルト )  FALSE:管理機能を使用しない
		 */
		extern int SetUseNotManageTextureFlag(int Flag);

		/**
		 * Direct3D の管理テクスチャ機能を使用するグラフィックハンドルを作成するかどうかを取得する
		 */
		extern int GetUseNotManageTextureFlag();

		/**
		 * 作成するグラフィックハンドルで使用する環境依存のテクスチャフォーマットを指定する( Direct3D9環境なら DX_TEXTUREFORMAT_DIRECT3D9_R8G8B8 など、0 を渡すと解除 )
		 */
		extern int SetUsePlatformTextureFormat(int PlatformTextureFormat);

		/**
		 * 作成するグラフィックハンドルで使用する環境依存のテクスチャフォーマットを取得する
		 */
		extern int GetUsePlatformTextureFormat();

		/**
		 * 作成するグラフィックハンドルに適用する透過色を設定する
		 *
		 * Params:
		 *      Red = 透過色を光の3原色で表したもの( 0〜255 )
		 *      Green = 透過色を光の3原色で表したもの( 0〜255 )
		 *      Blue = 透過色を光の3原色で表したもの( 0〜255 )
		 */
		extern int SetTransColor(int Red, int Green, int Blue);

		/**
		 * 作成するグラフィックハンドルに適用する透過色を取得する
		 */
		extern int GetTransColor(int* Red, int* Green, int* Blue);

		/**
		 * 2のn乗ではないサイズの画像を複数のテクスチャを使用してVRAMの無駄を省くかどうかを設定する、複数のテクスチャを使用する場合はVRAM容量の節約ができる代わりに速度の低下やバイリニアフィルタリング描画時にテクスチャとテクスチャの境目が良く見るとわかる等の弊害があります
		 *
		 * Params:
		 *      Flag = TRUE:複数のテクスチャを使用する   FALSE:なるべく1枚のテクスチャで済ます( デフォルト )
		 */
		extern int SetUseDivGraphFlag(int Flag);

		/**
		 * LoadGraph などの際にファイル名の末尾に _a が付いたアルファチャンネル用の画像ファイルを追加で読み込む処理を行うかどうかを設定する
		 *
		 * Params:
		 *      Flag = TRUE:行う( デフォルト )  FALSE:行わない
		 */
		extern int SetUseAlphaImageLoadFlag(int Flag);

		/**
		 * 使用するテクスチャーの最大サイズを設定する( デフォルトではグラフィックスデバイスが対応している最大テクスチャーサイズ、引数に 0 を渡すとデフォルト設定になります )
		 */
		extern int SetUseMaxTextureSize(int Size);

		/**
		 * グラフィックハンドルを作成する際に使用した画像データのバックアップをして Direct3DDevice のデバイスロスト時に使用するかどうかを設定する、バックアップをしないとメモリの節約になりますが、復帰に掛かる時間が長くなり、メモリ上のファイルイメージからグラフィックハンドルを作成した場合は自動復帰ができないなどの弊害があります
		 *
		 * Params:
		 *      Flag = TRUE:バックアップをする( デフォルト )  FALSE:バックアップをしない
		 */
		extern int SetUseGraphBaseDataBackup(int Flag);

		/**
		 * グラフィックハンドルを作成する際に使用した画像データのバックアップをして Direct3DDevice のデバイスロスト時に使用するかどうかを取得する
		 */
		extern int GetUseGraphBaseDataBackup();

		/**
		 * ( 現在効果なし )グラフィックハンドルが持つ画像データをシステムメモリ上に作成するかどうかを設定する
		 *
		 * Params:
		 *      Flag = TRUE:システムメモリ上に作成  FALSE:VRAM上に作成( デフォルト )
		 */
		extern int SetUseSystemMemGraphCreateFlag(int Flag);

		/**
		 * ( 現在効果なし )グラフィックハンドルが持つ画像データをシステムメモリ上に作成するかどうかを取得する
		 */
		extern int GetUseSystemMemGraphCreateFlag();

		// 画像情報関係関数

		/**
		 * 指定のグラフィックハンドルのARGB8イメージを取得する( 現在動画ファイルをグラフィックハンドルで読み込んだ場合のみ使用可能 )
		 */
		extern const (uint)* GetFullColorImage(int GrHandle);

		/**
		 * グラフィックメモリ領域のロック
		 */
		extern int GraphLock(int GrHandle, int* PitchBuf, void** DataPointBuf, .COLORDATA** ColorDataPP = null, int WriteOnly = dxlib_d.DxDataType.FALSE);

		/**
		 * グラフィックメモリ領域のロック解除
		 */
		extern int GraphUnLock(int GrHandle);

		/**
		 * グラフィックハンドル専用のZバッファを持つかどうかを設定する
		 *
		 * Params:
		 *      GrHandle = 対象となるグラフィックハンドル( 描画対象として使用可能なグラフィックハンドルのみ有効 )
		 *      UseFlag = 専用のZバッファを持つかどうか( TRUE:持つ( デフォルト )  FALSE:持たない )
		 *      BitDepth = ビット深度( 16 or 24 or 32 )
		 */
		extern int SetUseGraphZBuffer(int GrHandle, int UseFlag, int BitDepth = -1);

		/**
		 * グラフィックハンドルのZバッファの状態を別のグラフィックハンドルのZバッファにコピーする( DestGrHandle も SrcGrHandle もZバッファを持っている描画対象にできるグラフィックハンドルで、サイズが同じであり、且つマルチサンプリング( アンチエイリアス )設定が無いことが条件 )
		 */
		extern int CopyGraphZBufferImage(int DestGrHandle, int SrcGrHandle);

		/**
		 * グラフィックスデバイスのデバイスロスト発生時に指定のグラフィックハンドルを削除するかどうかを設定する
		 *
		 * Params:
		 *      GrHandle = ?
		 *      DeleteFlag = TRUE:デバイスロスト時に削除する  FALSE:デバイスロストが発生しても削除しない
		 */
		extern int SetDeviceLostDeleteGraphFlag(int GrHandle, int DeleteFlag);

		/**
		 * グラフィックハンドルが持つ画像のサイズを得る
		 */
		extern int GetGraphSize(int GrHandle, int* SizeXBuf, int* SizeYBuf);

		/**
		 * グラフィックハンドルが持つ画像のサイズを得る( float型 )
		 */
		extern int GetGraphSizeF(int GrHandle, float* SizeXBuf, float* SizeYBuf);

		/**
		 * グラフィックハンドルが持つ1つ目のテクスチャのサイズを得る
		 */
		extern int GetGraphTextureSize(int GrHandle, int* SizeXBuf, int* SizeYBuf);

		/**
		 * LoadDivGraph や DerivationGraph で元画像の一部分を使用している場合に、指定のグラフィックハンドルが使用している元画像の範囲を取得する
		 */
		extern int GetGraphUseBaseGraphArea(int GrHandle, int* UseX, int* UseY, int* UseSizeX, int* UseSizeY);

		/**
		 * グラフィックハンドルが持つテクスチャのミップマップレベル数を取得する
		 */
		extern int GetGraphMipmapCount(int GrHandle);

		/**
		 * グラフィックハンドルが画像ファイルから読み込まれていた場合、その画像のファイルパスを取得する
		 */
		extern int GetGraphFilePath(int GrHandle, dxlib_d.DxDataType.TCHAR* FilePathBuffer);

		/**
		 * 指定のグラフィックハンドルが描画対象にできる( SetDrawScreen の引数に渡せる )グラフィックハンドルかどうかを取得する
		 *
		 * Returns: TRUE:描画対象にできるグラフィックハンドル FALSE:描画対象にできないグラフィックハンドル
		 */
		extern int CheckDrawValidGraph(int GrHandle);

		/**
		 * カラーデータを得る
		 */
		extern const (.COLORDATA)* GetTexColorData(int AlphaCh, int AlphaTest, int ColorBitDepth, int DrawValid = dxlib_d.DxDataType.FALSE);

		/**
		 * フォーマットに基づいたカラーデータを得る
		 */
		extern const (.COLORDATA)* GetTexColorData(const (.IMAGEFORMATDESC)* Format);

		/**
		 * 指定のフォーマットインデックスのカラーデータを得る
		 */
		extern const (.COLORDATA)* GetTexColorData(int FormatIndex);

		/**
		 * グラフィックスデバイスが対応している最大テクスチャサイズを取得する
		 */
		extern int GetMaxGraphTextureSize(int* SizeX, int* SizeY);

		/**
		 * グラフィックハンドルの画像を復元する関数が登録されているかどうかを取得する
		 *
		 * Returns: TRUE:登録されている  FALSE:登録されていない
		 */
		extern int GetValidRestoreShredPoint();

		/**
		 * ( 現在効果なし )これから新たにグラフィックを作成する場合に使用するカラー情報を取得する
		 */
		extern int GetCreateGraphColorData(.COLORDATA* ColorData, .IMAGEFORMATDESC* Format);

		// 画像パレット操作関係関数( ソフトウエア画像のみ使用可能 )

		/**
		 * グラフィックハンドルのパレットを取得する( ソフトウエアレンダリングモードで、且つパレット画像の場合のみ使用可能 )
		 */
		extern int GetGraphPalette(int GrHandle, int ColorIndex, int* Red, int* Green, int* Blue);

		/**
		 * グラフィックハンドルの SetGraphPalette で変更する前のパレットを取得する( ソフトウエアレンダリングモードで、且つパレット画像の場合のみ使用可能 )
		 */
		extern int GetGraphOriginalPalette(int GrHandle, int ColorIndex, int* Red, int* Green, int* Blue);

		/**
		 * グラフィックハンドルのパレットを変更する( ソフトウエアレンダリングモードで、且つパレット画像の場合のみ使用可能 )
		 */
		extern int SetGraphPalette(int GrHandle, int ColorIndex, uint Color);

		/**
		 * SetGraphPalette で変更したパレットを全て元に戻す( ソフトウエアレンダリングモードで、且つパレット画像の場合のみ使用可能 )
		 */
		extern int ResetGraphPalette(int GrHandle);

		// 図形描画関数

		/**
		 * 線を描画する
		 */
		extern int DrawLine(int x1, int y1, int x2, int y2, uint Color, int Thickness = 1);

		/**
		 * 線を描画する( アンチエイリアス付き )
		 */
		extern int DrawLineAA(float x1, float y1, float x2, float y2, uint Color, float Thickness = 1.0f);

		/**
		 * 四角形を描画する
		 */
		extern int DrawBox(int x1, int y1, int x2, int y2, uint Color, int FillFlag);

		/**
		 * 四角形を描画する( アンチエイリアス付き )
		 */
		extern int DrawBoxAA(float x1, float y1, float x2, float y2, uint Color, int FillFlag, float LineThickness = 1.0f);

		/**
		 * 中身を塗りつぶす四角形を描画する
		 */
		extern int DrawFillBox(int x1, int y1, int x2, int y2, uint Color);

		/**
		 * 枠だけの四角形の描画 する
		 */
		extern int DrawLineBox(int x1, int y1, int x2, int y2, uint Color);

		/**
		 * 円を描画する
		 */
		extern int DrawCircle(int x, int y, int r, uint Color, int FillFlag = dxlib_d.DxDataType.TRUE, int LineThickness = 1);

		/**
		 * 円を描画する( アンチエイリアス付き )
		 */
		extern int DrawCircleAA(float x, float y, float r, int posnum, uint Color, int FillFlag = dxlib_d.DxDataType.TRUE, float LineThickness = 1.0f);

		/**
		 * 楕円を描画する
		 */
		extern int DrawOval(int x, int y, int rx, int ry, uint Color, int FillFlag, int LineThickness = 1);

		/**
		 * 楕円を描画する( アンチエイリアス付き )
		 */
		extern int DrawOvalAA(float x, float y, float rx, float ry, int posnum, uint Color, int FillFlag, float LineThickness = 1.0f);

		/**
		 * 指定の矩形に収まる円( 楕円 )を描画する
		 */
		extern int DrawOval_Rect(int x1, int y1, int x2, int y2, uint Color, int FillFlag);

		/**
		 * 三角形を描画する
		 */
		extern int DrawTriangle(int x1, int y1, int x2, int y2, int x3, int y3, uint Color, int FillFlag);

		/**
		 * 三角形を描画する( アンチエイリアス付き )
		 */
		extern int DrawTriangleAA(float x1, float y1, float x2, float y2, float x3, float y3, uint Color, int FillFlag, float LineThickness = 1.0f);

		/**
		 * 四角形を描画する
		 */
		extern int DrawQuadrangle(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, uint Color, int FillFlag);

		/**
		 * 四角形を描画する( アンチエイリアス付き )
		 */
		extern int DrawQuadrangleAA(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, uint Color, int FillFlag, float LineThickness = 1.0f);

		/**
		 * 角の丸い四角形を描画する
		 */
		extern int DrawRoundRect(int x1, int y1, int x2, int y2, int rx, int ry, uint Color, int FillFlag);

		/**
		 * 角の丸い四角形を描画する( アンチエイリアス付き )
		 */
		extern int DrawRoundRectAA(float x1, float y1, float x2, float y2, float rx, float ry, int posnum, uint Color, int FillFlag, float LineThickness = 1.0f);

		/**
		 * DrawTriangleAA などのアンチエイリアス付き図形描画の準備を行う
		 */
		extern int BeginAADraw();

		/**
		 * DrawTriangleAA などのアンチエイリアス付き図形描画の後始末を行う
		 */
		extern int EndAADraw();

		/**
		 * 点を描画する
		 */
		extern int DrawPixel(int x, int y, uint Color);

		/**
		 * 指定点から境界色があるところまで塗りつぶす(境界色を -1 にすると指定点の色の領域を塗りつぶす)
		 */
		extern int Paint(int x, int y, uint FillColor, dxlib_d.DxDataType.ULONGLONG BoundaryColor = 0xFFFFFFFFFFFFFFFFUL);

		/**
		 * 点の集合を描画する
		 */
		extern int DrawPixelSet(const (.POINTDATA)* PointDataArray, int Num);

		/**
		 * 線の集合を描画する
		 */
		extern int DrawLineSet(const (.LINEDATA)* LineDataArray, int Num);

		/**
		 * 3Dの点を描画する
		 */
		extern int DrawPixel3D(.VECTOR Pos, uint Color);

		/**
		 * 3Dの点を描画する
		 */
		extern int DrawPixel3DD(.VECTOR_D Pos, uint Color);

		/**
		 * 3Dの線分を描画する
		 */
		extern int DrawLine3D(.VECTOR Pos1, .VECTOR Pos2, uint Color);

		/**
		 * 3Dの線分を描画する
		 */
		extern int DrawLine3DD(.VECTOR_D Pos1, .VECTOR_D Pos2, uint Color);

		/**
		 * 3Dの三角形を描画する
		 */
		extern int DrawTriangle3D(.VECTOR Pos1, .VECTOR Pos2, .VECTOR Pos3, uint Color, int FillFlag);

		/**
		 * 3Dの三角形を描画する
		 */
		extern int DrawTriangle3DD(.VECTOR_D Pos1, .VECTOR_D Pos2, .VECTOR_D Pos3, uint Color, int FillFlag);

		/**
		 * 3Dの立方体を描画する
		 */
		extern int DrawCube3D(.VECTOR Pos1, .VECTOR Pos2, uint DifColor, uint SpcColor, int FillFlag);

		/**
		 * 3Dの立方体を描画する
		 */
		extern int DrawCube3DD(.VECTOR_D Pos1, .VECTOR_D Pos2, uint DifColor, uint SpcColor, int FillFlag);

		/**
		 * 3Dの立方体の集合を描画する
		 */
		extern int DrawCubeSet3D(.CUBEDATA* CubeDataArray, int Num, int FillFlag);

		/**
		 * 3Dの球体を描画する
		 */
		extern int DrawSphere3D(.VECTOR CenterPos, float r, int DivNum, uint DifColor, uint SpcColor, int FillFlag);

		/**
		 * 3Dの球体を描画する
		 */
		extern int DrawSphere3DD(.VECTOR_D CenterPos, double r, int DivNum, uint DifColor, uint SpcColor, int FillFlag);

		/**
		 * 3Dのカプセルを描画する
		 */
		extern int DrawCapsule3D(.VECTOR Pos1, .VECTOR Pos2, float r, int DivNum, uint DifColor, uint SpcColor, int FillFlag);

		/**
		 * 3Dのカプセルを描画する
		 */
		extern int DrawCapsule3DD(.VECTOR_D Pos1, .VECTOR_D Pos2, double r, int DivNum, uint DifColor, uint SpcColor, int FillFlag);

		/**
		 * 3Dの円錐を描画する
		 */
		extern int DrawCone3D(.VECTOR TopPos, .VECTOR BottomPos, float r, int DivNum, uint DifColor, uint SpcColor, int FillFlag);

		/**
		 * 3Dの円錐を描画する
		 */
		extern int DrawCone3DD(.VECTOR_D TopPos, .VECTOR_D BottomPos, double r, int DivNum, uint DifColor, uint SpcColor, int FillFlag);

		// 画像描画関数

		/**
		 * 画像ファイルを読みこんで画面に描画する
		 */
		extern int LoadGraphScreen(int x, int y, const (dxlib_d.DxDataType.TCHAR)* GraphName, int TransFlag);

		/**
		 * 画像ファイルを読みこんで画面に描画する
		 */
		extern int LoadGraphScreenWithStrLen(int x, int y, const (dxlib_d.DxDataType.TCHAR)* GraphName, size_t GraphNameLength, int TransFlag);

		/**
		 * 画像の等倍描画
		 */
		extern int DrawGraph(int x, int y, int GrHandle, int TransFlag);

		/**
		 * 画像の拡大描画
		 */
		extern int DrawExtendGraph(int x1, int y1, int x2, int y2, int GrHandle, int TransFlag);

		/**
		 * 画像の回転描画
		 */
		extern int DrawRotaGraph(int x, int y, double ExRate, double Angle, int GrHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像の回転描画2( 回転中心指定付き )
		 */
		extern int DrawRotaGraph2(int x, int y, int cx, int cy, double ExtRate, double Angle, int GrHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像の回転描画3( 回転中心指定付き+縦横拡大率別指定版 )
		 */
		extern int DrawRotaGraph3(int x, int y, int cx, int cy, double ExtRateX, double ExtRateY, double Angle, int GrHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像の回転描画( 高速版、座標計算のアルゴリズムが簡略化されています、描画結果に不都合が無ければこちらの方が高速です )
		 */
		extern int DrawRotaGraphFast(int x, int y, float ExRate, float Angle, int GrHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像の回転描画2( 回転中心指定付き )( 高速版、座標計算のアルゴリズムが簡略化されています、描画結果に不都合が無ければこちらの方が高速です )
		 */
		extern int DrawRotaGraphFast2(int x, int y, int cx, int cy, float ExtRate, float Angle, int GrHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像の回転描画3( 回転中心指定付き+縦横拡大率別指定版 )( 高速版、座標計算のアルゴリズムが簡略化されています、描画結果に不都合が無ければこちらの方が高速です )
		 */
		extern int DrawRotaGraphFast3(int x, int y, int cx, int cy, float ExtRateX, float ExtRateY, float Angle, int GrHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像の自由変形描画
		 */
		extern int DrawModiGraph(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, int GrHandle, int TransFlag);

		/**
		 * 画像の左右反転描画
		 */
		extern int DrawTurnGraph(int x, int y, int GrHandle, int TransFlag);

		/**
		 * 画像の反転描画
		 */
		extern int DrawReverseGraph(int x, int y, int GrHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像の描画( 座標指定が float 版 )
		 */
		extern int DrawGraphF(float xf, float yf, int GrHandle, int TransFlag);

		/**
		 * 画像の拡大描画( 座標指定が float 版 )
		 */
		extern int DrawExtendGraphF(float x1f, float y1f, float x2f, float y2, int GrHandle, int TransFlag);

		/**
		 * 画像の回転描画( 座標指定が float 版 )
		 */
		extern int DrawRotaGraphF(float xf, float yf, double ExRate, double Angle, int GrHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像の回転描画2( 回転中心指定付き )( 座標指定が float 版 )
		 */
		extern int DrawRotaGraph2F(float xf, float yf, float cxf, float cyf, double ExtRate, double Angle, int GrHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像の回転描画3( 回転中心指定付き+縦横拡大率別指定版 )( 座標指定が float 版 )
		 */
		extern int DrawRotaGraph3F(float xf, float yf, float cxf, float cyf, double ExtRateX, double ExtRateY, double Angle, int GrHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像の回転描画( 座標指定が float 版 )( 高速版、座標計算のアルゴリズムが簡略化されています、描画結果に不都合が無ければこちらの方が高速です )
		 */
		extern int DrawRotaGraphFastF(float xf, float yf, float ExRate, float Angle, int GrHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像の回転描画2( 回転中心指定付き )( 座標指定が float 版 )( 高速版、座標計算のアルゴリズムが簡略化されています、描画結果に不都合が無ければこちらの方が高速です )
		 */
		extern int DrawRotaGraphFast2F(float xf, float yf, float cxf, float cyf, float ExtRate, float Angle, int GrHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像の回転描画3( 回転中心指定付き+縦横拡大率別指定版 )( 座標指定が float 版 )( 高速版、座標計算のアルゴリズムが簡略化されています、描画結果に不都合が無ければこちらの方が高速です )
		 */
		extern int DrawRotaGraphFast3F(float xf, float yf, float cxf, float cyf, float ExtRateX, float ExtRateY, float Angle, int GrHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像の自由変形描画( 座標指定が float 版 )
		 */
		extern int DrawModiGraphF(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, int GrHandle, int TransFlag);

		/**
		 * 画像の左右反転描画( 座標指定が float 版 )
		 */
		extern int DrawTurnGraphF(float xf, float yf, int GrHandle, int TransFlag);

		/**
		 * 画像の反転描画( 座標指定が float 版 )
		 */
		extern int DrawReverseGraphF(float xf, float yf, int GrHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * チップ画像を使った2Dマップ描画
		 */
		extern int DrawChipMap(int Sx, int Sy, int XNum, int YNum, const (int)* MapData, int ChipTypeNum, int MapDataPitch, const (int)* ChipGrHandle, int TransFlag);

		/**
		 * チップ画像を使った2Dマップ描画
		 */
		extern int DrawChipMap(int MapWidth, int MapHeight, const (int)* MapData, int ChipTypeNum, const (int)* ChipGrHandle, int TransFlag, int MapDrawPointX, int MapDrawPointY, int MapDrawWidth, int MapDrawHeight, int ScreenX, int ScreenY);

		/**
		 * 画像を指定領域にタイル状に描画する
		 */
		extern int DrawTile(int x1, int y1, int x2, int y2, int Tx, int Ty, double ExtRate, double Angle, int GrHandle, int TransFlag);

		/**
		 * 画像の指定矩形部分のみを等倍描画
		 */
		extern int DrawRectGraph(int DestX, int DestY, int SrcX, int SrcY, int Width, int Height, int GraphHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像の指定矩形部分のみを拡大描画
		 */
		extern int DrawRectExtendGraph(int DestX1, int DestY1, int DestX2, int DestY2, int SrcX, int SrcY, int SrcWidth, int SrcHeight, int GraphHandle, int TransFlag);

		/**
		 * 画像の指定矩形部分のみを回転描画
		 */
		extern int DrawRectRotaGraph(int x, int y, int SrcX, int SrcY, int Width, int Height, double ExtRate, double Angle, int GraphHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像の指定矩形部分のみを回転描画2( 回転中心指定付き )
		 */
		extern int DrawRectRotaGraph2(int x, int y, int SrcX, int SrcY, int Width, int Height, int cx, int cy, double ExtRate, double Angle, int GraphHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像の指定矩形部分のみを回転描画3( 回転中心指定付き+縦横拡大率別指定版 )
		 */
		extern int DrawRectRotaGraph3(int x, int y, int SrcX, int SrcY, int Width, int Height, int cx, int cy, double ExtRateX, double ExtRateY, double Angle, int GraphHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像の指定矩形部分のみを回転描画( 高速版、座標計算のアルゴリズムが簡略化されています、描画結果に不都合が無ければこちらの方が高速です )
		 */
		extern int DrawRectRotaGraphFast(int x, int y, int SrcX, int SrcY, int Width, int Height, float ExtRate, float Angle, int GraphHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像の指定矩形部分のみを回転描画2( 回転中心指定付き )( 高速版、座標計算のアルゴリズムが簡略化されています、描画結果に不都合が無ければこちらの方が高速です )
		 */
		extern int DrawRectRotaGraphFast2(int x, int y, int SrcX, int SrcY, int Width, int Height, int cx, int cy, float ExtRate, float Angle, int GraphHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像の指定矩形部分のみを回転描画3( 回転中心指定付き+縦横拡大率別指定版 )( 高速版、座標計算のアルゴリズムが簡略化されています、描画結果に不都合が無ければこちらの方が高速です )
		 */
		extern int DrawRectRotaGraphFast3(int x, int y, int SrcX, int SrcY, int Width, int Height, int cx, int cy, float ExtRateX, float ExtRateY, float Angle, int GraphHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像の指定矩形部分のみを自由変形描画
		 */
		extern int DrawRectModiGraph(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, int SrcX, int SrcY, int Width, int Height, int GraphHandle, int TransFlag);

		/**
		 * 画像の指定矩形部分のみを等倍描画( 座標指定が float 版 )
		 */
		extern int DrawRectGraphF(float DestX, float DestY, int SrcX, int SrcY, int Width, int Height, int GraphHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像の指定矩形部分のみを拡大描画( 座標指定が float 版 )
		 */
		extern int DrawRectExtendGraphF(float DestX1, float DestY1, float DestX2, float DestY2, int SrcX, int SrcY, int SrcWidth, int SrcHeight, int GraphHandle, int TransFlag);

		/**
		 * 画像の指定矩形部分のみを回転描画( 座標指定が float 版 )
		 */
		extern int DrawRectRotaGraphF(float x, float y, int SrcX, int SrcY, int Width, int Height, double ExtRate, double Angle, int GraphHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像の指定矩形部分のみを回転描画2( 回転中心指定付き )( 座標指定が float 版 )
		 */
		extern int DrawRectRotaGraph2F(float x, float y, int SrcX, int SrcY, int Width, int Height, float cxf, float cyf, double ExtRate, double Angle, int GraphHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像の指定矩形部分のみを回転描画3( 回転中心指定付き+縦横拡大率別指定版 )( 座標指定が float 版 )
		 */
		extern int DrawRectRotaGraph3F(float x, float y, int SrcX, int SrcY, int Width, int Height, float cxf, float cyf, double ExtRateX, double ExtRateY, double Angle, int GraphHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像の指定矩形部分のみを回転描画( 座標指定が float 版 )( 高速版、座標計算のアルゴリズムが簡略化されています、描画結果に不都合が無ければこちらの方が高速です )
		 */
		extern int DrawRectRotaGraphFastF(float x, float y, int SrcX, int SrcY, int Width, int Height, float ExtRate, float Angle, int GraphHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像の指定矩形部分のみを回転描画2( 回転中心指定付き )( 座標指定が float 版 )( 高速版、座標計算のアルゴリズムが簡略化されています、描画結果に不都合が無ければこちらの方が高速です )
		 */
		extern int DrawRectRotaGraphFast2F(float x, float y, int SrcX, int SrcY, int Width, int Height, float cxf, float cyf, float ExtRate, float Angle, int GraphHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像の指定矩形部分のみを回転描画3( 回転中心指定付き+縦横拡大率別指定版 )( 座標指定が float 版 )( 高速版、座標計算のアルゴリズムが簡略化されています、描画結果に不都合が無ければこちらの方が高速です )
		 */
		extern int DrawRectRotaGraphFast3F(float x, float y, int SrcX, int SrcY, int Width, int Height, float cxf, float cyf, float ExtRateX, float ExtRateY, float Angle, int GraphHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像の指定矩形部分のみを自由変形描画( 座標指定が float 版 )
		 */
		extern int DrawRectModiGraphF(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, int SrcX, int SrcY, int Width, int Height, int GraphHandle, int TransFlag);

		/**
		 * ブレンド画像と合成して画像を等倍描画する
		 */
		extern int DrawBlendGraph(int x, int y, int GrHandle, int TransFlag, int BlendGraph, int BorderParam, int BorderRange);

		/**
		 * ブレンド画像と合成して画像を等倍描画する( ブレンド画像の起点座標を指定する引数付き )
		 */
		extern int DrawBlendGraphPos(int x, int y, int GrHandle, int TransFlag, int bx, int by, int BlendGraph, int BorderParam, int BorderRange);

		/**
		 * 円グラフ的な描画を行う( GrHandle の画像の上下左右の端は透過色にしておく必要があります )
		 */
		extern int DrawCircleGauge(int CenterX, int CenterY, double Percent, int GrHandle, double StartPercent = 0.0, double Scale = 1.0, int ReverseX = dxlib_d.DxDataType.FALSE, int ReverseY = dxlib_d.DxDataType.FALSE);

		/**
		 * 円グラフ的な描画を行う( GrHandle の画像の上下左右の端は透過色にしておく必要があります )( 座標指定が float 版 )
		 */
		extern int DrawCircleGaugeF(float CenterX, float CenterY, double Percent, int GrHandle, double StartPercent = 0.0, double Scale = 1.0, int ReverseX = dxlib_d.DxDataType.FALSE, int ReverseY = dxlib_d.DxDataType.FALSE);

		/**
		 * Zバッファに対して画像の等倍描画
		 */
		extern int DrawGraphToZBuffer(int X, int Y, int GrHandle, int WriteZMode /* DX_ZWRITE_MASK 等 */);

		/**
		 * Zバッファに対して画像の左右反転描画
		 */
		extern int DrawTurnGraphToZBuffer(int x, int y, int GrHandle, int WriteZMode /* DX_ZWRITE_MASK 等 */);

		/**
		 * Zバッファに対して画像の反転描画
		 */
		extern int DrawReverseGraphToZBuffer(int x, int y, int GrHandle, int WriteZMode /* DX_ZWRITE_MASK 等 */, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * Zバッファに対して画像の拡大描画
		 */
		extern int DrawExtendGraphToZBuffer(int x1, int y1, int x2, int y2, int GrHandle, int WriteZMode /* DX_ZWRITE_MASK 等 */);

		/**
		 * Zバッファに対して画像の回転描画
		 */
		extern int DrawRotaGraphToZBuffer(int x, int y, double ExRate, double Angle, int GrHandle, int WriteZMode /* DX_ZWRITE_MASK 等 */, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * Zバッファに対して画像の回転描画2( 回転中心指定付き )
		 */
		extern int DrawRotaGraph2ToZBuffer(int x, int y, int cx, int cy, double ExtRate, double Angle, int GrHandle, int WriteZMode /* DX_ZWRITE_MASK 等 */, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * Zバッファに対して画像の回転描画3( 回転中心指定付き+縦横拡大率別指定版 )
		 */
		extern int DrawRotaGraph3ToZBuffer(int x, int y, int cx, int cy, double ExtRateX, double ExtRateY, double Angle, int GrHandle, int WriteZMode /* DX_ZWRITE_MASK 等 */, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * Zバッファに対して画像の回転描画( 高速版、座標計算のアルゴリズムが簡略化されています、描画結果に不都合が無ければこちらの方が高速です )
		 */
		extern int DrawRotaGraphFastToZBuffer(int x, int y, float ExRate, float Angle, int GrHandle, int WriteZMode /* DX_ZWRITE_MASK 等 */, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * Zバッファに対して画像の回転描画2( 回転中心指定付き )( 高速版、座標計算のアルゴリズムが簡略化されています、描画結果に不都合が無ければこちらの方が高速です )
		 */
		extern int DrawRotaGraphFast2ToZBuffer(int x, int y, int cx, int cy, float ExtRate, float Angle, int GrHandle, int WriteZMode /* DX_ZWRITE_MASK 等 */, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * Zバッファに対して画像の回転描画3( 回転中心指定付き+縦横拡大率別指定版 )( 高速版、座標計算のアルゴリズムが簡略化されています、描画結果に不都合が無ければこちらの方が高速です )
		 */
		extern int DrawRotaGraphFast3ToZBuffer(int x, int y, int cx, int cy, float ExtRateX, float ExtRateY, float Angle, int GrHandle, int WriteZMode /* DX_ZWRITE_MASK 等 */, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * Zバッファに対して画像の自由変形描画
		 */
		extern int DrawModiGraphToZBuffer(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, int GrHandle, int WriteZMode /* DX_ZWRITE_MASK 等 */);

		/**
		 * Zバッファに対して矩形の描画
		 */
		extern int DrawBoxToZBuffer(int x1, int y1, int x2, int y2, int FillFlag, int WriteZMode /* DX_ZWRITE_MASK 等 */);

		/**
		 * Zバッファに対して円の描画
		 */
		extern int DrawCircleToZBuffer(int x, int y, int r, int FillFlag, int WriteZMode /* DX_ZWRITE_MASK 等 */);

		/**
		 * Zバッファに対して三角形を描画する
		 */
		extern int DrawTriangleToZBuffer(int x1, int y1, int x2, int y2, int x3, int y3, int FillFlag, int WriteZMode /* DX_ZWRITE_MASK 等 */);

		/**
		 * Zバッファに対して四角形を描画する
		 */
		extern int DrawQuadrangleToZBuffer(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, int FillFlag, int WriteZMode /* DX_ZWRITE_MASK 等 */);

		/**
		 * Zバッファに対して角の丸い四角形を描画する
		 */
		extern int DrawRoundRectToZBuffer(int x1, int y1, int x2, int y2, int rx, int ry, int FillFlag, int WriteZMode /* DX_ZWRITE_MASK 等 */);

		/**
		 * 2Dポリゴンを描画する
		 *
		 * Params:
		 *      Vertex = 三角形を形成する頂点配列の先頭アドレス( 頂点の数はポリゴンの数×3 )
		 *      PolygonNum = 描画するポリゴンの数
		 *      GrHandle = 使用するグラフィックハンドル
		 *      TransFlag = 透過色処理を行うかどうか( TRUE:行う  FALSE:行わない )
		 *      UVScaling = 基本FALSEでOK
		 */
		extern int DrawPolygon(const (.VERTEX)* VertexArray, int PolygonNum, int GrHandle, int TransFlag, int UVScaling = dxlib_d.DxDataType.FALSE);

		/**
		 * 2Dポリゴンを描画する
		 */
		extern int DrawPolygon2D(const (.VERTEX2D)* VertexArray, int PolygonNum, int GrHandle, int TransFlag);

		/**
		 * 3Dポリゴンを描画する
		 */
		extern int DrawPolygon3D(const (.VERTEX3D)* VertexArray, int PolygonNum, int GrHandle, int TransFlag);

		/**
		 * 2Dポリゴンを描画する( 頂点インデックスを使用 )
		 */
		extern int DrawPolygonIndexed2D(const (.VERTEX2D)* VertexArray, int VertexNum, const (ushort)* IndexArray, int PolygonNum, int GrHandle, int TransFlag);

		/**
		 * 3Dポリゴンを描画する( 頂点インデックスを使用 )
		 */
		extern int DrawPolygonIndexed3D(const (.VERTEX3D)* VertexArray, int VertexNum, const (ushort)* IndexArray, int PolygonNum, int GrHandle, int TransFlag);

		/**
		 * 3Dポリゴンを描画する( 頂点インデックスを使用 )( 旧バージョン用 )
		 */
		extern int DrawPolygonIndexed3DBase(const (.VERTEX_3D)* VertexArray, int VertexNum, const (ushort)* IndexArray, int IndexNum, int PrimitiveType /* DX_PRIMTYPE_TRIANGLELIST 等 */, int GrHandle, int TransFlag);

		/**
		 * 3Dポリゴンを描画する( 旧バージョン用 )
		 */
		extern int DrawPolygon3DBase(const (.VERTEX_3D)* VertexArray, int VertexNum, int PrimitiveType /* DX_PRIMTYPE_TRIANGLELIST 等 */, int GrHandle, int TransFlag);

		/**
		 * 3Dポリゴンを描画する( 旧バージョン用 )
		 */
		extern int DrawPolygon3D(const (.VERTEX_3D)* VertexArray, int PolygonNum, int GrHandle, int TransFlag);

		/**
		 * 2Dプリミティブを描画する
		 */
		extern int DrawPolygonBase(const (.VERTEX)* VertexArray, int VertexNum, int PrimitiveType /* DX_PRIMTYPE_TRIANGLELIST 等 */, int GrHandle, int TransFlag, int UVScaling = dxlib_d.DxDataType.FALSE);

		/**
		 * 2Dプリミティブを描画する
		 */
		extern int DrawPrimitive2D(const (.VERTEX2D)* VertexArray, int VertexNum, int PrimitiveType /* DX_PRIMTYPE_TRIANGLELIST 等 */, int GrHandle, int TransFlag);

		/**
		 * 3Dプリミティブを描画する
		 */
		extern int DrawPrimitive3D(const (.VERTEX3D)* VertexArray, int VertexNum, int PrimitiveType /* DX_PRIMTYPE_TRIANGLELIST 等 */, int GrHandle, int TransFlag);

		/**
		 * 2Dプリミティブを描画する(頂点インデックス使用)
		 */
		extern int DrawPrimitiveIndexed2D(const (.VERTEX2D)* VertexArray, int VertexNum, const (ushort)* IndexArray, int IndexNum, int PrimitiveType /* DX_PRIMTYPE_TRIANGLELIST 等 */, int GrHandle, int TransFlag);

		/**
		 * 3Dプリミティブを描画する(頂点インデックス使用)
		 */
		extern int DrawPrimitiveIndexed3D(const (.VERTEX3D)* VertexArray, int VertexNum, const (ushort)* IndexArray, int IndexNum, int PrimitiveType /* DX_PRIMTYPE_TRIANGLELIST 等 */, int GrHandle, int TransFlag);

		/**
		 * 頂点バッファを使用して3Dポリゴンを描画する
		 */
		extern int DrawPolygon3D_UseVertexBuffer(int VertexBufHandle, int GrHandle, int TransFlag);

		/**
		 * 頂点バッファを使用して3Dプリミティブを描画する
		 */
		extern int DrawPrimitive3D_UseVertexBuffer(int VertexBufHandle, int PrimitiveType /* DX_PRIMTYPE_TRIANGLELIST 等 */, int GrHandle, int TransFlag);

		/**
		 * 頂点バッファを使用して3Dプリミティブを描画する
		 */
		extern int DrawPrimitive3D_UseVertexBuffer2(int VertexBufHandle, int PrimitiveType /* DX_PRIMTYPE_TRIANGLELIST 等 */, int StartVertex, int UseVertexNum, int GrHandle, int TransFlag);

		/**
		 * 頂点バッファとインデックスバッファを使用して3Dポリゴンを描画する
		 */
		extern int DrawPolygonIndexed3D_UseVertexBuffer(int VertexBufHandle, int IndexBufHandle, int GrHandle, int TransFlag);

		/**
		 * 頂点バッファとインデックスバッファを使用して3Dプリミティブを描画する
		 */
		extern int DrawPrimitiveIndexed3D_UseVertexBuffer(int VertexBufHandle, int IndexBufHandle, int PrimitiveType /* DX_PRIMTYPE_TRIANGLELIST 等 */, int GrHandle, int TransFlag);

		/**
		 * 頂点バッファとインデックスバッファを使用して3Dプリミティブを描画する
		 */
		extern int DrawPrimitiveIndexed3D_UseVertexBuffer2(int VertexBufHandle, int IndexBufHandle, int PrimitiveType /* DX_PRIMTYPE_TRIANGLELIST 等 */, int BaseVertex, int StartVertex, int UseVertexNum, int StartIndex, int UseIndexNum, int GrHandle, int TransFlag);

		/**
		 * 画像の3D描画
		 */
		extern int DrawGraph3D(float x, float y, float z, int GrHandle, int TransFlag);

		/**
		 * 画像の拡大3D描画
		 */
		extern int DrawExtendGraph3D(float x, float y, float z, double ExRateX, double ExRateY, int GrHandle, int TransFlag);

		/**
		 * 画像の回転3D描画
		 */
		extern int DrawRotaGraph3D(float x, float y, float z, double ExRate, double Angle, int GrHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像の回転3D描画(回転中心指定型)
		 */
		extern int DrawRota2Graph3D(float x, float y, float z, float cx, float cy, double ExtRateX, double ExtRateY, double Angle, int GrHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 画像の自由変形3D描画
		 */
		extern int DrawModiBillboard3D(.VECTOR Pos, float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, int GrHandle, int TransFlag);

		/**
		 * 3D空間上に画像を描画
		 */
		extern int DrawBillboard3D(.VECTOR Pos, float cx, float cy, float Size, float Angle, int GrHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		// 描画設定関係関数

		/**
		 * 描画モードを設定する
		 */
		extern int SetDrawMode(int DrawMode);

		/**
		 * 描画モードを取得する
		 */
		extern int GetDrawMode();

		/**
		 * 描画ブレンドモードを設定する
		 */
		extern int SetDrawBlendMode(int BlendMode, int BlendParam);

		/**
		 * 描画ブレンドモードを取得する
		 */
		extern int GetDrawBlendMode(int* BlendMode, int* BlendParam);

		/**
		 * 描画時のアルファテストの設定を行う( TestMode:テストモード( DX_CMP_GREATER等 -1でデフォルト動作に戻す )  TestParam:描画アルファ値との比較に使用する値( 0〜255 ) )
		 *
		 * Params:
		 *      TestMode = ?
		 *      TestParam = ?
		 */
		extern int SetDrawAlphaTest(int TestMode, int TestParam);

		/**
		 * 描画時のアルファテストの設定を取得する( TestMode:テストモード( DX_CMP_GREATER等 -1でデフォルト動作に戻す )  TestParam:描画アルファ値との比較に使用する値( 0〜255 ) )
		 *
		 * Params:
		 *      TestMode = ?
		 *      TestParam = ?
		 */
		extern int GetDrawAlphaTest(int* TestMode, int* TestParam);

		/**
		 * ( SetBlendGraphParam の BlendType = DX_BLENDGRAPHTYPE_WIPE の処理を行う旧関数 )描画処理時に描画する画像とブレンドするαチャンネル付き画像をセットする( BlendGraph を -1 でブレンド機能を無効 )
		 */
		extern int SetBlendGraph(int BlendGraph, int BorderParam, int BorderRange);

		/**
		 * 描画処理時に描画する画像とブレンドする画像のブレンド設定を行う、BlendGraph を -1 にすれば設定を解除、その場合 BlendType とその後ろのパラメータは無視される
		 */
		extern int SetBlendGraphParam(int BlendGraph, int BlendType, ...);

		// int SetBlendGraphParam(int BlendGraph, int BlendType = DX_BLENDGRAPHTYPE_NORMAL, int Ratio = ( 0( ブレンド率0% )〜255( ブレンド率100% ) ));
		// int SetBlendGraphParam(int BlendGraph, int BlendType = DX_BLENDGRAPHTYPE_WIPE, int BorderParam = 境界位置(0〜255), int BorderRange = 境界幅(指定できる値は1、64、128、255の4つ));
		// int SetBlendGraphParam(int BlendGraph, int BlendType = DX_BLENDGRAPHTYPE_ALPHA);

		/**
		 * ブレンド画像の起点座標をセットする
		 */
		extern int SetBlendGraphPosition(int x, int y);

		/**
		 * ブレンド画像の適応座標モードを設定する
		 */
		extern int SetBlendGraphPositionMode(int BlendGraphPositionMode /* DX_BLENDGRAPH_POSMODE_DRAWGRAPH など */);

		/**
		 * 描画輝度を設定する
		 */
		extern int SetDrawBright(int RedBright, int GreenBright, int BlueBright);

		/**
		 * 描画輝度を取得する
		 */
		extern int GetDrawBright(int* Red, int* Green, int* Blue);

		/**
		 * 描画先のアルファチャンネルの内容を書き換えるかを設定する
		 *
		 * Params:
		 *      Flag = FALSE:書き換えない  TRUE:書き換える( デフォルト )
		 */
		extern int SetWriteAlphaChannelFlag(int Flag);

		/**
		 * 描画先のアルファチャンネルの内容を書き換えるかを取得する
		 *
		 * Returns: FALSE:書き換えない  TRUE:書き換える( デフォルト )
		 */
		extern int GetWriteAlphaChannelFlag();

		/**
		 * 描画先のアルファチャンネルの内容を書き換えないことができるかどうかを取得する
		 *
		 * Returns: TRUE:書き換えないことができる  FALSE:書き換えないことができない
		 */
		extern int CheckSeparateAlphaBlendEnable();

		/**
		 * 描画する画像のRGB成分を無視するかどうかを指定する
		 *
		 * Params:
		 *      EnableFlag = この機能を使うかどうか( TRUE:使う  FALSE:使わない( デフォルト ) )
		 */
		extern int SetIgnoreDrawGraphColor(int EnableFlag);

		/**
		 * 最大異方性値を設定する
		 */
		extern int SetMaxAnisotropy(int MaxAnisotropy);

		/**
		 * 最大異方性値を取得する
		 */
		extern int GetMaxAnisotropy();

		/**
		 * 3D処理で使用する座標値が 10000000.0f などの大きな値になっても描画の崩れを小さく抑える処理を使用するかどうかを設定する、DxLib_Init の呼び出し前でのみ使用可能
		 *
		 * Params:
		 *      UseFlag = TRUE:描画の崩れを抑える処理を使用する( CPU負荷が上がります )  FALSE:描画の崩れを抑える処理は使用しない( デフォルト )
		 */
		extern int SetUseLarge3DPositionSupport(int UseFlag);

		/**
		 * Zバッファを使用するかどうかを設定する( 2Dと3D描画に影響 )
		 *
		 * Params:
		 *      Flag = TRUE:Zバッファを使用する  FALSE:Zバッファを使用しない( デフォルト )
		 */
		extern int SetUseZBufferFlag(int Flag);

		/**
		 * Zバッファに書き込みを行うかどうかを設定する( 2Dと3D描画に影響 )
		 *
		 * Params:
		 *      Flag = TRUE:書き込みを行う  FALSE:書き込みを行わない( デフォルト )
		 */
		extern int SetWriteZBufferFlag(int Flag);

		/**
		 * ZバッファのZ値と書き込むZ値との比較モードを設定する( 2Dと3D描画に影響 )
		 *
		 * Params:
		 *      CmpType = DX_CMP_NEVER等( デフォルト:DX_CMP_LESSEQUAL )
		 */
		extern int SetZBufferCmpType(int CmpType /* DX_CMP_NEVER 等 */);

		/**
		 * 書き込むZ値のバイアスを設定する( 2Dと3D描画に影響 )( Bias:バイアス値( デフォルト:0 ) )
		 *
		 * Params:
		 *      Bias = ?
		 */
		extern int SetZBias(int Bias);

		/**
		 * Zバッファを使用するかどうかを設定する( 3D描画のみに影響 )
		 *
		 * Params:
		 *      Flag = TRUE:Zバッファを使用する  FALSE:Zバッファを使用しない( デフォルト )
		 */
		extern int SetUseZBuffer3D(int Flag);

		/**
		 * Zバッファに書き込みを行うかどうかを設定する( 3D描画のみに影響 )
		 *
		 * Params:
		 *      Flag = TRUE:書き込みを行う  FALSE:書き込みを行わない( デフォルト )
		 */
		extern int SetWriteZBuffer3D(int Flag);

		/**
		 * ZバッファのZ値と書き込むZ値との比較モードを設定する( 3D描画のみに影響 )
		 *
		 * Params:
		 *      CmpType = DX_CMP_NEVER等( デフォルト:DX_CMP_LESSEQUAL )
		 */
		extern int SetZBufferCmpType3D(int CmpType /* DX_CMP_NEVER 等 */);

		/**
		 * 書き込むZ値のバイアスを設定する( 3D描画のみに影響 )( Bias:バイアス値( デフォルト:0 ) )
		 *
		 * Params:
		 *      Bias = ?
		 */
		extern int SetZBias3D(int Bias);

		/**
		 * 2D描画でZバッファに書き込むZ値を設定する( Z:書き込むZ値( デフォルト:0.2f ) )
		 *
		 * Params:
		 *      Z = ?
		 */
		extern int SetDrawZ(float Z);

		/**
		 * 描画可能領域の設定する
		 */
		extern int SetDrawArea(int x1, int y1, int x2, int y2);

		/**
		 * 描画可能領域を取得する
		 */
		extern int GetDrawArea(dxlib_d.DxDataType.RECT* Rect);

		/**
		 * 描画可能領域を描画対象画面全体にする
		 */
		extern int SetDrawAreaFull();

		/**
		 * 3D描画の拡大率を設定する
		 */
		extern int SetDraw3DScale(float Scale);

		/**
		 * SetRestoreGraphCallback の旧名
		 */
		extern int SetRestoreShredPoint(void function() ShredPoint);

		/**
		 * グラフィックハンドル復元関数を登録する
		 */
		extern int SetRestoreGraphCallback(void function() Callback);

		/**
		 * グラフィック復元関数を実行する
		 */
		extern int RunRestoreShred();

		/**
		 * グラフィックスデバイスがロストから復帰した際に呼ばれるコールバック関数を設定する
		 */
		extern int SetGraphicsDeviceRestoreCallbackFunction(void function(void* Data) Callback, void* CallbackData);

		/**
		 * グラフィックスデバイスがロストから復帰する前に呼ばれるコールバック関数を設定する
		 */
		extern int SetGraphicsDeviceLostCallbackFunction(void function(void* Data) Callback, void* CallbackData);

		/**
		 * 2D描画に使用される変換行列を設定する
		 */
		extern int SetTransformTo2D(const (.MATRIX)* Matrix);

		/**
		 * 2D描画に使用される変換行列を設定する
		 */
		extern int SetTransformTo2DD(const (.MATRIX_D)* Matrix);

		/**
		 * 2D描画用に使用する変換行列の設定を初期状態に戻す
		 */
		extern int ResetTransformTo2D();

		/**
		 * ローカル座標からワールド座標に変換するための行列を設定する
		 */
		extern int SetTransformToWorld(const (.MATRIX)* Matrix);

		/**
		 * ローカル座標からワールド座標に変換するための行列を設定する
		 */
		extern int SetTransformToWorldD(const (.MATRIX_D)* Matrix);

		/**
		 * ローカル座標からワールド座標に変換するための行列を取得する
		 */
		extern int GetTransformToWorldMatrix(.MATRIX* MatBuf);

		/**
		 * ローカル座標からワールド座標に変換するための行列を取得する
		 */
		extern int GetTransformToWorldMatrixD(.MATRIX_D* MatBuf);

		/**
		 * ワールド座標からビュー座標に変換するための行列を設定する
		 */
		extern int SetTransformToView(const (.MATRIX)* Matrix);

		/**
		 * ワールド座標からビュー座標に変換するための行列を設定する
		 */
		extern int SetTransformToViewD(const (.MATRIX_D)* Matrix);

		/**
		 * ワールド座標からビュー座標に変換するための行列を取得する
		 */
		extern int GetTransformToViewMatrix(.MATRIX* MatBuf);

		/**
		 * ワールド座標からビュー座標に変換するための行列を取得する
		 */
		extern int GetTransformToViewMatrixD(.MATRIX_D* MatBuf);

		/**
		 * ビュー座標からプロジェクション座標に変換するための行列を設定する
		 */
		extern int SetTransformToProjection(const (.MATRIX)* Matrix);

		/**
		 * ビュー座標からプロジェクション座標に変換するための行列を設定する
		 */
		extern int SetTransformToProjectionD(const (.MATRIX_D)* Matrix);

		/**
		 * ビュー座標からプロジェクション座標に変換するための行列を取得する
		 */
		extern int GetTransformToProjectionMatrix(.MATRIX* MatBuf);

		/**
		 * ビュー座標からプロジェクション座標に変換するための行列を取得する
		 */
		extern int GetTransformToProjectionMatrixD(.MATRIX_D* MatBuf);

		/**
		 * ビューポート行列を設定する
		 */
		extern int SetTransformToViewport(const (.MATRIX)* Matrix);

		/**
		 * ビューポート行列を設定する
		 */
		extern int SetTransformToViewportD(const (.MATRIX_D)* Matrix);

		/**
		 * ビューポート行列を取得する
		 */
		extern int GetTransformToViewportMatrix(.MATRIX* MatBuf);

		/**
		 * ビューポート行列を取得する
		 */
		extern int GetTransformToViewportMatrixD(.MATRIX_D* MatBuf);

		/**
		 * Direct3Dで自動適用されるビューポート行列を取得する
		 */
		extern int GetTransformToAPIViewportMatrix(.MATRIX* MatBuf);

		/**
		 * Direct3Dで自動適用されるビューポート行列を取得する
		 */
		extern int GetTransformToAPIViewportMatrixD(.MATRIX_D* MatBuf);

		/**
		 * デフォルトの変換行列を設定する
		 */
		extern int SetDefTransformMatrix();

		/**
		 * ローカル座標からスクリーン座標を取得する
		 */
		extern int GetTransformPosition(.VECTOR* LocalPos, float* x, float* y);

		/**
		 * ローカル座標からスクリーン座標を取得する
		 */
		extern int GetTransformPositionD(.VECTOR_D* LocalPos, double* x, double* y);

		/**
		 * ワールド空間上のビルボードのサイズからスクリーンに投影した場合のピクセル単位のサイズを取得する
		 */
		extern float GetBillboardPixelSize(.VECTOR WorldPos, float WorldSize);

		/**
		 * ワールド空間上のビルボードのサイズからスクリーンに投影した場合のピクセル単位のサイズを取得する
		 */
		extern double GetBillboardPixelSizeD(.VECTOR_D WorldPos, double WorldSize);

		/**
		 * ワールド座標をビュー座標に変換する
		 */
		extern .VECTOR ConvWorldPosToViewPos(.VECTOR WorldPos);

		/**
		 * ワールド座標をビュー座標に変換する
		 */
		extern .VECTOR_D ConvWorldPosToViewPosD(.VECTOR_D WorldPos);

		/**
		 * ワールド座標をスクリーン座標に変換する
		 */
		extern .VECTOR ConvWorldPosToScreenPos(.VECTOR WorldPos);

		/**
		 * ワールド座標をスクリーン座標に変換する
		 */
		extern .VECTOR_D ConvWorldPosToScreenPosD(.VECTOR_D WorldPos);

		/**
		 * ワールド座標をスクリーン座標に変換する、最後のXYZ座標をWで割る前の値を得る
		 */
		extern .FLOAT4 ConvWorldPosToScreenPosPlusW(.VECTOR WorldPos);

		/**
		 * ワールド座標をスクリーン座標に変換する、最後のXYZ座標をWで割る前の値を得る
		 */
		extern .DOUBLE4 ConvWorldPosToScreenPosPlusWD(.VECTOR_D WorldPos);

		/**
		 * スクリーン座標をワールド座標に変換する
		 */
		extern .VECTOR ConvScreenPosToWorldPos(.VECTOR ScreenPos);

		/**
		 * スクリーン座標をワールド座標に変換する
		 */
		extern .VECTOR_D ConvScreenPosToWorldPosD(.VECTOR_D ScreenPos);

		/**
		 * スクリーン座標をワールド座標に変換する( Z座標が線形 )
		 */
		extern .VECTOR ConvScreenPosToWorldPos_ZLinear(.VECTOR ScreenPos);

		/**
		 * スクリーン座標をワールド座標に変換する( Z座標が線形 )
		 */
		extern .VECTOR_D ConvScreenPosToWorldPos_ZLinearD(.VECTOR_D ScreenPos);

		/**
		 * SetUseBackCulling の旧名称
		 */
		extern int SetUseCullingFlag(int Flag);

		/**
		 * ポリゴンカリングモードを設定する
		 */
		extern int SetUseBackCulling(int Flag /* DX_CULLING_LEFT 等 */);

		/**
		 * ポリゴンカリングモードを取得する
		 */
		extern int GetUseBackCulling();

		/**
		 * テクスチャアドレスモードを設定する
		 */
		extern int SetTextureAddressMode(int Mode /* DX_TEXADDRESS_WRAP 等 */, int Stage = -1);

		/**
		 * テクスチャアドレスモードを設定する( U と V を別々に設定する )
		 */
		extern int SetTextureAddressModeUV(int ModeU, int ModeV, int Stage = -1);

		/**
		 * テクスチャ座標変換パラメータを設定する
		 */
		extern int SetTextureAddressTransform(float TransU, float TransV, float ScaleU, float ScaleV, float RotCenterU, float RotCenterV, float Rotate);

		/**
		 * テクスチャ座標変換行列を設定する
		 */
		extern int SetTextureAddressTransformMatrix(.MATRIX Matrix);

		/**
		 * テクスチャ座標変換設定をリセットする
		 */
		extern int ResetTextureAddressTransform();

		/**
		 * フォグを有効にするかどうかを設定する
		 *
		 * Params:
		 *      Flag = TRUE:有効  FALSE:無効
		 */
		extern int SetFogEnable(int Flag);

		/**
		 * フォグが有効かどうかを取得する
		 *
		 * Returns: TRUE:有効  FALSE:無効
		 */
		extern int GetFogEnable();

		/**
		 * フォグモードを設定する
		 */
		extern int SetFogMode(int Mode /* DX_FOGMODE_NONE 等 */);

		/**
		 * フォグモードを取得する
		 */
		extern int GetFogMode();

		/**
		 * フォグカラーを設定する
		 */
		extern int SetFogColor(int r, int g, int b);

		/**
		 * フォグカラーを取得する
		 */
		extern int GetFogColor(int* r, int* g, int* b);

		/**
		 * フォグが始まる距離と終了する距離を設定する( 0.0f 〜 1.0f )
		 */
		extern int SetFogStartEnd(float start, float end);

		/**
		 * フォグが始まる距離と終了する距離を取得する( 0.0f 〜 1.0f )
		 */
		extern int GetFogStartEnd(float* start, float* end);

		/**
		 * フォグの密度を設定する( 0.0f 〜 1.0f )
		 */
		extern int SetFogDensity(float density);

		/**
		 * フォグの密度を取得する( 0.0f 〜 1.0f )
		 */
		extern float GetFogDensity();

		// 画面関係関数

		/**
		 * 指定座標の色を取得する
		 */
		extern uint GetPixel(int x, int y);

		/**
		 * 指定座標の色を取得する( float型 )
		 */
		extern .COLOR_F GetPixelF(int x, int y);

		/**
		 * メインウインドウの背景色を設定する
		 *
		 * Params:
		 *      Red= 0〜255
		 *      Green = 0〜255
		 *      Blue = 0〜255
		 *      Alpha = 0〜255
		 */
		extern int SetBackgroundColor(int Red, int Green, int Blue, int Alpha = 0);

		/**
		 * メインウインドウの背景色を取得する
		 *
		 * Params:
		 *      Red= 0〜255
		 *      Green = 0〜255
		 *      Blue = 0〜255
		 *      Alpha = 0〜255
		 */
		extern int GetBackgroundColor(int* Red, int* Green, int* Blue, int* Alpha = null);

		/**
		 * 描画先の画面から指定領域の画像情報をグラフィックハンドルに転送する
		 */
		extern int GetDrawScreenGraph(int x1, int y1, int x2, int y2, int GrHandle, int UseClientFlag = dxlib_d.DxDataType.TRUE);

		/**
		 * SetDrawScreen で描画対象にできるグラフィックハンドルから指定領域の画像情報を別のグラフィックハンドルに転送する
		 */
		extern int BltDrawValidGraph(int TargetDrawValidGrHandle, int x1, int y1, int x2, int y2, int DestX, int DestY, int DestGrHandle);

		/**
		 * 裏画面と表画面の内容を交換する
		 */
		extern int ScreenFlip();

		/**
		 * 裏画面の内容を表画面に転送する
		 */
		extern int ScreenCopy();

		/**
		 * 垂直同期信号を待つ
		 */
		extern int WaitVSync(int SyncNum);

		/**
		 * 画面をクリアする
		 */
		extern int ClearDrawScreen(const (dxlib_d.DxDataType.RECT)* ClearRect = null);

		/**
		 * 画面のZバッファをクリアする
		 */
		extern int ClearDrawScreenZBuffer(const (dxlib_d.DxDataType.RECT)* ClearRect = null);

		/**
		 * ClearDrawScreenの旧名称
		 */
		extern int ClsDrawScreen();

		/**
		 * 描画先画面を設定する( MakeScreen で作成したグラフィックハンドルも渡すことができます )
		 */
		extern int SetDrawScreen(int DrawScreen);

		/**
		 * 描画先画面を取得する
		 */
		extern int GetDrawScreen();

		/**
		 * GetDrawScreen の旧名称
		 */
		extern int GetActiveGraph();

		/**
		 * SetDrawScreen を実行した際にカメラや描画範囲の設定をリセットするかを設定する
		 *
		 * Params:
		 *      UseFlag = TRUE:リセットする( デフォルト )  FALSE:リセットしない
		 */
		extern int SetUseSetDrawScreenSettingReset(int UseFlag);

		/**
		 * SetDrawScreen を実行した際にカメラや描画範囲の設定をリセットするかを取得する
		 */
		extern int GetUseSetDrawScreenSettingReset();

		/**
		 * 描画先Zバッファのセット( DrawScreen 付属のZバッファを描画先Zバッファにする、DrawScreen を -1 にするとデフォルトの描画先Zバッファに戻る )
		 */
		extern int SetDrawZBuffer(int DrawScreen);

		/**
		 * 画面モードを設定する
		 */
		extern int SetGraphMode(int ScreenSizeX, int ScreenSizeY, int ColorBitDepth, int RefreshRate = 60);

		/**
		 * 画面のメモリイメージをセットする( DxLib_Init の前で呼ぶ必要がある( DxLib_Init の前に一度でも呼んでいれば、DxLib_Init 後は Image のアドレスのみの変更目的で呼ぶことは可能 )、PixelFormat に DX_USER_SCREEN_PIXEL_FORMAT_R5G6B5 又は DX_USER_SCREEN_PIXEL_FORMAT_X8R8G8B8 の二つ以外を指定した場合はDXライブラリの描画関数は一切使用できなくなります )
		 */
		extern int SetUserScreenImage(void* Image, int PixelFormat /* DX_USER_SCREEN_PIXEL_FORMAT_R5G6B5 等 */);

		/**
		 * フルスクリーン解像度モードを設定する
		 */
		extern int SetFullScreenResolutionMode(int ResolutionMode /* DX_FSRESOLUTIONMODE_NATIVE 等 */);

		/**
		 * フルスクリーン解像度モードを取得する( UseResolutionMode は実際に使用されている解像度モード( 例えば DX_FSRESOLUTIONMODE_NATIVE を指定していてもモニタが指定の解像度に対応していない場合は UseResolutionMode が DX_FSRESOLUTIONMODE_DESKTOP や DX_FSRESOLUTIONMODE_MAXIMUM になります ) )
		 */
		extern int GetFullScreenResolutionMode(int* ResolutionMode, int* UseResolutionMode);

		/**
		 * フルスクリーンモード時の画面拡大モードを設定する
		 */
		extern int SetFullScreenScalingMode(int ScalingMode /* DX_FSSCALINGMODE_NEAREST 等 */, int FitScaling = dxlib_d.DxDataType.FALSE);

		/**
		 * 640x480の画面で320x240の画面解像度にするかどうかを設定する、640x480以外の解像度では無効
		 *
		 * Params:
		 *      Flag = TRUE:有効  FALSE:無効
		 */
		extern int SetEmulation320x240(int Flag);

		/**
		 * 画面用のZバッファのサイズを設定する
		 */
		extern int SetZBufferSize(int ZBufferSizeX, int ZBufferSizeY);

		/**
		 * 画面用のZバッファのビット深度を設定する( 16 or 24 or 32 )
		 */
		extern int SetZBufferBitDepth(int BitDepth);

		/**
		 * ScreenFlip 実行時にVSYNC待ちをするかどうかを設定する
		 */
		extern int SetWaitVSyncFlag(int Flag);

		/**
		 * ScreenFlip 実行時にVSYNC待ちをするかどうかを取得する
		 */
		extern int GetWaitVSyncFlag();

		/**
		 * 画面のフルスクリーンアンチエイリアスモードの設定を行う( DxLib_Init の前でのみ使用可能 )
		 */
		extern int SetFullSceneAntiAliasingMode(int Samples, int Quality);

		/**
		 * ScreenFlip 時に表画面全体に転送する裏画面の領域を設定する( DxLib_Init の前でのみ使用可能 )
		 */
		extern int SetGraphDisplayArea(int x1, int y1, int x2, int y2);

		/**
		 * 画面モード変更時( とウインドウモード変更時 )にグラフィックスシステムの設定やグラフィックハンドルをリセットするかどうかを設定する
		 *
		 * Params:
		 *      Flag = TRUE:リセットする( デフォルト )  FALSE:リセットしない
		 */
		extern int SetChangeScreenModeGraphicsSystemResetFlag(int Flag);

		/**
		 * 現在の画面の解像度とカラービット数を得る
		 */
		extern int GetScreenState(int* SizeX, int* SizeY, int* ColorBitDepth);

		/**
		 * 描画先のサイズを取得する
		 */
		extern int GetDrawScreenSize(int* XBuf, int* YBuf);

		/**
		 * 画面のカラービット数を取得する
		 */
		extern int GetScreenBitDepth();

		/**
		 * GetScreenBitDepth の旧名称
		 */
		extern int GetColorBitDepth();

		/**
		 * 画面モードが変更されているかどうかを取得する
		 */
		extern int GetChangeDisplayFlag();

		/**
		 * ( 現在正常に動作しません )ビデオメモリの容量を得る
		 */
		extern int GetVideoMemorySize(int* AllSize, int* FreeSize);

		/**
		 * 現在の画面のリフレッシュレートを取得する
		 */
		extern int GetRefreshRate();

		/**
		 * ディスプレイの数を取得
		 */
		extern int GetDisplayNum();

		/**
		 * ディスプレイのデスクトップ上での矩形位置を取得する
		 */
		extern int GetDisplayInfo(int DisplayIndex, int* DesktopRectX, int* DesktopRectY, int* DesktopSizeX, int* DesktopSizeY, int* IsPrimary);

		/**
		 * 変更可能なディスプレイモードの数を取得する
		 */
		extern int GetDisplayModeNum(int DisplayIndex = 0);

		/**
		 * 変更可能なディスプレイモードの情報を取得する( ModeIndex は 0 〜 GetDisplayModeNum の戻り値-1 )
		 */
		extern .DISPLAYMODEDATA GetDisplayMode(int ModeIndex, int DisplayIndex = 0);

		/**
		 * ディスプレイの最大解像度を取得する
		 */
		extern int GetDisplayMaxResolution(int* SizeX, int* SizeY, int DisplayIndex = 0);

		/**
		 * ディスプレイのカラーデータアドレスを取得する
		 */
		extern const (.COLORDATA)* GetDispColorData();

		/**
		 * 同時に描画を行うことができる画面の数を取得する
		 */
		extern int GetMultiDrawScreenNum();

		/**
		 * DrawGraphF 等の浮動小数点値で座標を指定する関数における座標タイプを取得する
		 *
		 * Returns: DX_DRAWFLOATCOORDTYPE_DIRECT3D9 など
		 */
		extern int GetDrawFloatCoordType();

		// その他設定関係関数

		/**
		 * 通常描画にプログラマブルシェーダーを使用するかどうかを設定する
		 *
		 * Params:
		 *      Flag = TRUE:使用する( デフォルト )  FALSE:使用しない
		 */
		extern int SetUseNormalDrawShader(int Flag);

		/**
		 * ソフトウエアレンダリングモードを使用するかどうかを設定する( DxLib_Init の前に呼ぶ必要があります )
		 *
		 * Params:
		 *      Flag = TRUE:使用する  FALSE:使用しない( デフォルト )
		 */
		extern int SetUseSoftwareRenderModeFlag(int Flag);

		/**
		 * ( 同効果のSetUseSoftwareRenderModeFlag を使用して下さい )3D機能を使わないかどうかを設定する
		 */
		extern int SetNotUse3DFlag(int Flag);

		/**
		 * ( 同効果のSetUseSoftwareRenderModeFlag を使用して下さい )3D機能を使うかどうかを設定する
		 */
		extern int SetUse3DFlag(int Flag);

		/**
		 * 描画に3D機能を使うかどうかを取得する
		 */
		extern int GetUse3DFlag();

		/**
		 * ( 同効果のSetUseSoftwareRenderModeFlag を使用して下さい )画面のピクセルデータをVRAMに置くかどうかを設定する
		 */
		extern int SetScreenMemToVramFlag(int Flag);

		/**
		 * 画面のピクセルデータがシステムメモリ上に存在するかを取得する
		 */
		extern int GetScreenMemToSystemMemFlag();

		/**
		 * 通常使用しない
		 */
		extern int SetWindowDrawRect(const (dxlib_d.DxDataType.RECT)* DrawRect);

		/**
		 * DXライブラリのグラフィックス処理関連の復帰処理を行う
		 */
		extern int RestoreGraphSystem();

		/**
		 * ハードウエアの頂点演算処理機能を使用するかどうかを設定する( DxLib_Init の前に呼ぶ必要があります )
		 *
		 * Params:
		 *      Flag = TRUE:使用する( デフォルト )  FALSE:使用しない
		 */
		extern int SetUseHardwareVertexProcessing(int Flag);

		/**
		 * ピクセル単位でライティングを行うかどうかを設定する、要 ShaderModel 3.0
		 *
		 * Params:
		 *      Flag = TRUE:ピクセル単位のライティングを行う  FALSE:頂点単位のライティングを行う( デフォルト )
		 */
		extern int SetUsePixelLighting(int Flag);

		/**
		 * 古いバージョンの DrawModiGraph 関数のコードを使用するかどうかを設定する
		 */
		extern int SetUseOldDrawModiGraphCodeFlag(int Flag);

		/**
		 * ( 現在効果なし )VRAMを使用するかのフラグをセットする
		 */
		extern int SetUseVramFlag(int Flag);

		/**
		 * ( 現在効果なし )2Dグラフィックサーフェス作成時にシステムメモリーを使用するかのフラグ取得
		 */
		extern int GetUseVramFlag();

		/**
		 * ( 現在効果なし )簡略化ブレンド処理を行うか否かのフラグをセットする
		 */
		extern int SetBasicBlendFlag(int Flag);

		/**
		 * ( 現在効果なし )単純図形の描画に3Dデバイスの機能を使用するかどうかを設定する
		 */
		extern int SetUseBasicGraphDraw3DDeviceMethodFlag(int Flag);

		/**
		 * DXライブラリのウインドウを表示するディスプレイデバイスを設定する( -1 を指定するとマウスカーソルがあるディスプレイデバイスにDXライブラリのウインドウを表示する )
		 */
		extern int SetUseDisplayIndex(int Index);

		/**
		 * 頂点バッファに溜まった頂点データを描画する( 特殊用途 )
		 */
		extern int RenderVertex();

		// 描画パフォーマンス関係関数

		/**
		 * 前々回の ScreenFlip 呼び出しから、前回の ScreenFlip 呼び出しまでの間に行われた描画コールの回数を取得する
		 */
		extern int GetDrawCallCount();

		/**
		 * フレームレート( 1秒間に呼ばれる ScreenFlip の回数 )を取得する
		 */
		extern float GetFPS();

		version (DX_NON_SAVEFUNCTION) {
		} else {
			// 描画先画面保存関数
			// Jpeg_Quality         = 0:低画質〜100:高画質
			// Png_CompressionLevel = 0:無圧縮〜  9:最高圧縮

			/**
			 * 現在描画対象になっている画面をファイルで保存する
			 */
			extern int SaveDrawScreen(int x1, int y1, int x2, int y2, const (dxlib_d.DxDataType.TCHAR)* FileName, int SaveType = DX_IMAGESAVETYPE_BMP, int Jpeg_Quality = 80, int Jpeg_Sample2x1 = dxlib_d.DxDataType.TRUE, int Png_CompressionLevel = -1);

			/**
			 * 現在描画対象になっている画面をファイルで保存する
			 */
			extern int SaveDrawScreenWithStrLen(int x1, int y1, int x2, int y2, const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int SaveType = DX_IMAGESAVETYPE_BMP, int Jpeg_Quality = 80, int Jpeg_Sample2x1 = dxlib_d.DxDataType.TRUE, int Png_CompressionLevel = -1);

			/**
			 * 現在描画対象になっている画面をBMP形式で保存する
			 */
			extern int SaveDrawScreenToBMP(int x1, int y1, int x2, int y2, const (dxlib_d.DxDataType.TCHAR)* FileName);

			/**
			 * 現在描画対象になっている画面をBMP形式で保存する
			 */
			extern int SaveDrawScreenToBMPWithStrLen(int x1, int y1, int x2, int y2, const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength);

			/**
			 * 現在描画対象になっている画面をDDS形式で保存する
			 */
			extern int SaveDrawScreenToDDS(int x1, int y1, int x2, int y2, const (dxlib_d.DxDataType.TCHAR)* FileName);

			/**
			 * 現在描画対象になっている画面をDDS形式で保存する
			 */
			extern int SaveDrawScreenToDDSWithStrLen(int x1, int y1, int x2, int y2, const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength);

			/**
			 * 現在描画対象になっている画面をJPEG形式で保存する Quality = 画質、値が大きいほど低圧縮高画質,0〜100
			 */
			extern int SaveDrawScreenToJPEG(int x1, int y1, int x2, int y2, const (dxlib_d.DxDataType.TCHAR)* FileName, int Quality = 80, int Sample2x1 = dxlib_d.DxDataType.TRUE);

			/**
			 * 現在描画対象になっている画面をJPEG形式で保存する Quality = 画質、値が大きいほど低圧縮高画質,0〜100
			 */
			extern int SaveDrawScreenToJPEGWithStrLen(int x1, int y1, int x2, int y2, const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int Quality = 80, int Sample2x1 = dxlib_d.DxDataType.TRUE);

			/**
			 * 現在描画対象になっている画面をPNG形式で保存する CompressionLevel = 圧縮率、値が大きいほど高圧縮率高負荷、0は無圧縮,0〜9
			 */
			extern int SaveDrawScreenToPNG(int x1, int y1, int x2, int y2, const (dxlib_d.DxDataType.TCHAR)* FileName, int CompressionLevel = -1);

			/**
			 * 現在描画対象になっている画面をPNG形式で保存する CompressionLevel = 圧縮率、値が大きいほど高圧縮率高負荷、0は無圧縮,0〜9
			 */
			extern int SaveDrawScreenToPNGWithStrLen(int x1, int y1, int x2, int y2, const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int CompressionLevel = -1);

			// 描画対象にできるグラフィックハンドル保存関数
			// Jpeg_Quality         = 0:低画質〜100:高画質
			// Png_CompressionLevel = 0:無圧縮〜  9:最高圧縮

			/**
			 * 描画対象にできるグラフィックハンドルをファイルで保存する
			 */
			extern int SaveDrawValidGraph(int GrHandle, int x1, int y1, int x2, int y2, const (dxlib_d.DxDataType.TCHAR)* FileName, int SaveType = DX_IMAGESAVETYPE_BMP, int Jpeg_Quality = 80, int Jpeg_Sample2x1 = dxlib_d.DxDataType.TRUE, int Png_CompressionLevel = -1);

			/**
			 * 描画対象にできるグラフィックハンドルをファイルで保存する
			 */
			extern int SaveDrawValidGraphWithStrLen(int GrHandle, int x1, int y1, int x2, int y2, const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int SaveType = DX_IMAGESAVETYPE_BMP, int Jpeg_Quality = 80, int Jpeg_Sample2x1 = dxlib_d.DxDataType.TRUE, int Png_CompressionLevel = -1);

			/**
			 * 描画対象にできるグラフィックハンドルをBMP形式で保存する
			 */
			extern int SaveDrawValidGraphToBMP(int GrHandle, int x1, int y1, int x2, int y2, const (dxlib_d.DxDataType.TCHAR)* FileName);

			/**
			 * 描画対象にできるグラフィックハンドルをBMP形式で保存する
			 */
			extern int SaveDrawValidGraphToBMPWithStrLen(int GrHandle, int x1, int y1, int x2, int y2, const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength);

			/**
			 * 描画対象にできるグラフィックハンドルをDDS形式で保存する
			 */
			extern int SaveDrawValidGraphToDDS(int GrHandle, int x1, int y1, int x2, int y2, const (dxlib_d.DxDataType.TCHAR)* FileName);

			/**
			 * 描画対象にできるグラフィックハンドルをDDS形式で保存する
			 */
			extern int SaveDrawValidGraphToDDSWithStrLen(int GrHandle, int x1, int y1, int x2, int y2, const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength);

			/**
			 * 描画対象にできるグラフィックハンドルをJPEG形式で保存する Quality = 画質、値が大きいほど低圧縮高画質,0〜100
			 */
			extern int SaveDrawValidGraphToJPEG(int GrHandle, int x1, int y1, int x2, int y2, const (dxlib_d.DxDataType.TCHAR)* FileName, int Quality = 80, int Sample2x1 = dxlib_d.DxDataType.TRUE);

			/**
			 * 描画対象にできるグラフィックハンドルをJPEG形式で保存する Quality = 画質、値が大きいほど低圧縮高画質,0〜100
			 */
			extern int SaveDrawValidGraphToJPEGWithStrLen(int GrHandle, int x1, int y1, int x2, int y2, const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int Quality = 80, int Sample2x1 = dxlib_d.DxDataType.TRUE);

			/**
			 * 描画対象にできるグラフィックハンドルをPNG形式で保存する CompressionLevel = 圧縮率、値が大きいほど高圧縮率高負荷、0は無圧縮,0〜9
			 */
			extern int SaveDrawValidGraphToPNG(int GrHandle, int x1, int y1, int x2, int y2, const (dxlib_d.DxDataType.TCHAR)* FileName, int CompressionLevel = -1);

			/**
			 * 描画対象にできるグラフィックハンドルをPNG形式で保存する CompressionLevel = 圧縮率、値が大きいほど高圧縮率高負荷、0は無圧縮,0〜9
			 */
			extern int SaveDrawValidGraphToPNGWithStrLen(int GrHandle, int x1, int y1, int x2, int y2, const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int CompressionLevel = -1);
		}

		// 頂点バッファ関係関数

		/**
		 * 頂点バッファを作成する
		 *
		 * Returns: -1:エラー  0以上:頂点バッファハンドル
		 */
		extern int CreateVertexBuffer(int VertexNum, int VertexType /* DX_VERTEX_TYPE_NORMAL_3D 等 */);

		/**
		 * 頂点バッファを削除する
		 */
		extern int DeleteVertexBuffer(int VertexBufHandle);

		/**
		 * すべての頂点バッファを削除する
		 */
		extern int InitVertexBuffer();

		/**
		 * 頂点バッファに頂点データを転送する
		 */
		extern int SetVertexBufferData(int SetIndex, const (void)* VertexArray, int VertexNum, int VertexBufHandle);

		/**
		 * 頂点バッファハンドルの頂点バッファのアドレスを取得する
		 */
		extern void* GetBufferVertexBuffer(int VertexBufHandle);

		/**
		 * 頂点バッファハンドルの頂点バッファへの変更を適用する( GetBufferVertexBuffer で取得したバッファへの変更を反映する )
		 */
		extern int UpdateVertexBuffer(int VertexBufHandle, int UpdateStartIndex, int UpdateVertexNum);

		/**
		 * インデックスバッファを作成する
		 *
		 * Returns: -1:エラー 0以上:インデックスバッファハンドル
		 */
		extern int CreateIndexBuffer(int IndexNum, int IndexType /* DX_INDEX_TYPE_16BIT 等 */);

		/**
		 * インデックスバッファを削除する
		 */
		extern int DeleteIndexBuffer(int IndexBufHandle);

		/**
		 * すべてのインデックスバッファを削除する
		 */
		extern int InitIndexBuffer();

		/**
		 * インデックスバッファにインデックスデータを転送する
		 */
		extern int SetIndexBufferData(int SetIndex, const (void)* IndexArray, int IndexNum, int IndexBufHandle);

		/**
		 * インデックスバッファハンドルのインデックスバッファのアドレスを取得する
		 */
		extern void* GetBufferIndexBuffer(int IndexBufHandle);

		/**
		 * インデックスバッファハンドルのインデックスバッファへの変更を適用する( GetBufferIndexBuffer で取得したバッファへの変更を反映する )
		 */
		extern int UpdateIndexBuffer(int IndexBufHandle, int UpdateStartIndex, int UpdateIndexNum);

		/**
		 * グラフィックスデバイスが対応している一度に描画できるプリミティブの最大数を取得する
		 */
		extern int GetMaxPrimitiveCount();

		/**
		 * グラフィックスデバイスが対応している一度に使用することのできる最大頂点数を取得する
		 */
		extern int GetMaxVertexIndex();

		// シェーダー関係関数

		/**
		 * 使用できるシェーダーのバージョンを取得する( 0:使えない  200:シェーダーモデル2.0が使用可能  300:シェーダーモデル3.0が使用可能 )
		 */
		extern int GetValidShaderVersion();

		/**
		 * 頂点シェーダーバイナリをファイルから読み込み頂点シェーダーハンドルを作成する
		 *
		 * Returns: -1:エラー  -1以外:シェーダーハンドル
		 */
		extern int LoadVertexShader(const (dxlib_d.DxDataType.TCHAR)* FileName);

		/**
		 * 頂点シェーダーバイナリをファイルから読み込み頂点シェーダーハンドルを作成する
		 *
		 * Returns: -1:エラー  -1以外:シェーダーハンドル
		 */
		extern int LoadVertexShaderWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength);

		/**
		 * ジオメトリシェーダーバイナリをファイルから読み込みジオメトリシェーダーハンドルを作成する
		 *
		 * Returns: -1:エラー  -1以外:シェーダーハンドル
		 */
		extern int LoadGeometryShader(const (dxlib_d.DxDataType.TCHAR)* FileName);

		/**
		 * ジオメトリシェーダーバイナリをファイルから読み込みジオメトリシェーダーハンドルを作成する
		 *
		 * Returns: -1:エラー  -1以外:シェーダーハンドル
		 */
		extern int LoadGeometryShaderWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength);

		/**
		 * ピクセルシェーダーバイナリをファイルから読み込みピクセルシェーダーハンドルを作成する
		 *
		 * Returns: -1:エラー  -1以外:シェーダーハンドル
		 */
		extern int LoadPixelShader(const (dxlib_d.DxDataType.TCHAR)* FileName);

		/**
		 * ピクセルシェーダーバイナリをファイルから読み込みピクセルシェーダーハンドルを作成する
		 *
		 * Returns: -1:エラー  -1以外:シェーダーハンドル
		 */
		extern int LoadPixelShaderWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength);

		/**
		 * メモリに読み込まれた頂点シェーダーバイナリから頂点シェーダーハンドルを作成する
		 *
		 * Returns: -1:エラー  -1以外:シェーダーハンドル
		 */
		extern int LoadVertexShaderFromMem(const (void)* ImageAddress, int ImageSize);

		/**
		 * メモリに読み込まれたジオメトリシェーダーバイナリからジオメトリシェーダーハンドルを作成する
		 *
		 * Returns: -1:エラー  -1以外:シェーダーハンドル
		 */
		extern int LoadGeometryShaderFromMem(const (void)* ImageAddress, int ImageSize);

		/**
		 * メモリに読み込まれたピクセルシェーダーバイナリからピクセルシェーダーハンドルを作成する
		 *
		 * Returns: -1:エラー  -1以外:シェーダーハンドル
		 */
		extern int LoadPixelShaderFromMem(const (void)* ImageAddress, int ImageSize);

		/**
		 * シェーダーハンドルの削除( 頂点シェーダー・ピクセルシェーダー共通 )
		 */
		extern int DeleteShader(int ShaderHandle);

		/**
		 * シェーダーハンドルを全て削除する( 頂点シェーダーハンドル・ピクセルシェーダーハンドルどちらもすべて削除 )
		 */
		extern int InitShader();

		/**
		 * 指定の名前を持つ定数が使用するシェーダー定数の番号を取得する
		 */
		extern int GetConstIndexToShader(const (dxlib_d.DxDataType.TCHAR)* ConstantName, int ShaderHandle);

		/**
		 * 指定の名前を持つ定数が使用するシェーダー定数の番号を取得する
		 */
		extern int GetConstIndexToShaderWithStrLen(const (dxlib_d.DxDataType.TCHAR)* ConstantName, size_t ConstantNameLength, int ShaderHandle);

		/**
		 * 指定の名前を持つ定数が使用するシェーダー定数の数を取得する
		 */
		extern int GetConstCountToShader(const (dxlib_d.DxDataType.TCHAR)* ConstantName, int ShaderHandle);

		/**
		 * 指定の名前を持つ定数が使用するシェーダー定数の数を取得する
		 */
		extern int GetConstCountToShaderWithStrLen(const (dxlib_d.DxDataType.TCHAR)* ConstantName, size_t ConstantNameLength, int ShaderHandle);

		/**
		 * 指定の名前を持つ浮動小数点数定数のデフォルトパラメータが格納されているメモリアドレスを取得する
		 */
		extern const (.FLOAT4)* GetConstDefaultParamFToShader(const (dxlib_d.DxDataType.TCHAR)* ConstantName, int ShaderHandle);

		/**
		 * 指定の名前を持つ浮動小数点数定数のデフォルトパラメータが格納されているメモリアドレスを取得する
		 */
		extern const (.FLOAT4)* GetConstDefaultParamFToShaderWithStrLen(const (dxlib_d.DxDataType.TCHAR)* ConstantName, size_t ConstantNameLength, int ShaderHandle);

		/**
		 * 頂点シェーダーの float 型定数を設定する
		 */
		extern int SetVSConstSF(int ConstantIndex, float Param);

		/**
		 * 頂点シェーダーの float 型定数を設定する
		 */
		extern int SetVSConstF(int ConstantIndex, .FLOAT4 Param);

		/**
		 * 頂点シェーダーの float 型定数に行列を設定する
		 */
		extern int SetVSConstFMtx(int ConstantIndex, .MATRIX Param);

		/**
		 * 頂点シェーダーの float 型定数に転置した行列を設定する
		 */
		extern int SetVSConstFMtxT(int ConstantIndex, .MATRIX Param);

		/**
		 * 頂点シェーダーの int   型定数を設定する
		 */
		extern int SetVSConstSI(int ConstantIndex, int Param);

		/**
		 * 頂点シェーダーの int   型定数を設定する
		 */
		extern int SetVSConstI(int ConstantIndex, .INT4 Param);

		/**
		 * 頂点シェーダーの BOOL  型定数を設定する
		 */
		extern int SetVSConstB(int ConstantIndex, dxlib_d.DxDataType.BOOL Param);

		/**
		 * 頂点シェーダーの float 型定数を設定する( 配列を使って連番インデックスに一度に設定 )
		 */
		extern int SetVSConstSFArray(int ConstantIndex, const (float)* ParamArray, int ParamNum);

		/**
		 * 頂点シェーダーの float 型定数を設定する( 配列を使って連番インデックスに一度に設定 )
		 */
		extern int SetVSConstFArray(int ConstantIndex, const (.FLOAT4)* ParamArray, int ParamNum);

		/**
		 * 頂点シェーダーの float 型定数に行列を設定する( 配列を使って連番インデックスに一度に設定 )
		 */
		extern int SetVSConstFMtxArray(int ConstantIndex, const (.MATRIX)* ParamArray, int ParamNum);

		/**
		 * 頂点シェーダーの float 型定数に転置した行列を設定する( 配列を使って連番インデックスに一度に設定 )
		 */
		extern int SetVSConstFMtxTArray(int ConstantIndex, const (.MATRIX)* ParamArray, int ParamNum);

		/**
		 * 頂点シェーダーの int   型定数を設定する( 配列を使って連番インデックスに一度に設定 )
		 */
		extern int SetVSConstSIArray(int ConstantIndex, const (int)* ParamArray, int ParamNum);

		/**
		 * 頂点シェーダーの int   型定数を設定する( 配列を使って連番インデックスに一度に設定 )
		 */
		extern int SetVSConstIArray(int ConstantIndex, const (.INT4)* ParamArray, int ParamNum);

		/**
		 * 頂点シェーダーの BOOL  型定数を設定する( 配列を使って連番インデックスに一度に設定 )
		 */
		extern int SetVSConstBArray(int ConstantIndex, const (dxlib_d.DxDataType.BOOL)* ParamArray, int ParamNum);

		/**
		 * 頂点シェーダーの float 型定数の設定をリセットする
		 */
		extern int ResetVSConstF(int ConstantIndex, int ParamNum);

		/**
		 * 頂点シェーダーの int   型定数の設定をリセットする
		 */
		extern int ResetVSConstI(int ConstantIndex, int ParamNum);

		/**
		 * 頂点シェーダーの BOOL  型定数の設定をリセットする
		 */
		extern int ResetVSConstB(int ConstantIndex, int ParamNum);

		/**
		 * ピクセルシェーダーの float 型定数を設定する
		 */
		extern int SetPSConstSF(int ConstantIndex, float Param);

		/**
		 * ピクセルシェーダーの float 型定数を設定する
		 */
		extern int SetPSConstF(int ConstantIndex, .FLOAT4 Param);

		/**
		 * ピクセルシェーダーの float 型定数に行列を設定する
		 */
		extern int SetPSConstFMtx(int ConstantIndex, .MATRIX Param);

		/**
		 * ピクセルシェーダーの float 型定数に転置した行列を設定する
		 */
		extern int SetPSConstFMtxT(int ConstantIndex, .MATRIX Param);

		/**
		 * ピクセルシェーダーの int   型定数を設定する
		 */
		extern int SetPSConstSI(int ConstantIndex, int Param);

		/**
		 * ピクセルシェーダーの int   型定数を設定する
		 */
		extern int SetPSConstI(int ConstantIndex, .INT4 Param);

		/**
		 * ピクセルシェーダーの BOOL  型定数を設定する
		 */
		extern int SetPSConstB(int ConstantIndex, dxlib_d.DxDataType.BOOL Param);

		/**
		 * ピクセルシェーダーの float 型定数を設定する( 配列を使って連番インデックスに一度に設定 )
		 */
		extern int SetPSConstSFArray(int ConstantIndex, const (float)* ParamArray, int ParamNum);

		/**
		 * ピクセルシェーダーの float 型定数を設定する( 配列を使って連番インデックスに一度に設定 )
		 */
		extern int SetPSConstFArray(int ConstantIndex, const (.FLOAT4)* ParamArray, int ParamNum);

		/**
		 * ピクセルシェーダーの float 型定数に行列を設定する( 配列を使って連番インデックスに一度に設定 )
		 */
		extern int SetPSConstFMtxArray(int ConstantIndex, const (.MATRIX)* ParamArray, int ParamNum);

		/**
		 * ピクセルシェーダーの float 型定数に転置した行列を設定する( 配列を使って連番インデックスに一度に設定 )
		 */
		extern int SetPSConstFMtxTArray(int ConstantIndex, const (.MATRIX)* ParamArray, int ParamNum);

		/**
		 * ピクセルシェーダーの int   型定数を設定する( 配列を使って連番インデックスに一度に設定 )
		 */
		extern int SetPSConstSIArray(int ConstantIndex, const (int)* ParamArray, int ParamNum);

		/**
		 * ピクセルシェーダーの int   型定数を設定する( 配列を使って連番インデックスに一度に設定 )
		 */
		extern int SetPSConstIArray(int ConstantIndex, const (.INT4)* ParamArray, int ParamNum);

		/**
		 * ピクセルシェーダーの BOOL  型定数を設定する( 配列を使って連番インデックスに一度に設定 )
		 */
		extern int SetPSConstBArray(int ConstantIndex, const (dxlib_d.DxDataType.BOOL)* ParamArray, int ParamNum);

		/**
		 * ピクセルシェーダーの float 型定数の設定をリセットする
		 */
		extern int ResetPSConstF(int ConstantIndex, int ParamNum);

		/**
		 * ピクセルシェーダーの int   型定数の設定をリセットする
		 */
		extern int ResetPSConstI(int ConstantIndex, int ParamNum);

		/**
		 * ピクセルシェーダーの BOOL  型定数の設定をリセットする
		 */
		extern int ResetPSConstB(int ConstantIndex, int ParamNum);

		/**
		 * シェーダーを使用した描画での描画先を設定する( DrawScreen に -1 を渡すと無効化 )
		 */
		extern int SetRenderTargetToShader(int TargetIndex, int DrawScreen, int SurfaceIndex = 0, int MipLevel = 0);

		/**
		 * シェーダーを使用した描画で使用するグラフィックハンドルを設定する
		 */
		extern int SetUseTextureToShader(int StageIndex, int GraphHandle);

		/**
		 * シェーダーを使用した描画に使用する頂点シェーダーを設定する( -1を渡すと解除 )
		 */
		extern int SetUseVertexShader(int ShaderHandle);

		/**
		 * シェーダーを使用した描画に使用するジオメトリシェーダーを設定する( -1を渡すと解除 )
		 */
		extern int SetUseGeometryShader(int ShaderHandle);

		/**
		 * シェーダーを使用した描画に使用するピクセルシェーダーを設定する( -1を渡すと解除 )
		 */
		extern int SetUsePixelShader(int ShaderHandle);

		/**
		 * ポリゴンの頂点の接線と従法線をUV座標から計算してセットする
		 */
		extern int CalcPolygonBinormalAndTangentsToShader(.VERTEX3DSHADER* VertexArray, int PolygonNum);

		/**
		 * ポリゴンの頂点の接線と従法線をUV座標から計算してセットする( 頂点インデックスを使用する )
		 */
		extern int CalcPolygonIndexedBinormalAndTangentsToShader(.VERTEX3DSHADER* VertexArray, int VertexNum, const (ushort)* IndexArray, int PolygonNum);

		/**
		 * シェーダーを使ってビルボードを描画する
		 */
		extern int DrawBillboard3DToShader(.VECTOR Pos, float cx, float cy, float Size, float Angle, int GrHandle, int TransFlag, int ReverseXFlag = dxlib_d.DxDataType.FALSE, int ReverseYFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * シェーダーを使って2Dポリゴンを描画する
		 */
		extern int DrawPolygon2DToShader(const (.VERTEX2DSHADER)* VertexArray, int PolygonNum);

		/**
		 * シェーダーを使って3Dポリゴンを描画する
		 */
		extern int DrawPolygon3DToShader(const (.VERTEX3DSHADER)* VertexArray, int PolygonNum);

		/**
		 * シェーダーを使って2Dポリゴンを描画する( 頂点インデックスを使用する )
		 */
		extern int DrawPolygonIndexed2DToShader(const (.VERTEX2DSHADER)* VertexArray, int VertexNum, const (ushort)* IndexArray, int PolygonNum);

		/**
		 * シェーダーを使って3Dポリゴンを描画する( 頂点インデックスを使用する )
		 */
		extern int DrawPolygonIndexed3DToShader(const (.VERTEX3DSHADER)* VertexArray, int VertexNum, const (ushort)* IndexArray, int PolygonNum);

		/**
		 * シェーダーを使って2Dプリミティブを描画する
		 */
		extern int DrawPrimitive2DToShader(const (.VERTEX2DSHADER)* VertexArray, int VertexNum, int PrimitiveType /* DX_PRIMTYPE_TRIANGLELIST 等 */);

		/**
		 * シェーダーを使って3Dプリミティブを描画する
		 */
		extern int DrawPrimitive3DToShader(const (.VERTEX3DSHADER)* VertexArray, int VertexNum, int PrimitiveType /* DX_PRIMTYPE_TRIANGLELIST 等 */);

		/**
		 * シェーダーを使って2Dプリミティブを描画する( 頂点インデックスを使用する )
		 */
		extern int DrawPrimitiveIndexed2DToShader(const (.VERTEX2DSHADER)* VertexArray, int VertexNum, const (ushort)* IndexArray, int IndexNum, int PrimitiveType /* DX_PRIMTYPE_TRIANGLELIST 等 */);

		/**
		 * シェーダーを使って3Dプリミティブを描画する( 頂点インデックスを使用する )
		 */
		extern int DrawPrimitiveIndexed3DToShader(const (.VERTEX3DSHADER)* VertexArray, int VertexNum, const (ushort)* IndexArray, int IndexNum, int PrimitiveType /* DX_PRIMTYPE_TRIANGLELIST 等 */);

		/**
		 * シェーダーを使って3Dポリゴンを描画する( 頂点バッファ使用版 )
		 */
		extern int DrawPolygon3DToShader_UseVertexBuffer(int VertexBufHandle);

		/**
		 * シェーダーを使って3Dポリゴンを描画する( 頂点バッファとインデックスバッファ使用版 )
		 */
		extern int DrawPolygonIndexed3DToShader_UseVertexBuffer(int VertexBufHandle, int IndexBufHandle);

		/**
		 * シェーダーを使って3Dプリミティブを描画する( 頂点バッファ使用版 )
		 */
		extern int DrawPrimitive3DToShader_UseVertexBuffer(int VertexBufHandle, int PrimitiveType /* DX_PRIMTYPE_TRIANGLELIST 等 */);

		/**
		 * シェーダーを使って3Dプリミティブを描画する( 頂点バッファ使用版 )
		 */
		extern int DrawPrimitive3DToShader_UseVertexBuffer2(int VertexBufHandle, int PrimitiveType /* DX_PRIMTYPE_TRIANGLELIST 等 */, int StartVertex, int UseVertexNum);

		/**
		 * シェーダーを使って3Dプリミティブを描画する( 頂点バッファとインデックスバッファ使用版 )
		 */
		extern int DrawPrimitiveIndexed3DToShader_UseVertexBuffer(int VertexBufHandle, int IndexBufHandle, int PrimitiveType /* DX_PRIMTYPE_TRIANGLELIST 等 */);

		/**
		 * シェーダーを使って3Dプリミティブを描画する( 頂点バッファとインデックスバッファ使用版 )
		 */
		extern int DrawPrimitiveIndexed3DToShader_UseVertexBuffer2(int VertexBufHandle, int IndexBufHandle, int PrimitiveType /* DX_PRIMTYPE_TRIANGLELIST 等 */, int BaseVertex, int StartVertex, int UseVertexNum, int StartIndex, int UseIndexNum);

		// シェーダー用定数バッファ関係関数

		/**
		 * 全てのシェーダー用定数バッファハンドルを削除する
		 */
		extern int InitShaderConstantBuffer();

		/**
		 * シェーダー用定数バッファハンドルを初期化する
		 */
		extern int CreateShaderConstantBuffer(int BufferSize);

		/**
		 * シェーダー用定数バッファハンドルを削除する
		 */
		extern int DeleteShaderConstantBuffer(int SConstBufHandle);

		/**
		 * シェーダー用定数バッファハンドルの定数バッファのアドレスを取得する
		 */
		extern void* GetBufferShaderConstantBuffer(int SConstBufHandle);

		/**
		 * シェーダー用定数バッファハンドルの定数バッファへの変更を適用する
		 */
		extern int UpdateShaderConstantBuffer(int SConstBufHandle);

		/**
		 * シェーダー用定数バッファハンドルの定数バッファを指定のシェーダーの指定のスロットにセットする
		 */
		extern int SetShaderConstantBuffer(int SConstBufHandle, int TargetShader /* DX_SHADERTYPE_VERTEX など */, int Slot);

		// フィルター関係関数
		version (DX_NON_FILTER) {
		} else {
			/**
			 * GraphFilterBlt や GraphBlendBlt の結果を転送先に転送する際のブレンドモードを設定する( 現状で対応しているのは DX_BLENDMODE_NOBLEND と DX_BLENDMODE_ALPHA のみ )
			 */
			extern int SetGraphFilterBltBlendMode(int BlendMode /* DX_BLENDMODE_ALPHA など */);

			/**
			 * 画像にフィルター処理を行う
			 */
			extern int GraphFilter(int GrHandle, int FilterType /* DX_GRAPH_FILTER_GAUSS 等 */, ...);

			/**
			 * 画像のフィルター付き転送を行う
			 */
			extern int GraphFilterBlt(int SrcGrHandle, int DestGrHandle, int FilterType /* DX_GRAPH_FILTER_GAUSS 等 */, ...);

			/**
			 * 画像のフィルター付き転送を行う( 矩形指定 )
			 */
			extern int GraphFilterRectBlt(int SrcGrHandle, int DestGrHandle, int SrcX1, int SrcY1, int SrcX2, int SrcY2, int DestX, int DestY, int FilterType /* DX_GRAPH_FILTER_GAUSS 等 */, ...);

			// int GraphFilter(int GrHandle, int FilterType = DX_GRAPH_FILTER_MONO, int Cb = 青色差( -255 〜 255 ), int Cr = 赤色差( -255 〜 255 ));
			// int GraphFilter(int GrHandle, int FilterType = DX_GRAPH_FILTER_GAUSS, int PixelWidth = 使用ピクセル幅( 8 , 16 , 32 の何れか ), int Param = ぼかしパラメータ( 100 で約1ピクセル分の幅 ));
			// int GraphFilter(int GrHandle, int FilterType = DX_GRAPH_FILTER_DOWN_SCALE, int DivNum = 元のサイズの何分の1か、という値( 2 , 4 , 8 の何れか ));
			// int GraphFilter(int GrHandle, int FilterType = DX_GRAPH_FILTER_BRIGHT_CLIP, int CmpType = クリップタイプ( DX_CMP_LESS:CmpParam以下をクリップ  又は  DX_CMP_GREATER:CmpParam以上をクリップ ), int CmpParam = クリップパラメータ( 0 〜 255 ), int ClipFillFlag = クリップしたピクセルを塗りつぶすかどうか( TRUE:塗りつぶす  FALSE:塗りつぶさない ), uint ClipFillColor = クリップしたピクセルに塗る色値( GetColor で取得する )( ClipFillFlag が FALSE の場合は使用しない ), int ClipFillAlpha = クリップしたピクセルに塗るα値( 0 〜 255 )( ClipFillFlag が FALSE の場合は使用しない ));
			// int GraphFilter(int GrHandle, int FilterType = DX_GRAPH_FILTER_BRIGHT_SCALE, int MinBright = 変換後に真っ暗になる明るさ( 0 〜 255 ), int MaxBright = 変換後に真っ白になる明るさ( 0 〜 255 ));
			// int GraphFilter(int GrHandle, int FilterType = DX_GRAPH_FILTER_HSB, int HueType = Hue の意味( 0:相対値  1:絶対値 ), int Hue = 色相パラメータ( HueType が 0 の場合 = ピクセルの色相に対する相対値( -180 〜 180 )   HueType が 1 の場合 = 色相の絶対値( 0 〜 360 ) ), int Saturation = 彩度( -255 〜 ), int Bright = 輝度( -255 〜 255 ));
			// int GraphFilter(int GrHandle, int FilterType = DX_GRAPH_FILTER_INVERT);
			// int GraphFilter(int GrHandle, int FilterType = DX_GRAPH_FILTER_LEVEL, int Min = 変換元の下限値( 0 〜 255 ), int Max = 変換元の上限値( 0 〜 255 ), int Gamma = ガンマ値( 100 でガンマ補正無し、0 とそれ以下の値は不可 ), int AfterMin = 変換後の最低値( 0 〜 255 ), int AfterMax = 変換後の最大値( 0 〜 255 ));
			// int GraphFilter(int GrHandle, int FilterType = DX_GRAPH_FILTER_TWO_COLOR, int Threshold = 閾値( 0 〜 255 ), uint LowColor = 閾値より値が低かったピクセルの変換後の色値( GetColor で取得する ), int LowAlpha = 閾値より値が低かったピクセルの変換後のα値( 0 〜 255 ), uint HighColor = 閾値より値が高かったピクセルの変換後の色値( GetColor で取得する ), int HighAlpha = 閾値より値が高かったピクセルの変換後のα値( 0 〜 255 ));
			// int GraphFilter(int GrHandle, int FilterType = DX_GRAPH_FILTER_GRADIENT_MAP, int MapGrHandle = グラデーションマップのグラフィックハンドル( 元画像の輝度からグラデーションマップ画像の x 座標を算出しますので縦幅は1dotでもOK ), int Reverse = グラデーションマップ左右反転フラグ( TRUE:グラデーションマップを左右反転して使う  FALSE:左右反転しない ));
			// int GraphFilter(int GrHandle, int FilterType = DX_GRAPH_FILTER_REPLACEMENT, int TargetR, int TargetG, int TargetB, int TargetA = 置換対象の色( 0～255 ), int R, int G, int B, int A = 置換後の色( 0～255 ));

			/*
			 * 通常のアルファチャンネル付き画像を乗算済みアルファ画像に変換するフィルタ
			 */
			// int GraphFilter(int GrHandle, int FilterType = DX_GRAPH_FILTER_PREMUL_ALPHA);

			/*
			 * 乗算済みα画像を通常のアルファチャンネル付き画像に変換するフィルタ
			 */
			//int GraphFilter(int GrHandle, int FilterType = DX_GRAPH_FILTER_INTERP_ALPHA);

			/*
			 * YUVカラーをRGBカラーに変換するフィルタ
			 */
			//int GraphFilter(int GrHandle, int FilterType = DX_GRAPH_FILTER_YUV_TO_RGB);

			/*
			 * YUVカラーをRGBカラーに変換するフィルタ( UV成分が Y成分の半分・又は4分の1( 横・縦片方若しくは両方 )の解像度しかない場合用 )
			 */
			//int GraphFilter(int GrHandle, int FilterType = DX_GRAPH_FILTER_Y2UV1_TO_RGB, int UVGrHandle = YUVカラーのUV成分のみで、且つYに対して解像度が半分( 若しくは 4 分の 1 )のグラフィックハンドル( U=R, V=G ));

			/*
			 * YUVカラーをRGBカラーに変換するフィルタ( 且つ右側半分のRの値をアルファ値として扱う )
			 */
			//int GraphFilter(int GrHandle, int FilterType = DX_GRAPH_FILTER_YUV_TO_RGB_RRA);

			/*
			 * YUVカラーをRGBカラーに変換するフィルタ( UV成分が Y成分の半分・又は4分の1( 横・縦片方若しくは両方 )の解像度しかない場合用 )( 且つ右側半分のRの値をアルファ値として扱う )
			 */
			//int GraphFilter(int GrHandle, int FilterType = DX_GRAPH_FILTER_Y2UV1_TO_RGB_RRA, int UVGrHandle = YUVカラーのUV成分のみで、且つYに対して解像度が半分( 若しくは 4 分の 1 )のグラフィックハンドル( U=R, V=G ));

			//int GraphFilter(int GrHandle, int FilterType = DX_GRAPH_FILTER_BICUBIC_SCALE, int DestSizeX = スケーリング後の横ピクセル数, int DestSizeY = スケーリング後の縦ピクセル数);
			//int GraphFilter(int GrHandle, int FilterType = DX_GRAPH_FILTER_LANCZOS3_SCALE, int DestSizeX = スケーリング後の横ピクセル数, int DestSizeY = スケーリング後の縦ピクセル数);

			/**
			 * 二つの画像をブレンドする
			 */
			extern int GraphBlend(int GrHandle, int BlendGrHandle, int BlendRatio /* ブレンド効果の影響度( 0:0%  255:100% ) */, int BlendType /* DX_GRAPH_BLEND_ADD 等 */, ...);

			/**
			 * 二つの画像をブレンドして結果を指定の画像に出力する
			 */
			extern int GraphBlendBlt(int SrcGrHandle, int BlendGrHandle, int DestGrHandle, int BlendRatio /* ブレンド効果の影響度( 0:0%  255:100% ) */, int BlendType /* DX_GRAPH_BLEND_ADD 等 */, ...);

			/**
			 * 二つの画像をブレンドして結果を指定の画像に出力する( 矩形指定 )
			 */
			extern int GraphBlendRectBlt(int SrcGrHandle, int BlendGrHandle, int DestGrHandle, int SrcX1, int SrcY1, int SrcX2, int SrcY2, int BlendX, int BlendY, int DestX, int DestY, int BlendRatio /* ブレンド効果の影響度( 0:0%  255:100% ) */, int BlendType /* DX_GRAPH_BLEND_ADD 等 */, ...);

			// int GraphBlend(int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_NORMAL);
			// int GraphBlend(int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_RGBA_SELECT_MIX, int SelectR = ( 出力の赤分となる成分 DX_RGBA_SELECT_SRC_R 等 ), int SelectG = ( 出力の緑成分となる成分 DX_RGBA_SELECT_SRC_R 等 ), int SelectB = ( 出力の青成分となる成分 DX_RGBA_SELECT_SRC_R 等 ), int SelectA = ( 出力のα成分となる成分 DX_RGBA_SELECT_SRC_R 等 ));
			// int GraphBlend(int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_MULTIPLE);
			// int GraphBlend(int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_DIFFERENCE);
			// int GraphBlend(int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_ADD);
			// int GraphBlend(int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_SCREEN);
			// int GraphBlend(int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_OVERLAY);
			// int GraphBlend(int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_DODGE);
			// int GraphBlend(int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_BURN);
			// int GraphBlend(int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_DARKEN);
			// int GraphBlend(int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_LIGHTEN);
			// int GraphBlend(int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_SOFTLIGHT);
			// int GraphBlend(int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_HARDLIGHT);
			// int GraphBlend(int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_EXCLUSION);
			// int GraphBlend(int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_NORMAL_ALPHACH);
			// int GraphBlend(int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_ADD_ALPHACH);
			// int GraphBlend(int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_MULTIPLE_A_ONLY);
			// int GraphBlend(int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_PMA_MULTIPLE_A_ONLY);
		}

		version (DX_NON_MOVIE) {
		} else {
			// ムービーグラフィック関係関数

			/**
			 * 動画ファイルの再生
			 */
			extern int PlayMovie(const (dxlib_d.DxDataType.TCHAR)* FileName, int ExRate, int PlayType);

			/**
			 * 動画ファイルの再生
			 */
			extern int PlayMovieWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int ExRate, int PlayType);

			/**
			 * 動画ファイルの横ピクセル数と縦ピクセル数を取得する
			 */
			extern int GetMovieImageSize_File(const (dxlib_d.DxDataType.TCHAR)* FileName, int* SizeX, int* SizeY);

			/**
			 * 動画ファイルの横ピクセル数と縦ピクセル数を取得する
			 */
			extern int GetMovieImageSize_File_WithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int* SizeX, int* SizeY);

			/**
			 * メモリ上に展開された動画ファイルの横ピクセル数と縦ピクセル数を取得する
			 */
			extern int GetMovieImageSize_Mem(const (void)* FileImage, int FileImageSize, int* SizeX, int* SizeY);

			/**
			 * 動画ファイルを開く
			 */
			extern int OpenMovieToGraph(const (dxlib_d.DxDataType.TCHAR)* FileName, int FullColor = dxlib_d.DxDataType.TRUE);

			/**
			 * 動画ファイルを開く
			 */
			extern int OpenMovieToGraphWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int FullColor = dxlib_d.DxDataType.TRUE);

			/**
			 * 動画ファイルを使用するグラフィックハンドルの動画ファイルの再生を開始する
			 */
			extern int PlayMovieToGraph(int GraphHandle, int PlayType = DX_PLAYTYPE_BACK, int SysPlay = 0);

			/**
			 * 動画ファイルを使用するグラフィックハンドルの動画ファイルの再生を停止する
			 */
			extern int PauseMovieToGraph(int GraphHandle, int SysPause = 0);

			/**
			 * 動画ファイルの再生フレームを進める、戻すことは出来ない( 動画ファイルが停止状態で、且つ Ogg Theora のみ有効 )
			 */
			extern int AddMovieFrameToGraph(int GraphHandle, uint FrameNum);

			/**
			 * 動画ファイルの再生位置を設定する(ミリ秒単位)
			 */
			extern int SeekMovieToGraph(int GraphHandle, int Time);

			/**
			 * 動画ファイルの再生速度を設定する( 1.0 = 等倍速  2.0 = 2倍速 )、一部のファイルフォーマットのみで有効な機能です
			 */
			extern int SetPlaySpeedRateMovieToGraph(int GraphHandle, double SpeedRate);

			/**
			 * 動画ファイルの再生状態を得る
			 */
			extern int GetMovieStateToGraph(int GraphHandle);

			/**
			 * 動画ファイルの音量を設定する(0〜10000)
			 */
			extern int SetMovieVolumeToGraph(int Volume, int GraphHandle);

			/**
			 * 動画ファイルの音量を設定する(0〜255)
			 */
			extern int ChangeMovieVolumeToGraph(int Volume, int GraphHandle);

			/**
			 * 動画ファイルの基本イメージデータを取得する( ImageUpdateFlag に int 型変数のアドレスを渡すと、イメージが更新された場合は 1 が、更新されていない場合は 0 が格納されます、 ImageUpdateFlagSetOnly を TRUE にすると戻り値の BASEIMAGE は有効な画像データではなくなりますが、BASEIMAGE の更新処理が行われませんので、ImageUpdateFlag を利用して画像が更新されたかどうかだけをチェックしたい場合は TRUE にしてください )
			 */
			extern const (.BASEIMAGE)* GetMovieBaseImageToGraph(int GraphHandle, int* ImageUpdateFlag = null, int ImageUpdateFlagSetOnly = dxlib_d.DxDataType.FALSE);

			/**
			 * 動画ファイルの総フレーム数を得る( Ogg Theora と mp4 でのみ有効 )
			 */
			extern int GetMovieTotalFrameToGraph(int GraphHandle);

			/**
			 * 動画ファイルの再生位置を取得する(ミリ秒単位)
			 */
			extern int TellMovieToGraph(int GraphHandle);

			/**
			 * 動画ファイルの再生位置を取得する(フレーム単位)
			 */
			extern int TellMovieToGraphToFrame(int GraphHandle);

			/**
			 * 動画ファイルの再生位置を設定する(フレーム単位)
			 */
			extern int SeekMovieToGraphToFrame(int GraphHandle, int Frame);

			/**
			 * 動画ファイルの1フレームあたりの時間を取得する
			 *
			 * Returns: 1フレームの時間(単位:マイクロ秒)
			 */
			extern dxlib_d.DxDataType.LONGLONG GetOneFrameTimeMovieToGraph(int GraphHandle);

			/**
			 * 動画ファイルのイメージを最後に更新した時間を得る(ミリ秒単位)
			 */
			extern int GetLastUpdateTimeMovieToGraph(int GraphHandle);

			/**
			 * 読み込む動画ファイル映像の右半分の赤成分をα情報として扱うかどうかをセットする
			 *
			 * Params:
			 *      Flag = TRUE:α情報として扱う  FALSE:α情報として扱わない( デフォルト )
			 */
			extern int SetMovieRightImageAlphaFlag(int Flag);

			/**
			 * 読み込む動画ファイルが32bitカラーだった場合、A8R8G8B8 形式として扱うかどうかをセットする、32bitカラーではない動画ファイルに対しては無効
			 *
			 * Params:
			 *      Flag = TRUE:A8R8G8B8として扱う  FALSE:X8R8G8B8として扱う( デフォルト )
			 */
			extern int SetMovieColorA8R8G8B8Flag(int Flag);

			/**
			 * YUVフォーマットのサーフェスが使用できる場合はYUVフォーマットのサーフェスを使用するかどうかを設定する
			 *
			 * Params:
			 *      Flag = TRUE:使用する( デフォルト ) FALSE:RGBフォーマットのサーフェスを使用する
			 */
			extern int SetMovieUseYUVFormatSurfaceFlag(int Flag);
		}

		// カメラ関係関数

		/**
		 * カメラの Nearクリップ面と Farクリップ面の距離を設定する
		 */
		extern int SetCameraNearFar(float Near, float Far);

		/**
		 * カメラの Nearクリップ面と Farクリップ面の距離を設定する
		 */
		extern int SetCameraNearFarD(double Near, double Far);

		/**
		 * カメラの視点、注視点、アップベクトルを設定する( アップベクトルはY軸方向から導き出す )
		 */
		extern int SetCameraPositionAndTarget_UpVecY(.VECTOR Position, .VECTOR Target);

		/**
		 * カメラの視点、注視点、アップベクトルを設定する( アップベクトルはY軸方向から導き出す )
		 */
		extern int SetCameraPositionAndTarget_UpVecYD(.VECTOR_D Position, .VECTOR_D Target);

		/**
		 * カメラの視点、注視点、アップベクトルを設定する
		 */
		extern int SetCameraPositionAndTargetAndUpVec(.VECTOR Position, .VECTOR TargetPosition, .VECTOR UpVector);

		/**
		 * カメラの視点、注視点、アップベクトルを設定する
		 */
		extern int SetCameraPositionAndTargetAndUpVecD(.VECTOR_D Position, .VECTOR_D TargetPosition, .VECTOR_D UpVector);

		/**
		 * カメラの視点、注視点、アップベクトルを設定する( 注視点とアップベクトルは垂直回転角度、水平回転角度、捻り回転角度から導き出す )
		 */
		extern int SetCameraPositionAndAngle(.VECTOR Position, float VRotate, float HRotate, float TRotate);

		/**
		 * カメラの視点、注視点、アップベクトルを設定する( 注視点とアップベクトルは垂直回転角度、水平回転角度、捻り回転角度から導き出す )
		 */
		extern int SetCameraPositionAndAngleD(.VECTOR_D Position, double VRotate, double HRotate, double TRotate);

		/**
		 * ビュー行列を直接設定する
		 */
		extern int SetCameraViewMatrix(.MATRIX ViewMatrix);

		/**
		 * ビュー行列を直接設定する
		 */
		extern int SetCameraViewMatrixD(.MATRIX_D ViewMatrix);

		/**
		 * 画面上におけるカメラが見ている映像の中心の座標を設定する
		 */
		extern int SetCameraScreenCenter(float x, float y);

		/**
		 * 画面上におけるカメラが見ている映像の中心の座標を設定する
		 */
		extern int SetCameraScreenCenterD(double x, double y);

		/**
		 * 遠近法カメラをセットアップする
		 */
		extern int SetupCamera_Perspective(float Fov);

		/**
		 * 遠近法カメラをセットアップする
		 */
		extern int SetupCamera_PerspectiveD(double Fov);

		/**
		 * 正射影カメラをセットアップする
		 */
		extern int SetupCamera_Ortho(float Size);

		/**
		 * 正射影カメラをセットアップする
		 */
		extern int SetupCamera_OrthoD(double Size);

		/**
		 * 射影行列を直接設定する
		 */
		extern int SetupCamera_ProjectionMatrix(.MATRIX ProjectionMatrix);

		/**
		 * 射影行列を直接設定する
		 */
		extern int SetupCamera_ProjectionMatrixD(.MATRIX_D ProjectionMatrix);

		/**
		 * カメラのドットアスペクト比を設定する
		 */
		extern int SetCameraDotAspect(float DotAspect);

		/**
		 * カメラのドットアスペクト比を設定する
		 */
		extern int SetCameraDotAspectD(double DotAspect);

		/**
		 * 指定の座標がカメラの視界に入っているかどうかを判定する
		 *
		 * Returns: TRUE:視界に入っていない  FALSE:視界に入っている
		 */
		extern int CheckCameraViewClip(.VECTOR CheckPos);

		/**
		 * 指定の座標がカメラの視界に入っているかどうかを判定する
		 *
		 * Returns: TRUE:視界に入っていない  FALSE:視界に入っている
		 */
		extern int CheckCameraViewClipD(.VECTOR_D CheckPos);

		/**
		 * 指定の座標がカメラの視界に入っているかどうかを判定する、戻り値で外れている方向も知ることができる
		 *
		 * Returns: 0:視界に入っている  0以外:視界に入っていない( DX_CAMERACLIP_LEFT や DX_CAMERACLIP_RIGHT が or 演算で混合されたもの、and 演算で方向を確認できる )
		 */
		extern int CheckCameraViewClip_Dir(.VECTOR CheckPos);

		/**
		 * 指定の座標がカメラの視界に入っているかどうかを判定する、戻り値で外れている方向も知ることができる
		 *
		 * Returns: 0:視界に入っている  0以外:視界に入っていない( DX_CAMERACLIP_LEFT や DX_CAMERACLIP_RIGHT が or 演算で混合されたもの、and 演算で方向を確認できる )
		 */
		extern int CheckCameraViewClip_DirD(.VECTOR_D CheckPos);

		/**
		 * 二つの座標で表されるボックスがカメラの視界に入っているかどうかを判定する
		 *
		 * Returns: TRUE:視界に入っていない  FALSE:視界に入っている
		 */
		extern int CheckCameraViewClip_Box(.VECTOR BoxPos1, .VECTOR BoxPos2);

		/**
		 * 二つの座標で表されるボックスがカメラの視界に入っているかどうかを判定する
		 *
		 * Returns: TRUE:視界に入っていない  FALSE:視界に入っている
		 */
		extern int CheckCameraViewClip_BoxD(.VECTOR_D BoxPos1, .VECTOR_D BoxPos2);

		/**
		 * カメラの Near クリップ面の距離を取得する
		 */
		extern float GetCameraNear();

		/**
		 * カメラの Near クリップ面の距離を取得する
		 */
		extern double GetCameraNearD();

		/**
		 * カメラの Far クリップ面の距離を取得する
		 */
		extern float GetCameraFar();

		/**
		 * カメラの Far クリップ面の距離を取得する
		 */
		extern double GetCameraFarD();

		/**
		 * カメラの位置を取得する
		 */
		extern .VECTOR GetCameraPosition();

		/**
		 * カメラの位置を取得する
		 */
		extern .VECTOR_D GetCameraPositionD();

		/**
		 * カメラの注視点を取得する
		 */
		extern .VECTOR GetCameraTarget();

		/**
		 * カメラの注視点を取得する
		 */
		extern .VECTOR_D GetCameraTargetD();

		/**
		 * カメラの正面方向に垂直な上方向のベクトルを取得する
		 */
		extern .VECTOR GetCameraUpVector();

		/**
		 * カメラの正面方向に垂直な上方向のベクトルを取得する
		 */
		extern .VECTOR_D GetCameraUpVectorD();

		/**
		 * カメラの正面方向に垂直な下方向のベクトルを取得する
		 */
		extern .VECTOR GetCameraDownVector();

		/**
		 * カメラの正面方向に垂直な下方向のベクトルを取得する
		 */
		extern .VECTOR_D GetCameraDownVectorD();

		/**
		 * カメラの正面方向に垂直な右方向のベクトルを取得する
		 */
		extern .VECTOR GetCameraRightVector();

		/**
		 * カメラの正面方向に垂直な右方向のベクトルを取得する
		 */
		extern .VECTOR_D GetCameraRightVectorD();

		/**
		 * カメラの正面方向に垂直な左方向のベクトルを取得する
		 */
		extern .VECTOR GetCameraLeftVector();

		/**
		 * カメラの正面方向に垂直な左方向のベクトルを取得する
		 */
		extern .VECTOR_D GetCameraLeftVectorD();

		/**
		 * カメラの正面方向のベクトルを取得する
		 */
		extern .VECTOR GetCameraFrontVector();

		/**
		 * カメラの正面方向のベクトルを取得する
		 */
		extern .VECTOR_D GetCameraFrontVectorD();

		/**
		 * カメラの後ろ方向のベクトルを取得する
		 */
		extern .VECTOR GetCameraBackVector();

		/**
		 * カメラの後ろ方向のベクトルを取得する
		 */
		extern .VECTOR_D GetCameraBackVectorD();

		/**
		 * カメラの水平方向の向きを取得する
		 */
		extern float GetCameraAngleHRotate();

		/**
		 * カメラの水平方向の向きを取得する
		 */
		extern double GetCameraAngleHRotateD();

		/**
		 * カメラの垂直方向の向きを取得する
		 */
		extern float GetCameraAngleVRotate();

		/**
		 * カメラの垂直方向の向きを取得する
		 */
		extern double GetCameraAngleVRotateD();

		/**
		 * カメラの向きの捻り角度を取得する
		 */
		extern float GetCameraAngleTRotate();

		/**
		 * カメラの向きの捻り角度を取得する
		 */
		extern double GetCameraAngleTRotateD();

		/**
		 * ビュー行列を取得する
		 */
		extern .MATRIX GetCameraViewMatrix();

		/**
		 * ビュー行列を取得する
		 */
		extern .MATRIX_D GetCameraViewMatrixD();

		/**
		 * ビルボード行列を取得する
		 */
		extern .MATRIX GetCameraBillboardMatrix();

		/**
		 * ビルボード行列を取得する
		 */
		extern .MATRIX_D GetCameraBillboardMatrixD();

		/**
		 * 画面上におけるカメラが見ている映像の中心の座標を取得する
		 */
		extern int GetCameraScreenCenter(float* x, float* y);

		/**
		 * 画面上におけるカメラが見ている映像の中心の座標を取得する
		 */
		extern int GetCameraScreenCenterD(double* x, double* y);

		/**
		 * カメラの視野角を取得する
		 */
		extern float GetCameraFov();

		/**
		 * カメラの視野角を取得する
		 */
		extern double GetCameraFovD();

		/**
		 * カメラの視野サイズを取得する
		 */
		extern float GetCameraSize();

		/**
		 * カメラの視野サイズを取得する
		 */
		extern double GetCameraSizeD();

		/**
		 * 射影行列を取得する
		 */
		extern .MATRIX GetCameraProjectionMatrix();

		/**
		 * 射影行列を取得する
		 */
		extern .MATRIX_D GetCameraProjectionMatrixD();

		/**
		 * カメラのドットアスペクト比を得る
		 */
		extern float GetCameraDotAspect();

		/**
		 * カメラのドットアスペクト比を得る
		 */
		extern double GetCameraDotAspectD();

		/**
		 * ビューポート行列を取得する
		 */
		extern .MATRIX GetCameraViewportMatrix();

		/**
		 * ビューポート行列を取得する
		 */
		extern .MATRIX_D GetCameraViewportMatrixD();

		/**
		 * Direct3Dで自動適用されるビューポート行列を取得する
		 */
		extern .MATRIX GetCameraAPIViewportMatrix();

		/**
		 * Direct3Dで自動適用されるビューポート行列を取得する
		 */
		extern .MATRIX_D GetCameraAPIViewportMatrixD();

		// ライト関係関数

		/**
		 * ライティングを使用するかどうかを設定する
		 */
		extern int SetUseLighting(int Flag);

		/**
		 * 3D描画のライティング計算で頂点カラーのディフューズカラーを使用するかどうかを設定する
		 */
		extern int SetMaterialUseVertDifColor(int UseFlag);

		/**
		 * 3D描画のライティング計算で頂点カラーのスペキュラカラーを使用するかどうかを設定する
		 */
		extern int SetMaterialUseVertSpcColor(int UseFlag);

		/**
		 * 3D描画のライティング計算で使用するマテリアルパラメータを設定する
		 */
		extern int SetMaterialParam(MATERIALPARAM Material);

		/**
		 * 3D描画にスペキュラを使用するかどうかを設定する
		 */
		extern int SetUseSpecular(int UseFlag);

		/**
		 * グローバルアンビエントライトカラーを設定する
		 */
		extern int SetGlobalAmbientLight(.COLOR_F Color);

		/**
		 * デフォルトライトのタイプをディレクショナルライトにする
		 */
		extern int ChangeLightTypeDir(.VECTOR Direction);

		/**
		 * デフォルトライトのタイプをスポットライトにする
		 */
		extern int ChangeLightTypeSpot(.VECTOR Position, .VECTOR Direction, float OutAngle, float InAngle, float Range, float Atten0, float Atten1, float Atten2);

		/**
		 * デフォルトライトのタイプをポイントライトにする
		 */
		extern int ChangeLightTypePoint(.VECTOR Position, float Range, float Atten0, float Atten1, float Atten2);

		/**
		 * デフォルトライトのタイプを取得する
		 *
		 * Returns: DX_LIGHTTYPE_DIRECTIONAL 等
		 */
		extern int GetLightType();

		/**
		 * デフォルトライトを使用するかどうかを設定する
		 */
		extern int SetLightEnable(int EnableFlag);

		/**
		 * デフォルトライトを使用するかどうかを取得する
		 *
		 * Returns: TRUE:有効  FALSE:無効
		 */
		extern int GetLightEnable();

		/**
		 * デフォルトライトのディフューズカラーを設定する
		 */
		extern int SetLightDifColor(.COLOR_F Color);

		/**
		 * デフォルトライトのディフューズカラーを取得する
		 */
		extern .COLOR_F GetLightDifColor();

		/**
		 * デフォルトライトのスペキュラカラーを設定する
		 */
		extern int SetLightSpcColor(.COLOR_F Color);

		/**
		 * デフォルトライトのスペキュラカラーを取得する
		 */
		extern .COLOR_F GetLightSpcColor();

		/**
		 * デフォルトライトのアンビエントカラーを設定する
		 */
		extern int SetLightAmbColor(.COLOR_F Color);

		/**
		 * デフォルトライトのアンビエントカラーを取得する
		 */
		extern .COLOR_F GetLightAmbColor();

		/**
		 * デフォルトライトの方向を設定する
		 */
		extern int SetLightDirection(.VECTOR Direction);

		/**
		 * デフォルトライトの方向を取得する
		 */
		extern .VECTOR GetLightDirection();

		/**
		 * デフォルトライトの位置を設定する
		 */
		extern int SetLightPosition(.VECTOR Position);

		/**
		 * デフォルトライトの位置を取得する
		 */
		extern .VECTOR GetLightPosition();

		/**
		 * デフォルトライトの距離減衰パラメータを設定する( 有効距離、距離減衰係数0、1、2 )
		 */
		extern int SetLightRangeAtten(float Range, float Atten0, float Atten1, float Atten2);

		/**
		 * デフォルトライトの距離減衰パラメータを取得する( 有効距離、距離減衰係数0、1、2 )
		 */
		extern int GetLightRangeAtten(float* Range, float* Atten0, float* Atten1, float* Atten2);

		/**
		 * デフォルトライトのスポットライトのパラメータを設定する( 外部コーン角度、内部コーン角度 )
		 */
		extern int SetLightAngle(float OutAngle, float InAngle);

		/**
		 * デフォルトライトのスポットライトのパラメータを取得する( 外部コーン角度、内部コーン角度 )
		 */
		extern int GetLightAngle(float* OutAngle, float* InAngle);

		/**
		 * デフォルトライトに SetUseShadowMap で指定したシャドウマップを適用するかどうかを設定する
		 *
		 * Params:
		 *      SmSlotIndex = シャドウマップスロット( SetUseShadowMap の第1引数に設定する値 )
		 *      UseFlag = 適用にするかどうかのフラグ( TRUE:適用する( デフォルト )  FALSE:適用しない )
		 */
		extern int SetLightUseShadowMap(int SmSlotIndex, int UseFlag);

		/**
		 * ディレクショナルライトハンドルを作成する
		 */
		extern int CreateDirLightHandle(.VECTOR Direction);

		/**
		 * スポットライトハンドルを作成する
		 */
		extern int CreateSpotLightHandle(.VECTOR Position, .VECTOR Direction, float OutAngle, float InAngle, float Range, float Atten0, float Atten1, float Atten2);

		/**
		 * ポイントライトハンドルを作成する
		 */
		extern int CreatePointLightHandle(.VECTOR Position, float Range, float Atten0, float Atten1, float Atten2);

		/**
		 * ライトハンドルを削除する
		 */
		extern int DeleteLightHandle(int LHandle);

		/**
		 * ライトハンドルを全て削除する
		 */
		extern int DeleteLightHandleAll();

		/**
		 * ライトハンドルのライトのタイプを変更する( DX_LIGHTTYPE_DIRECTIONAL 等 )
		 */
		extern int SetLightTypeHandle(int LHandle, int LightType);

		/**
		 * ライトハンドルのライト効果の有効、無効を設定する
		 *
		 * Params:
		 *      LHandle = ?
		 *      EnableFlag = TRUE:有効  FALSE:無効
		 */
		extern int SetLightEnableHandle(int LHandle, int EnableFlag);

		/**
		 * ライトハンドルのライトのディフューズカラーを設定する
		 */
		extern int SetLightDifColorHandle(int LHandle, .COLOR_F Color);

		/**
		 * ライトハンドルのライトのスペキュラカラーを設定する
		 */
		extern int SetLightSpcColorHandle(int LHandle, .COLOR_F Color);

		/**
		 * ライトハンドルのライトのアンビエントカラーを設定する
		 */
		extern int SetLightAmbColorHandle(int LHandle, .COLOR_F Color);

		/**
		 * ライトハンドルのライトの方向を設定する
		 */
		extern int SetLightDirectionHandle(int LHandle, .VECTOR Direction);

		/**
		 * ライトハンドルのライトの位置を設定する
		 */
		extern int SetLightPositionHandle(int LHandle, .VECTOR Position);

		/**
		 * ライトハンドルのライトの距離減衰パラメータを設定する( 有効距離、距離減衰係数0、1、2 )
		 */
		extern int SetLightRangeAttenHandle(int LHandle, float Range, float Atten0, float Atten1, float Atten2);

		/**
		 * ライトハンドルのライトのスポットライトのパラメータを設定する( 外部コーン角度、内部コーン角度 )
		 */
		extern int SetLightAngleHandle(int LHandle, float OutAngle, float InAngle);

		/**
		 * ライトハンドルのライトに SetUseShadowMap で指定したシャドウマップを適用するかどうかを設定する
		 *
		 * Params:
		 *      LHandle = ?
		 *      SmSlotIndex = シャドウマップスロット( SetUseShadowMap の第1引数に設定する値 )
		 *      UseFlag = 適用にするかどうかのフラグ( TRUE:適用する( デフォルト )  FALSE:適用しない )
		 */
		extern int SetLightUseShadowMapHandle(int LHandle, int SmSlotIndex, int UseFlag);

		/**
		 * ライトハンドルのライトのタイプを取得する
		 *
		 * Returns: DX_LIGHTTYPE_DIRECTIONAL 等
		 */
		extern int GetLightTypeHandle(int LHandle);

		/**
		 * ライトハンドルのライト効果の有効、無効を取得する
		 *
		 * Returns: TRUE:有効  FALSE:無効
		 */
		extern int GetLightEnableHandle(int LHandle);

		/**
		 * ライトハンドルのライトのディフューズカラーを取得する
		 */
		extern .COLOR_F GetLightDifColorHandle(int LHandle);

		/**
		 * ライトハンドルのライトのスペキュラカラーを取得する
		 */
		extern .COLOR_F GetLightSpcColorHandle(int LHandle);

		/**
		 * ライトハンドルのライトのアンビエントカラーを取得する
		 */
		extern .COLOR_F GetLightAmbColorHandle(int LHandle);

		/**
		 * ライトハンドルのライトの方向を取得する
		 */
		extern .VECTOR GetLightDirectionHandle(int LHandle);

		/**
		 * ライトハンドルのライトの位置を取得する
		 */
		extern .VECTOR GetLightPositionHandle(int LHandle);

		/**
		 * ライトハンドルのライトの距離減衰パラメータを取得する( 有効距離、距離減衰係数0、1、2 )
		 */
		extern int GetLightRangeAttenHandle(int LHandle, float* Range, float* Atten0, float* Atten1, float* Atten2);

		/**
		 * ライトハンドルのライトのスポットライトのパラメータを取得する( 外部コーン角度、内部コーン角度 )
		 */
		extern int GetLightAngleHandle(int LHandle, float* OutAngle, float* InAngle);

		/**
		 * 有効になっているライトハンドルの数を取得する
		 */
		extern int GetEnableLightHandleNum();

		/**
		 * 有効になっているライトハンドルを取得する
		 */
		extern int GetEnableLightHandle(int Index);

		// 色情報取得用関数

		/**
		 * テクスチャフォーマットのインデックスを得る
		 */
		extern int GetTexFormatIndex(const (.IMAGEFORMATDESC)* Format);

		// DxMask.cpp 関数プロトタイプ宣言

		version (DX_NON_MASK) {
		} else {
			// マスク関係

			/**
			 * マスクスクリーンを作成する
			 */
			extern int CreateMaskScreen();

			/**
			 * マスクスクリーンを削除する
			 */
			extern int DeleteMaskScreen();

			/**
			 * マスクスクリーンにメモリ上のビットマップデータを転送する( MaskData は 1byte で 1dot 表す1ラインあたり Width byte のデータ配列の先頭アドレス )
			 */
			extern int DrawMaskToDirectData(int x, int y, int Width, int Height, const (void)* MaskData, int TransMode);

			/**
			 * マスクスクリーンにメモリ上のビットマップデータで指定矩形内を塗りつぶすように転送する
			 */
			extern int DrawFillMaskToDirectData(int x1, int y1, int x2, int y2, int Width, int Height, const (void)* MaskData);

			/**
			 * マスクスクリーンを使用するかどうかを設定する
			 *
			 * Params:
			 *      ValidFlag = 使用するかどうか( TRUE:使用する  FALSE:使用しない( デフォルト )
			 */
			extern int SetUseMaskScreenFlag(int ValidFlag);

			/**
			 * マスクスクリーンを使用するかどうかを取得する
			 */
			extern int GetUseMaskScreenFlag();

			/**
			 * マスクスクリーンを指定の色で塗りつぶす
			 */
			extern int FillMaskScreen(int Flag);

			/**
			 * マスクスクリーンとして使用するグラフィックのハンドルを設定する、-1を渡すと解除( 引数で渡すグラフィックハンドルは MakeScreen で作成した「アルファチャンネル付きの描画対象にできるグラフィックハンドル」である必要があります( アルファチャンネルがマスクに使用されます ) )
			 */
			extern int SetMaskScreenGraph(int GraphHandle);

			/**
			 * マスクスクリーンとして使用するグラフィックの、どのチャンネルをマスクとして使用するかを設定する( デフォルトは DX_MASKGRAPH_CH_A、 尚、DX_MASKGRAPH_CH_A以外を使用する場合はグラフィックスデバイスがシェーダーモデル2.0以降に対応している必要があります )
			 */
			extern int SetMaskScreenGraphUseChannel(int UseChannel /* DX_MASKGRAPH_CH_A 等 */);

			/**
			 * マスクハンドルをすべて削除する
			 */
			extern int InitMask();

			/**
			 * マスクハンドルを作成する
			 */
			extern int MakeMask(int Width, int Height);

			/**
			 * マスクハンドルが持つマスクイメージのサイズを取得する
			 */
			extern int GetMaskSize(int* WidthBuf, int* HeightBuf, int MaskHandle);

			/**
			 * マスクハンドルが持つマスクイメージのBASEIMAGEデータを取得する( フォーマットが変更されるような操作をすると正常に動作しなくなります、あと、ReleaseBaseImage は実行する必要はありません )
			 */
			extern int GetMaskBaseImageInfo(.BASEIMAGE* BaseImage, int MaskHandle);

			/**
			 * マスクハンドルにビットマップイメージを転送する
			 */
			extern int SetDataToMask(int Width, int Height, const (void)* MaskData, int MaskHandle);

			/**
			 * マスクハンドルを削除する
			 */
			extern int DeleteMask(int MaskHandle);

			/**
			 * マスクハンドルにBASEIMAGEデータを転送する
			 */
			extern int GraphImageBltToMask(const (.BASEIMAGE)* BaseImage, int ImageX, int ImageY, int MaskHandle);

			/**
			 * 画像ファイルを読み込みマスクハンドルを作成する
			 */
			extern int LoadMask(const (dxlib_d.DxDataType.TCHAR)* FileName);

			/**
			 * 画像ファイルを読み込みマスクハンドルを作成する
			 */
			extern int LoadMaskWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength);

			/**
			 * 画像ファイルを分割読み込みしてマスクハンドルを作成する
			 */
			extern int LoadDivMask(const (dxlib_d.DxDataType.TCHAR)* FileName, int AllNum, int XNum, int YNum, int XSize, int YSize, int* HandleArray);

			/**
			 * 画像ファイルを分割読み込みしてマスクハンドルを作成する
			 */
			extern int LoadDivMaskWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int AllNum, int XNum, int YNum, int XSize, int YSize, int* HandleArray);

			/**
			 * メモリ上にある画像ファイルイメージを読み込みマスクハンドルを作成する
			 */
			extern int CreateMaskFromMem(const (void)* FileImage, int FileImageSize);

			/**
			 * メモリ上にある画像ファイルイメージを分割読み込みしてマスクハンドルを作成する
			 */
			extern int CreateDivMaskFromMem(const (void)* FileImage, int FileImageSize, int AllNum, int XNum, int YNum, int XSize, int YSize, int* HandleArray);

			/**
			 * マスクスクリーンにマスクハンドルの持つマスクイメージを書き込む
			 */
			extern int DrawMask(int x, int y, int MaskHandle, int TransMode);

			version (DX_NON_FONT) {
			} else {
				/**
				 * 書式指定ありの文字列をマスクスクリーンに描画する
				 */
				extern int DrawFormatStringMask(int x, int y, int Flag, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

				/**
				 * 書式指定ありの文字列をマスクスクリーンに描画する( フォントハンドル指定版 )( SetFontCacheToTextureFlag(FALSE); にして作成したフォントハンドルのみ使用可能 )
				 */
				extern int DrawFormatStringMaskToHandle(int x, int y, int Flag, int FontHandle, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

				/**
				 * 文字列をマスクスクリーンに描画する
				 */
				extern int DrawStringMask(int x, int y, int Flag, const (dxlib_d.DxDataType.TCHAR)* String);

				/**
				 * 文字列をマスクスクリーンに描画する
				 */
				extern int DrawNStringMask(int x, int y, int Flag, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength);

				/**
				 * 文字列をマスクスクリーンに描画する( フォントハンドル指定版 )( SetFontCacheToTextureFlag(FALSE); にして作成したフォントハンドルのみ使用可能 )
				 */
				extern int DrawStringMaskToHandle(int x, int y, int Flag, int FontHandle, const (dxlib_d.DxDataType.TCHAR)* String);

				/**
				 * 文字列をマスクスクリーンに描画する( フォントハンドル指定版 )( SetFontCacheToTextureFlag(FALSE); にして作成したフォントハンドルのみ使用可能 )
				 */
				extern int DrawNStringMaskToHandle(int x, int y, int Flag, int FontHandle, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength);
			}

			/**
			 * マスクハンドルが持つマスクイメージをマスクスクリーンいっぱいに描画する( タイル状に並べる )
			 */
			extern int DrawFillMask(int x1, int y1, int x2, int y2, int MaskHandle);

			/**
			 * マスクイメージ内の数値に対する効果を逆転させる( 旧バージョンとの互換性の為の機能 )
			 */
			extern int SetMaskReverseEffectFlag(int ReverseFlag);

			/**
			 * マスクスクリーンの指定矩形部分をマスクハンドルに転送する
			 */
			extern int GetMaskScreenData(int x1, int y1, int x2, int y2, int MaskHandle);

			/**
			 * マスクスクリーンを使用する設定になっているかどうかを取得する
			 */
			extern int GetMaskUseFlag();
		}
	}

	// DxFont.cpp 関数プロトタイプ宣言

	version (DX_NON_FONT) {
	} else {
		// フォント、文字列描画関係関数

		/**
		 * 使用可能なフォントの名前を列挙する( NameBuffer に 64バイト区切りで名前が格納されます )
		 */
		extern int EnumFontName(dxlib_d.DxDataType.TCHAR* NameBuffer, int NameBufferNum, int JapanOnlyFlag = dxlib_d.DxDataType.TRUE);

		/**
		 * 使用可能なフォントの名前を列挙する( NameBuffer に 64バイト区切りで名前が格納されます )( 文字セット指定版 )
		 */
		extern int EnumFontNameEx(dxlib_d.DxDataType.TCHAR* NameBuffer, int NameBufferNum, int CharSet = -1 /* DX_CHARSET_DEFAULT 等 */);

		/**
		 * 指定のフォント名のフォントを列挙する
		 */
		extern int EnumFontNameEx2(dxlib_d.DxDataType.TCHAR* NameBuffer, int NameBufferNum, const (dxlib_d.DxDataType.TCHAR)* EnumFontName, int CharSet = -1 /* DX_CHARSET_DEFAULT 等 */);

		/**
		 * 指定のフォント名のフォントを列挙する
		 */
		extern int EnumFontNameEx2WithStrLen(dxlib_d.DxDataType.TCHAR* NameBuffer, int NameBufferNum, const (dxlib_d.DxDataType.TCHAR)* EnumFontName, size_t EnumFontNameLength, int CharSet = -1 /* DX_CHARSET_DEFAULT 等 */);

		/**
		 * 指定のフォント名のフォントが存在するかどうかをチェックする
		 *
		 * Returns: TRUE:存在する  FALSE:存在しない
		 */
		extern int CheckFontName(const (dxlib_d.DxDataType.TCHAR)* FontName, int CharSet = -1 /* DX_CHARSET_DEFAULT 等 */);

		/**
		 * 指定のフォント名のフォントが存在するかどうかをチェックする
		 *
		 * Returns: TRUE:存在する  FALSE:存在しない
		 */
		extern int CheckFontNameWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FontName, size_t FontNameLength, int CharSet = -1 /* DX_CHARSET_DEFAULT 等 */);

		/**
		 * 全てのフォントハンドルを削除する
		 */
		extern int InitFontToHandle();

		/**
		 * フォントハンドルを作成する
		 */
		extern int CreateFontToHandle(const (dxlib_d.DxDataType.TCHAR)* FontName, int Size, int Thick, int FontType = -1, int CharSet = -1, int EdgeSize = -1, int Italic = dxlib_d.DxDataType.FALSE, int Handle = -1);

		/**
		 * フォントハンドルを作成する
		 */
		extern int CreateFontToHandleWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FontName, size_t FontNameLength, int Size, int Thick, int FontType = -1, int CharSet = -1, int EdgeSize = -1, int Italic = dxlib_d.DxDataType.FALSE, int Handle = -1);

		/**
		 * フォントデータファイルからフォントハンドルを作成する
		 */
		extern int LoadFontDataToHandle(const (dxlib_d.DxDataType.TCHAR)* FileName, int EdgeSize = 0);

		/**
		 * フォントデータファイルからフォントハンドルを作成する
		 */
		extern int LoadFontDataToHandleWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int EdgeSize = 0);

		/**
		 * メモリ上のフォントデータファイルイメージからフォントハンドルを作成する
		 */
		extern int LoadFontDataFromMemToHandle(const (void)* FontDataImage, int FontDataImageSize, int EdgeSize = 0);

		/**
		 * フォントハンドルの字間を変更する
		 */
		extern int SetFontSpaceToHandle(int Pixel, int FontHandle);

		/**
		 * フォントハンドルの行間を変更する
		 */
		extern int SetFontLineSpaceToHandle(int Pixel, int FontHandle);

		/**
		 * 指定のフォントハンドルを使用する関数の引数に渡す文字列の文字コード形式を設定する( UNICODE版では無効 )
		 */
		extern int SetFontCharCodeFormatToHandle(int CharCodeFormat /* DX_CHARCODEFORMAT_SHIFTJIS 等 */, int FontHandle);

		/**
		 * フォントハンドルを削除する
		 */
		extern int DeleteFontToHandle(int FontHandle);

		/**
		 * フォントハンドルを削除した際に TRUE を代入する変数のアドレスを設定する
		 */
		extern int SetFontLostFlag(int FontHandle, int* LostFlag);

		/**
		 * 指定の文字の代わりに描画するグラフィックハンドルを登録する
		 */
		extern int AddFontImageToHandle(int FontHandle, const (dxlib_d.DxDataType.TCHAR)* Char, int GrHandle, int DrawX, int DrawY, int AddX);

		/**
		 * 指定の文字の代わりに描画するグラフィックハンドルを登録する
		 */
		extern int AddFontImageToHandleWithStrLen(int FontHandle, const (dxlib_d.DxDataType.TCHAR)* Char, size_t CharLength, int GrHandle, int DrawX, int DrawY, int AddX);

		/**
		 * 指定の文字の代わりに描画するグラフィックハンドルの登録を解除する
		 */
		extern int SubFontImageToHandle(int FontHandle, const (dxlib_d.DxDataType.TCHAR)* Char);

		/**
		 * 指定の文字の代わりに描画するグラフィックハンドルの登録を解除する
		 */
		extern int SubFontImageToHandleWithStrLen(int FontHandle, const (dxlib_d.DxDataType.TCHAR)* Char, size_t CharLength);

		/**
		 * 代替フォントハンドル( FontHandle に無い文字を描画しようとしたときに代わりに使用されるフォントハンドル )を登録する
		 */
		extern int AddSubstitutionFontToHandle(int FontHandle, int SubstitutionFontHandle, int DrawX, int DrawY);

		/**
		 * 代替フォントハンドルの登録を解除する
		 */
		extern int SubSubstitutionFontToHandle(int FontHandle, int SubstitutionFontHandle);

		/**
		 * デフォルトフォントハンドルで使用するフォントを変更
		 */
		extern int ChangeFont(const (dxlib_d.DxDataType.TCHAR)* FontName, int CharSet = -1 /* DX_CHARSET_SHFTJIS 等 */);

		/**
		 * デフォルトフォントハンドルで使用するフォントを変更
		 */
		extern int ChangeFontWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FontName, size_t FontNameLength, int CharSet = -1 /* DX_CHARSET_SHFTJIS 等 */);

		/**
		 * デフォルトフォントハンドルのフォントタイプの変更
		 */
		extern int ChangeFontType(int FontType);

		/**
		 * デフォルトフォントハンドルのフォント名を取得する
		 */
		extern const (dxlib_d.DxDataType.TCHAR)* GetFontName();

		/**
		 * デフォルトフォントハンドルのサイズを設定する
		 */
		extern int SetFontSize(int FontSize);

		/**
		 * デフォルトフォントハンドルのサイズを取得する
		 */
		extern int GetFontSize();

		/**
		 * デフォルトフォントハンドルの縁サイズを取得する
		 */
		extern int GetFontEdgeSize();

		/**
		 * デフォルトフォントハンドルの太さを設定する
		 */
		extern int SetFontThickness(int ThickPal);

		/**
		 * デフォルトフォントハンドルの字間を変更する
		 */
		extern int SetFontSpace(int Pixel);

		/**
		 * デフォルトフォントハンドルの字間を取得する
		 */
		extern int GetFontSpace();

		/**
		 * デフォルトフォントハンドルの行間を変更する
		 */
		extern int SetFontLineSpace(int Pixel);

		/**
		 * デフォルトフォントハンドルの行間を取得する
		 */
		extern int GetFontLineSpace();

		/**
		 * デフォルトフォントハンドルを使用する関数の引数に渡す文字列の文字コード形式を設定する( UNICODE版では無効 )
		 */
		extern int SetFontCharCodeFormat(int CharCodeFormat /* DX_CHARCODEFORMAT_SHIFTJIS 等 */);

		/**
		 * デフォルトフォントハンドルの設定を変更する
		 */
		extern int SetDefaultFontState(const (dxlib_d.DxDataType.TCHAR)* FontName, int Size, int Thick, int FontType = -1, int CharSet = -1, int EdgeSize = -1, int Italic = dxlib_d.DxDataType.FALSE);

		/**
		 * デフォルトフォントハンドルの設定を変更する
		 */
		extern int SetDefaultFontStateWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FontName, size_t FontNameLength, int Size, int Thick, int FontType = -1, int CharSet = -1, int EdgeSize = -1, int Italic = dxlib_d.DxDataType.FALSE);

		/**
		 * デフォルトフォントハンドルを取得する
		 */
		extern int GetDefaultFontHandle();

		/**
		 * デフォルトフォントハンドルのキャッシュできる文字の数を取得する
		 */
		extern int GetFontMaxCacheCharNum();

		/**
		 * デフォルトフォントハンドルの文字の最大幅を取得する
		 */
		extern int GetFontMaxWidth();

		/**
		 * デフォルトフォントハンドルの描画位置からベースラインまでの高さを取得する
		 */
		extern int GetFontAscent();

		/**
		 * デフォルトフォントハンドルを使用した文字列の描画幅を取得する
		 */
		extern int GetDrawStringWidth(const (dxlib_d.DxDataType.TCHAR)* String, int StrLen, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * デフォルトフォントハンドルを使用した文字列の描画幅を取得する
		 */
		extern int GetDrawNStringWidth(const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * デフォルトフォントハンドルを使用した書式付き文字列の描画幅を取得する
		 */
		extern int GetDrawFormatStringWidth(const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * デフォルトフォントハンドルを使用した文字列の描画幅を取得する( 拡大率付き )
		 */
		extern int GetDrawExtendStringWidth(double ExRateX, const (dxlib_d.DxDataType.TCHAR)* String, int StrLen, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * デフォルトフォントハンドルを使用した文字列の描画幅を取得する( 拡大率付き )
		 */
		extern int GetDrawExtendNStringWidth(double ExRateX, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * デフォルトフォントハンドルを使用した書式付き文字列の描画幅を取得する( 拡大率付き )
		 */
		extern int GetDrawExtendFormatStringWidth(double ExRateX, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * デフォルトフォントハンドルを使用した文字列の描画幅・高さ・行数を取得する
		 */
		extern int GetDrawStringSize(int* SizeX, int* SizeY, int* LineCount, const (dxlib_d.DxDataType.TCHAR)* String, int StrLen, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * デフォルトフォントハンドルを使用した文字列の描画幅・高さ・行数を取得する
		 */
		extern int GetDrawNStringSize(int* SizeX, int* SizeY, int* LineCount, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * デフォルトフォントハンドルを使用した書式付き文字列の描画幅・高さ・行数を取得する
		 */
		extern int GetDrawFormatStringSize(int* SizeX, int* SizeY, int* LineCount, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * デフォルトフォントハンドルを使用した文字列の描画幅・高さ・行数を取得する( 拡大率付き )
		 */
		extern int GetDrawExtendStringSize(int* SizeX, int* SizeY, int* LineCount, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, int StrLen, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * デフォルトフォントハンドルを使用した文字列の描画幅・高さ・行数を取得する( 拡大率付き )
		 */
		extern int GetDrawExtendNStringSize(int* SizeX, int* SizeY, int* LineCount, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * デフォルトフォントハンドルを使用した書式付き文字列の描画幅・高さ・行数を取得する( 拡大率付き )
		 */
		extern int GetDrawExtendFormatStringSize(int* SizeX, int* SizeY, int* LineCount, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * デフォルトフォントハンドルを使用した文字列の1文字毎の情報を取得する
		 */
		extern int GetDrawStringCharInfo(.DRAWCHARINFO* InfoBuffer, size_t InfoBufferSize, const (dxlib_d.DxDataType.TCHAR)* String, int StrLen, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * デフォルトフォントハンドルを使用した文字列の1文字毎の情報を取得する
		 */
		extern int GetDrawNStringCharInfo(.DRAWCHARINFO* InfoBuffer, size_t InfoBufferSize, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * デフォルトフォントハンドルを使用した書式付き文字列の1文字毎の情報を取得する
		 */
		extern int GetDrawFormatStringCharInfo(.DRAWCHARINFO* InfoBuffer, size_t InfoBufferSize, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * デフォルトフォントハンドルを使用した文字列の1文字毎の情報を取得する
		 */
		extern int GetDrawExtendStringCharInfo(.DRAWCHARINFO* InfoBuffer, size_t InfoBufferSize, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, int StrLen, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * デフォルトフォントハンドルを使用した文字列の1文字毎の情報を取得する
		 */
		extern int GetDrawExtendNStringCharInfo(.DRAWCHARINFO* InfoBuffer, size_t InfoBufferSize, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * デフォルトフォントハンドルを使用した書式付き文字列の1文字毎の情報を取得する
		 */
		extern int GetDrawExtendFormatStringCharInfo(.DRAWCHARINFO* InfoBuffer, size_t InfoBufferSize, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * デフォルトフォントハンドルを使用した二つの文字のペアのカーニング情報を取得する
		 *
		 * Params:
		 *      PairChar = カーニング情報を調べるペアとなる2文字の文字列( 2文字以上あっても先頭の2文字だけ使用されます )
		 *      KernAmount = 2文字目の文字を基本の位置からずらすドット数を代入するint型変数のアドレス
		 */
		extern int GetDrawStringKerningPairInfo(const (dxlib_d.DxDataType.TCHAR)* PairChar, int* KernAmount);

		/**
		 * デフォルトフォントハンドルを使用した二つの文字のペアのカーニング情報を取得する
		 *
		 * Params:
		 *      PairChar = カーニング情報を調べるペアとなる2文字の文字列( 2文字以上あっても先頭の2文字だけ使用されます )
		 *      PairCharLength = ?
		 *      KernAmount = 2文字目の文字を基本の位置からずらすドット数を代入するint型変数のアドレス
		 */
		extern int GetDrawStringKerningPairInfoWithStrLen(const (dxlib_d.DxDataType.TCHAR)* PairChar, size_t PairCharLength, int* KernAmount);

		/**
		 * フォントハンドルのフォント名を取得する
		 */
		extern const (dxlib_d.DxDataType.TCHAR)* GetFontNameToHandle(int FontHandle);

		/**
		 * フォントハンドルのキャッシュできる文字の数を取得する
		 */
		extern int GetFontMaxCacheCharNumToHandle(int FontHandle);

		/**
		 * フォントハンドルの文字の最大幅を取得する
		 */
		extern int GetFontMaxWidthToHandle(int FontHandle);

		/**
		 * フォントハンドルの描画位置からベースラインまでの高さを取得する
		 */
		extern int GetFontAscentToHandle(int FontHandle);

		/**
		 * フォントハンドルのサイズを取得する
		 */
		extern int GetFontSizeToHandle(int FontHandle);

		/**
		 * フォントハンドルの縁サイズを取得する
		 */
		extern int GetFontEdgeSizeToHandle(int FontHandle);

		/**
		 * フォントハンドルの字間を取得する
		 */
		extern int GetFontSpaceToHandle(int FontHandle);

		/**
		 * フォントハンドルの行間を取得する
		 */
		extern int GetFontLineSpaceToHandle(int FontHandle);

		/**
		 * フォントハンドルの指定の文字の描画情報を取得する
		 */
		extern int GetFontCharInfo(int FontHandle, const (dxlib_d.DxDataType.TCHAR)* Char, int* DrawX, int* DrawY, int* NextCharX, int* SizeX, int* SizeY);

		/**
		 * フォントハンドルの指定の文字の描画情報を取得する
		 */
		extern int GetFontCharInfoWithStrLen(int FontHandle, const (dxlib_d.DxDataType.TCHAR)* Char, size_t CharLength, int* DrawX, int* DrawY, int* NextCharX, int* SizeX, int* SizeY);

		/**
		 * フォントハンドルを使用した文字列の描画幅を取得する
		 */
		extern int GetDrawStringWidthToHandle(const (dxlib_d.DxDataType.TCHAR)* String, int StrLen, int FontHandle, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * フォントハンドルを使用した文字列の描画幅を取得する
		 */
		extern int GetDrawNStringWidthToHandle(const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, int FontHandle, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * フォントハンドルを使用した書式付き文字列の描画幅を取得する
		 */
		extern int GetDrawFormatStringWidthToHandle(int FontHandle, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * フォントハンドルを使用した文字列の描画幅を取得する
		 */
		extern int GetDrawExtendStringWidthToHandle(double ExRateX, const (dxlib_d.DxDataType.TCHAR)* String, int StrLen, int FontHandle, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * フォントハンドルを使用した文字列の描画幅を取得する
		 */
		extern int GetDrawExtendNStringWidthToHandle(double ExRateX, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, int FontHandle, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * フォントハンドルを使用した書式付き文字列の描画幅を取得する
		 */
		extern int GetDrawExtendFormatStringWidthToHandle(double ExRateX, int FontHandle, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * フォントハンドルを使用した文字列の描画幅・高さ・行数を取得する
		 */
		extern int GetDrawStringSizeToHandle(int* SizeX, int* SizeY, int* LineCount, const (dxlib_d.DxDataType.TCHAR)* String, int StrLen, int FontHandle, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * フォントハンドルを使用した文字列の描画幅・高さ・行数を取得する
		 */
		extern int GetDrawNStringSizeToHandle(int* SizeX, int* SizeY, int* LineCount, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, int FontHandle, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * フォントハンドルを使用した書式付き文字列の描画幅・高さ・行数を取得する
		 */
		extern int GetDrawFormatStringSizeToHandle(int* SizeX, int* SizeY, int* LineCount, int FontHandle, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * フォントハンドルを使用した文字列の描画幅・高さ・行数を取得する
		 */
		extern int GetDrawExtendStringSizeToHandle(int* SizeX, int* SizeY, int* LineCount, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, int StrLen, int FontHandle, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * フォントハンドルを使用した文字列の描画幅・高さ・行数を取得する
		 */
		extern int GetDrawExtendNStringSizeToHandle(int* SizeX, int* SizeY, int* LineCount, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, int FontHandle, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * フォントハンドルを使用した書式付き文字列の描画幅・高さ・行数を取得する
		 */
		extern int GetDrawExtendFormatStringSizeToHandle(int* SizeX, int* SizeY, int* LineCount, double ExRateX, double ExRateY, int FontHandle, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * フォントハンドルを使用した文字列の1文字毎の情報を取得する
		 */
		extern int GetDrawStringCharInfoToHandle(.DRAWCHARINFO* InfoBuffer, size_t InfoBufferSize, const (dxlib_d.DxDataType.TCHAR)* String, int StrLen, int FontHandle, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * フォントハンドルを使用した文字列の1文字毎の情報を取得する
		 */
		extern int GetDrawNStringCharInfoToHandle(.DRAWCHARINFO* InfoBuffer, size_t InfoBufferSize, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, int FontHandle, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * フォントハンドルを使用した書式付き文字列の1文字毎の情報を取得する
		 */
		extern int GetDrawFormatStringCharInfoToHandle(.DRAWCHARINFO* InfoBuffer, size_t InfoBufferSize, int FontHandle, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * フォントハンドルを使用した文字列の1文字毎の情報を取得する
		 */
		extern int GetDrawExtendStringCharInfoToHandle(.DRAWCHARINFO* InfoBuffer, size_t InfoBufferSize, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, int StrLen, int FontHandle, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * フォントハンドルを使用した文字列の1文字毎の情報を取得する
		 */
		extern int GetDrawExtendNStringCharInfoToHandle(.DRAWCHARINFO* InfoBuffer, size_t InfoBufferSize, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, int FontHandle, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * フォントハンドルを使用した書式付き文字列の1文字毎の情報を取得する
		 */
		extern int GetDrawExtendFormatStringCharInfoToHandle(.DRAWCHARINFO* InfoBuffer, size_t InfoBufferSize, double ExRateX, double ExRateY, int FontHandle, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * フォントハンドルを使用した二つの文字のペアのカーニング情報を取得する
		 *
		 * Params:
		 *      PairChar = カーニング情報を調べるペアとなる2文字の文字列( 2文字以上あっても先頭の2文字だけ使用されます )
		 *      KernAmount = 2文字目の文字を基本の位置からずらすドット数を代入するint型変数のアドレス
		 *      FontHandle = ?
		 */
		extern int GetDrawStringKerningPairInfoToHandle(const (dxlib_d.DxDataType.TCHAR)* PairChar, int* KernAmount, int FontHandle);

		/**
		 * フォントハンドルを使用した二つの文字のペアのカーニング情報を取得する
		 *
		 * Params:
		 *      PairChar = カーニング情報を調べるペアとなる2文字の文字列( 2文字以上あっても先頭の2文字だけ使用されます )
		 *      KernAmount = 2文字目の文字を基本の位置からずらすドット数を代入するint型変数のアドレス
		 *      FontHandle = ?
		 */
		extern int GetDrawStringKerningPairInfoToHandleWithStrLen(const (dxlib_d.DxDataType.TCHAR)* PairChar, size_t PairCharLength, int* KernAmount, int FontHandle);

		/**
		 * フォントハンドルの情報を取得する
		 */
		extern int GetFontStateToHandle(dxlib_d.DxDataType.TCHAR* FontName, int* Size, int* Thick, int FontHandle, int* FontType = null, int* CharSet = null, int* EdgeSize = null, int* Italic = null);

		/**
		 * フォントハンドルがテクスチャキャッシュを使用しているかどうかを取得する
		 */
		extern int CheckFontCacheToTextureFlag(int FontHandle);

		/**
		 * CheckFontCacheToTextureFlag の誤字版
		 */
		extern int CheckFontChacheToTextureFlag(int FontHandle);

		/**
		 * フォントハンドルが有効かどうかを取得する
		 */
		extern int CheckFontHandleValid(int FontHandle);

		/**
		 * フォントハンドルのキャッシュ情報を初期化する
		 */
		extern int ClearFontCacheToHandle(int FontHandle);

		/**
		 * フォントのキャッシュにテクスチャを使用するかどうかを設定する
		 *
		 * Params:
		 *      Flag = TRUE:テクスチャを使用する( デフォルト )  FALSE:テクスチャは使用しない
		 */
		extern int SetFontCacheToTextureFlag(int Flag);

		/**
		 * フォントのキャッシュにテクスチャを使用するかどうかを設定する
		 */
		extern int GetFontCacheToTextureFlag();

		/**
		 * SetFontCacheToTextureFlag の誤字版
		 */
		extern int SetFontChacheToTextureFlag(int Flag);

		/**
		 * GetFontCacheToTextureFlag の誤字版
		 */
		extern int GetFontChacheToTextureFlag();

		/**
		 * フォントのキャッシュとして使用するテクスチャのカラービット深度を設定する( 16 又は 32 のみ指定可能  デフォルトは 32 )
		 */
		extern int SetFontCacheTextureColorBitDepth(int ColorBitDepth);

		/**
		 * フォントのキャッシュとして使用するテクスチャのカラービット深度を取得する
		 */
		extern int GetFontCacheTextureColorBitDepth();

		/**
		 * フォントキャッシュでキャッシュできる文字数を設定する
		 */
		extern int SetFontCacheCharNum(int CharNum);

		/**
		 * フォントキャッシュでキャッシュできる文字数を取得する
		 *
		 * Returns: 0:デフォルト  1以上:指定文字数
		 */
		extern int GetFontCacheCharNum();

		/**
		 * フォントキャッシュとして保存する画像の形式を乗算済みαチャンネル付き画像にするかどうかを設定する
		 *
		 * Params:
		 *      Flag = TRUE:乗算済みαを使用する  FLASE:乗算済みαを使用しない( デフォルト )
		 */
		extern int SetFontCacheUsePremulAlphaFlag(int Flag);

		/**
		 * フォントキャッシュとして保存する画像の形式を乗算済みαチャンネル付き画像にするかどうかを取得する
		 */
		extern int GetFontCacheUsePremulAlphaFlag();

		/**
		 * フォントのサイズを補正する処理を行うかどうかを設定する
		 *
		 * Params:
		 *      Flag = TRUE:行う( デフォルト )  FALSE:行わない
		 */
		extern int SetFontUseAdjustSizeFlag(int Flag);

		/**
		 * フォントのサイズを補正する処理を行うかどうかを取得する
		 */
		extern int GetFontUseAdjustSizeFlag();

		// FontCacheStringDraw の代わりに DrawString を使ってください

		/**
		 * ?
		 */
		extern int FontCacheStringDrawToHandle(int x, int y, const (dxlib_d.DxDataType.TCHAR)* StrData, uint Color, uint EdgeColor, .BASEIMAGE* DestImage, const (dxlib_d.DxDataType.RECT)* ClipRect /* null 可 */, int FontHandle, int VerticalFlag = dxlib_d.DxDataType.FALSE, dxlib_d.DxDataType.SIZE* DrawSizeP = null);

		/**
		 * ?
		 */
		extern int FontCacheStringDrawToHandleWithStrLen(int x, int y, const (dxlib_d.DxDataType.TCHAR)* StrData, size_t StrDataLength, uint Color, uint EdgeColor, .BASEIMAGE* DestImage, const (dxlib_d.DxDataType.RECT)* ClipRect /* null 可 */, int FontHandle, int VerticalFlag = dxlib_d.DxDataType.FALSE, dxlib_d.DxDataType.SIZE* DrawSizeP = null);

		/**
		 * 基本イメージに文字列を描画する( デフォルトフォントハンドルを使用する )
		 */
		extern int FontBaseImageBlt(int x, int y, const (dxlib_d.DxDataType.TCHAR)* StrData, .BASEIMAGE* DestImage, .BASEIMAGE* DestEdgeImage, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 基本イメージに文字列を描画する( デフォルトフォントハンドルを使用する )
		 */
		extern int FontBaseImageBltWithStrLen(int x, int y, const (dxlib_d.DxDataType.TCHAR)* StrData, size_t StrDataLength, .BASEIMAGE* DestImage, .BASEIMAGE* DestEdgeImage, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 基本イメージに文字列を描画する
		 */
		extern int FontBaseImageBltToHandle(int x, int y, const (dxlib_d.DxDataType.TCHAR)* StrData, .BASEIMAGE* DestImage, .BASEIMAGE* DestEdgeImage, int FontHandle, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 基本イメージに文字列を描画する
		 */
		extern int FontBaseImageBltToHandleWithStrLen(int x, int y, const (dxlib_d.DxDataType.TCHAR)* StrData, size_t StrDataLength, .BASEIMAGE* DestImage, .BASEIMAGE* DestEdgeImage, int FontHandle, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * 2バイト文字か調べる( TRUE:2バイト文字  FALSE:1バイト文字 )
		 *
		 * Returns: TRUE:2バイト文字  FALSE:1バイト文字
		 */
		extern int MultiByteCharCheck(const (char)* Buf, int CharSet /* DX_CHARSET_SHFTJIS */);

		// 文字列描画関数

		/**
		 * デフォルトフォントハンドルを使用して文字列を描画する
		 */
		extern int DrawString(int x, int y, const (dxlib_d.DxDataType.TCHAR)* String, uint Color, uint EdgeColor = 0);

		/**
		 * デフォルトフォントハンドルを使用して文字列を描画する
		 */
		extern int DrawNString(int x, int y, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, uint Color, uint EdgeColor = 0);

		/**
		 * デフォルトフォントハンドルを使用して文字列を描画する( 縦書き )
		 */
		extern int DrawVString(int x, int y, const (dxlib_d.DxDataType.TCHAR)* String, uint Color, uint EdgeColor = 0);

		/**
		 * デフォルトフォントハンドルを使用して文字列を描画する( 縦書き )
		 */
		extern int DrawNVString(int x, int y, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, uint Color, uint EdgeColor = 0);

		/**
		 * デフォルトフォントハンドルを使用して書式指定文字列を描画する
		 */
		extern int DrawFormatString(int x, int y, uint Color, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * デフォルトフォントハンドルを使用して書式指定文字列を描画する( 縦書き )
		 */
		extern int DrawFormatVString(int x, int y, uint Color, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * デフォルトフォントハンドルを使用して文字列の拡大描画
		 */
		extern int DrawExtendString(int x, int y, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, uint Color, uint EdgeColor = 0);

		/**
		 * デフォルトフォントハンドルを使用して文字列の拡大描画
		 */
		extern int DrawExtendNString(int x, int y, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, uint Color, uint EdgeColor = 0);

		/**
		 * デフォルトフォントハンドルを使用して文字列の拡大描画( 縦書き )
		 */
		extern int DrawExtendVString(int x, int y, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, uint Color, uint EdgeColor = 0);

		/**
		 * デフォルトフォントハンドルを使用して文字列の拡大描画( 縦書き )
		 */
		extern int DrawExtendNVString(int x, int y, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, uint Color, uint EdgeColor = 0);

		/**
		 * デフォルトフォントハンドルを使用して書式指定文字列を拡大描画する
		 */
		extern int DrawExtendFormatString(int x, int y, double ExRateX, double ExRateY, uint Color, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * デフォルトフォントハンドルを使用して書式指定文字列を拡大描画する( 縦書き )
		 */
		extern int DrawExtendFormatVString(int x, int y, double ExRateX, double ExRateY, uint Color, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * デフォルトフォントハンドルを使用して文字列を回転描画する
		 */
		extern int DrawRotaString(int x, int y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, uint Color, uint EdgeColor = 0, int VerticalFlag = dxlib_d.DxDataType.FALSE, const (dxlib_d.DxDataType.TCHAR)* String = null);

		/**
		 * デフォルトフォントハンドルを使用して文字列を回転描画する
		 */
		extern int DrawRotaNString(int x, int y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, uint Color, uint EdgeColor = 0, int VerticalFlag = dxlib_d.DxDataType.FALSE, const (dxlib_d.DxDataType.TCHAR)* String = null, size_t StringLength = 0);

		/**
		 * デフォルトフォントハンドルを使用して書式指定文字列を回転描画する
		 */
		extern int DrawRotaFormatString(int x, int y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, uint Color, uint EdgeColor = 0, int VerticalFlag = dxlib_d.DxDataType.FALSE, const (dxlib_d.DxDataType.TCHAR)* FormatString = null, ...);

		/**
		 * デフォルトフォントハンドルを使用して文字列を変形描画する
		 */
		extern int DrawModiString(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, uint Color, uint EdgeColor = 0, int VerticalFlag = dxlib_d.DxDataType.FALSE, const (dxlib_d.DxDataType.TCHAR)* String = null);

		/**
		 * デフォルトフォントハンドルを使用して文字列を変形描画する
		 */
		extern int DrawModiNString(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, uint Color, uint EdgeColor = 0, int VerticalFlag = dxlib_d.DxDataType.FALSE, const (dxlib_d.DxDataType.TCHAR)* String = null, size_t StringLength = 0);

		/**
		 * デフォルトフォントハンドルを使用して書式指定文字列を変形描画する
		 */
		extern int DrawModiFormatString(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, uint Color, uint EdgeColor = 0, int VerticalFlag = dxlib_d.DxDataType.FALSE, const (dxlib_d.DxDataType.TCHAR)* FormatString = null, ...);

		/**
		 * デフォルトフォントハンドルを使用して文字列を描画する( 座標指定が float 版 )
		 */
		extern int DrawStringF(float x, float y, const (dxlib_d.DxDataType.TCHAR)* String, uint Color, uint EdgeColor = 0);

		/**
		 * デフォルトフォントハンドルを使用して文字列を描画する( 座標指定が float 版 )
		 */
		extern int DrawNStringF(float x, float y, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, uint Color, uint EdgeColor = 0);

		/**
		 * デフォルトフォントハンドルを使用して文字列を描画する( 縦書き )( 座標指定が float 版 )
		 */
		extern int DrawVStringF(float x, float y, const (dxlib_d.DxDataType.TCHAR)* String, uint Color, uint EdgeColor = 0);

		/**
		 * デフォルトフォントハンドルを使用して文字列を描画する( 縦書き )( 座標指定が float 版 )
		 */
		extern int DrawNVStringF(float x, float y, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, uint Color, uint EdgeColor = 0);

		/**
		 * デフォルトフォントハンドルを使用して書式指定文字列を描画する( 座標指定が float 版 )
		 */
		extern int DrawFormatStringF(float x, float y, uint Color, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * デフォルトフォントハンドルを使用して書式指定文字列を描画する( 縦書き )( 座標指定が float 版 )
		 */
		extern int DrawFormatVStringF(float x, float y, uint Color, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * デフォルトフォントハンドルを使用して文字列の拡大描画( 座標指定が float 版 )
		 */
		extern int DrawExtendStringF(float x, float y, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, uint Color, uint EdgeColor = 0);

		/**
		 * デフォルトフォントハンドルを使用して文字列の拡大描画( 座標指定が float 版 )
		 */
		extern int DrawExtendNStringF(float x, float y, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, uint Color, uint EdgeColor = 0);

		/**
		 * デフォルトフォントハンドルを使用して文字列の拡大描画( 縦書き )( 座標指定が float 版 )
		 */
		extern int DrawExtendVStringF(float x, float y, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, uint Color, uint EdgeColor = 0);

		/**
		 * デフォルトフォントハンドルを使用して文字列の拡大描画( 縦書き )( 座標指定が float 版 )
		 */
		extern int DrawExtendNVStringF(float x, float y, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, uint Color, uint EdgeColor = 0);

		/**
		 * デフォルトフォントハンドルを使用して書式指定文字列を拡大描画する( 座標指定が float 版 )
		 */
		extern int DrawExtendFormatStringF(float x, float y, double ExRateX, double ExRateY, uint Color, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * デフォルトフォントハンドルを使用して書式指定文字列を拡大描画する( 縦書き )( 座標指定が float 版 )
		 */
		extern int DrawExtendFormatVStringF(float x, float y, double ExRateX, double ExRateY, uint Color, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * デフォルトフォントハンドルを使用して文字列を回転描画する( 座標指定が float 版 )
		 */
		extern int DrawRotaStringF(float x, float y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, uint Color, uint EdgeColor = 0, int VerticalFlag = dxlib_d.DxDataType.FALSE, const (dxlib_d.DxDataType.TCHAR)* String = null);

		/**
		 * デフォルトフォントハンドルを使用して文字列を回転描画する( 座標指定が float 版 )
		 */
		extern int DrawRotaNStringF(float x, float y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, uint Color, uint EdgeColor = 0, int VerticalFlag = dxlib_d.DxDataType.FALSE, const (dxlib_d.DxDataType.TCHAR)* String = null, size_t StringLength = 0);

		/**
		 * デフォルトフォントハンドルを使用して書式指定文字列を回転描画する( 座標指定が float 版 )
		 */
		extern int DrawRotaFormatStringF(float x, float y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, uint Color, uint EdgeColor = 0, int VerticalFlag = dxlib_d.DxDataType.FALSE, const (dxlib_d.DxDataType.TCHAR)* FormatString = null, ...);

		/**
		 * デフォルトフォントハンドルを使用して文字列を変形描画する( 座標指定が float 版 )
		 */
		extern int DrawModiStringF(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, uint Color, uint EdgeColor = 0, int VerticalFlag = dxlib_d.DxDataType.FALSE, const (dxlib_d.DxDataType.TCHAR)* String = null);

		/**
		 * デフォルトフォントハンドルを使用して文字列を変形描画する( 座標指定が float 版 )
		 */
		extern int DrawModiNStringF(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, uint Color, uint EdgeColor = 0, int VerticalFlag = dxlib_d.DxDataType.FALSE, const (dxlib_d.DxDataType.TCHAR)* String = null, size_t StringLength = 0);

		/**
		 * デフォルトフォントハンドルを使用して書式指定文字列を変形描画する( 座標指定が float 版 )
		 */
		extern int DrawModiFormatStringF(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, uint Color, uint EdgeColor = 0, int VerticalFlag = dxlib_d.DxDataType.FALSE, const (dxlib_d.DxDataType.TCHAR)* FormatString = null, ...);

		/**
		 * デフォルトフォントハンドルを使用して整数型の数値を描画する
		 */
		extern int DrawNumberToI(int x, int y, int Num, int RisesNum, uint Color, uint EdgeColor = 0);

		/**
		 * デフォルトフォントハンドルを使用して浮動小数点型の数値を描画する
		 */
		extern int DrawNumberToF(int x, int y, double Num, int Length, uint Color, uint EdgeColor = 0);

		/**
		 * デフォルトフォントハンドルを使用して整数型の数値とその説明の文字列を一度に描画する
		 */
		extern int DrawNumberPlusToI(int x, int y, const (dxlib_d.DxDataType.TCHAR)* NoteString, int Num, int RisesNum, uint Color, uint EdgeColor = 0);

		/**
		 * デフォルトフォントハンドルを使用して浮動小数点型の数値とその説明の文字列を一度に描画する
		 */
		extern int DrawNumberPlusToF(int x, int y, const (dxlib_d.DxDataType.TCHAR)* NoteString, double Num, int Length, uint Color, uint EdgeColor = 0);

		/**
		 * デフォルトフォントハンドルを使用してZバッファに対して文字列を描画する
		 */
		extern int DrawStringToZBuffer(int x, int y, const (dxlib_d.DxDataType.TCHAR)* String, int WriteZMode /* DX_ZWRITE_MASK 等 */);

		/**
		 * デフォルトフォントハンドルを使用してZバッファに対して文字列を描画する
		 */
		extern int DrawNStringToZBuffer(int x, int y, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, int WriteZMode /* DX_ZWRITE_MASK 等 */);

		/**
		 * デフォルトフォントハンドルを使用してZバッファに対して文字列を描画する( 縦書き )
		 */
		extern int DrawVStringToZBuffer(int x, int y, const (dxlib_d.DxDataType.TCHAR)* String, int WriteZMode /* DX_ZWRITE_MASK 等 */);

		/**
		 * デフォルトフォントハンドルを使用してZバッファに対して文字列を描画する( 縦書き )
		 */
		extern int DrawNVStringToZBuffer(int x, int y, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, int WriteZMode /* DX_ZWRITE_MASK 等 */);

		/**
		 * デフォルトフォントハンドルを使用してZバッファに対して書式指定文字列を描画する
		 */
		extern int DrawFormatStringToZBuffer(int x, int y, int WriteZMode /* DX_ZWRITE_MASK 等 */, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * デフォルトフォントハンドルを使用してZバッファに対して書式指定文字列を描画する( 縦書き )
		 */
		extern int DrawFormatVStringToZBuffer(int x, int y, int WriteZMode /* DX_ZWRITE_MASK 等 */, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * デフォルトフォントハンドルを使用してZバッファに対して文字列を拡大描画する
		 */
		extern int DrawExtendStringToZBuffer(int x, int y, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, int WriteZMode /* DX_ZWRITE_MASK 等 */);

		/**
		 * デフォルトフォントハンドルを使用してZバッファに対して文字列を拡大描画する
		 */
		extern int DrawExtendNStringToZBuffer(int x, int y, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, int WriteZMode /* DX_ZWRITE_MASK 等 */);

		/**
		 * デフォルトフォントハンドルを使用してZバッファに対して文字列を拡大描画する( 縦書き )
		 */
		extern int DrawExtendVStringToZBuffer(int x, int y, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, int WriteZMode /* DX_ZWRITE_MASK 等 */);

		/**
		 * デフォルトフォントハンドルを使用してZバッファに対して文字列を拡大描画する( 縦書き )
		 */
		extern int DrawExtendNVStringToZBuffer(int x, int y, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, int WriteZMode /* DX_ZWRITE_MASK 等 */);

		/**
		 * デフォルトフォントハンドルを使用してZバッファに対して書式指定文字列を拡大描画する
		 */
		extern int DrawExtendFormatStringToZBuffer(int x, int y, double ExRateX, double ExRateY, int WriteZMode /* DX_ZWRITE_MASK 等 */, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * デフォルトフォントハンドルを使用してZバッファに対して書式指定文字列を拡大描画する( 縦書き )
		 */
		extern int DrawExtendFormatVStringToZBuffer(int x, int y, double ExRateX, double ExRateY, int WriteZMode /* DX_ZWRITE_MASK 等 */, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * デフォルトフォントハンドルを使用してZバッファに対して文字列を回転描画する
		 */
		extern int DrawRotaStringToZBuffer(int x, int y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, int WriteZMode /* DX_ZWRITE_MASK 等 */, int VerticalFlag, const (dxlib_d.DxDataType.TCHAR)* String);

		/**
		 * デフォルトフォントハンドルを使用してZバッファに対して文字列を回転描画する
		 */
		extern int DrawRotaNStringToZBuffer(int x, int y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, int WriteZMode /* DX_ZWRITE_MASK 等 */, int VerticalFlag, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength);

		/**
		 * デフォルトフォントハンドルを使用してZバッファに対して書式指定文字列を回転描画する
		 */
		extern int DrawRotaFormatStringToZBuffer(int x, int y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, int WriteZMode /* DX_ZWRITE_MASK 等 */, int VerticalFlag, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * デフォルトフォントハンドルを使用してZバッファに対して文字列を変形描画する
		 */
		extern int DrawModiStringToZBuffer(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, int WriteZMode /* DX_ZWRITE_MASK 等 */, int VerticalFlag, const (dxlib_d.DxDataType.TCHAR)* String);

		/**
		 * デフォルトフォントハンドルを使用してZバッファに対して文字列を変形描画する
		 */
		extern int DrawModiNStringToZBuffer(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, int WriteZMode /* DX_ZWRITE_MASK 等 */, int VerticalFlag, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength);

		/**
		 * デフォルトフォントハンドルを使用してZバッファに対して書式指定文字列を変形描画する
		 */
		extern int DrawModiFormatStringToZBuffer(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, int WriteZMode /* DX_ZWRITE_MASK 等 */, int VerticalFlag, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * フォントハンドルを使用して文字列を描画する
		 */
		extern int DrawStringToHandle(int x, int y, const (dxlib_d.DxDataType.TCHAR)* String, uint Color, int FontHandle, uint EdgeColor = 0, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * フォントハンドルを使用して文字列を描画する
		 */
		extern int DrawNStringToHandle(int x, int y, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, uint Color, int FontHandle, uint EdgeColor = 0, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * フォントハンドルを使用して文字列を描画する( 縦書き )
		 */
		extern int DrawVStringToHandle(int x, int y, const (dxlib_d.DxDataType.TCHAR)* String, uint Color, int FontHandle, uint EdgeColor = 0);

		/**
		 * フォントハンドルを使用して文字列を描画する( 縦書き )
		 */
		extern int DrawNVStringToHandle(int x, int y, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, uint Color, int FontHandle, uint EdgeColor = 0);

		/**
		 * フォントハンドルを使用して書式指定文字列を描画する
		 */
		extern int DrawFormatStringToHandle(int x, int y, uint Color, int FontHandle, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * フォントハンドルを使用して書式指定文字列を描画する( 縦書き )
		 */
		extern int DrawFormatVStringToHandle(int x, int y, uint Color, int FontHandle, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * フォントハンドルを使用して文字列を拡大描画する
		 */
		extern int DrawExtendStringToHandle(int x, int y, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, uint Color, int FontHandle, uint EdgeColor = 0, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * フォントハンドルを使用して文字列を拡大描画する
		 */
		extern int DrawExtendNStringToHandle(int x, int y, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, uint Color, int FontHandle, uint EdgeColor = 0, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * フォントハンドルを使用して文字列を拡大描画する( 縦書き )
		 */
		extern int DrawExtendVStringToHandle(int x, int y, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, uint Color, int FontHandle, uint EdgeColor = 0);

		/**
		 * フォントハンドルを使用して文字列を拡大描画する( 縦書き )
		 */
		extern int DrawExtendNVStringToHandle(int x, int y, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, uint Color, int FontHandle, uint EdgeColor = 0);

		/**
		 * フォントハンドルを使用して書式指定文字列を拡大描画する
		 */
		extern int DrawExtendFormatStringToHandle(int x, int y, double ExRateX, double ExRateY, uint Color, int FontHandle, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * フォントハンドルを使用して書式指定文字列を拡大描画する( 縦書き )
		 */
		extern int DrawExtendFormatVStringToHandle(int x, int y, double ExRateX, double ExRateY, uint Color, int FontHandle, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * フォントハンドルを使用して文字列を回転描画する
		 */
		extern int DrawRotaStringToHandle(int x, int y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, uint Color, int FontHandle, uint EdgeColor, int VerticalFlag, const (dxlib_d.DxDataType.TCHAR)* String);

		/**
		 * フォントハンドルを使用して文字列を回転描画する
		 */
		extern int DrawRotaNStringToHandle(int x, int y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, uint Color, int FontHandle, uint EdgeColor, int VerticalFlag, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength);

		/**
		 * フォントハンドルを使用して書式指定文字列を回転描画する
		 */
		extern int DrawRotaFormatStringToHandle(int x, int y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, uint Color, int FontHandle, uint EdgeColor, int VerticalFlag, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * フォントハンドルを使用して文字列を変形描画する
		 */
		extern int DrawModiStringToHandle(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, uint Color, int FontHandle, uint EdgeColor, int VerticalFlag, const (dxlib_d.DxDataType.TCHAR)* String);

		/**
		 * フォントハンドルを使用して文字列を変形描画する
		 */
		extern int DrawModiNStringToHandle(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, uint Color, int FontHandle, uint EdgeColor, int VerticalFlag, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength);

		/**
		 * フォントハンドルを使用して書式指定文字列を変形描画する
		 */
		extern int DrawModiFormatStringToHandle(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, uint Color, int FontHandle, uint EdgeColor, int VerticalFlag, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * フォントハンドルを使用して文字列を描画する( 座標指定が float 版 )
		 */
		extern int DrawStringFToHandle(float x, float y, const (dxlib_d.DxDataType.TCHAR)* String, uint Color, int FontHandle, uint EdgeColor = 0, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * フォントハンドルを使用して文字列を描画する( 座標指定が float 版 )
		 */
		extern int DrawNStringFToHandle(float x, float y, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, uint Color, int FontHandle, uint EdgeColor = 0, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * フォントハンドルを使用して文字列を描画する( 縦書き )( 座標指定が float 版 )
		 */
		extern int DrawVStringFToHandle(float x, float y, const (dxlib_d.DxDataType.TCHAR)* String, uint Color, int FontHandle, uint EdgeColor = 0);

		/**
		 * フォントハンドルを使用して文字列を描画する( 縦書き )( 座標指定が float 版 )
		 */
		extern int DrawNVStringFToHandle(float x, float y, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, uint Color, int FontHandle, uint EdgeColor = 0);

		/**
		 * フォントハンドルを使用して書式指定文字列を描画する( 座標指定が float 版 )
		 */
		extern int DrawFormatStringFToHandle(float x, float y, uint Color, int FontHandle, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * フォントハンドルを使用して書式指定文字列を描画する( 縦書き )( 座標指定が float 版 )
		 */
		extern int DrawFormatVStringFToHandle(float x, float y, uint Color, int FontHandle, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * フォントハンドルを使用して文字列を拡大描画する( 座標指定が float 版 )
		 */
		extern int DrawExtendStringFToHandle(float x, float y, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, uint Color, int FontHandle, uint EdgeColor = 0, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * フォントハンドルを使用して文字列を拡大描画する( 座標指定が float 版 )
		 */
		extern int DrawExtendNStringFToHandle(float x, float y, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, uint Color, int FontHandle, uint EdgeColor = 0, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * フォントハンドルを使用して文字列を拡大描画する( 縦書き )( 座標指定が float 版 )
		 */
		extern int DrawExtendVStringFToHandle(float x, float y, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, uint Color, int FontHandle, uint EdgeColor = 0);

		/**
		 * フォントハンドルを使用して文字列を拡大描画する( 縦書き )( 座標指定が float 版 )
		 */
		extern int DrawExtendNVStringFToHandle(float x, float y, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, uint Color, int FontHandle, uint EdgeColor = 0);

		/**
		 * フォントハンドルを使用して書式指定文字列を拡大描画する( 座標指定が float 版 )
		 */
		extern int DrawExtendFormatStringFToHandle(float x, float y, double ExRateX, double ExRateY, uint Color, int FontHandle, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * フォントハンドルを使用して書式指定文字列を拡大描画する( 縦書き )( 座標指定が float 版 )
		 */
		extern int DrawExtendFormatVStringFToHandle(float x, float y, double ExRateX, double ExRateY, uint Color, int FontHandle, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * フォントハンドルを使用して文字列を回転描画する( 座標指定が float 版 )
		 */
		extern int DrawRotaStringFToHandle(float x, float y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, uint Color, int FontHandle, uint EdgeColor = 0, int VerticalFlag = dxlib_d.DxDataType.FALSE, const (dxlib_d.DxDataType.TCHAR)* String = null);

		/**
		 * フォントハンドルを使用して文字列を回転描画する( 座標指定が float 版 )
		 */
		extern int DrawRotaNStringFToHandle(float x, float y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, uint Color, int FontHandle, uint EdgeColor = 0, int VerticalFlag = dxlib_d.DxDataType.FALSE, const (dxlib_d.DxDataType.TCHAR)* String = null, size_t StringLength = 0);

		/**
		 * フォントハンドルを使用して書式指定文字列を回転描画する( 座標指定が float 版 )
		 */
		extern int DrawRotaFormatStringFToHandle(float x, float y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, uint Color, int FontHandle, uint EdgeColor = 0, int VerticalFlag = dxlib_d.DxDataType.FALSE, const (dxlib_d.DxDataType.TCHAR)* FormatString = null, ...);

		/**
		 * フォントハンドルを使用して文字列を変形描画する( 座標指定が float 版 )
		 */
		extern int DrawModiStringFToHandle(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, uint Color, int FontHandle, uint EdgeColor, int VerticalFlag, const (dxlib_d.DxDataType.TCHAR)* String);

		/**
		 * フォントハンドルを使用して文字列を変形描画する( 座標指定が float 版 )
		 */
		extern int DrawModiNStringFToHandle(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, uint Color, int FontHandle, uint EdgeColor, int VerticalFlag, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength);

		/**
		 * フォントハンドルを使用して書式指定文字列を変形描画する( 座標指定が float 版 )
		 */
		extern int DrawModiFormatStringFToHandle(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, uint Color, int FontHandle, uint EdgeColor, int VerticalFlag, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * フォントハンドルを使用して整数型の数値を描画する
		 */
		extern int DrawNumberToIToHandle(int x, int y, int Num, int RisesNum, uint Color, int FontHandle, uint EdgeColor = 0);

		/**
		 * フォントハンドルを使用して浮動小数点型の数値を描画する
		 */
		extern int DrawNumberToFToHandle(int x, int y, double Num, int Length, uint Color, int FontHandle, uint EdgeColor = 0);

		/**
		 * フォントハンドルを使用して整数型の数値とその説明の文字列を一度に描画する
		 */
		extern int DrawNumberPlusToIToHandle(int x, int y, const (dxlib_d.DxDataType.TCHAR)* NoteString, int Num, int RisesNum, uint Color, int FontHandle, uint EdgeColor = 0);

		/**
		 * フォントハンドルを使用して浮動小数点型の数値とその説明の文字列を一度に描画する
		 */
		extern int DrawNumberPlusToFToHandle(int x, int y, const (dxlib_d.DxDataType.TCHAR)* NoteString, double Num, int Length, uint Color, int FontHandle, uint EdgeColor = 0);

		/**
		 * フォントハンドルを使用してZバッファに対して文字列を描画する
		 */
		extern int DrawStringToHandleToZBuffer(int x, int y, const (dxlib_d.DxDataType.TCHAR)* String, int FontHandle, int WriteZMode /* DX_ZWRITE_MASK 等 */, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * フォントハンドルを使用してZバッファに対して文字列を描画する
		 */
		extern int DrawNStringToHandleToZBuffer(int x, int y, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, int FontHandle, int WriteZMode /* DX_ZWRITE_MASK 等 */, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * フォントハンドルを使用してZバッファに対して文字列を描画する( 縦書き )
		 */
		extern int DrawVStringToHandleToZBuffer(int x, int y, const (dxlib_d.DxDataType.TCHAR)* String, int FontHandle, int WriteZMode /* DX_ZWRITE_MASK 等 */);

		/**
		 * フォントハンドルを使用してZバッファに対して文字列を描画する( 縦書き )
		 */
		extern int DrawNVStringToHandleToZBuffer(int x, int y, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, int FontHandle, int WriteZMode /* DX_ZWRITE_MASK 等 */);

		/**
		 * フォントハンドルを使用してZバッファに対して書式指定文字列を描画する
		 */
		extern int DrawFormatStringToHandleToZBuffer(int x, int y, int FontHandle, int WriteZMode /* DX_ZWRITE_MASK 等 */, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * フォントハンドルを使用してZバッファに対して書式指定文字列を描画する( 縦書き )
		 */
		extern int DrawFormatVStringToHandleToZBuffer(int x, int y, int FontHandle, int WriteZMode /* DX_ZWRITE_MASK 等 */, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * フォントハンドルを使用してZバッファに対して文字列を拡大描画する
		 */
		extern int DrawExtendStringToHandleToZBuffer(int x, int y, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, int FontHandle, int WriteZMode /* DX_ZWRITE_MASK 等 */, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * フォントハンドルを使用してZバッファに対して文字列を拡大描画する
		 */
		extern int DrawExtendNStringToHandleToZBuffer(int x, int y, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, int FontHandle, int WriteZMode /* DX_ZWRITE_MASK 等 */, int VerticalFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * フォントハンドルを使用してZバッファに対して文字列を拡大描画する( 縦書き )
		 */
		extern int DrawExtendVStringToHandleToZBuffer(int x, int y, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, int FontHandle, int WriteZMode /* DX_ZWRITE_MASK 等 */);

		/**
		 * フォントハンドルを使用してZバッファに対して文字列を拡大描画する( 縦書き )
		 */
		extern int DrawExtendNVStringToHandleToZBuffer(int x, int y, double ExRateX, double ExRateY, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength, int FontHandle, int WriteZMode /* DX_ZWRITE_MASK 等 */);

		/**
		 * フォントハンドルを使用してZバッファに対して書式指定文字列を拡大描画する
		 */
		extern int DrawExtendFormatStringToHandleToZBuffer(int x, int y, double ExRateX, double ExRateY, int FontHandle, int WriteZMode /* DX_ZWRITE_MASK 等 */, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * フォントハンドルを使用してZバッファに対して書式指定文字列を拡大描画する( 縦書き )
		 */
		extern int DrawExtendFormatVStringToHandleToZBuffer(int x, int y, double ExRateX, double ExRateY, int FontHandle, int WriteZMode /* DX_ZWRITE_MASK 等 */, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * フォントハンドルを使用してZバッファに対して文字列を回転描画する
		 */
		extern int DrawRotaStringToHandleToZBuffer(int x, int y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, int FontHandle, int WriteZMode /* DX_ZWRITE_MASK 等 */, int VerticalFlag, const (dxlib_d.DxDataType.TCHAR)* String);

		/**
		 * フォントハンドルを使用してZバッファに対して文字列を回転描画する
		 */
		extern int DrawRotaNStringToHandleToZBuffer(int x, int y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, int FontHandle, int WriteZMode /* DX_ZWRITE_MASK 等 */, int VerticalFlag, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength);

		/**
		 * フォントハンドルを使用してZバッファに対して書式指定文字列を回転描画する
		 */
		extern int DrawRotaFormatStringToHandleToZBuffer(int x, int y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, int FontHandle, int WriteZMode /* DX_ZWRITE_MASK 等 */, int VerticalFlag, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);

		/**
		 * フォントハンドルを使用してZバッファに対して文字列を変形描画する
		 */
		extern int DrawModiStringToHandleToZBuffer(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, int FontHandle, int WriteZMode /* DX_ZWRITE_MASK 等 */, int VerticalFlag, const (dxlib_d.DxDataType.TCHAR)* String);

		/**
		 * フォントハンドルを使用してZバッファに対して文字列を変形描画する
		 */
		extern int DrawModiNStringToHandleToZBuffer(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, int FontHandle, int WriteZMode /* DX_ZWRITE_MASK 等 */, int VerticalFlag, const (dxlib_d.DxDataType.TCHAR)* String, size_t StringLength);

		/**
		 * フォントハンドルを使用してZバッファに対して書式指定文字列を変形描画する
		 */
		extern int DrawModiFormatStringToHandleToZBuffer(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, int FontHandle, int WriteZMode /* DX_ZWRITE_MASK 等 */, int VerticalFlag, const (dxlib_d.DxDataType.TCHAR)* FormatString, ...);
	}

	// DxMath.cpp 関数プロトタイプ宣言

	// 演算ライブラリ

	/**
	 * float型要素の行列をdouble型要素の行列に変換する
	 */
	extern int ConvertMatrixFtoD(.MATRIX_D* Out, const (.MATRIX)* In);

	/**
	 * double型要素の行列をfloat型要素の行列に変換する
	 */
	extern int ConvertMatrixDtoF(.MATRIX* Out, const (.MATRIX_D)* In);

	/**
	 * 単位行列を作成する
	 */
	extern int CreateIdentityMatrix(.MATRIX* Out);

	/**
	 * 単位行列を作成する
	 */
	extern int CreateIdentityMatrixD(.MATRIX_D* Out);

	/**
	 * ビュー行列を作成する
	 */
	extern int CreateLookAtMatrix(.MATRIX* Out, const (.VECTOR)* Eye, const (.VECTOR)* At, const (.VECTOR)* Up);

	/**
	 * ビュー行列を作成する
	 */
	extern int CreateLookAtMatrixD(.MATRIX_D* Out, const (.VECTOR_D)* Eye, const (.VECTOR_D)* At, const (.VECTOR_D)* Up);

	/**
	 * ビュー行列を作成する(方向を回転値で指定)
	 */
	extern int CreateLookAtMatrix2(.MATRIX* Out, const (.VECTOR)* Eye, double XZAngle, double Oira);

	/**
	 * ビュー行列を作成する(方向を回転値で指定)
	 */
	extern int CreateLookAtMatrix2D(.MATRIX_D* Out, const (.VECTOR_D)* Eye, double XZAngle, double Oira);

	/**
	 * ビュー行列を作成する(右手座標系用)
	 */
	extern int CreateLookAtMatrixRH(.MATRIX* Out, const (.VECTOR)* Eye, const (.VECTOR)* At, const (.VECTOR)* Up);

	/**
	 * ビュー行列を作成する(右手座標系用)
	 */
	extern int CreateLookAtMatrixRHD(.MATRIX_D* Out, const (.VECTOR_D)* Eye, const (.VECTOR_D)* At, const (.VECTOR_D)* Up);

	/**
	 * 行列の積を求める
	 */
	extern int CreateMultiplyMatrix(.MATRIX* Out, const (.MATRIX)* In1, const (.MATRIX)* In2);

	/**
	 * 行列の積を求める
	 */
	extern int CreateMultiplyMatrixD(.MATRIX_D* Out, const (.MATRIX_D)* In1, const (.MATRIX_D)* In2);

	/**
	 * 射影行列を作成する
	 */
	extern int CreatePerspectiveFovMatrix(.MATRIX* Out, float fov, float zn, float zf, float aspect = -1.0f);

	/**
	 * 射影行列を作成する
	 */
	extern int CreatePerspectiveFovMatrixD(.MATRIX_D* Out, double fov, double zn, double zf, double aspect = -1.0f);

	/**
	 * 射影行列を作成する(右手座標系用)
	 */
	extern int CreatePerspectiveFovMatrixRH(.MATRIX* Out, float fov, float zn, float zf, float aspect = -1.0f);

	/**
	 * 射影行列を作成する(右手座標系用)
	 */
	extern int CreatePerspectiveFovMatrixRHD(.MATRIX_D* Out, double fov, double zn, double zf, double aspect = -1.0f);

	/**
	 * 正射影行列を作成する
	 */
	extern int CreateOrthoMatrix(.MATRIX* Out, float size, float zn, float zf, float aspect = -1.0f);

	/**
	 * 正射影行列を作成する
	 */
	extern int CreateOrthoMatrixD(.MATRIX_D* Out, double size, double zn, double zf, double aspect = -1.0f);

	/**
	 * 正射影行列を作成する(右手座標系用)
	 */
	extern int CreateOrthoMatrixRH(.MATRIX* Out, float size, float zn, float zf, float aspect = -1.0f);

	/**
	 * 正射影行列を作成する(右手座標系用)
	 */
	extern int CreateOrthoMatrixRHD(.MATRIX_D* Out, double size, double zn, double zf, double aspect = -1.0f);

	/**
	 * スケーリング行列を作成する
	 */
	extern int CreateScalingMatrix(.MATRIX* Out, float sx, float sy, float sz);

	/**
	 * スケーリング行列を作成する
	 */
	extern int CreateScalingMatrixD(.MATRIX_D* Out, double sx, double sy, double sz);

	/**
	 * X軸を中心とした回転行列を作成する
	 */
	extern int CreateRotationXMatrix(.MATRIX* Out, float Angle);

	/**
	 * X軸を中心とした回転行列を作成する
	 */
	extern int CreateRotationXMatrixD(.MATRIX_D* Out, double Angle);

	/**
	 * Y軸を中心とした回転行列を作成する
	 */
	extern int CreateRotationYMatrix(.MATRIX* Out, float Angle);

	/**
	 * Y軸を中心とした回転行列を作成する
	 */
	extern int CreateRotationYMatrixD(.MATRIX_D* Out, double Angle);

	/**
	 * Z軸を中心とした回転行列を作成する
	 */
	extern int CreateRotationZMatrix(.MATRIX* Out, float Angle);

	/**
	 * Z軸を中心とした回転行列を作成する
	 */
	extern int CreateRotationZMatrixD(.MATRIX_D* Out, double Angle);

	/**
	 * 平行移動行列を作成する
	 */
	extern int CreateTranslationMatrix(.MATRIX* Out, float x, float y, float z);

	/**
	 * 平行移動行列を作成する
	 */
	extern int CreateTranslationMatrixD(.MATRIX_D* Out, double x, double y, double z);

	/**
	 * 転置行列を作成する
	 */
	extern int CreateTransposeMatrix(.MATRIX* Out, const (.MATRIX)* In);

	/**
	 * 転置行列を作成する
	 */
	extern int CreateTransposeMatrixD(.MATRIX_D* Out, const (.MATRIX_D)* In);

	/**
	 * 逆行列を作成する
	 */
	extern int CreateInverseMatrix(.MATRIX* Out, const (.MATRIX)* In);

	/**
	 * 逆行列を作成する
	 */
	extern int CreateInverseMatrixD(.MATRIX_D* Out, const (.MATRIX_D)* In);

	/**
	 * ビューポート行列を作成する
	 */
	extern int CreateViewportMatrix(.MATRIX* Out, float CenterX, float CenterY, float Width, float Height);

	/**
	 * ビューポート行列を作成する
	 */
	extern int CreateViewportMatrixD(.MATRIX_D* Out, double CenterX, double CenterY, double Width, double Height);

	/**
	 * X軸回転→Y軸回転→Z軸回転を合成した行列を作成する
	 */
	extern int CreateRotationXYZMatrix(.MATRIX* Out, float XRot, float YRot, float ZRot);

	/**
	 * X軸回転→Y軸回転→Z軸回転を合成した行列を作成する
	 */
	extern int CreateRotationXYZMatrixD(.MATRIX_D* Out, double XRot, double YRot, double ZRot);

	/**
	 * X軸回転→Z軸回転→Y軸回転を合成した行列を作成する
	 */
	extern int CreateRotationXZYMatrix(.MATRIX* Out, float XRot, float YRot, float ZRot);

	/**
	 * X軸回転→Z軸回転→Y軸回転を合成した行列を作成する
	 */
	extern int CreateRotationXZYMatrixD(.MATRIX_D* Out, double XRot, double YRot, double ZRot);

	/**
	 * Y軸回転→X軸回転→Z軸回転を合成した行列を作成する
	 */
	extern int CreateRotationYXZMatrix(.MATRIX* Out, float XRot, float YRot, float ZRot);

	/**
	 * Y軸回転→X軸回転→Z軸回転を合成した行列を作成する
	 */
	extern int CreateRotationYXZMatrixD(.MATRIX_D* Out, double XRot, double YRot, double ZRot);

	/**
	 * Y軸回転→Z軸回転→X軸回転を合成した行列を作成する
	 */
	extern int CreateRotationYZXMatrix(.MATRIX* Out, float XRot, float YRot, float ZRot);

	/**
	 * Y軸回転→Z軸回転→X軸回転を合成した行列を作成する
	 */
	extern int CreateRotationYZXMatrixD(.MATRIX_D* Out, double XRot, double YRot, double ZRot);

	/**
	 * Z軸回転→X軸回転→Y軸回転を合成した行列を作成する
	 */
	extern int CreateRotationZXYMatrix(.MATRIX* Out, float XRot, float YRot, float ZRot);

	/**
	 * Z軸回転→X軸回転→Y軸回転を合成した行列を作成する
	 */
	extern int CreateRotationZXYMatrixD(.MATRIX_D* Out, double XRot, double YRot, double ZRot);

	/**
	 * Z軸回転→Y軸回転→X軸回転を合成した行列を作成する
	 */
	extern int CreateRotationZYXMatrix(.MATRIX* Out, float XRot, float YRot, float ZRot);

	/**
	 * Z軸回転→Y軸回転→X軸回転を合成した行列を作成する
	 */
	extern int CreateRotationZYXMatrixD(.MATRIX_D* Out, double XRot, double YRot, double ZRot);

	/**
	 * 行列からXYZ軸回転の値を取得する
	 *
	 * Returns: -1:ジンバルロック発生  0:成功
	 */
	extern int GetMatrixXYZRotation(const (.MATRIX)* In, float* OutXRot, float* OutYRot, float* OutZRot);

	/**
	 * 行列からXYZ軸回転の値を取得する
	 *
	 * Returns: -1:ジンバルロック発生  0:成功
	 */
	extern int GetMatrixXYZRotationD(const (.MATRIX_D)* In, double* OutXRot, double* OutYRot, double* OutZRot);

	/**
	 * 行列からXZY軸回転の値を取得する
	 *
	 * Returns: -1:ジンバルロック発生  0:成功
	 */
	extern int GetMatrixXZYRotation(const (.MATRIX)* In, float* OutXRot, float* OutYRot, float* OutZRot);

	/**
	 * 行列からXZY軸回転の値を取得する
	 *
	 * Returns: -1:ジンバルロック発生  0:成功
	 */
	extern int GetMatrixXZYRotationD(const (.MATRIX_D)* In, double* OutXRot, double* OutYRot, double* OutZRot);

	/**
	 * 行列からYXZ軸回転の値を取得する
	 *
	 * Returns: -1:ジンバルロック発生  0:成功
	 */
	extern int GetMatrixYXZRotation(const (.MATRIX)* In, float* OutXRot, float* OutYRot, float* OutZRot);

	/**
	 * 行列からYXZ軸回転の値を取得する
	 *
	 * Returns: -1:ジンバルロック発生  0:成功
	 */
	extern int GetMatrixYXZRotationD(const (.MATRIX_D)* In, double* OutXRot, double* OutYRot, double* OutZRot);

	/**
	 * 行列からYZX軸回転の値を取得する
	 *
	 * Returns: -1:ジンバルロック発生  0:成功
	 */
	extern int GetMatrixYZXRotation(const (.MATRIX)* In, float* OutXRot, float* OutYRot, float* OutZRot);

	/**
	 * 行列からYZX軸回転の値を取得する
	 *
	 * Returns: -1:ジンバルロック発生  0:成功
	 */
	extern int GetMatrixYZXRotationD(const (.MATRIX_D)* In, double* OutXRot, double* OutYRot, double* OutZRot);

	/**
	 * 行列からZXY軸回転の値を取得する
	 *
	 * Returns: -1:ジンバルロック発生  0:成功
	 */
	extern int GetMatrixZXYRotation(const (.MATRIX)* In, float* OutXRot, float* OutYRot, float* OutZRot);

	/**
	 * 行列からZXY軸回転の値を取得する
	 *
	 * Returns: -1:ジンバルロック発生  0:成功
	 */
	extern int GetMatrixZXYRotationD(const (.MATRIX_D)* In, double* OutXRot, double* OutYRot, double* OutZRot);

	/**
	 * 行列からZYX軸回転の値を取得する
	 *
	 * Returns: -1:ジンバルロック発生  0:成功
	 */
	extern int GetMatrixZYXRotation(const (.MATRIX)* In, float* OutXRot, float* OutYRot, float* OutZRot);

	/**
	 * 行列からZYX軸回転の値を取得する
	 *
	 * Returns: -1:ジンバルロック発生  0:成功
	 */
	extern int GetMatrixZYXRotationD(const (.MATRIX_D)* In, double* OutXRot, double* OutYRot, double* OutZRot);

	/**
	 * float型のベクトルをdouble型のベクトルに変換する
	 */
	extern int VectorConvertFtoD(.VECTOR_D* Out, const (.VECTOR)* In);

	/**
	 * double型のベクトルをfloat型のベクトルに変換する
	 */
	extern int VectorConvertDtoF(.VECTOR* Out, const (.VECTOR_D)* In);

	/**
	 * ベクトルを正規化する
	 */
	extern int VectorNormalize(.VECTOR* Out, const (.VECTOR)* In);

	/**
	 * ベクトルを正規化する
	 */
	extern int VectorNormalizeD(.VECTOR_D* Out, const (.VECTOR_D)* In);

	/**
	 * ベクトルをスカラー倍する
	 */
	extern int VectorScale(.VECTOR* Out, const (.VECTOR)* In, float Scale);

	/**
	 * ベクトルをスカラー倍する
	 */
	extern int VectorScaleD(.VECTOR_D* Out, const (.VECTOR_D)* In, double Scale);

	/**
	 * ベクトルの掛け算をする
	 */
	extern int VectorMultiply(.VECTOR* Out, const (.VECTOR)* In1, const (.VECTOR)* In2);

	/**
	 * ベクトルの掛け算をする
	 */
	extern int VectorMultiplyD(.VECTOR_D* Out, const (.VECTOR_D)* In1, const (.VECTOR_D)* In2);

	/**
	 * Out = In1 - In2 のベクトル計算をする
	 */
	extern int VectorSub(.VECTOR* Out, const (.VECTOR)* In1, const (.VECTOR)* In2);

	/**
	 * Out = In1 - In2 のベクトル計算をする
	 */
	extern int VectorSubD(.VECTOR_D* Out, const (.VECTOR_D)* In1, const (.VECTOR_D)* In2);

	/**
	 * Out = In1 + In2 のベクトル計算をする
	 */
	extern int VectorAdd(.VECTOR* Out, const (.VECTOR)* In1, const (.VECTOR)* In2);

	/**
	 * Out = In1 + In2 のベクトル計算をする
	 */
	extern int VectorAddD(.VECTOR_D* Out, const (.VECTOR_D)* In1, const (.VECTOR_D)* In2);

	/**
	 * In1とIn2の外積を計算する
	 */
	extern int VectorOuterProduct(.VECTOR* Out, const (.VECTOR)* In1, const (.VECTOR)* In2);

	/**
	 * In1とIn2の外積を計算する
	 */
	extern int VectorOuterProductD(.VECTOR_D* Out, const (.VECTOR_D)* In1, const (.VECTOR_D)* In2);

	/**
	 * In1とIn2の内積を計算する
	 */
	extern float VectorInnerProduct(const (.VECTOR)* In1, const (.VECTOR)* In2);

	/**
	 * In1とIn2の内積を計算する
	 */
	extern double VectorInnerProductD(const (.VECTOR_D)* In1, const (.VECTOR_D)* In2);

	/**
	 * ベクトルのX軸を軸にした回転を行う
	 */
	extern int VectorRotationX(.VECTOR* Out, const (.VECTOR)* In, double Angle);

	/**
	 * ベクトルのX軸を軸にした回転を行う
	 */
	extern int VectorRotationXD(.VECTOR_D* Out, const (.VECTOR_D)* In, double Angle);

	/**
	 * ベクトルのY軸を軸にした回転を行う
	 */
	extern int VectorRotationY(.VECTOR* Out, const (.VECTOR)* In, double Angle);

	/**
	 * ベクトルのY軸を軸にした回転を行う
	 */
	extern int VectorRotationYD(.VECTOR_D* Out, const (.VECTOR_D)* In, double Angle);

	/**
	 * ベクトルのZ軸を軸にした回転を行う
	 */
	extern int VectorRotationZ(.VECTOR* Out, const (.VECTOR)* In, double Angle);

	/**
	 * ベクトルのZ軸を軸にした回転を行う
	 */
	extern int VectorRotationZD(.VECTOR_D* Out, const (.VECTOR_D)* In, double Angle);

	/**
	 * ベクトル行列と4x4正方行列を乗算する( w は 1 と仮定 )
	 */
	extern int VectorTransform(.VECTOR* Out, const (.VECTOR)* InVec, const (.MATRIX)* InMatrix);

	/**
	 * ベクトル行列と4x4正方行列を乗算する( w は 1 と仮定 )
	 */
	extern int VectorTransformD(.VECTOR_D* Out, const (.VECTOR_D)* InVec, const (.MATRIX_D)* InMatrix);

	/**
	 * ベクトル行列と4x4正方行列の回転部分のみを乗算する
	 */
	extern int VectorTransformSR(.VECTOR* Out, const (.VECTOR)* InVec, const (.MATRIX)* InMatrix);

	/**
	 * ベクトル行列と4x4正方行列の回転部分のみを乗算する
	 */
	extern int VectorTransformSRD(.VECTOR_D* Out, const (.VECTOR_D)* InVec, const (.MATRIX_D)* InMatrix);

	/**
	 * ベクトル行列と4x4正方行列を乗算する( w の要素を渡す )
	 */
	extern int VectorTransform4(.VECTOR* Out, float* V4Out, const (.VECTOR)* InVec, const (float)* V4In, const (.MATRIX)* InMatrix);

	/**
	 * ベクトル行列と4x4正方行列を乗算する( w の要素を渡す )
	 */
	extern int VectorTransform4D(.VECTOR_D* Out, double* V4Out, const (.VECTOR_D)* InVec, const (double)* V4In, const (.MATRIX_D)* InMatrix);

	/**
	 * 二つの線分の最接近点情報を解析する
	 */
	extern int Segment_Segment_Analyse(const (.VECTOR)* SegmentAPos1, const (.VECTOR)* SegmentAPos2, const (.VECTOR)* SegmentBPos1, const (.VECTOR)* SegmentBPos2, .SEGMENT_SEGMENT_RESULT* Result);

	/**
	 * 二つの線分の最接近点情報を解析する
	 */
	extern int Segment_Segment_AnalyseD(const (.VECTOR_D)* SegmentAPos1, const (.VECTOR_D)* SegmentAPos2, const (.VECTOR_D)* SegmentBPos1, const (.VECTOR_D)* SegmentBPos2, .SEGMENT_SEGMENT_RESULT_D* Result);

	/**
	 * 線分と点の最接近点情報を解析する
	 */
	extern int Segment_Point_Analyse(const (.VECTOR)* SegmentPos1, const (.VECTOR)* SegmentPos2, const (.VECTOR)* PointPos, .SEGMENT_POINT_RESULT* Result);

	/**
	 * 線分と点の最接近点情報を解析する
	 */
	extern int Segment_Point_AnalyseD(const (.VECTOR_D)* SegmentPos1, const (.VECTOR_D)* SegmentPos2, const (.VECTOR_D)* PointPos, .SEGMENT_POINT_RESULT_D* Result);

	/**
	 * 線分と三角形の最接近点情報を解析する
	 */
	extern int Segment_Triangle_Analyse(const (.VECTOR)* SegmentPos1, const (.VECTOR)* SegmentPos2, const (.VECTOR)* TrianglePos1, const (.VECTOR)* TrianglePos2, const (.VECTOR)* TrianglePos3, .SEGMENT_TRIANGLE_RESULT* Result);

	/**
	 * 線分と三角形の最接近点情報を解析する
	 */
	extern int Segment_Triangle_AnalyseD(const (.VECTOR_D)* SegmentPos1, const (.VECTOR_D)* SegmentPos2, const (.VECTOR_D)* TrianglePos1, const (.VECTOR_D)* TrianglePos2, const (.VECTOR_D)* TrianglePos3, .SEGMENT_TRIANGLE_RESULT_D* Result);

	/**
	 * 三角形と点の最接近点情報を解析する
	 */
	extern int Triangle_Point_Analyse(const (.VECTOR)* TrianglePos1, const (.VECTOR)* TrianglePos2, const (.VECTOR)* TrianglePos3, const (.VECTOR)* PointPos, .TRIANGLE_POINT_RESULT* Result);

	/**
	 * 三角形と点の最接近点情報を解析する
	 */
	extern int Triangle_Point_AnalyseD(const (.VECTOR_D)* TrianglePos1, const (.VECTOR_D)* TrianglePos2, const (.VECTOR_D)* TrianglePos3, const (.VECTOR_D)* PointPos, .TRIANGLE_POINT_RESULT_D* Result);

	/**
	 * 平面と点の最近点情報を解析する
	 */
	extern int Plane_Point_Analyse(const (.VECTOR)* PlanePos, const (.VECTOR)* PlaneNormal, const (.VECTOR)* PointPos, .PLANE_POINT_RESULT* Result);

	/**
	 * 平面と点の最近点情報を解析する
	 */
	extern int Plane_Point_AnalyseD(const (.VECTOR_D)* PlanePos, const (.VECTOR_D)* PlaneNormal, const (.VECTOR_D)* PointPos, .PLANE_POINT_RESULT_D* Result);

	/**
	 * 指定の座標から三角形の重心を求める
	 */
	extern void TriangleBarycenter(.VECTOR TrianglePos1, .VECTOR TrianglePos2, .VECTOR TrianglePos3, .VECTOR Position, float* TrianglePos1Weight, float* TrianglePos2Weight, float* TrianglePos3Weight);

	/**
	 * 指定の座標から三角形の重心を求める
	 */
	extern void TriangleBarycenterD(.VECTOR_D TrianglePos1, .VECTOR_D TrianglePos2, .VECTOR_D TrianglePos3, .VECTOR_D Position, double* TrianglePos1Weight, double* TrianglePos2Weight, double* TrianglePos3Weight);

	/**
	 * 二つの線分の最近点間の距離を得る
	 */
	extern float Segment_Segment_MinLength(.VECTOR SegmentAPos1, .VECTOR SegmentAPos2, .VECTOR SegmentBPos1, .VECTOR SegmentBPos2);

	/**
	 * 二つの線分の最近点間の距離を得る
	 */
	extern double Segment_Segment_MinLengthD(.VECTOR_D SegmentAPos1, .VECTOR_D SegmentAPos2, .VECTOR_D SegmentBPos1, .VECTOR_D SegmentBPos2);

	/**
	 * 二つの線分の最近点間の距離の二乗を得る
	 */
	extern float Segment_Segment_MinLength_Square(.VECTOR SegmentAPos1, .VECTOR SegmentAPos2, .VECTOR SegmentBPos1, .VECTOR SegmentBPos2);

	/**
	 * 二つの線分の最近点間の距離の二乗を得る
	 */
	extern double Segment_Segment_MinLength_SquareD(.VECTOR_D SegmentAPos1, .VECTOR_D SegmentAPos2, .VECTOR_D SegmentBPos1, .VECTOR_D SegmentBPos2);

	/**
	 * 線分と三角形の最近点間の距離を得る
	 */
	extern float Segment_Triangle_MinLength(.VECTOR SegmentPos1, .VECTOR SegmentPos2, .VECTOR TrianglePos1, .VECTOR TrianglePos2, .VECTOR TrianglePos3);

	/**
	 * 線分と三角形の最近点間の距離を得る
	 */
	extern double Segment_Triangle_MinLengthD(.VECTOR_D SegmentPos1, .VECTOR_D SegmentPos2, .VECTOR_D TrianglePos1, .VECTOR_D TrianglePos2, .VECTOR_D TrianglePos3);

	/**
	 * 線分と三角形の最近点間の距離の二乗を得る
	 */
	extern float Segment_Triangle_MinLength_Square(.VECTOR SegmentPos1, .VECTOR SegmentPos2, .VECTOR TrianglePos1, .VECTOR TrianglePos2, .VECTOR TrianglePos3);

	/**
	 * 線分と三角形の最近点間の距離の二乗を得る
	 */
	extern double Segment_Triangle_MinLength_SquareD(.VECTOR_D SegmentPos1, .VECTOR_D SegmentPos2, .VECTOR_D TrianglePos1, .VECTOR_D TrianglePos2, .VECTOR_D TrianglePos3);

	/**
	 * 線分と点の一番近い距離を得る
	 */
	extern float Segment_Point_MinLength(.VECTOR SegmentPos1, .VECTOR SegmentPos2, .VECTOR PointPos);

	/**
	 * 線分と点の一番近い距離を得る
	 */
	extern double Segment_Point_MinLengthD(.VECTOR_D SegmentPos1, .VECTOR_D SegmentPos2, .VECTOR_D PointPos);

	/**
	 * 線分と点の一番近い距離の二乗を得る
	 */
	extern float Segment_Point_MinLength_Square(.VECTOR SegmentPos1, .VECTOR SegmentPos2, .VECTOR PointPos);

	/**
	 * 線分と点の一番近い距離の二乗を得る
	 */
	extern double Segment_Point_MinLength_SquareD(.VECTOR_D SegmentPos1, .VECTOR_D SegmentPos2, .VECTOR_D PointPos);

	/**
	 * 三角形と点の一番近い距離を得る
	 */
	extern float Triangle_Point_MinLength(.VECTOR TrianglePos1, .VECTOR TrianglePos2, .VECTOR TrianglePos3, .VECTOR PointPos);

	/**
	 * 三角形と点の一番近い距離を得る
	 */
	extern double Triangle_Point_MinLengthD(.VECTOR_D TrianglePos1, .VECTOR_D TrianglePos2, .VECTOR_D TrianglePos3, .VECTOR_D PointPos);

	/**
	 * 三角形と点の一番近い距離の二乗を得る
	 */
	extern float Triangle_Point_MinLength_Square(.VECTOR TrianglePos1, .VECTOR TrianglePos2, .VECTOR TrianglePos3, .VECTOR PointPos);

	/**
	 * 三角形と点の一番近い距離の二乗を得る
	 */
	extern double Triangle_Point_MinLength_SquareD(.VECTOR_D TrianglePos1, .VECTOR_D TrianglePos2, .VECTOR_D TrianglePos3, .VECTOR_D PointPos);

	/**
	 * 二つの三角形の最近点間の距離を得る
	 */
	extern float Triangle_Triangle_MinLength(.VECTOR Triangle1Pos1, .VECTOR Triangle1Pos2, .VECTOR Triangle1Pos3, .VECTOR Triangle2Pos1, .VECTOR Triangle2Pos2, .VECTOR Triangle2Pos3);

	/**
	 * 二つの三角形の最近点間の距離を得る
	 */
	extern double Triangle_Triangle_MinLengthD(.VECTOR_D Triangle1Pos1, .VECTOR_D Triangle1Pos2, .VECTOR_D Triangle1Pos3, .VECTOR_D Triangle2Pos1, .VECTOR_D Triangle2Pos2, .VECTOR_D Triangle2Pos3);

	/**
	 * 二つの三角形の最近点間の距離の二乗を得る
	 */
	extern float Triangle_Triangle_MinLength_Square(.VECTOR Triangle1Pos1, .VECTOR Triangle1Pos2, .VECTOR Triangle1Pos3, .VECTOR Triangle2Pos1, .VECTOR Triangle2Pos2, .VECTOR Triangle2Pos3);

	/**
	 * 二つの三角形の最近点間の距離の二乗を得る
	 */
	extern double Triangle_Triangle_MinLength_SquareD(.VECTOR_D Triangle1Pos1, .VECTOR_D Triangle1Pos2, .VECTOR_D Triangle1Pos3, .VECTOR_D Triangle2Pos1, .VECTOR_D Triangle2Pos2, .VECTOR_D Triangle2Pos3);

	/**
	 * 点に一番近い平面上の座標を得る
	 */
	extern .VECTOR Plane_Point_MinLength_Position(.VECTOR PlanePos, .VECTOR PlaneNormal, .VECTOR PointPos);

	/**
	 * 点に一番近い平面上の座標を得る
	 */
	extern .VECTOR_D Plane_Point_MinLength_PositionD(.VECTOR_D PlanePos, .VECTOR_D PlaneNormal, .VECTOR_D PointPos);

	/**
	 * 平面と点の一番近い距離を得る
	 */
	extern float Plane_Point_MinLength(.VECTOR PlanePos, .VECTOR PlaneNormal, .VECTOR PointPos);

	/**
	 * 平面と点の一番近い距離を得る
	 */
	extern double Plane_Point_MinLengthD(.VECTOR_D PlanePos, .VECTOR_D PlaneNormal, .VECTOR_D PointPos);

	/**
	 * 三角形と線の当たり判定
	 */
	extern .HITRESULT_LINE HitCheck_Line_Triangle(.VECTOR LinePos1, .VECTOR LinePos2, .VECTOR TrianglePos1, .VECTOR TrianglePos2, .VECTOR TrianglePos3);

	/**
	 * 三角形と線の当たり判定
	 */
	extern .HITRESULT_LINE_D HitCheck_Line_TriangleD(.VECTOR_D LinePos1, .VECTOR_D LinePos2, .VECTOR_D TrianglePos1, .VECTOR_D TrianglePos2, .VECTOR_D TrianglePos3);

	/**
	 * 三角形と三角形の当たり判定
	 *
	 * Returns: TRUE:当たっている  FALSE:当たっていない
	 */
	extern int HitCheck_Triangle_Triangle(.VECTOR Triangle1Pos1, .VECTOR Triangle1Pos2, .VECTOR Triangle1Pos3, .VECTOR Triangle2Pos1, .VECTOR Triangle2Pos2, .VECTOR Triangle2Pos3);

	/**
	 * 三角形と三角形の当たり判定
	 *
	 * Returns: TRUE:当たっている  FALSE:当たっていない
	 */
	extern int HitCheck_Triangle_TriangleD(.VECTOR_D Triangle1Pos1, .VECTOR_D Triangle1Pos2, .VECTOR_D Triangle1Pos3, .VECTOR_D Triangle2Pos1, .VECTOR_D Triangle2Pos2, .VECTOR_D Triangle2Pos3);

	/**
	 * 三角形と三角形の当たり判定( 2D版 )
	 *
	 * Returns: TRUE:当たっている  FALSE:当たっていない
	 */
	extern int HitCheck_Triangle_Triangle_2D(.VECTOR Triangle1Pos1, .VECTOR Triangle1Pos2, .VECTOR Triangle1Pos3, .VECTOR Triangle2Pos1, .VECTOR Triangle2Pos2, .VECTOR Triangle2Pos3);

	/**
	 * 三角形と三角形の当たり判定( 2D版 )
	 *
	 * Returns: TRUE:当たっている  FALSE:当たっていない
	 */
	extern int HitCheck_Triangle_TriangleD_2D(.VECTOR_D Triangle1Pos1, .VECTOR_D Triangle1Pos2, .VECTOR_D Triangle1Pos3, .VECTOR_D Triangle2Pos1, .VECTOR_D Triangle2Pos2, .VECTOR_D Triangle2Pos3);

	/**
	 * 線と箱の当たり判定
	 */
	extern .HITRESULT_LINE HitCheck_Line_Cube(.VECTOR LinePos1, .VECTOR LinePos2, .VECTOR CubePos1, .VECTOR CubePos2);

	/**
	 * 線と箱の当たり判定
	 */
	extern .HITRESULT_LINE_D HitCheck_Line_CubeD(.VECTOR_D LinePos1, .VECTOR_D LinePos2, .VECTOR_D CubePos1, .VECTOR_D CubePos2);

	/**
	 * 点と円錐の当たり判定
	 *
	 * Returns: TRUE:当たっている  FALSE:当たっていない
	 */
	extern int HitCheck_Point_Cone(.VECTOR PointPos, .VECTOR ConeTopPos, .VECTOR ConeBottomPos, float ConeR);

	/**
	 * 点と円錐の当たり判定
	 *
	 * Returns: TRUE:当たっている  FALSE:当たっていない
	 */
	extern int HitCheck_Point_ConeD(.VECTOR_D PointPos, .VECTOR_D ConeTopPos, .VECTOR_D ConeBottomPos, double ConeR);

	/**
	 * 線と球の当たり判定
	 *
	 * Returns: TRUE:当たっている  FALSE:当たっていない
	 */
	extern int HitCheck_Line_Sphere(.VECTOR LinePos1, .VECTOR LinePos2, .VECTOR SphereCenterPos, float SphereR);

	/**
	 * 線と球の当たり判定
	 *
	 * Returns: TRUE:当たっている  FALSE:当たっていない
	 */
	extern int HitCheck_Line_SphereD(.VECTOR_D LinePos1, .VECTOR_D LinePos2, .VECTOR_D SphereCenterPos, double SphereR);

	/**
	 * 球と球の当たり判定
	 *
	 * Returns: TRUE:当たっている  FALSE:当たっていない
	 */
	extern int HitCheck_Sphere_Sphere(.VECTOR Sphere1CenterPos, float Sphere1R, .VECTOR Sphere2CenterPos, float Sphere2R);

	/**
	 * 球と球の当たり判定
	 *
	 * Returns: TRUE:当たっている  FALSE:当たっていない
	 */
	extern int HitCheck_Sphere_SphereD(.VECTOR_D Sphere1CenterPos, double Sphere1R, .VECTOR_D Sphere2CenterPos, double Sphere2R);

	/**
	 * 球とカプセルの当たり判定
	 *
	 * Returns: TRUE:当たっている  FALSE:当たっていない
	 */
	extern int HitCheck_Sphere_Capsule(.VECTOR SphereCenterPos, float SphereR, .VECTOR CapPos1, .VECTOR CapPos2, float CapR);

	/**
	 * 球とカプセルの当たり判定
	 *
	 * Returns: TRUE:当たっている  FALSE:当たっていない
	 */
	extern int HitCheck_Sphere_CapsuleD(.VECTOR_D SphereCenterPos, double SphereR, .VECTOR_D CapPos1, .VECTOR_D CapPos2, double CapR);

	/**
	 * 球と三角形の当たり判定
	 *
	 * Returns: TRUE:当たっている  FALSE:当たっていない
	 */
	extern int HitCheck_Sphere_Triangle(.VECTOR SphereCenterPos, float SphereR, .VECTOR TrianglePos1, .VECTOR TrianglePos2, .VECTOR TrianglePos3);

	/**
	 * 球と三角形の当たり判定
	 *
	 * Returns: TRUE:当たっている  FALSE:当たっていない
	 */
	extern int HitCheck_Sphere_TriangleD(.VECTOR_D SphereCenterPos, double SphereR, .VECTOR_D TrianglePos1, .VECTOR_D TrianglePos2, .VECTOR_D TrianglePos3);

	/**
	 * カプセル同士の当たり判定
	 *
	 * Returns: TRUE:当たっている  FALSE:当たっていない
	 */
	extern int HitCheck_Capsule_Capsule(.VECTOR Cap1Pos1, .VECTOR Cap1Pos2, float Cap1R, .VECTOR Cap2Pos1, .VECTOR Cap2Pos2, float Cap2R);

	/**
	 * カプセル同士の当たり判定
	 *
	 * Returns: TRUE:当たっている  FALSE:当たっていない
	 */
	extern int HitCheck_Capsule_CapsuleD(.VECTOR_D Cap1Pos1, .VECTOR_D Cap1Pos2, double Cap1R, .VECTOR_D Cap2Pos1, .VECTOR_D Cap2Pos2, double Cap2R);

	/**
	 * カプセルと三角形の当たり判定
	 *
	 * Returns: TRUE:当たっている  FALSE:当たっていない
	 */
	extern int HitCheck_Capsule_Triangle(.VECTOR CapPos1, .VECTOR CapPos2, float CapR, .VECTOR TrianglePos1, .VECTOR TrianglePos2, .VECTOR TrianglePos3);

	/**
	 * カプセルと三角形の当たり判定
	 *
	 * Returns: TRUE:当たっている  FALSE:当たっていない
	 */
	extern int HitCheck_Capsule_TriangleD(.VECTOR_D CapPos1, .VECTOR_D CapPos2, double CapR, .VECTOR_D TrianglePos1, .VECTOR_D TrianglePos2, .VECTOR_D TrianglePos3);

	// その他

	/**
	 * 矩形のクリッピング
	 */
	extern int RectClipping(dxlib_d.DxDataType.RECT* Rect, const (dxlib_d.DxDataType.RECT)* ClippuRect);

	/**
	 * 矩形の left が right より値が大きい場合などの誤りを補正する
	 */
	extern int RectAdjust(dxlib_d.DxDataType.RECT* Rect);

	/**
	 * 矩形の幅と高さを求める
	 */
	extern int GetRectSize(const (dxlib_d.DxDataType.RECT)* Rect, int* Width, int* Height);

	// 表記簡略版

	/**
	 * 単位行列を取得する
	 */
	extern .MATRIX MGetIdent();

	/**
	 * 単位行列を取得する
	 */
	extern .MATRIX_D MGetIdentD();

	/**
	 * 行列の乗算を行う
	 */
	extern .MATRIX MMult(.MATRIX In1, .MATRIX In2);

	/**
	 * 行列の乗算を行う
	 */
	extern .MATRIX_D MMultD(.MATRIX_D In1, .MATRIX_D In2);

	/**
	 * 行列のスケーリングを行う
	 */
	extern .MATRIX MScale(.MATRIX InM, float Scale);

	/**
	 * 行列のスケーリングを行う
	 */
	extern .MATRIX_D MScaleD(.MATRIX_D InM, double Scale);

	/**
	 * 行列の足し算を行う
	 */
	extern .MATRIX MAdd(.MATRIX In1, .MATRIX In2);

	/**
	 * 行列の足し算を行う
	 */
	extern .MATRIX_D MAddD(.MATRIX_D In1, .MATRIX_D In2);

	/**
	 * 拡大行列を取得する
	 */
	extern .MATRIX MGetScale(.VECTOR Scale);

	/**
	 * 拡大行列を取得する
	 */
	extern .MATRIX_D MGetScaleD(.VECTOR_D Scale);

	/**
	 * X軸回転行列を取得する
	 */
	extern .MATRIX MGetRotX(float XAxisRotate);

	/**
	 * X軸回転行列を取得する
	 */
	extern .MATRIX_D MGetRotXD(double XAxisRotate);

	/**
	 * Y軸回転行列を取得する
	 */
	extern .MATRIX MGetRotY(float YAxisRotate);

	/**
	 * Y軸回転行列を取得する
	 */
	extern .MATRIX_D MGetRotYD(double YAxisRotate);

	/**
	 * Z軸回転行列を取得する
	 */
	extern .MATRIX MGetRotZ(float ZAxisRotate);

	/**
	 * Z軸回転行列を取得する
	 */
	extern .MATRIX_D MGetRotZD(double ZAxisRotate);

	/**
	 * 指定軸で指定角度回転する行列を取得する
	 */
	extern .MATRIX MGetRotAxis(.VECTOR RotateAxis, float Rotate);

	/**
	 * 指定軸で指定角度回転する行列を取得する
	 */
	extern .MATRIX_D MGetRotAxisD(.VECTOR_D RotateAxis, double Rotate);

	/**
	 * In1 の向きから In2 の向きへ変換する回転行列を取得する( In2 と In1 が真逆のベクトルの場合は回転軸は不定 )
	 */
	extern .MATRIX MGetRotVec2(.VECTOR In1, .VECTOR In2);

	/**
	 * In1 の向きから In2 の向きへ変換する回転行列を取得する( In2 と In1 が真逆のベクトルの場合は回転軸は不定 )
	 */
	extern .MATRIX_D MGetRotVec2D(.VECTOR_D In1, .VECTOR_D In2);

	/**
	 * 平行移動行列を取得する
	 */
	extern .MATRIX MGetTranslate(.VECTOR Trans);

	/**
	 * 平行移動行列を取得する
	 */
	extern .MATRIX_D MGetTranslateD(.VECTOR_D Trans);

	/**
	 * 指定の3軸ローカルのベクトルを基本軸上のベクトルに変換する行列を取得する( x' = (XAxis.x * x) + (YAixs.x * y) + (ZAxis.z * z) + Pos.x   y' = (XAxis.y * x) + (YAixs.y * y) + (ZAxis.y * z) + Pos.y      z' = (XAxis.z * x) + (YAixs.z * y) + (ZAxis.z * z) + Pos.z )
	 */
	extern .MATRIX MGetAxis1(.VECTOR XAxis, .VECTOR YAxis, .VECTOR ZAxis, .VECTOR Pos);

	/**
	 * 指定の3軸ローカルのベクトルを基本軸上のベクトルに変換する行列を取得する( x' = (XAxis.x * x) + (YAixs.x * y) + (ZAxis.z * z) + Pos.x   y' = (XAxis.y * x) + (YAixs.y * y) + (ZAxis.y * z) + Pos.y      z' = (XAxis.z * x) + (YAixs.z * y) + (ZAxis.z * z) + Pos.z )
	 */
	extern .MATRIX_D MGetAxis1D(.VECTOR_D XAxis, .VECTOR_D YAxis, .VECTOR_D ZAxis, .VECTOR_D Pos);

	/**
	 * 基本軸上のベクトルを指定の3軸上に投影したベクトルに変換する行列を取得する( x' = (XAxis.x * ( x - Pos.x )) + (XAxis.y * ( x - Pos.x )) + (XAxis.z * ( x - Pos.x ))    y' = (YAxis.x * ( x - Pos.x )) + (YAxis.y * ( x - Pos.x )) + (YAxis.z * ( x - Pos.x ))    z' = (ZAxis.x * ( x - Pos.x )) + (ZAxis.y * ( x - Pos.x )) + (ZAxis.z * ( x - Pos.x )) )
	 */
	extern .MATRIX MGetAxis2(.VECTOR XAxis, .VECTOR YAxis, .VECTOR ZAxis, .VECTOR Pos);

	/**
	 * 基本軸上のベクトルを指定の3軸上に投影したベクトルに変換する行列を取得する( x' = (XAxis.x * ( x - Pos.x )) + (XAxis.y * ( x - Pos.x )) + (XAxis.z * ( x - Pos.x ))    y' = (YAxis.x * ( x - Pos.x )) + (YAxis.y * ( x - Pos.x )) + (YAxis.z * ( x - Pos.x ))    z' = (ZAxis.x * ( x - Pos.x )) + (ZAxis.y * ( x - Pos.x )) + (ZAxis.z * ( x - Pos.x )) )
	 */
	extern .MATRIX_D MGetAxis2D(.VECTOR_D XAxis, .VECTOR_D YAxis, .VECTOR_D ZAxis, .VECTOR_D Pos);

	/**
	 * 転置行列を取得する
	 */
	extern .MATRIX MTranspose(.MATRIX InM);

	/**
	 * 転置行列を取得する
	 */
	extern .MATRIX_D MTransposeD(.MATRIX_D InM);

	/**
	 * 逆行列を取得する
	 */
	extern .MATRIX MInverse(.MATRIX InM);

	/**
	 * 逆行列を取得する
	 */
	extern .MATRIX_D MInverseD(.MATRIX_D InM);

	/**
	 * 拡大行列のX軸、Y軸、Z軸の拡大率を取得する
	 */
	extern .VECTOR MGetSize(.MATRIX InM);

	/**
	 * 拡大行列のX軸、Y軸、Z軸の拡大率を取得する
	 */
	extern .VECTOR_D MGetSizeD(.MATRIX_D InM);

	/**
	 * 行列の回転成分を取得する
	 */
	extern .MATRIX MGetRotElem(.MATRIX InM);

	/**
	 * 行列の回転成分を取得する
	 */
	extern .MATRIX_D MGetRotElemD(.MATRIX_D InM);

	/**
	 * 行列の平行移動成分を取得する
	 */
	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.VECTOR MGetTranslateElem(ref .MATRIX InM)
	{
		.VECTOR Result =
		{
			x: InM.m[3][0],
			y: InM.m[3][1],
			z: InM.m[3][2],
		};

		return Result;
	}

	/**
	 * 行列の平行移動成分を取得する
	 */
	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.VECTOR_D MGetTranslateElemD(ref .MATRIX_D InM)
	{
		.VECTOR_D Result =
		{
			x: InM.m[3][0],
			y: InM.m[3][1],
			z: InM.m[3][2],
		};

		return Result;
	}

	/**
	 * ベクトル値の変換
	 */
	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.VECTOR_D VConvFtoD(const ref .VECTOR In)
	{
		.VECTOR_D Result =
		{
			x: In.x,
			y: In.y,
			z: In.z,
		};

		return Result;
	}

	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.VECTOR VConvDtoF(const ref .VECTOR_D In)
	{
		.VECTOR Result =
		{
			x: cast(float)(In.x),
			y: cast(float)(In.y),
			z: cast(float)(In.z),
		};

		return Result;
	}

	/**
	 * ベクトル値の生成
	 */
	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.VECTOR VGet(float x, float y, float z)
	{
		.VECTOR Result =
		{
			x: x,
			y: y,
			z: z,
		};

		return Result;
	}

	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.VECTOR_D VGetD(double x, double y, double z)
	{
		.VECTOR_D Result =
		{
			x: x,
			y: y,
			z: z,
		};

		return Result;
	}

	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.FLOAT2 F2Get(float u, float v)
	{
		.FLOAT2 Result =
		{
			u: u,
			v: v,
		};

		return Result;
	}

	/**
	 * 4要素ベクトル値の生成
	 */
	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.FLOAT4 F4Get(float x, float y, float z, float w)
	{
		.FLOAT4 Result =
		{
			x: x,
			y: y,
			z: z,
			w: w,
		};

		return Result;
	}

	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.DOUBLE4 D4Get(double x, double y, double z, double w)
	{
		.DOUBLE4 Result =
		{
			x: x,
			y: y,
			z: z,
			w: w,
		};

		return Result;
	}

	/**
	 * ベクトルの加算
	 */
	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.VECTOR VAdd(const ref .VECTOR In1, const ref .VECTOR In2)
	{
		.VECTOR Result =
		{
			x: In1.x + In2.x,
			y: In1.y + In2.y,
			z: In1.z + In2.z,
		};

		return Result;
	}

	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.VECTOR_D VAddD(const ref .VECTOR_D In1, const ref .VECTOR_D In2)
	{
		.VECTOR_D Result =
		{
			x: In1.x + In2.x,
			y: In1.y + In2.y,
			z: In1.z + In2.z,
		};

		return Result;
	}

	/**
	 * ベクトルの減算
	 */
	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.VECTOR VSub(const ref .VECTOR In1, const ref .VECTOR In2)
	{
		.VECTOR Result =
		{
			x: In1.x - In2.x,
			y: In1.y - In2.y,
			z: In1.z - In2.z,
		};

		return Result;
	}

	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.VECTOR_D VSubD(const ref .VECTOR_D In1, const ref .VECTOR_D In2)
	{
		.VECTOR_D Result =
		{
			x: In1.x - In2.x,
			y: In1.y - In2.y,
			z: In1.z - In2.z,
		};

		return Result;
	}

	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.FLOAT2 F2Add(const ref .FLOAT2 In1, const ref .FLOAT2 In2)
	{
		.FLOAT2 Result =
		{
			u: In1.u + In2.u,
			v: In1.v + In2.v,
		};

		return Result;
	}

	/**
	 * 4要素ベクトルの加算
	 */
	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.FLOAT4 F4Add(const ref .FLOAT4 In1, const ref .FLOAT4 In2)
	{
		.FLOAT4 Result =
		{
			x: In1.x + In2.x,
			y: In1.y + In2.y,
			z: In1.z + In2.z,
			w: In1.w + In2.w,
		};

		return Result;
	}

	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.DOUBLE4 D4Add(const ref .DOUBLE4 In1, const ref .DOUBLE4 In2)
	{
		.DOUBLE4 Result =
		{
			x: In1.x + In2.x,
			y: In1.y + In2.y,
			z: In1.z + In2.z,
			w: In1.w + In2.w,
		};

		return Result;
	}

	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.FLOAT2 F2Sub(const ref .FLOAT2 In1, const ref .FLOAT2 In2)
	{
		.FLOAT2 Result =
		{
			u: In1.u - In2.u,
			v: In1.v - In2.v,
		};

		return Result;
	}

	/**
	 * 4要素ベクトルの減算
	 */
	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.FLOAT4 F4Sub(const ref .FLOAT4 In1, const ref .FLOAT4 In2)
	{
		.FLOAT4 Result =
		{
			x: In1.x - In2.x,
			y: In1.y - In2.y,
			z: In1.z - In2.z,
			w: In1.w - In2.w,
		};

		return Result;
	}

	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.DOUBLE4 D4Sub(const ref .DOUBLE4 In1, const ref .DOUBLE4 In2)
	{
		.DOUBLE4 Result =
		{
			x: In1.x - In2.x,
			y: In1.y - In2.y,
			z: In1.z - In2.z,
			w: In1.w - In2.w,
		};

		return Result;
	}

	/**
	 * ベクトルの内積
	 */
	pragma(inline, true)
	pure nothrow @safe @nogc @live
	float VDot(const ref .VECTOR In1, const ref .VECTOR In2)
	{
		return (In1.x * In2.x) + (In1.y * In2.y) + (In1.z * In2.z);
	}

	pragma(inline, true)
	pure nothrow @safe @nogc @live
	double VDotD(const ref .VECTOR_D In1, const ref .VECTOR_D In2)
	{
		return (In1.x * In2.x) + (In1.y * In2.y) + (In1.z * In2.z);
	}

	/**
	 * ベクトルの外積
	 */
	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.VECTOR VCross(const ref .VECTOR In1, const ref .VECTOR In2)
	{
		.VECTOR Result =
		{
			x: (In1.y * In2.z) - (In1.z * In2.y),
			y: (In1.z * In2.x) - (In1.x * In2.z),
			z: (In1.x * In2.y) - (In1.y * In2.x),
		};

		return Result;
	}

	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.VECTOR_D VCrossD(const ref .VECTOR_D In1, const ref .VECTOR_D In2)
	{
		.VECTOR_D Result =
		{
			x: (In1.y * In2.z) - (In1.z * In2.y),
			y: (In1.z * In2.x) - (In1.x * In2.z),
			z: (In1.x * In2.y) - (In1.y * In2.x),
		};

		return Result;
	}

	/**
	 * ベクトルのスケーリング
	 */
	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.VECTOR VScale(const ref .VECTOR In, float Scale)
	{
		.VECTOR Result =
		{
			x: In.x * Scale,
			y: In.y * Scale,
			z: In.z * Scale,
		};

		return Result;
	}

	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.VECTOR_D VScaleD(const ref .VECTOR_D In, double Scale)
	{
		.VECTOR_D Result =
		{
			x: In.x * Scale,
			y: In.y * Scale,
			z: In.z * Scale,
		};

		return Result;
	}

	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.FLOAT2 F2Scale(const ref .FLOAT2 In, float Scale)
	{
		.FLOAT2 Result =
		{
			u: In.u * Scale,
			v: In.v * Scale,
		};

		return Result;
	}

	/**
	 * 4要素ベクトルのスケーリング
	 */
	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.FLOAT4 F4Scale(const ref .FLOAT4 In, float Scale)
	{
		.FLOAT4 Result =
		{
			x: In.x * Scale,
			y: In.y * Scale,
			z: In.z * Scale,
			w: In.w * Scale,
		};

		return Result;
	}

	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.DOUBLE4 D4Scale(const ref .DOUBLE4 In, double Scale)
	{
		.DOUBLE4 Result =
		{
			x: In.x * Scale,
			y: In.y * Scale,
			z: In.z * Scale,
			w: In.w * Scale,
		};

		return Result;
	}

	/**
	 * ベクトルの正規化
	 */
	extern .VECTOR VNorm(.VECTOR In);

	/**
	 * ベクトルの正規化
	 */
	extern .VECTOR_D VNormD(.VECTOR_D In);

	/**
	 * ベクトルのサイズ
	 */
	extern float VSize(.VECTOR In);

	/**
	 * ベクトルのサイズ
	 */
	extern double VSizeD(.VECTOR_D In);

	/**
	 * ベクトルのサイズの2乗
	 */
	pragma(inline, true)
	pure nothrow @safe @nogc @live
	float VSquareSize(const ref .VECTOR In)
	{
		return (In.x * In.x) + (In.y * In.y) + (In.z * In.z);
	}

	pragma(inline, true)
	pure nothrow @safe @nogc @live
	double VSquareSizeD(const ref .VECTOR_D In)
	{
		return (In.x * In.x) + (In.y * In.y) + (In.z * In.z);
	}

	/**
	 * 行列を使った座標変換
	 */
	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.VECTOR VTransform(const ref .VECTOR InV, const ref .MATRIX InM)
	{
		.VECTOR Result =
		{
			x: (InV.x * InM.m[0][0]) + (InV.y * InM.m[1][0]) + (InV.z * InM.m[2][0]) + InM.m[3][0],
			y: (InV.x * InM.m[0][1]) + (InV.y * InM.m[1][1]) + (InV.z * InM.m[2][1]) + InM.m[3][1],
			z: (InV.x * InM.m[0][2]) + (InV.y * InM.m[1][2]) + (InV.z * InM.m[2][2]) + InM.m[3][2],
		};

		return Result;
	}

	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.VECTOR_D VTransformD(const ref .VECTOR_D InV, const ref .MATRIX_D InM)
	{
		.VECTOR_D Result =
		{
			x: (InV.x * InM.m[0][0]) + (InV.y * InM.m[1][0]) + (InV.z * InM.m[2][0]) + InM.m[3][0],
			y: (InV.x * InM.m[0][1]) + (InV.y * InM.m[1][1]) + (InV.z * InM.m[2][1]) + InM.m[3][1],
			z: (InV.x * InM.m[0][2]) + (InV.y * InM.m[1][2]) + (InV.z * InM.m[2][2]) + InM.m[3][2],
		};

		return Result;
	}

	/**
	 * 行列を使った座標変換( スケーリング+回転成分のみ )
	 */
	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.VECTOR VTransformSR(const ref .VECTOR InV, const ref .MATRIX InM)
	{
		.VECTOR Result =
		{
			x: (InV.x * InM.m[0][0]) + (InV.y * InM.m[1][0]) + (InV.z * InM.m[2][0]),
			y: (InV.x * InM.m[0][1]) + (InV.y * InM.m[1][1]) + (InV.z * InM.m[2][1]),
			z: (InV.x * InM.m[0][2]) + (InV.y * InM.m[1][2]) + (InV.z * InM.m[2][2]),
		};

		return Result;
	}

	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.VECTOR_D VTransformSRD(const ref .VECTOR_D InV, const ref .MATRIX_D InM)
	{
		.VECTOR_D Result =
		{
			x: (InV.x * InM.m[0][0]) + (InV.y * InM.m[1][0]) + (InV.z * InM.m[2][0]),
			y: (InV.x * InM.m[0][1]) + (InV.y * InM.m[1][1]) + (InV.z * InM.m[2][1]),
			z: (InV.x * InM.m[0][2]) + (InV.y * InM.m[1][2]) + (InV.z * InM.m[2][2]),
		};

		return Result;
	}

	/**
	 * 二つのベクトルが成す角のコサイン値を得る
	 */
	extern float VCos(.VECTOR In1, .VECTOR In2);

	/**
	 * 二つのベクトルが成す角のコサイン値を得る
	 */
	extern double VCosD(.VECTOR_D In1, .VECTOR_D In2);

	/**
	 * 二つのベクトルが成す角の角度を得る( 単位:ラジアン )
	 */
	extern float VRad(.VECTOR In1, .VECTOR In2);

	/**
	 * 二つのベクトルが成す角の角度を得る( 単位:ラジアン )
	 */
	extern double VRadD(.VECTOR_D In1, .VECTOR_D In2);

	/**
	 * 2つのクォータニオンの乗算の結果を返す
	 */
	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.FLOAT4 QTCross(const ref .FLOAT4 A, const ref .FLOAT4 B)
	{
		.FLOAT4 Result =
		{
			w: (A.w * B.w) - ((A.x * B.x) + (A.y * B.y) + (A.z * B.z)),
			x: (B.x * A.w) + (A.x * B.w) + ((A.y * B.z) - (A.z * B.y)),
			y: (B.y * A.w) + (A.y * B.w) + ((A.z * B.x) - (A.x * B.z)),
			z: (B.z * A.w) + (A.z * B.w) + ((A.x * B.y) - (A.y * B.x)),
		};

		return Result;
	}

	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.DOUBLE4 QTCrossD(const ref .DOUBLE4 A, const ref .DOUBLE4 B)
	{
		.DOUBLE4 Result =
		{
			w: (A.w * B.w) - ((A.x * B.x) + (A.y * B.y) + (A.z * B.z)),
			x: (B.x * A.w) + (A.x * B.w) + ((A.y * B.z) - (A.z * B.y)),
			y: (B.y * A.w) + (A.y * B.w) + ((A.z * B.x) - (A.x * B.z)),
			z: (B.z * A.w) + (A.z * B.w) + ((A.x * B.y) - (A.y * B.x)),
		};

		return Result;
	}

	/**
	 * 共役クォータニオンを返す
	 */
	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.FLOAT4 QTConj(const ref .FLOAT4 A)
	{
		.FLOAT4 Result =
		{
			w: A.w,
			x: -A.x,
			y: -A.y,
			z: -A.z,
		};

		return Result;
	}

	pragma(inline, true)
	pure nothrow @safe @nogc @live
	.DOUBLE4 QTConjD(const ref .DOUBLE4 A)
	{
		.DOUBLE4 Result =
		{
			w: A.w,
			x: -A.x,
			y: -A.y,
			z: -A.z,
		};

		return Result;
	}

	/**
	 * 回転を表すクォータニオンを返す
	 */
	extern .FLOAT4 QTRot(.VECTOR Axis, float Angle);

	/**
	 * 回転を表すクォータニオンを返す
	 */
	extern .DOUBLE4 QTRotD(.VECTOR_D Axis, double Angle);

	/**
	 * 3次元空間上の点を任意の軸の周りに任意の角度だけ回転させる関数
	 */
	extern .VECTOR VRotQ(.VECTOR P, .VECTOR Axis, float Angle);

	/**
	 * 3次元空間上の点を任意の軸の周りに任意の角度だけ回転させる関数
	 */
	extern .VECTOR_D VRotQD(.VECTOR_D P, .VECTOR_D Axis, double Angle);

	// DxBaseImage.cpp 関数プロトタイプ宣言

	// 基本イメージデータのロード+DIB関係

	/**
	 * 画像ファイル若しくはメモリ上に展開された画像ファイルイメージを読み込み、基本イメージデータ若しくはBMPデータを構築する
	 */
	extern int CreateGraphImageOrDIBGraph(const (dxlib_d.DxDataType.TCHAR)* FileName, const (void)* DataImage, int DataImageSize, int DataImageType /* LOADIMAGE_TYPE_FILE 等 */, int BmpFlag, int ReverseFlag, .BASEIMAGE* BaseImage, dxlib_d.DxDataType.BITMAPINFO** BmpInfo, void** GraphData);

	/**
	 * 画像ファイル若しくはメモリ上に展開された画像ファイルイメージを読み込み、基本イメージデータ若しくはBMPデータを構築する
	 */
	extern int CreateGraphImageOrDIBGraphWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, const (void)* DataImage, int DataImageSize, int DataImageType /* LOADIMAGE_TYPE_FILE 等 */, int BmpFlag, int ReverseFlag, .BASEIMAGE* BaseImage, dxlib_d.DxDataType.BITMAPINFO** BmpInfo, void** GraphData);

	/**
	 * 画像データから構築したストリーム読み込み用データを使用して基本イメージデータを構築する
	 */
	extern int CreateGraphImageType2(.STREAMDATA* Src, .BASEIMAGE* Dest);

	/**
	 * 24bitカラー形式のビットマップデータからBMPデータを構築する
	 */
	extern int CreateBmpInfo(dxlib_d.DxDataType.BITMAPINFO* BmpInfo, int Width, int Height, int Pitch, const (void)* SrcGrData, void** DestGrData);

	/**
	 * 画像ファイルの横ピクセル数と縦ピクセル数を取得する
	 */
	extern int GetImageSize_File(const (dxlib_d.DxDataType.TCHAR)* FileName, int* SizeX, int* SizeY);

	/**
	 * 画像ファイルの横ピクセル数と縦ピクセル数を取得する
	 */
	extern int GetImageSize_FileWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int* SizeX, int* SizeY);

	/**
	 * メモリ上に展開された画像ファイルの横ピクセル数と縦ピクセル数を取得する
	 */
	extern int GetImageSize_Mem(const (void)* FileImage, int FileImageSize, int* SizeX, int* SizeY);

	/**
	 * 基本イメージデータの指定座標のフルカラーコードを取得する
	 */
	extern uint GetGraphImageFullColorCode(const (.BASEIMAGE)* GraphImage, int x, int y);

	/**
	 * 画像ファイル若しくはメモリ上に展開された画像ファイルイメージを読み込み、基本イメージデータを構築する
	 */
	extern int CreateGraphImage_plus_Alpha(const (dxlib_d.DxDataType.TCHAR)* FileName, const (void)* RgbImage, int RgbImageSize, int RgbImageType, const (void)* AlphaImage, int AlphaImageSize, int AlphaImageType, .BASEIMAGE* RgbGraphImage, .BASEIMAGE* AlphaGraphImage, int ReverseFlag);

	/**
	 * 画像ファイル若しくはメモリ上に展開された画像ファイルイメージを読み込み、基本イメージデータを構築する
	 */
	extern int CreateGraphImage_plus_AlphaWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, const (void)* RgbImage, int RgbImageSize, int RgbImageType, const (void)* AlphaImage, int AlphaImageSize, int AlphaImageType, .BASEIMAGE* RgbGraphImage, .BASEIMAGE* AlphaGraphImage, int ReverseFlag);

	/**
	 * 基本イメージデータを左右反転する
	 */
	extern int ReverseGraphImage(.BASEIMAGE* GraphImage);

	/**
	 * ユーザー定義の画像データ読み込み関数を登録する
	 */
	@disable
	extern int AddUserGraphLoadFunction(int function(FILE* fp, dxlib_d.DxDataType.BITMAPINFO** BmpInfo, void** GraphData) UserLoadFunc);

	/**
	 * ユーザー定義の画像データ読み込み関数を登録する
	 */
	@disable
	extern int AddUserGraphLoadFunction2(int function(void* Image, int ImageSize, int ImageType, dxlib_d.DxDataType.BITMAPINFO** BmpInfo, void** GraphData) UserLoadFunc);

	/**
	 * ユーザー定義の画像データ読み込み関数Ver3を登録する
	 */
	@disable
	extern int AddUserGraphLoadFunction3(int function(void* DataImage, int DataImageSize, int DataImageType, int BmpFlag, .BASEIMAGE* BaseImage, dxlib_d.DxDataType.BITMAPINFO** BmpInfo, void** GraphData) UserLoadFunc);

	/**
	 * ユーザー定義の画像データ読み込み関数Ver4を登録する
	 */
	extern int AddUserGraphLoadFunction4(int function(.STREAMDATA* Src, .BASEIMAGE* BaseImage) UserLoadFunc);

	/**
	 * ユーザー定義の画像データ読み込み関数を登録から抹消する
	 */
	@disable
	extern int SubUserGraphLoadFunction(int function(FILE* fp, dxlib_d.DxDataType.BITMAPINFO** BmpInfo, void** GraphData) UserLoadFunc);

	/**
	 * ユーザー定義の画像データ読み込み関数を登録から抹消する
	 */
	@disable
	extern int SubUserGraphLoadFunction2(int function(void* Image, int ImageSize, int ImageType, dxlib_d.DxDataType.BITMAPINFO** BmpInfo, void** GraphData) UserLoadFunc);

	/**
	 * ユーザー定義の画像データ読み込み関数Ver3を登録から抹消する
	 */
	@disable
	extern int SubUserGraphLoadFunction3(int function(void* DataImage, int DataImageSize, int DataImageType, int BmpFlag, .BASEIMAGE* BaseImage, dxlib_d.DxDataType.BITMAPINFO** BmpInfo, void** GraphData) UserLoadFunc);

	/**
	 * ユーザー定義の画像データ読み込み関数Ver4を登録から抹消する
	 */
	extern int SubUserGraphLoadFunction4(int function(.STREAMDATA* Src, .BASEIMAGE* BaseImage) UserLoadFunc);

	/**
	 * 高速読み込みルーチンを使用するかどうかを設定する
	 *
	 * Params:
	 *      Flag = TRUE:使用する( デフォルト )  FALSE:使用しない
	 */
	extern int SetUseFastLoadFlag(int Flag);

	/**
	 * 画像減色時の画像劣化緩和処理モードを設定する( デフォルトでは緩和処理無しの DX_SHAVEDMODE_NONE )
	 */
	extern int SetGraphDataShavedMode(int ShavedMode /* DX_SHAVEDMODE_NONE 等 */);

	/**
	 * 画像減色時の画像劣化緩和処理モードを取得する
	 */
	extern int GetGraphDataShavedMode();

	/**
	 * 画像ファイル読み込み時に乗算済みアルファ画像に変換するかどうかを設定する
	 *
	 * Params:
	 *      UseFlag = TRUE:変換処理を行う  FALSE:変換処理を行わない( デフォルト )
	 */
	extern int SetUsePremulAlphaConvertLoad(int UseFlag);

	// 基本イメージデータ構造体関係

	/**
	 * 画像ファイル若しくはメモリ上に展開された画像ファイルイメージから基本イメージデータを構築する
	 */
	extern int CreateBaseImage(const (dxlib_d.DxDataType.TCHAR)* FileName, const (void)* FileImage, int FileImageSize, int DataType /*=LOADIMAGE_TYPE_FILE*/, .BASEIMAGE* BaseImage, int ReverseFlag);

	/**
	 * 画像ファイル若しくはメモリ上に展開された画像ファイルイメージから基本イメージデータを構築する
	 */
	extern int CreateBaseImageWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, const (void)* FileImage, int FileImageSize, int DataType /*=LOADIMAGE_TYPE_FILE*/, .BASEIMAGE* BaseImage, int ReverseFlag);

	/**
	 * CreateBaseImage の旧名称
	 */
	extern int CreateGraphImage(const (dxlib_d.DxDataType.TCHAR)* FileName, const (void)* DataImage, int DataImageSize, int DataImageType, .BASEIMAGE* GraphImage, int ReverseFlag);

	/**
	 * 画像ファイルから基本イメージデータを構築する
	 */
	extern int CreateBaseImageToFile(const (dxlib_d.DxDataType.TCHAR)* FileName, .BASEIMAGE* BaseImage, int ReverseFlag = dxlib_d.DxDataType.FALSE);

	/**
	 * 画像ファイルから基本イメージデータを構築する
	 */
	extern int CreateBaseImageToFileWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, .BASEIMAGE* BaseImage, int ReverseFlag = dxlib_d.DxDataType.FALSE);

	/**
	 * メモリ上に展開された画像ファイルイメージから基本イメージデータを構築する
	 */
	extern int CreateBaseImageToMem(const (void)* FileImage, int FileImageSize, .BASEIMAGE* BaseImage, int ReverseFlag = dxlib_d.DxDataType.FALSE);

	/**
	 * ARGB各チャンネル 32bit 浮動小数点型 カラーの基本イメージデータを作成する
	 */
	extern int CreateARGBF32ColorBaseImage(int SizeX, int SizeY, .BASEIMAGE* BaseImage);

	/**
	 * ARGB各チャンネル 16bit 浮動小数点型 カラーの基本イメージデータを作成する
	 */
	extern int CreateARGBF16ColorBaseImage(int SizeX, int SizeY, .BASEIMAGE* BaseImage);

	/**
	 * ARGB8カラーの基本イメージデータを作成する
	 */
	extern int CreateARGB8ColorBaseImage(int SizeX, int SizeY, .BASEIMAGE* BaseImage);

	/**
	 * XRGB8カラーの基本イメージデータを作成する
	 */
	extern int CreateXRGB8ColorBaseImage(int SizeX, int SizeY, .BASEIMAGE* BaseImage);

	/**
	 * RGB8カラーの基本イメージデータを作成する
	 */
	extern int CreateRGB8ColorBaseImage(int SizeX, int SizeY, .BASEIMAGE* BaseImage);

	/**
	 * ARGB4カラーの基本イメージデータを作成する
	 */
	extern int CreateARGB4ColorBaseImage(int SizeX, int SizeY, .BASEIMAGE* BaseImage);

	/**
	 * A1R5G5B5カラーの基本イメージデータを作成する
	 */
	extern int CreateA1R5G5B5ColorBaseImage(int SizeX, int SizeY, .BASEIMAGE* BaseImage);

	/**
	 * X1R5G5B5カラーの基本イメージデータを作成する
	 */
	extern int CreateX1R5G5B5ColorBaseImage(int SizeX, int SizeY, .BASEIMAGE* BaseImage);

	/**
	 * R5G5B5A1カラーの基本イメージデータを作成する
	 */
	extern int CreateR5G5B5A1ColorBaseImage(int SizeX, int SizeY, .BASEIMAGE* BaseImage);

	/**
	 * R5G6B5カラーの基本イメージデータを作成する
	 */
	extern int CreateR5G6B5ColorBaseImage(int SizeX, int SizeY, .BASEIMAGE* BaseImage);

	/**
	 * パレット8ビットカラーの基本イメージデータを作成する
	 */
	extern int CreatePAL8ColorBaseImage(int SizeX, int SizeY, .BASEIMAGE* BaseImage, int UseAlpha = dxlib_d.DxDataType.FALSE);

	/**
	 * 指定のカラーフォーマットの基本イメージデータを作成する
	 */
	extern int CreateColorDataBaseImage(int SizeX, int SizeY, const (.COLORDATA)* ColorData, .BASEIMAGE* BaseImage);

	/**
	 * 基本イメージデータのイメージサイズを取得する
	 *
	 * Returns: イメージサイズ( 単位:byte )
	 */
	extern int GetBaseImageGraphDataSize(const (.BASEIMAGE)* BaseImage);

	/**
	 * 基本イメージデータの指定の部分だけを使う基本イメージデータの情報を作成する( BaseImage にはフォーマットが DX_BASEIMAGE_FORMAT_NORMAL でミップマップを使用していない画像のみ使用可能 )
	 */
	extern int DerivationBaseImage(const (.BASEIMAGE)* BaseImage, int x1, int y1, int x2, int y2, .BASEIMAGE* NewBaseImage);

	/**
	 * 基本イメージデータの後始末を行う
	 */
	extern int ReleaseBaseImage(.BASEIMAGE* BaseImage);

	/**
	 * ReleaseBaseImage の旧名称
	 */
	extern int ReleaseGraphImage(.BASEIMAGE* GraphImage);

	/**
	 * DX_BASEIMAGE_FORMAT_NORMAL 以外の形式のイメージを DX_BASEIMAGE_FORMAT_NORMAL 形式のイメージに変換する
	 */
	extern int ConvertNormalFormatBaseImage(.BASEIMAGE* BaseImage, int ReleaseOrigGraphData = dxlib_d.DxDataType.TRUE);

	/**
	 * 通常のαチャンネル付き画像を乗算済みαチャンネル付き画像に変換する( ピクセルフォーマットが ARGB8 以外の場合は ARGB8 に変換されます )
	 */
	extern int ConvertPremulAlphaBaseImage(.BASEIMAGE* BaseImage);

	/**
	 * 乗算済みαチャンネル付き画像を通常のαチャンネル付き画像に変換する( ピクセルフォーマットが ARGB8 以外の場合は ARGB8 に変換されます )
	 */
	extern int ConvertInterpAlphaBaseImage(.BASEIMAGE* BaseImage);

	/**
	 * 描画対象の画面から指定領域を基本イメージデータに転送する
	 */
	extern int GetDrawScreenBaseImage(int x1, int y1, int x2, int y2, .BASEIMAGE* BaseImage);

	/**
	 * 描画対象の画面から指定領域を基本イメージデータに転送する( 転送先座標指定版 )
	 */
	extern int GetDrawScreenBaseImageDestPos(int x1, int y1, int x2, int y2, .BASEIMAGE* BaseImage, int DestX, int DestY);

	/**
	 * 基本イメージデータを指定の色で塗りつぶす
	 */
	extern int FillBaseImage(.BASEIMAGE* BaseImage, int r, int g, int b, int a);

	/**
	 * 基本イメージデータの指定の領域を指定の色で塗りつぶす
	 */
	extern int FillRectBaseImage(.BASEIMAGE* BaseImage, int x, int y, int w, int h, int r, int g, int b, int a);

	/**
	 * 基本イメージデータの指定の領域を0クリアする
	 */
	extern int ClearRectBaseImage(.BASEIMAGE* BaseImage, int x, int y, int w, int h);

	/**
	 * 基本イメージデータのパレットを取得する
	 */
	extern int GetPaletteBaseImage(const (.BASEIMAGE)* BaseImage, int PaletteNo, int* r, int* g, int* b, int* a);

	/**
	 * 基本イメージデータのパレットをセットする
	 */
	extern int SetPaletteBaseImage(.BASEIMAGE* BaseImage, int PaletteNo, int r, int g, int b, int a);

	/**
	 * 基本イメージデータの指定の座標の色コードを変更する(パレット画像用)
	 */
	extern int SetPixelPalCodeBaseImage(.BASEIMAGE* BaseImage, int x, int y, int palNo);

	/**
	 * 基本イメージデータの指定の座標の色コードを取得する(パレット画像用)
	 */
	extern int GetPixelPalCodeBaseImage(const (.BASEIMAGE)* BaseImage, int x, int y);

	/**
	 * 基本イメージデータの指定の座標の色を変更する(各色要素は0〜255)
	 */
	extern int SetPixelBaseImage(.BASEIMAGE* BaseImage, int x, int y, int r, int g, int b, int a);

	/**
	 * 基本イメージデータの指定の座標の色を変更する(各色要素は浮動小数点数)
	 */
	extern int SetPixelBaseImageF(.BASEIMAGE* BaseImage, int x, int y, float r, float g, float b, float a);

	/**
	 * 基本イメージデータの指定の座標の色を取得する(各色要素は0〜255)
	 */
	extern int GetPixelBaseImage(const (.BASEIMAGE)* BaseImage, int x, int y, int* r, int* g, int* b, int* a);

	/**
	 * 基本イメージデータの指定の座標の色を取得する(各色要素は浮動小数点数)
	 */
	extern int GetPixelBaseImageF(const (.BASEIMAGE)* BaseImage, int x, int y, float* r, float* g, float* b, float* a);

	/**
	 * 基本イメージデータの指定の座標に線を描画する(各色要素は0〜255)
	 */
	extern int DrawLineBaseImage(.BASEIMAGE* BaseImage, int x1, int y1, int x2, int y2, int r, int g, int b, int a);

	/**
	 * 基本イメージデータの指定の座標に円を描画する(各色要素は0〜255)
	 */
	extern int DrawCircleBaseImage(.BASEIMAGE* BaseImage, int x, int y, int radius, int r, int g, int b, int a, int FillFlag = dxlib_d.DxDataType.TRUE);

	/**
	 * 基本イメージデータを別の基本イメージデータに転送する
	 */
	extern int BltBaseImage(int SrcX, int SrcY, int SrcSizeX, int SrcSizeY, int DestX, int DestY, .BASEIMAGE* SrcBaseImage, .BASEIMAGE* DestBaseImage);

	/**
	 * 基本イメージデータを別の基本イメージデータに転送する
	 */
	extern int BltBaseImage(int DestX, int DestY, .BASEIMAGE* SrcBaseImage, .BASEIMAGE* DestBaseImage);

	/**
	 * 基本イメージデータを別の基本イメージデータに透過色処理付きで転送する
	 */
	extern int BltBaseImageWithTransColor(int SrcX, int SrcY, int SrcSizeX, int SrcSizeY, int DestX, int DestY, .BASEIMAGE* SrcBaseImage, .BASEIMAGE* DestBaseImage, int Tr, int Tg, int Tb, int Ta);

	/**
	 * 基本イメージデータを別の基本イメージデータにアルファ値のブレンドを考慮した上で転送する( 出力先が ARGB8 形式以外の場合はエラーになります )
	 *
	 * Params:
	 *      SrcX = ?
	 *      SrcY = ?
	 *      SrcSizeX = ?
	 *      SrcSizeY = ?
	 *      DestX = ?
	 *      DestY = ?
	 *      SrcBaseImage = ?
	 *      DestBaseImage = ?
	 *      Opacity = 透明度:0( 完全透明 ) 〜 255( 完全不透明 )
	 */
	extern int BltBaseImageWithAlphaBlend(int SrcX, int SrcY, int SrcSizeX, int SrcSizeY, int DestX, int DestY, .BASEIMAGE* SrcBaseImage, .BASEIMAGE* DestBaseImage, int Opacity = 255);

	/**
	 * 基本イメージデータを左右反転する
	 */
	extern int ReverseBaseImageH(.BASEIMAGE* BaseImage);

	/**
	 * 基本イメージデータを上下反転する
	 */
	extern int ReverseBaseImageV(.BASEIMAGE* BaseImage);

	/**
	 * 基本イメージデータを上下左右反転する
	 */
	extern int ReverseBaseImage(.BASEIMAGE* BaseImage);

	/**
	 * 基本イメージデータに含まれるピクセルのアルファ値をチェックする
	 *
	 * Returns: -1:エラー  0:画像にアルファ成分が無い  1:画像にアルファ成分があり、すべて最大(255)値  2:画像にアルファ成分があり、存在するアルファ値は最小(0)と最大(255)もしくは最小(0)のみ 3:画像にアルファ成分があり、最小と最大以外の中間の値がある
	 */
	extern int CheckPixelAlphaBaseImage(const (.BASEIMAGE)* BaseImage);

	/**
	 * 基本イメージデータで使用されているパレット番号の最大値を取得する( パレット画像では無い場合は -1 が返る )
	 */
	extern int GetBaseImageUseMaxPaletteNo(const (.BASEIMAGE)* BaseImage);

	version (DX_NON_JPEGREAD) {
	} else {
		/**
		 * JPEGファイルの Exif情報を取得する、ExifBuffer を null に渡すと、戻り値の情報のサイズのみ取得できます
		 *
		 * Returns: -1:エラー  -1以外:Exif情報のサイズ
		 */
		extern int ReadJpegExif(const (dxlib_d.DxDataType.TCHAR)* JpegFilePath, dxlib_d.DxDataType.BYTE* ExifBuffer_Array, size_t ExifBufferSize);

		/**
		 * JPEGファイルの Exif情報を取得する、ExifBuffer を null に渡すと、戻り値の情報のサイズのみ取得できます
		 *
		 * Returns: 戻り値  -1:エラー  -1以外:Exif情報のサイズ
		 */
		extern int ReadJpegExifWithStrLen(const (dxlib_d.DxDataType.TCHAR)* JpegFilePath, size_t JpegFilePathLength, dxlib_d.DxDataType.BYTE* ExifBuffer_Array, size_t ExifBufferSize);
	}

	version (DX_NON_SAVEFUNCTION) {
	} else {
		/**
		 * 基本イメージデータをBMP画像として保存する
		 */
		extern int SaveBaseImageToBmp(const (dxlib_d.DxDataType.TCHAR)* FilePath, const (.BASEIMAGE)* BaseImage);

		/**
		 * 基本イメージデータをBMP画像として保存する
		 */
		extern int SaveBaseImageToBmpWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FilePath, size_t FilePathLength, const (.BASEIMAGE)* BaseImage);

		/**
		 * 基本イメージデータをDDS画像として保存する
		 */
		extern int SaveBaseImageToDds(const (dxlib_d.DxDataType.TCHAR)* FilePath, const (.BASEIMAGE)* BaseImage);

		/**
		 * 基本イメージデータをDDS画像として保存する
		 */
		extern int SaveBaseImageToDdsWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FilePath, size_t FilePathLength, const (.BASEIMAGE)* BaseImage);

		version (DX_NON_PNGREAD) {
		} else {
			/**
			 * 基本イメージデータをPNG画像として保存する
			 */
			extern int SaveBaseImageToPng(const (dxlib_d.DxDataType.TCHAR)* FilePath, .BASEIMAGE* BaseImage, int CompressionLevel);

			/**
			 * 基本イメージデータをPNG画像として保存する
			 */
			extern int SaveBaseImageToPngWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FilePath, size_t FilePathLength, .BASEIMAGE* BaseImage, int CompressionLevel);
		}

		version (DX_NON_JPEGREAD) {
		} else {
			/**
			 * 基本イメージデータをJPEG画像として保存する
			 */
			extern int SaveBaseImageToJpeg(const (dxlib_d.DxDataType.TCHAR)* FilePath, .BASEIMAGE* BaseImage, int Quality, int Sample2x1);

			/**
			 * 基本イメージデータをJPEG画像として保存する
			 */
			extern int SaveBaseImageToJpegWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FilePath, size_t FilePathLength, .BASEIMAGE* BaseImage, int Quality, int Sample2x1);
		}
	}

	// 基本イメージ描画

	/**
	 * 基本イメージデータを描画する
	 */
	extern int DrawBaseImage(int x, int y, .BASEIMAGE* BaseImage);

	/**
	 * カラーマッチングしながらイメージデータ間転送を行う Ver2
	 */
	extern int GraphColorMatchBltVer2(void* DestGraphData, int DestPitch, const (.COLORDATA)* DestColorData, const (void)* SrcGraphData, int SrcPitch, const (.COLORDATA)* SrcColorData, const (void)* AlphaMask, int AlphaPitch, const (.COLORDATA)* AlphaColorData, dxlib_d.DxDataType.POINT DestPoint, const (dxlib_d.DxDataType.RECT)* SrcRect, int ReverseFlag, int TransColorAlphaTestFlag, uint TransColor, int ImageShavedMode, int AlphaOnlyFlag = dxlib_d.DxDataType.FALSE, int RedIsAlphaFlag = dxlib_d.DxDataType.FALSE, int TransColorNoMoveFlag = dxlib_d.DxDataType.FALSE, int Pal8ColorMatch = dxlib_d.DxDataType.FALSE);

	// 色情報取得関係

	/**
	 * 浮動小数点型のカラー値を作成する
	 */
	extern .COLOR_F GetColorF(float Red, float Green, float Blue, float Alpha);

	/**
	 * 符号なし整数8ビットのカラー値を作成する
	 */
	extern .COLOR_U8 GetColorU8(int Red, int Green, int Blue, int Alpha);

	/**
	 * DrawPixel 等の描画関数で使用するカラー値を取得する
	 */
	extern uint GetColor(int Red, int Green, int Blue);

	/**
	 * カラー値から赤、緑、青の値を取得する
	 */
	extern int GetColor2(uint Color, int* Red, int* Green, int* Blue);

	/**
	 * 指定のピクセルフォーマットに対応したカラー値を得る
	 */
	extern uint GetColor3(const (.COLORDATA)* ColorData, int Red, int Green, int Blue, int Alpha = 255);

	/**
	 * 指定のカラーフォーマットのカラー値を別のカラーフォーマットのカラー値に変換する
	 */
	extern uint GetColor4(const (.COLORDATA)* DestColorData, const (.COLORDATA)* SrcColorData, uint SrcColor);

	/**
	 * 指定のカラーフォーマットのカラー値を赤、緑、青、アルファの値を取得する
	 */
	extern int GetColor5(const (.COLORDATA)* ColorData, uint Color, int* Red, int* Green, int* Blue, int* Alpha = null);

	/**
	 * パレットカラーのカラーフォーマットを構築する
	 */
	extern int CreatePaletteColorData(.COLORDATA* ColorDataBuf);

	/**
	 * ARGB各チャンネル 32bit 浮動小数点型カラーのカラーフォーマットを構築する
	 */
	extern int CreateARGBF32ColorData(.COLORDATA* ColorDataBuf);

	/**
	 * ARGB各チャンネル 16bit 浮動小数点型カラーのカラーフォーマットを構築する
	 */
	extern int CreateARGBF16ColorData(.COLORDATA* ColorDataBuf);

	/**
	 * XRGB8カラーのカラーフォーマットを構築する
	 */
	extern int CreateXRGB8ColorData(.COLORDATA* ColorDataBuf);

	/**
	 * ARGB8カラーのカラーフォーマットを構築する
	 */
	extern int CreateARGB8ColorData(.COLORDATA* ColorDataBuf);

	/**
	 * ARGB4カラーのカラーフォーマットを構築する
	 */
	extern int CreateARGB4ColorData(.COLORDATA* ColorDataBuf);

	/**
	 * A1R5G5B5カラーのカラーフォーマットを構築する
	 */
	extern int CreateA1R5G5B5ColorData(.COLORDATA* ColorDataBuf);

	/**
	 * X1R5G5B5カラーのカラーフォーマットを構築する
	 */
	extern int CreateX1R5G5B5ColorData(.COLORDATA* ColorDataBuf);

	/**
	 * R5G5B5A1カラーのカラーフォーマットを構築する
	 */
	extern int CreateR5G5B5A1ColorData(.COLORDATA* ColorDataBuf);

	/**
	 * R5G6B5カラーのカラーフォーマットを構築する
	 */
	extern int CreateR5G6B5ColorData(.COLORDATA* ColorDataBuf);

	/**
	 * 24ビットカラーのカラーフォーマットを構築する
	 */
	extern int CreateFullColorData(.COLORDATA* ColorDataBuf);

	/**
	 * グレースケールのカラーフォーマットを構築する
	 */
	extern int CreateGrayColorData(.COLORDATA* ColorDataBuf);

	/**
	 * パレット256色のカラーフォーマットを構築する
	 */
	extern int CreatePal8ColorData(.COLORDATA* ColorDataBuf, int UseAlpha = dxlib_d.DxDataType.FALSE);

	/**
	 * カラーフォーマットを作成する
	 */
	extern int CreateColorData(.COLORDATA* ColorDataBuf, int ColorBitDepth, dxlib_d.DxDataType.DWORD RedMask, dxlib_d.DxDataType.DWORD GreenMask, dxlib_d.DxDataType.DWORD BlueMask, dxlib_d.DxDataType.DWORD AlphaMask, int ChannelNum = 0, int ChannelBitDepth = 0, int FloatTypeFlag = dxlib_d.DxDataType.FALSE);

	/**
	 * NoneMask 以外の要素を埋めた COLORDATA 構造体の情報を元に NoneMask をセットする
	 */
	extern void SetColorDataNoneMask(.COLORDATA* ColorData);

	/**
	 * 二つのカラーフォーマットが等しいかどうか調べる
	 *
	 * Returns: TRUE:等しい  FALSE:等しくない
	 */
	extern int CmpColorData(const (.COLORDATA)* ColorData1, const (.COLORDATA)* ColorData2);

	// DxSoftImage.cpp関数プロトタイプ宣言
	version (DX_NON_SOFTIMAGE) {
	} else {
		/**
		 * ソフトウエアイメージハンドルを全て削除する
		 */
		extern int InitSoftImage();

		/**
		 * 画像ファイルを読み込みソフトウエアイメージハンドルを作成する
		 *
		 * Returns: -1:エラー  -1以外:イメージハンドル
		 */
		extern int LoadSoftImage(const (dxlib_d.DxDataType.TCHAR)* FileName);

		/**
		 * 画像ファイルを読み込みソフトウエアイメージハンドルを作成する
		 *
		 * Returns: -1:エラー  -1以外:イメージハンドル
		 */
		extern int LoadSoftImageWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength);

		/**
		 * 画像ファイルを読み込みソフトウエアイメージハンドルを作成する( 読み込んだ画像が RGBA8 以外のフォーマットだった場合は RGBA8 カラーに変換 )
		 *
		 * Returns: -1:エラー  -1以外:イメージハンドル
		 */
		extern int LoadARGB8ColorSoftImage(const (dxlib_d.DxDataType.TCHAR)* FileName);

		/**
		 * 画像ファイルを読み込みソフトウエアイメージハンドルを作成する( 読み込んだ画像が RGBA8 以外のフォーマットだった場合は RGBA8 カラーに変換 )
		 *
		 * Returns: -1:エラー  -1以外:イメージハンドル
		 */
		extern int LoadARGB8ColorSoftImageWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength);

		/**
		 * 画像ファイルを読み込みソフトウエアイメージハンドルを作成する( 読み込んだ画像が XGBA8 以外のフォーマットだった場合は XGBA8 カラーに変換 )
		 *
		 * Returns: -1:エラー  -1以外:イメージハンドル
		 */
		extern int LoadXRGB8ColorSoftImage(const (dxlib_d.DxDataType.TCHAR)* FileName);

		/**
		 * 画像ファイルを読み込みソフトウエアイメージハンドルを作成する( 読み込んだ画像が XGBA8 以外のフォーマットだった場合は XGBA8 カラーに変換 )
		 *
		 * Returns: -1:エラー  -1以外:イメージハンドル
		 */
		extern int LoadXRGB8ColorSoftImageWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength);

		/**
		 * メモリ上に展開された画像ファイルイメージからソフトウエアイメージハンドルを作成する
		 *
		 * Returns: -1:エラー  -1以外:イメージハンドル
		 */
		extern int LoadSoftImageToMem(const (void)* FileImage, int FileImageSize);

		/**
		 * メモリ上に展開された画像ファイルイメージからソフトウエアイメージハンドルを作成する( 読み込んだ画像が RGBA8 以外のフォーマットだった場合は RGBA8 カラーに変換 )
		 *
		 * Returns: -1:エラー  -1以外:イメージハンドル
		 */
		extern int LoadARGB8ColorSoftImageToMem(const (void)* FileImage, int FileImageSize);

		/**
		 * メモリ上に展開された画像ファイルイメージからソフトウエアイメージハンドルを作成する( 読み込んだ画像が XGBA8 以外のフォーマットだった場合は XGBA8 カラーに変換 )
		 *
		 * Returns: -1:エラー  -1以外:イメージハンドル
		 */
		extern int LoadXRGB8ColorSoftImageToMem(const (void)* FileImage, int FileImageSize);

		/**
		 * ソフトウエアイメージハンドルの作成
		 *
		 * Returns: -1:エラー  -1以外:イメージハンドル
		 */
		extern int MakeSoftImage(int SizeX, int SizeY);

		/**
		 * ソフトウエアイメージハンドルの作成( RGBA 各チャンネル 32bit 浮動小数点型 カラー )
		 */
		extern int MakeARGBF32ColorSoftImage(int SizeX, int SizeY);

		/**
		 * ソフトウエアイメージハンドルの作成( RGBA 各チャンネル 16bit 浮動小数点型 カラー )
		 */
		extern int MakeARGBF16ColorSoftImage(int SizeX, int SizeY);

		/**
		 * ソフトウエアイメージハンドルの作成( RGBA8 カラー )
		 */
		extern int MakeARGB8ColorSoftImage(int SizeX, int SizeY);

		/**
		 * ソフトウエアイメージハンドルの作成( XRGB8 カラー )
		 */
		extern int MakeXRGB8ColorSoftImage(int SizeX, int SizeY);

		/**
		 * ソフトウエアイメージハンドルの作成( ARGB4 カラー )
		 */
		extern int MakeARGB4ColorSoftImage(int SizeX, int SizeY);

		/**
		 * ソフトウエアイメージハンドルの作成( A1R5G5B5 カラー )
		 */
		extern int MakeA1R5G5B5ColorSoftImage(int SizeX, int SizeY);

		/**
		 * ソフトウエアイメージハンドルの作成( X1R5G5B5 カラー )
		 */
		extern int MakeX1R5G5B5ColorSoftImage(int SizeX, int SizeY);

		/**
		 * ソフトウエアイメージハンドルの作成( R5G5B5A1 カラー )
		 */
		extern int MakeR5G5B5A1ColorSoftImage(int SizeX, int SizeY);

		/**
		 * ソフトウエアイメージハンドルの作成( R5G6B5 カラー )
		 */
		extern int MakeR5G6B5ColorSoftImage(int SizeX, int SizeY);

		/**
		 * ソフトウエアイメージハンドルの作成( RGB8 カラー )
		 */
		extern int MakeRGB8ColorSoftImage(int SizeX, int SizeY);

		/**
		 * ソフトウエアイメージハンドルの作成( パレット256色 カラー )
		 */
		extern int MakePAL8ColorSoftImage(int SizeX, int SizeY, int UseAlpha = dxlib_d.DxDataType.FALSE);

		/**
		 * ソフトウエアイメージハンドルの削除する
		 */
		extern int DeleteSoftImage(int SIHandle);

		/**
		 * ソフトウエアイメージハンドルのサイズを取得する
		 */
		extern int GetSoftImageSize(int SIHandle, int* Width, int* Height);

		/**
		 * ソフトウエアイメージハンドルがパレット画像かどうかを取得する
		 *
		 * Returns: TRUE:パレット画像  FALSE:パレット画像じゃない
		 */
		extern int CheckPaletteSoftImage(int SIHandle);

		/**
		 * ソフトウエアイメージハンドルのフォーマットにα要素があるかどうかを取得する
		 *
		 * Returns: TRUE:ある  FALSE:ない
		 */
		extern int CheckAlphaSoftImage(int SIHandle);

		/**
		 * ソフトウエアイメージハンドルに含まれるピクセルのα値をチェックする
		 *
		 * Returns: -1:エラー  0:画像にα成分が無い  1:画像にα成分があり、すべて最大(255)値  2:画像にα成分があり、存在するα値は最小(0)と最大(255)もしくは最小(0)のみ 3:画像にα成分があり、最小と最大以外の中間の値がある
		 */
		extern int CheckPixelAlphaSoftImage(int SIHandle);

		/**
		 * 描画対象の画面から指定領域をソフトウエアイメージハンドルに転送する
		 */
		extern int GetDrawScreenSoftImage(int x1, int y1, int x2, int y2, int SIHandle);

		/**
		 * 描画対象の画面から指定領域をソフトウエアイメージハンドルに転送する( 転送先座標指定版 )
		 */
		extern int GetDrawScreenSoftImageDestPos(int x1, int y1, int x2, int y2, int SIHandle, int DestX, int DestY);

		/**
		 * ソフトウエアイメージハンドルを指定色で塗りつぶす(各色要素は0〜255)
		 */
		extern int FillSoftImage(int SIHandle, int r, int g, int b, int a);

		/**
		 * ソフトウエアイメージハンドルの指定の領域を0クリアする
		 */
		extern int ClearRectSoftImage(int SIHandle, int x, int y, int w, int h);

		/**
		 * ソフトウエアイメージハンドルのパレットを取得する(各色要素は0〜255)
		 */
		extern int GetPaletteSoftImage(int SIHandle, int PaletteNo, int* r, int* g, int* b, int* a);

		/**
		 * ソフトウエアイメージハンドルのパレットを設定する(各色要素は0〜255)
		 */
		extern int SetPaletteSoftImage(int SIHandle, int PaletteNo, int r, int g, int b, int a);

		/**
		 * ソフトウエアイメージハンドルの指定座標にドットを描画する(パレット画像用、有効値は0〜255)
		 */
		extern int DrawPixelPalCodeSoftImage(int SIHandle, int x, int y, int palNo);

		/**
		 * ソフトウエアイメージハンドルの指定座標の色コードを取得する(パレット画像用)
		 *
		 * Returns: 0~255
		 */
		extern int GetPixelPalCodeSoftImage(int SIHandle, int x, int y);

		/**
		 * ソフトウエアイメージハンドルの画像が格納されているメモリ領域の先頭アドレスを取得する
		 */
		extern void* GetImageAddressSoftImage(int SIHandle);

		/**
		 * ソフトウエアイメージハンドルのメモリに格納されている画像データの1ライン辺りのバイト数を取得する
		 */
		extern int GetPitchSoftImage(int SIHandle);

		/**
		 * ソフトウエアイメージハンドルの指定座標にドットを描画する(各色要素は0〜255)
		 */
		extern int DrawPixelSoftImage(int SIHandle, int x, int y, int r, int g, int b, int a);

		/**
		 * ソフトウエアイメージハンドルの指定座標にドットを描画する(各色要素は浮動小数点数)
		 */
		extern int DrawPixelSoftImageF(int SIHandle, int x, int y, float r, float g, float b, float a);

		/**
		 * ソフトウエアイメージハンドルの指定座標にドットを描画する(各色要素は0〜255)、エラーチェックをしない代わりに高速ですが、範囲外の座標や ARGB8 以外のフォーマットのソフトハンドルを渡すと不正なメモリアクセスで強制終了します
		 */
		extern void DrawPixelSoftImage_Unsafe_XRGB8(int SIHandle, int x, int y, int r, int g, int b);

		/**
		 * ソフトウエアイメージハンドルの指定座標にドットを描画する(各色要素は0〜255)、エラーチェックをしない代わりに高速ですが、範囲外の座標や XRGB8 以外のフォーマットのソフトハンドルを渡すと不正なメモリアクセスで強制終了します
		 */
		extern void DrawPixelSoftImage_Unsafe_ARGB8(int SIHandle, int x, int y, int r, int g, int b, int a);

		/**
		 * ソフトウエアイメージハンドルの指定座標の色を取得する(各色要素は0〜255)
		 */
		extern int GetPixelSoftImage(int SIHandle, int x, int y, int* r, int* g, int* b, int* a);

		/**
		 * ソフトウエアイメージハンドルの指定座標の色を取得する(各色要素は浮動小数点数)
		 */
		extern int GetPixelSoftImageF(int SIHandle, int x, int y, float* r, float* g, float* b, float* a);

		/**
		 * ソフトウエアイメージハンドルの指定座標の色を取得する(各色要素は0〜255)、エラーチェックをしない代わりに高速ですが、範囲外の座標や XRGB8 以外のフォーマットのソフトハンドルを渡すと不正なメモリアクセスで強制終了します
		 */
		extern void GetPixelSoftImage_Unsafe_XRGB8(int SIHandle, int x, int y, int* r, int* g, int* b);

		/**
		 * ソフトウエアイメージハンドルの指定座標の色を取得する(各色要素は0〜255)、エラーチェックをしない代わりに高速ですが、範囲外の座標や ARGB8 以外のフォーマットのソフトハンドルを渡すと不正なメモリアクセスで強制終了します
		 */
		extern void GetPixelSoftImage_Unsafe_ARGB8(int SIHandle, int x, int y, int* r, int* g, int* b, int* a);

		/**
		 * ソフトウエアイメージハンドルの指定座標に線を描画する(各色要素は0〜255)
		 */
		extern int DrawLineSoftImage(int SIHandle, int x1, int y1, int x2, int y2, int r, int g, int b, int a);

		/**
		 * ソフトウエアイメージハンドルの指定座標に円を描画する(各色要素は0〜255)
		 */
		extern int DrawCircleSoftImage(int SIHandle, int x, int y, int radius, int r, int g, int b, int a, int FillFlag = dxlib_d.DxDataType.TRUE);

		/**
		 * ソフトウエアイメージハンドルを別のソフトウエアイメージハンドルに転送する
		 */
		extern int BltSoftImage(int SrcX, int SrcY, int SrcSizeX, int SrcSizeY, int SrcSIHandle, int DestX, int DestY, int DestSIHandle);

		/**
		 * ソフトウエアイメージハンドルを別のソフトウエアイメージハンドルに透過色処理付きで転送する
		 */
		extern int BltSoftImageWithTransColor(int SrcX, int SrcY, int SrcSizeX, int SrcSizeY, int SrcSIHandle, int DestX, int DestY, int DestSIHandle, int Tr, int Tg, int Tb, int Ta);

		/**
		 * ソフトウエアイメージハンドルを別のソフトウエアイメージハンドルにアルファ値のブレンドを考慮した上で転送する( Opacity は透明度:0( 完全透明 ) 〜 255( 完全不透明 ) )( 出力先が ARGB8 形式以外の場合はエラーになります )
		 */
		extern int BltSoftImageWithAlphaBlend(int SrcX, int SrcY, int SrcSizeX, int SrcSizeY, int SrcSIHandle, int DestX, int DestY, int DestSIHandle, int Opacity = 255);

		/**
		 * ソフトウエアイメージハンドルを左右反転する
		 */
		extern int ReverseSoftImageH(int SIHandle);

		/**
		 * ソフトウエアイメージハンドルを上下反転する
		 */
		extern int ReverseSoftImageV(int SIHandle);

		/**
		 * ソフトウエアイメージハンドルを上下左右反転する
		 */
		extern int ReverseSoftImage(int SIHandle);

		version (DX_NON_FONT) {
		} else {
			/**
			 * ソフトウエアイメージハンドルに文字列を描画する( デフォルトフォントハンドルを使用する )
			 */
			extern int BltStringSoftImage(int x, int y, const (dxlib_d.DxDataType.TCHAR)* StrData, int DestSIHandle, int DestEdgeSIHandle = -1, int VerticalFlag = dxlib_d.DxDataType.FALSE);

			/**
			 * ソフトウエアイメージハンドルに文字列を描画する( デフォルトフォントハンドルを使用する )
			 */
			extern int BltStringSoftImageWithStrLen(int x, int y, const (dxlib_d.DxDataType.TCHAR)* StrData, size_t StrDataLength, int DestSIHandle, int DestEdgeSIHandle = -1, int VerticalFlag = dxlib_d.DxDataType.FALSE);

			/**
			 * ソフトウエアイメージハンドルに文字列を描画する( フォントハンドル使用版 )
			 */
			extern int BltStringSoftImageToHandle(int x, int y, const (dxlib_d.DxDataType.TCHAR)* StrData, int DestSIHandle, int DestEdgeSIHandle /* 縁が必要ない場合は -1 */, int FontHandle, int VerticalFlag = dxlib_d.DxDataType.FALSE);

			/**
			 * ソフトウエアイメージハンドルに文字列を描画する( フォントハンドル使用版 )
			 */
			extern int BltStringSoftImageToHandleWithStrLen(int x, int y, const (dxlib_d.DxDataType.TCHAR)* StrData, size_t StrDataLength, int DestSIHandle, int DestEdgeSIHandle /* 縁が必要ない場合は -1 */, int FontHandle, int VerticalFlag = dxlib_d.DxDataType.FALSE);
		}

		/**
		 * ソフトウエアイメージハンドルを画面に描画する
		 */
		extern int DrawSoftImage(int x, int y, int SIHandle);

		version (DX_NON_SAVEFUNCTION) {
		} else {
			/**
			 * ソフトウエアイメージハンドルをBMP画像ファイルとして保存する
			 */
			extern int SaveSoftImageToBmp(const (dxlib_d.DxDataType.TCHAR)* FilePath, int SIHandle);

			/**
			 * ソフトウエアイメージハンドルをBMP画像ファイルとして保存する
			 */
			extern int SaveSoftImageToBmpWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FilePath, size_t FilePathLength, int SIHandle);

			/**
			 * ソフトウエアイメージハンドルをDDS画像ファイルとして保存する
			 */
			extern int SaveSoftImageToDds(const (dxlib_d.DxDataType.TCHAR)* FilePath, int SIHandle);

			/**
			 * ソフトウエアイメージハンドルをDDS画像ファイルとして保存する
			 */
			extern int SaveSoftImageToDdsWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FilePath, size_t FilePathLength, int SIHandle);

			version (DX_NON_PNGREAD) {
			} else {
				/**
				 * ソフトウエアイメージハンドルをPNG画像ファイルとして保存する
				 *
				 * Params:
				 *      FilePath = ?
				 *      SIHandle = ?
				 *      CompressionLevel = 圧縮率、値が大きいほど高圧縮率高負荷、0は無圧縮,0〜9
				 */
				extern int SaveSoftImageToPng(const (dxlib_d.DxDataType.TCHAR)* FilePath, int SIHandle, int CompressionLevel);

				/**
				 * ソフトウエアイメージハンドルをPNG画像ファイルとして保存する
				 *
				 * Params:
				 *      ? = ?
				 *      ? = ?
				 *      ? = ?
				 *      CompressionLevel = 圧縮率、値が大きいほど高圧縮率高負荷、0は無圧縮,0〜9
				 */
				extern int SaveSoftImageToPngWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FilePath, size_t FilePathLength, int SIHandle, int CompressionLevel);
			}

			version (DX_NON_JPEGREAD) {
			} else {
				/**
				 * ソフトウエアイメージハンドルをJPEG画像ファイルとして保存する Quality = 画質、値が大きいほど低圧縮高画質,0〜100
				 */
				extern int SaveSoftImageToJpeg(const (dxlib_d.DxDataType.TCHAR)* FilePath, int SIHandle, int Quality, int Sample2x1);

				/**
				 * ソフトウエアイメージハンドルをJPEG画像ファイルとして保存する Quality = 画質、値が大きいほど低圧縮高画質,0〜100
				 */
				extern int SaveSoftImageToJpegWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FilePath, size_t FilePathLength, int SIHandle, int Quality, int Sample2x1);
			}
		}
	}

	version (DX_NON_SOUND) {
	} else {
		// DxSound.cpp関数プロトタイプ宣言

		// サウンドデータ管理系関数

		/**
		 * 全てのサウンドハンドルを削除する
		 */
		extern int InitSoundMem(int LogOutFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * サウンドハンドルを作成する
		 */
		extern int AddSoundData(int Handle = -1);

		/**
		 * ストリーム再生タイプのサウンドハンドルにストリームデータを再生対象に追加する
		 */
		extern int AddStreamSoundMem(.STREAMDATA* Stream, int LoopNum, int SoundHandle, int StreamDataType, int* CanStreamCloseFlag, int UnionHandle = -1);

		/**
		 * ストリーム再生タイプのサウンドハンドルにメモリ上に展開したサウンドファイルイメージを再生対象に追加する
		 */
		extern int AddStreamSoundMemToMem(const (void)* FileImage, size_t FileImageSize, int LoopNum, int SoundHandle, int StreamDataType, int UnionHandle = -1);

		/**
		 * ストリーム再生タイプのサウンドハンドルにサウンドファイルを再生対象に追加する
		 */
		extern int AddStreamSoundMemToFile(const (dxlib_d.DxDataType.TCHAR)* WaveFile, int LoopNum, int SoundHandle, int StreamDataType, int UnionHandle = -1);

		/**
		 * ストリーム再生タイプのサウンドハンドルにサウンドファイルを再生対象に追加する
		 */
		extern int AddStreamSoundMemToFileWithStrLen(const (dxlib_d.DxDataType.TCHAR)* WaveFile, size_t WaveFilePathLength, int LoopNum, int SoundHandle, int StreamDataType, int UnionHandle = -1);

		/**
		 * ストリーム再生タイプのサウンドハンドルの再生準備をする
		 */
		extern int SetupStreamSoundMem(int SoundHandle);

		/**
		 * ストリーム再生タイプのサウンドハンドルの再生を開始する
		 */
		extern int PlayStreamSoundMem(int SoundHandle, int PlayType = DX_PLAYTYPE_LOOP, int TopPositionFlag = dxlib_d.DxDataType.TRUE);

		/**
		 * ストリーム再生タイプのサウンドハンドルの再生状態を取得する
		 */
		extern int CheckStreamSoundMem(int SoundHandle);

		/**
		 * ストリーム再生タイプのサウンドハンドルの再生を停止する
		 */
		extern int StopStreamSoundMem(int SoundHandle);

		/**
		 * サウンドハンドルの再生位置をバイト単位で変更する(再生が止まっている時のみ有効)
		 */
		extern int SetStreamSoundCurrentPosition(dxlib_d.DxDataType.LONGLONG Byte, int SoundHandle);

		/**
		 * サウンドハンドルの再生位置をバイト単位で取得する
		 */
		extern dxlib_d.DxDataType.LONGLONG GetStreamSoundCurrentPosition(int SoundHandle);

		/**
		 * サウンドハンドルの再生位置をミリ秒単位で設定する(圧縮形式の場合は正しく設定されない場合がある)
		 */
		extern int SetStreamSoundCurrentTime(dxlib_d.DxDataType.LONGLONG Time, int SoundHandle);

		/**
		 * サウンドハンドルの再生位置をミリ秒単位で取得する(圧縮形式の場合は正しい値が返ってこない場合がある)
		 */
		extern dxlib_d.DxDataType.LONGLONG GetStreamSoundCurrentTime(int SoundHandle);

		/**
		 * ストリーム再生タイプのサウンドハンドルの周期的な処理を行う関数( 内部で自動的に呼ばれます )
		 */
		extern int ProcessStreamSoundMem(int SoundHandle);

		/**
		 * 有効なストリーム再生タイプのサウンドハンドルに対して ProcessStreamSoundMem を実行する( 内部で自動的に呼ばれます )
		 */
		extern int ProcessStreamSoundMemAll();

		/**
		 * 前奏部とループ部に分かれたサウンドファイルを読み込みサウンドハンドルを作成する
		 */
		extern int LoadSoundMem2(const (dxlib_d.DxDataType.TCHAR)* FileName1, const (dxlib_d.DxDataType.TCHAR)* FileName2);

		/**
		 * 前奏部とループ部に分かれたサウンドファイルを読み込みサウンドハンドルを作成する
		 */
		extern int LoadSoundMem2WithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName1, size_t FileName1Length, const (dxlib_d.DxDataType.TCHAR)* FileName2, size_t FileName2Length);

		/**
		 * 主にBGMを読み込みサウンドハンドルを作成するのに適した関数
		 */
		extern int LoadBGM(const (dxlib_d.DxDataType.TCHAR)* FileName);

		/**
		 * 主にBGMを読み込みサウンドハンドルを作成するのに適した関数
		 */
		extern int LoadBGMWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength);

		/**
		 * サウンドファイルからサウンドハンドルを作成する
		 */
		extern int LoadSoundMemBase(const (dxlib_d.DxDataType.TCHAR)* FileName, int BufferNum, int UnionHandle = -1);

		/**
		 * サウンドファイルからサウンドハンドルを作成する
		 */
		extern int LoadSoundMemBaseWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int BufferNum, int UnionHandle = -1);

		/**
		 * LoadSoundMemBase の別名関数
		 */
		extern int LoadSoundMem(const (dxlib_d.DxDataType.TCHAR)* FileName, int BufferNum = 3, int UnionHandle = -1);

		/**
		 * LoadSoundMemBase の別名関数
		 */
		extern int LoadSoundMemWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int BufferNum = 3, int UnionHandle = -1);

		/**
		 * LoadSoundMem を使用して下さい
		 */
		extern int LoadSoundMemToBufNumSitei(const (dxlib_d.DxDataType.TCHAR)* FileName, int BufferNum);

		/**
		 * LoadSoundMem を使用して下さい
		 */
		extern int LoadSoundMemToBufNumSiteiWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int BufferNum);

		/**
		 * 同じサウンドデータを使用するサウンドハンドルを作成する( DX_SOUNDDATATYPE_MEMNOPRESS タイプのサウンドハンドルのみ可能 )
		 */
		extern int DuplicateSoundMem(int SrcSoundHandle, int BufferNum = 3);

		/**
		 * メモリ上に展開されたサウンドファイルイメージからサウンドハンドルを作成する
		 */
		extern int LoadSoundMemByMemImageBase(const (void)* FileImage, size_t FileImageSize, int BufferNum, int UnionHandle = -1);

		/**
		 * LoadSoundMemByMemImageBase の別名関数
		 */
		extern int LoadSoundMemByMemImage(const (void)* FileImage, size_t FileImageSize, int BufferNum = 3, int UnionHandle = -1);

		/**
		 * メモリ上に展開されたPCMデータからサウンドハンドルを作成する
		 */
		extern int LoadSoundMemByMemImage2(const (void)* WaveImage, size_t WaveImageSize, const (.WAVEFORMATEX)* WaveFormat, size_t WaveHeaderSize);

		/**
		 * LoadSoundMemByMemImageBase を使用して下さい
		 */
		extern int LoadSoundMemByMemImageToBufNumSitei(const (void)* FileImage, size_t FileImageSize, int BufferNum);

		/**
		 * 前奏部とループ部に分かれた二つのメモリ上に展開されたサウンドファイルイメージからサウンドハンドルを作成する
		 */
		extern int LoadSoundMem2ByMemImage(const (void)* FileImage1, size_t FileImageSize1, const (void)* FileImage2, size_t FileImageSize2);

		/**
		 * ソフトウエアサウンドハンドルが持つサウンドデータからサウンドハンドルを作成する
		 */
		extern int LoadSoundMemFromSoftSound(int SoftSoundHandle, int BufferNum = 3);

		/**
		 * サウンドハンドルを削除する
		 */
		extern int DeleteSoundMem(int SoundHandle, int LogOutFlag = dxlib_d.DxDataType.FALSE);

		/**
		 * サウンドハンドルを再生する
		 */
		extern int PlaySoundMem(int SoundHandle, int PlayType, int TopPositionFlag = dxlib_d.DxDataType.TRUE);

		/**
		 * サウンドハンドルの再生を停止する
		 */
		extern int StopSoundMem(int SoundHandle);

		/**
		 * サウンドハンドルが再生中かどうかを取得する
		 */
		extern int CheckSoundMem(int SoundHandle);

		/**
		 * サウンドハンドルのパンを設定する( 100分の1デシベル単位 0 〜 10000 )
		 */
		extern int SetPanSoundMem(int PanPal, int SoundHandle);

		/**
		 * サウンドハンドルのパンを設定する( -255 〜 255 )
		 */
		extern int ChangePanSoundMem(int PanPal, int SoundHandle);

		/**
		 * サウンドハンドルのパンを取得する
		 */
		extern int GetPanSoundMem(int SoundHandle);

		/**
		 * サウンドハンドルのボリュームを設定する( 100分の1デシベル単位 0 〜 10000 )
		 */
		extern int SetVolumeSoundMem(int VolumePal, int SoundHandle);

		/**
		 * サウンドハンドルのボリュームを設定する( 0 〜 255 )
		 */
		extern int ChangeVolumeSoundMem(int VolumePal, int SoundHandle);

		/**
		 * サウンドハンドルのボリュームを取得する( 100分の1デシベル単位 0 〜 10000 )
		 */
		extern int GetVolumeSoundMem(int SoundHandle);

		/**
		 * サウンドハンドルのボリュームを取得する( 0 〜 255 )
		 */
		extern int GetVolumeSoundMem2(int SoundHandle);

		/**
		 * サウンドハンドルの指定のチャンネルのボリュームを設定する( 100分の1デシベル単位 0 〜 10000 )
		 */
		extern int SetChannelVolumeSoundMem(int Channel, int VolumePal, int SoundHandle);

		/**
		 * サウンドハンドルの指定のチャンネルのボリュームを設定する( 0 〜 255 )
		 */
		extern int ChangeChannelVolumeSoundMem(int Channel, int VolumePal, int SoundHandle);

		/**
		 * サウンドハンドルの指定のチャンネルのボリュームを取得する( 100分の1デシベル単位 0 〜 10000 )
		 */
		extern int GetChannelVolumeSoundMem(int Channel, int SoundHandle);

		/**
		 * サウンドハンドルの指定のチャンネルのボリュームを取得する( 0 〜 255 )
		 */
		extern int GetChannelVolumeSoundMem2(int Channel, int SoundHandle);

		/**
		 * サウンドハンドルの再生周波数を設定する
		 */
		extern int SetFrequencySoundMem(int FrequencyPal, int SoundHandle);

		/**
		 * サウンドハンドルの再生周波数を取得する
		 */
		extern int GetFrequencySoundMem(int SoundHandle);

		/**
		 * サウンドハンドルの再生周波数を読み込み直後の状態に戻す
		 */
		extern int ResetFrequencySoundMem(int SoundHandle);

		/**
		 * サウンドハンドルの次の再生にのみ使用するパンを設定する( 100分の1デシベル単位 0 〜 10000 )
		 */
		extern int SetNextPlayPanSoundMem(int PanPal, int SoundHandle);

		/**
		 * サウンドハンドルの次の再生にのみ使用するパンを設定する( -255 〜 255 )
		 */
		extern int ChangeNextPlayPanSoundMem(int PanPal, int SoundHandle);

		/**
		 * サウンドハンドルの次の再生にのみ使用するボリュームを設定する( 100分の1デシベル単位 0 〜 10000 )
		 */
		extern int SetNextPlayVolumeSoundMem(int VolumePal, int SoundHandle);

		/**
		 * サウンドハンドルの次の再生にのみ使用するボリュームを設定する( 0 〜 255 )
		 */
		extern int ChangeNextPlayVolumeSoundMem(int VolumePal, int SoundHandle);

		/**
		 * サウンドハンドルの次の再生にのみ使用するチャンネルのボリュームを設定する( 100分の1デシベル単位 0 〜 10000 )
		 */
		extern int SetNextPlayChannelVolumeSoundMem(int Channel, int VolumePal, int SoundHandle);

		/**
		 * サウンドハンドルの次の再生にのみ使用するチャンネルのボリュームを設定する( 0 〜 255 )
		 */
		extern int ChangeNextPlayChannelVolumeSoundMem(int Channel, int VolumePal, int SoundHandle);

		/**
		 * サウンドハンドルの次の再生にのみ使用する再生周波数を設定する
		 */
		extern int SetNextPlayFrequencySoundMem(int FrequencyPal, int SoundHandle);

		/**
		 * サウンドハンドルの再生位置をサンプル単位で設定する(再生が止まっている時のみ有効)
		 */
		extern int SetCurrentPositionSoundMem(dxlib_d.DxDataType.LONGLONG SamplePosition, int SoundHandle);

		/**
		 * サウンドハンドルの再生位置をサンプル単位で取得する
		 */
		extern dxlib_d.DxDataType.LONGLONG GetCurrentPositionSoundMem(int SoundHandle);

		/**
		 * サウンドハンドルの再生位置をバイト単位で設定する(再生が止まっている時のみ有効)
		 */
		extern int SetSoundCurrentPosition(dxlib_d.DxDataType.LONGLONG Byte, int SoundHandle);

		/**
		 * サウンドハンドルの再生位置をバイト単位で取得する
		 */
		extern dxlib_d.DxDataType.LONGLONG GetSoundCurrentPosition(int SoundHandle);

		/**
		 * サウンドハンドルの再生位置をミリ秒単位で設定する(圧縮形式の場合は正しく設定されない場合がある)
		 */
		extern int SetSoundCurrentTime(dxlib_d.DxDataType.LONGLONG Time, int SoundHandle);

		/**
		 * サウンドハンドルの再生位置をミリ秒単位で取得する(圧縮形式の場合は正しい値が返ってこない場合がある)
		 */
		extern dxlib_d.DxDataType.LONGLONG GetSoundCurrentTime(int SoundHandle);

		/**
		 * サウンドハンドルの音の総時間をサンプル単位で取得する
		 */
		extern dxlib_d.DxDataType.LONGLONG GetSoundTotalSample(int SoundHandle);

		/**
		 * サウンドハンドルの音の総時間をミリ秒単位で取得する
		 */
		extern dxlib_d.DxDataType.LONGLONG GetSoundTotalTime(int SoundHandle);

		/**
		 * SetLoopTimePosSoundMem の別名関数
		 */
		extern int SetLoopPosSoundMem(dxlib_d.DxDataType.LONGLONG LoopTime, int SoundHandle);

		/**
		 * サウンドハンドルにループ位置を設定する(ミリ秒単位)
		 */
		extern int SetLoopTimePosSoundMem(dxlib_d.DxDataType.LONGLONG LoopTime, int SoundHandle);

		/**
		 * サウンドハンドルにループ位置を設定する(サンプル単位)
		 */
		extern int SetLoopSamplePosSoundMem(dxlib_d.DxDataType.LONGLONG LoopSamplePosition, int SoundHandle);

		/**
		 * サウンドハンドルにループ開始位置を設定する(ミリ秒単位)
		 */
		extern int SetLoopStartTimePosSoundMem(dxlib_d.DxDataType.LONGLONG LoopStartTime, int SoundHandle);

		/**
		 * サウンドハンドルにループ開始位置を設定する(サンプル単位)
		 */
		extern int SetLoopStartSamplePosSoundMem(dxlib_d.DxDataType.LONGLONG LoopStartSamplePosition, int SoundHandle);

		/**
		 * サウンドハンドルにループ範囲を設定する(ミリ秒単位)
		 */
		extern int SetLoopAreaTimePosSoundMem(dxlib_d.DxDataType.LONGLONG LoopStartTime, dxlib_d.DxDataType.LONGLONG LoopEndTime, int SoundHandle);

		/**
		 * サウンドハンドルにループ範囲を取得する(ミリ秒単位)
		 */
		extern int GetLoopAreaTimePosSoundMem(dxlib_d.DxDataType.LONGLONG* LoopStartTime, dxlib_d.DxDataType.LONGLONG* LoopEndTime, int SoundHandle);

		/**
		 * サウンドハンドルにループ範囲を設定する(サンプル単位)
		 */
		extern int SetLoopAreaSamplePosSoundMem(dxlib_d.DxDataType.LONGLONG LoopStartSamplePosition, dxlib_d.DxDataType.LONGLONG LoopEndSamplePosition, int SoundHandle);

		/**
		 * サウンドハンドルにループ範囲を取得する(サンプル単位)
		 */
		extern int GetLoopAreaSamplePosSoundMem(dxlib_d.DxDataType.LONGLONG* LoopStartSamplePosition, dxlib_d.DxDataType.LONGLONG* LoopEndSamplePosition, int SoundHandle);

		/**
		 * サウンドハンドルの再生が終了したら自動的にハンドルを削除するかどうかを設定する
		 */
		extern int SetPlayFinishDeleteSoundMem(int DeleteFlag, int SoundHandle);

		/**
		 * サウンドハンドルの3Dサウンド用のリバーブパラメータを設定する
		 */
		extern int Set3DReverbParamSoundMem(const (.SOUND3D_REVERB_PARAM)* Param, int SoundHandle);

		/**
		 * サウンドハンドルの3Dサウンド用のリバーブパラメータをプリセットを使用して設定する
		 */
		extern int Set3DPresetReverbParamSoundMem(int PresetNo /* DX_REVERB_PRESET_DEFAULT 等 */, int SoundHandle);

		/**
		 * 全ての3Dサウンドのサウンドハンドルにリバーブパラメータを設定する
		 *
		 * Params:
		 *      Param = ?
		 *      PlaySoundOnly = TRUE:再生中のサウンドにのみ設定する  FALSE:再生していないサウンドにも設定する
		 */
		extern int Set3DReverbParamSoundMemAll(const (.SOUND3D_REVERB_PARAM)* Param, int PlaySoundOnly = dxlib_d.DxDataType.FALSE);

		/**
		 * 全ての3Dサウンドのサウンドハンドルにリバーブパラメータをプリセットを使用して設定する
		 *
		 * Params:
		 *      PresetNo = ?
		 *      PlaySoundOnly = TRUE:再生中のサウンドにのみ設定する  FALSE:再生していないサウンドにも設定する
		 */
		extern int Set3DPresetReverbParamSoundMemAll(int PresetNo /* DX_REVERB_PRESET_DEFAULT 等 */, int PlaySoundOnly = dxlib_d.DxDataType.FALSE);

		/**
		 * サウンドハンドルに設定されている3Dサウンド用のリバーブパラメータを取得する
		 */
		extern int Get3DReverbParamSoundMem(.SOUND3D_REVERB_PARAM* ParamBuffer, int SoundHandle);

		/**
		 * プリセットの3Dサウンド用のリバーブパラメータを取得する
		 */
		extern int Get3DPresetReverbParamSoundMem(.SOUND3D_REVERB_PARAM* ParamBuffer, int PresetNo /* DX_REVERB_PRESET_DEFAULT 等 */);

		/**
		 * サウンドハンドルの3Dサウンド用の再生位置を設定する
		 */
		extern int Set3DPositionSoundMem(.VECTOR Position, int SoundHandle);

		/**
		 * サウンドハンドルの3Dサウンド用の音が聞こえる距離を設定する
		 */
		extern int Set3DRadiusSoundMem(float Radius, int SoundHandle);

		/**
		 * サウンドハンドルの3Dサウンド用の移動速度を設定する
		 */
		extern int Set3DVelocitySoundMem(.VECTOR Velocity, int SoundHandle);

		/**
		 * サウンドハンドルの次の再生のみに使用する3Dサウンド用の再生位置を設定する
		 */
		extern int SetNextPlay3DPositionSoundMem(.VECTOR Position, int SoundHandle);

		/**
		 * サウンドハンドルの次の再生のみに使用する3Dサウンド用の音が聞こえる距離を設定する
		 */
		extern int SetNextPlay3DRadiusSoundMem(float Radius, int SoundHandle);

		/**
		 * サウンドハンドルの次の再生のみに使用する3Dサウンド用の移動速度を設定する
		 */
		extern int SetNextPlay3DVelocitySoundMem(.VECTOR Velocity, int SoundHandle);

		// 特殊関数

		/**
		 * MP3ファイルのタグ情報を取得する
		 */
		extern int GetMP3TagInfo(const (dxlib_d.DxDataType.TCHAR)* FileName, dxlib_d.DxDataType.TCHAR* TitleBuffer, size_t TitleBufferBytes, dxlib_d.DxDataType.TCHAR* ArtistBuffer, size_t ArtistBufferBytes, dxlib_d.DxDataType.TCHAR* AlbumBuffer, size_t AlbumBufferBytes, dxlib_d.DxDataType.TCHAR* YearBuffer, size_t YearBufferBytes, dxlib_d.DxDataType.TCHAR* CommentBuffer, size_t CommentBufferBytes, dxlib_d.DxDataType.TCHAR* TrackBuffer, size_t TrackBufferBytes, dxlib_d.DxDataType.TCHAR* GenreBuffer, size_t GenreBufferBytes, int* PictureGrHandle);

		/**
		 * MP3ファイルのタグ情報を取得する
		 */
		extern int GetMP3TagInfoWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, dxlib_d.DxDataType.TCHAR* TitleBuffer, size_t TitleBufferBytes, dxlib_d.DxDataType.TCHAR* ArtistBuffer, size_t ArtistBufferBytes, dxlib_d.DxDataType.TCHAR* AlbumBuffer, size_t AlbumBufferBytes, dxlib_d.DxDataType.TCHAR* YearBuffer, size_t YearBufferBytes, dxlib_d.DxDataType.TCHAR* CommentBuffer, size_t CommentBufferBytes, dxlib_d.DxDataType.TCHAR* TrackBuffer, size_t TrackBufferBytes, dxlib_d.DxDataType.TCHAR* GenreBuffer, size_t GenreBufferBytes, int* PictureGrHandle);

		version (DX_NON_OGGVORBIS) {
		} else {
			/**
			 * Oggファイルのコメント情報の数を取得する
			 */
			extern int GetOggCommentNum(const (dxlib_d.DxDataType.TCHAR)* FileName);

			/**
			 * Oggファイルのコメント情報の数を取得する
			 */
			extern int GetOggCommentNumWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength);

			extern int GetOggComment(const (dxlib_d.DxDataType.TCHAR)* FileName, int CommentIndex, dxlib_d.DxDataType.TCHAR* CommentNameBuffer, size_t CommentNameBufferBytes, dxlib_d.DxDataType.TCHAR* CommentBuffer,
			/**
			 * Oggファイルのコメント情報を取得する
			 */
			size_t CommentBufferBytes);

			extern int GetOggCommentWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int CommentIndex, dxlib_d.DxDataType.TCHAR* CommentNameBuffer, size_t CommentNameBufferBytes, dxlib_d.DxDataType.TCHAR* CommentBuffer,
			/**
			 * Oggファイルのコメント情報を取得する
			 */
			size_t CommentBufferBytes);
		}

		// 設定関係関数

		/**
		 * 作成するサウンドハンドルの再生タイプを設定する( DX_SOUNDDATATYPE_MEMNOPRESS 等 )
		 */
		extern int SetCreateSoundDataType(int SoundDataType);

		/**
		 * 作成するサウンドハンドルの再生タイプを取得する( DX_SOUNDDATATYPE_MEMNOPRESS 等 )
		 */
		extern int GetCreateSoundDataType();

		/**
		 * 作成するサウンドハンドルのピッチ( 音の長さを変えずに音程を変更する )レートを設定する( 単位はセント( 100.0fで半音、1200.0fで1オクターヴ )、プラスの値で音程が高く、マイナスの値で音程が低くなります )
		 */
		extern int SetCreateSoundPitchRate(float Cents);

		/**
		 * 作成するサウンドハンドルのピッチ( 音の長さを変えずに音程を変更する )レートを取得する( 単位はセント( 100.0fで半音、1200.0fで1オクターヴ )、プラスの値で音程が高く、マイナスの値で音程が低くなります )
		 */
		extern float GetCreateSoundPitchRate();

		/**
		 * 作成するサウンドハンドルのタイムストレッチ( 音程を変えずに音の長さを変更する )レートを設定する( 単位は倍率、2.0f で音の長さが2倍に、0.5f で音の長さが半分になります )
		 */
		extern int SetCreateSoundTimeStretchRate(float Rate);

		/**
		 * 作成するサウンドハンドルのタイムストレッチ( 音程を変えずに音の長さを変更する )レートを取得する( 単位は倍率、2.0f で音の長さが2倍に、0.5f で音の長さが半分になります )
		 */
		extern float GetCreateSoundTimeStretchRate();

		/**
		 * 作成するサウンドハンドルのループ範囲を設定する( ミリ秒単位 )
		 */
		extern int SetCreateSoundLoopAreaTimePos(dxlib_d.DxDataType.LONGLONG LoopStartTime, dxlib_d.DxDataType.LONGLONG LoopEndTime);

		/**
		 * 作成するサウンドハンドルのループ範囲を取得する( ミリ秒単位 )
		 */
		extern int GetCreateSoundLoopAreaTimePos(dxlib_d.DxDataType.LONGLONG* LoopStartTime, dxlib_d.DxDataType.LONGLONG* LoopEndTime);

		/**
		 * 作成するサウンドハンドルのループ範囲を設定する( サンプル単位 )
		 */
		extern int SetCreateSoundLoopAreaSamplePos(dxlib_d.DxDataType.LONGLONG LoopStartSamplePosition, dxlib_d.DxDataType.LONGLONG LoopEndSamplePosition);

		/**
		 * 作成するサウンドハンドルのループ範囲を取得する( サンプル単位 )
		 */
		extern int GetCreateSoundLoopAreaSamplePos(dxlib_d.DxDataType.LONGLONG* LoopStartSamplePosition, dxlib_d.DxDataType.LONGLONG* LoopEndSamplePosition);

		/**
		 * LoadSoundMem などで読み込むサウンドデータにループ範囲情報があっても無視するかどうかを設定する
		 *
		 * Params:
		 *      IgnoreFlag = TRUE:無視する  FALSE:無視しない( デフォルト )
		 */
		extern int SetCreateSoundIgnoreLoopAreaInfo(int IgnoreFlag);

		/**
		 * LoadSoundMem などで読み込むサウンドデータにループ範囲情報があっても無視するかどうかを取得する
		 *
		 * Returns: TRUE:無視する  FALSE:無視しない( デフォルト )
		 */
		extern int GetCreateSoundIgnoreLoopAreaInfo();

		/**
		 * 使用しないサウンドデータ読み込み処理のマスクを設定する( DX_READSOUNDFUNCTION_PCM 等 )
		 */
		extern int SetDisableReadSoundFunctionMask(int Mask);

		/**
		 * 使用しないサウンドデータ読み込み処理のマスクを取得する( DX_READSOUNDFUNCTION_PCM 等 )
		 */
		extern int GetDisableReadSoundFunctionMask();

		/**
		 * サウンドキャプチャを前提とした動作をするかどうかを設定する
		 */
		extern int SetEnableSoundCaptureFlag(int Flag);

		/**
		 * ChangeVolumeSoundMem, ChangeNextPlayVolumeSoundMem, ChangeMovieVolumeToGraph の音量計算式を Ver3.10c以前のものを使用するかどうかを設定する
		 *
		 * Params:
		 *      Flag = TRUE:Ver3.10c以前の計算式を使用  FALSE:3.10d以降の計算式を使用( デフォルト )
		 */
		extern int SetUseOldVolumeCalcFlag(int Flag);

		/**
		 * GetSoundCurrentTime などを使用した場合に取得できる再生時間のタイプを設定する
		 */
		extern int SetSoundCurrentTimeType(int Type /* DX_SOUNDCURRENTTIME_TYPE_LOW_LEVEL など */);

		/**
		 * GetSoundCurrentTime などを使用した場合に取得できる再生時間のタイプを取得する
		 */
		extern int GetSoundCurrentTimeType();

		/**
		 * 次に作成するサウンドハンドルを3Dサウンド用にするかどうかを設定する
		 *
		 * Params:
		 *      Flag = TRUE:3Dサウンド用にする  FALSE:3Dサウンド用にしない( デフォルト )
		 */
		extern int SetCreate3DSoundFlag(int Flag);

		/**
		 * 3D空間の1メートルに相当する距離を設定する、DxLib_Init を呼び出す前でのみ呼び出し可能( デフォルト:1.0f )
		 *
		 * Params:
		 *      Distance = ?
		 */
		extern int Set3DSoundOneMetre(float Distance);

		/**
		 * 3Dサウンドのリスナーの位置とリスナーの前方位置を設定する( リスナーの上方向はY軸固定 )
		 */
		extern int Set3DSoundListenerPosAndFrontPos_UpVecY(.VECTOR Position, .VECTOR FrontPosition);

		/**
		 * 3Dサウンドのリスナーの位置とリスナーの前方位置とリスナーの上方向を設定する
		 */
		extern int Set3DSoundListenerPosAndFrontPosAndUpVec(.VECTOR Position, .VECTOR FrontPosition, .VECTOR UpVector);

		/**
		 * 3Dサウンドのリスナーの移動速度を設定する
		 */
		extern int Set3DSoundListenerVelocity(.VECTOR Velocity);

		/**
		 * 3Dサウンドのリスナーの可聴角度範囲を設定する
		 */
		extern int Set3DSoundListenerConeAngle(float InnerAngle, float OuterAngle);

		/**
		 * 3Dサウンドのリスナーの可聴角度範囲の音量倍率を設定する
		 */
		extern int Set3DSoundListenerConeVolume(float InnerAngleVolume, float OuterAngleVolume);

		version (DX_NON_BEEP) {
		} else {
			// BEEP音再生用命令

			/**
			 * ビープ音周波数設定関数
			 */
			extern int SetBeepFrequency(int Freq);

			/**
			 * ビープ音を再生する
			 */
			extern int PlayBeep();

			/**
			 * ビープ音を止める
			 */
			extern int StopBeep();
		}

		// ラッパー関数

		/**
		 * サウンドファイルを再生する
		 */
		extern int PlaySoundFile(const (dxlib_d.DxDataType.TCHAR)* FileName, int PlayType);

		/**
		 * サウンドファイルを再生する
		 */
		extern int PlaySoundFileWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int PlayType);

		/**
		 * PlaySoundFile の旧名称
		 */
		extern int PlaySound(const (dxlib_d.DxDataType.TCHAR)* FileName, int PlayType);

		/**
		 * PlaySoundFile の旧名称
		 */
		extern int PlaySoundWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int PlayType);

		/**
		 * サウンドファイルの再生中かどうかを取得する
		 */
		extern int CheckSoundFile();

		/**
		 * CheckSoundFile の旧名称
		 */
		extern int CheckSound();

		/**
		 * サウンドファイルの再生を停止する
		 */
		extern int StopSoundFile();

		/**
		 * StopSoundFile の旧名称
		 */
		extern int StopSound();

		/**
		 * サウンドファイルの音量を設定する
		 */
		extern int SetVolumeSoundFile(int VolumePal);

		/**
		 * SetVolumeSound の旧名称
		 */
		extern int SetVolumeSound(int VolumePal);

		// ソフトウエア制御サウンド系関数

		/**
		 * ソフトウエアで扱う波形データハンドルをすべて削除する
		 */
		extern int InitSoftSound();

		/**
		 * ソフトウエアで扱う波形データハンドルをサウンドファイルから作成する
		 */
		extern int LoadSoftSound(const (dxlib_d.DxDataType.TCHAR)* FileName);

		/**
		 * ソフトウエアで扱う波形データハンドルをサウンドファイルから作成する
		 */
		extern int LoadSoftSoundWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength);

		/**
		 * ソフトウエアで扱う波形データハンドルをメモリ上に展開されたサウンドファイルイメージから作成する
		 */
		extern int LoadSoftSoundFromMemImage(const (void)* FileImage, size_t FileImageSize);

		/**
		 * ソフトウエアで扱う空の波形データハンドルを作成する( フォーマットは引数のソフトウエアサウンドハンドルと同じものにする )
		 */
		extern int MakeSoftSound(int UseFormat_SoftSoundHandle, dxlib_d.DxDataType.LONGLONG SampleNum);

		/**
		 * ソフトウエアで扱う空の波形データハンドルを作成する( チャンネル数:2 量子化ビット数:16bit サンプリング周波数:44.1KHz )
		 */
		extern int MakeSoftSound2Ch16Bit44KHz(dxlib_d.DxDataType.LONGLONG SampleNum);

		/**
		 * ソフトウエアで扱う空の波形データハンドルを作成する( チャンネル数:2 量子化ビット数:16bit サンプリング周波数:22KHz )
		 */
		extern int MakeSoftSound2Ch16Bit22KHz(dxlib_d.DxDataType.LONGLONG SampleNum);

		/**
		 * ソフトウエアで扱う空の波形データハンドルを作成する( チャンネル数:2 量子化ビット数:8bit サンプリング周波数:44.1KHz )
		 */
		extern int MakeSoftSound2Ch8Bit44KHz(dxlib_d.DxDataType.LONGLONG SampleNum);

		/**
		 * ソフトウエアで扱う空の波形データハンドルを作成する( チャンネル数:2 量子化ビット数:8bit サンプリング周波数:22KHz )
		 */
		extern int MakeSoftSound2Ch8Bit22KHz(dxlib_d.DxDataType.LONGLONG SampleNum);

		/**
		 * ソフトウエアで扱う空の波形データハンドルを作成する( チャンネル数:1 量子化ビット数:16bit サンプリング周波数:44.1KHz )
		 */
		extern int MakeSoftSound1Ch16Bit44KHz(dxlib_d.DxDataType.LONGLONG SampleNum);

		/**
		 * ソフトウエアで扱う空の波形データハンドルを作成する( チャンネル数:1 量子化ビット数:16bit サンプリング周波数:22KHz )
		 */
		extern int MakeSoftSound1Ch16Bit22KHz(dxlib_d.DxDataType.LONGLONG SampleNum);

		/**
		 * ソフトウエアで扱う空の波形データハンドルを作成する( チャンネル数:1 量子化ビット数:8bit サンプリング周波数:44.1KHz )
		 */
		extern int MakeSoftSound1Ch8Bit44KHz(dxlib_d.DxDataType.LONGLONG SampleNum);

		/**
		 * ソフトウエアで扱う空の波形データハンドルを作成する( チャンネル数:1 量子化ビット数:8bit サンプリング周波数:22KHz )
		 */
		extern int MakeSoftSound1Ch8Bit22KHz(dxlib_d.DxDataType.LONGLONG SampleNum);

		/**
		 * ソフトウエアで扱う空の波形データハンドルを作成する
		 */
		extern int MakeSoftSoundCustom(int ChannelNum, int BitsPerSample, int SamplesPerSec, dxlib_d.DxDataType.LONGLONG SampleNum, int IsFloatType = 0);

		/**
		 * ソフトウエアで扱う波形データハンドルを削除する
		 */
		extern int DeleteSoftSound(int SoftSoundHandle);

		version (DX_NON_SAVEFUNCTION) {
		} else {
			/**
			 * ソフトウエアで扱う波形データハンドルをWAVEファイル(PCM)形式で保存する
			 */
			extern int SaveSoftSound(int SoftSoundHandle, const (dxlib_d.DxDataType.TCHAR)* FileName);

			/**
			 * ソフトウエアで扱う波形データハンドルをWAVEファイル(PCM)形式で保存する
			 */
			extern int SaveSoftSoundWithStrLen(int SoftSoundHandle, const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength);
		}

		/**
		 * ソフトウエアで扱う波形データハンドルのサンプル数を取得する
		 */
		extern dxlib_d.DxDataType.LONGLONG GetSoftSoundSampleNum(int SoftSoundHandle);

		/**
		 * ソフトウエアで扱う波形データハンドルのフォーマットを取得する
		 */
		extern int GetSoftSoundFormat(int SoftSoundHandle, int* Channels, int* BitsPerSample, int* SamplesPerSec, int* IsFloatType = null);

		/**
		 * ソフトウエアで扱う波形データハンドルのサンプルを読み取る
		 */
		extern int ReadSoftSoundData(int SoftSoundHandle, dxlib_d.DxDataType.LONGLONG SamplePosition, int* Channel1, int* Channel2);

		/**
		 * ソフトウエアで扱う波形データハンドルのサンプルを読み取る( float型版 )
		 */
		extern int ReadSoftSoundDataF(int SoftSoundHandle, dxlib_d.DxDataType.LONGLONG SamplePosition, float* Channel1, float* Channel2);

		/**
		 * ソフトウエアで扱う波形データハンドルのサンプルを書き込む
		 */
		extern int WriteSoftSoundData(int SoftSoundHandle, dxlib_d.DxDataType.LONGLONG SamplePosition, int Channel1, int Channel2);

		/**
		 * ソフトウエアで扱う波形データハンドルのサンプルを書き込む( float型版 )
		 */
		extern int WriteSoftSoundDataF(int SoftSoundHandle, dxlib_d.DxDataType.LONGLONG SamplePosition, float Channel1, float Channel2);

		/**
		 * ソフトウエアで扱う波形データハンドルの波形データを音程を変えずにデータの長さを変更する
		 */
		extern int WriteTimeStretchSoftSoundData(int SrcSoftSoundHandle, int DestSoftSoundHandle);

		/**
		 * ソフトウエアで扱う波形データハンドルの波形データの長さを変更する
		 */
		extern int WritePitchShiftSoftSoundData(int SrcSoftSoundHandle, int DestSoftSoundHandle);

		/**
		 * ソフトウエアで扱う波形データハンドルの波形イメージが格納されているメモリアドレスを取得する
		 */
		extern void* GetSoftSoundDataImage(int SoftSoundHandle);

		/**
		 * ソフトウエアで扱う波形データハンドルの指定の範囲を高速フーリエ変換を行い、各周波数域の振幅を取得する( SampleNum は 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536 の何れかである必要があります、Channel を -1 にすると二つのチャンネルを合成した結果になります )
		 */
		extern int GetFFTVibrationSoftSound(int SoftSoundHandle, int Channel, dxlib_d.DxDataType.LONGLONG SamplePosition, int SampleNum, float* Buffer_Array, int BufferLength);

		/**
		 * ソフトウエアで扱う波形データハンドルの指定の範囲を高速フーリエ変換を行い、各周波数域の振幅を取得する、結果の実数と虚数を別々に取得することができるバージョン( SampleNum は 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536 の何れかである必要があります、Channel を -1 にすると二つのチャンネルを合成した結果になります )
		 */
		extern int GetFFTVibrationSoftSoundBase(int SoftSoundHandle, int Channel, dxlib_d.DxDataType.LONGLONG SamplePosition, int SampleNum, float* RealBuffer_Array, float* ImagBuffer_Array, int BufferLength);

		/**
		 * ソフトウエアで扱う波形データのプレイヤーハンドルをすべて解放する
		 */
		extern int InitSoftSoundPlayer();

		/**
		 * ソフトウエアで扱う波形データのプレイヤーハンドルを作成する( フォーマットは引数のソフトウエアサウンドハンドルと同じものにする )
		 */
		extern int MakeSoftSoundPlayer(int UseFormat_SoftSoundHandle);

		/**
		 * ソフトウエアで扱う波形データのプレイヤーハンドルを作成する( チャンネル数:2 量子化ビット数:16bit サンプリング周波数:44.1KHz )
		 */
		extern int MakeSoftSoundPlayer2Ch16Bit44KHz();

		/**
		 * ソフトウエアで扱う波形データのプレイヤーハンドルを作成する( チャンネル数:2 量子化ビット数:16bit サンプリング周波数:22KHz )
		 */
		extern int MakeSoftSoundPlayer2Ch16Bit22KHz();

		/**
		 * ソフトウエアで扱う波形データのプレイヤーハンドルを作成する( チャンネル数:2 量子化ビット数:8bit サンプリング周波数:44.1KHz )
		 */
		extern int MakeSoftSoundPlayer2Ch8Bit44KHz();

		/**
		 * ソフトウエアで扱う波形データのプレイヤーハンドルを作成する( チャンネル数:2 量子化ビット数:8bit サンプリング周波数:22KHz )
		 */
		extern int MakeSoftSoundPlayer2Ch8Bit22KHz();

		/**
		 * ソフトウエアで扱う波形データのプレイヤーハンドルを作成する( チャンネル数:1 量子化ビット数:16bit サンプリング周波数:44.1KHz )
		 */
		extern int MakeSoftSoundPlayer1Ch16Bit44KHz();

		/**
		 * ソフトウエアで扱う波形データのプレイヤーハンドルを作成する( チャンネル数:1 量子化ビット数:16bit サンプリング周波数:22KHz )
		 */
		extern int MakeSoftSoundPlayer1Ch16Bit22KHz();

		/**
		 * ソフトウエアで扱う波形データのプレイヤーハンドルを作成する( チャンネル数:1 量子化ビット数:8bit サンプリング周波数:44.1KHz )
		 */
		extern int MakeSoftSoundPlayer1Ch8Bit44KHz();

		/**
		 * ソフトウエアで扱う波形データのプレイヤーハンドルを作成する( チャンネル数:1 量子化ビット数:8bit サンプリング周波数:22KHz )
		 */
		extern int MakeSoftSoundPlayer1Ch8Bit22KHz();

		/**
		 * ソフトウエアで扱う波形データのプレイヤーハンドルを作成する
		 */
		extern int MakeSoftSoundPlayerCustom(int ChannelNum, int BitsPerSample, int SamplesPerSec);

		/**
		 * ソフトウエアで扱う波形データのプレイヤーハンドルを削除する
		 */
		extern int DeleteSoftSoundPlayer(int SSoundPlayerHandle);

		/**
		 * ソフトウエアで扱う波形データのプレイヤーハンドルに波形データを追加する( フォーマットが同じではない場合はエラー )
		 */
		extern int AddDataSoftSoundPlayer(int SSoundPlayerHandle, int SoftSoundHandle, dxlib_d.DxDataType.LONGLONG AddSamplePosition, int AddSampleNum);

		/**
		 * ソフトウエアで扱う波形データのプレイヤーハンドルにプレイヤーが対応したフォーマットの生波形データを追加する
		 */
		extern int AddDirectDataSoftSoundPlayer(int SSoundPlayerHandle, const (void)* SoundData, int AddSampleNum);

		/**
		 * ソフトウエアで扱う波形データのプレイヤーハンドルに波形データを1つ追加する
		 */
		extern int AddOneDataSoftSoundPlayer(int SSoundPlayerHandle, int Channel1, int Channel2);

		/**
		 * ソフトウエアで扱う波形データのプレイヤーハンドルが扱うデータフォーマットを取得する
		 */
		extern int GetSoftSoundPlayerFormat(int SSoundPlayerHandle, int* Channels, int* BitsPerSample, int* SamplesPerSec);

		/**
		 * ソフトウエアで扱う波形データのプレイヤーハンドルの再生処理を開始する
		 */
		extern int StartSoftSoundPlayer(int SSoundPlayerHandle);

		/**
		 * ソフトウエアで扱う波形データのプレイヤーハンドルの再生処理が開始されているか取得する
		 *
		 * Returns: TRUE:開始している  FALSE:停止している
		 */
		extern int CheckStartSoftSoundPlayer(int SSoundPlayerHandle);

		/**
		 * ソフトウエアで扱う波形データのプレイヤーハンドルの再生処理を停止する
		 */
		extern int StopSoftSoundPlayer(int SSoundPlayerHandle);

		/**
		 * ソフトウエアで扱う波形データのプレイヤーハンドルの状態を初期状態に戻す( 追加された波形データは削除され、再生状態だった場合は停止する )
		 */
		extern int ResetSoftSoundPlayer(int SSoundPlayerHandle);

		/**
		 * ソフトウエアで扱う波形データのプレイヤーハンドルに追加した波形データでまだ再生用サウンドバッファに転送されていない波形データのサンプル数を取得する
		 */
		extern int GetStockDataLengthSoftSoundPlayer(int SSoundPlayerHandle);

		/**
		 * ソフトウエアで扱う波形データのプレイヤーハンドルに再生用サウンドバッファに転送していない波形データが無く、再生用サウンドバッファにも無音データ以外無いかどうかを取得する
		 *
		 * Returns: TRUE:無音データ以外無い  FALSE:有効データがある
		 */
		extern int CheckSoftSoundPlayerNoneData(int SSoundPlayerHandle);

		// MIDI制御関数

		/**
		 * MIDIハンドルを削除する
		 */
		extern int DeleteMusicMem(int MusicHandle);

		/**
		 * MIDIファイルを読み込みMIDIハンドルを作成する
		 */
		extern int LoadMusicMem(const (dxlib_d.DxDataType.TCHAR)* FileName);

		/**
		 * MIDIファイルを読み込みMIDIハンドルを作成する
		 */
		extern int LoadMusicMemWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength);

		/**
		 * メモリ上に展開されたMIDIファイルイメージからMIDIハンドルを作成する
		 */
		extern int LoadMusicMemByMemImage(const (void)* FileImage, size_t FileImageSize);

		/**
		 * MIDIハンドルの演奏を開始する
		 */
		extern int PlayMusicMem(int MusicHandle, int PlayType);

		/**
		 * MIDIハンドルの演奏を停止する
		 */
		extern int StopMusicMem(int MusicHandle);

		/**
		 * MIDIハンドルが演奏中かどうかを取得する
		 *
		 * Returns: TRUE:演奏中  FALSE:停止中
		 */
		extern int CheckMusicMem(int MusicHandle);

		/**
		 * MIDIハンドルの再生音量をセットする
		 */
		extern int SetVolumeMusicMem(int Volume, int MusicHandle);

		/**
		 * MIDIハンドルの現在の再生位置を取得する
		 */
		extern int GetMusicMemPosition(int MusicHandle);

		/**
		 * MIDIハンドルをすべて削除する
		 */
		extern int InitMusicMem();

		/**
		 * MIDIハンドルの周期的処理( 内部で呼ばれます )
		 */
		extern int ProcessMusicMem();

		/**
		 * MIDIファイルを演奏する
		 */
		extern int PlayMusic(const (dxlib_d.DxDataType.TCHAR)* FileName, int PlayType);

		/**
		 * MIDIファイルを演奏する
		 */
		extern int PlayMusicWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int PlayType);

		/**
		 * メモリ上に展開されているMIDIファイルを演奏する
		 */
		extern int PlayMusicByMemImage(const (void)* FileImage, size_t FileImageSize, int PlayType);

		/**
		 * MIDIの再生音量をセットする
		 */
		extern int SetVolumeMusic(int Volume);

		/**
		 * MIDIファイルの演奏停止
		 */
		extern int StopMusic();

		/**
		 * MIDIファイルが演奏中か否か情報を取得する
		 */
		extern int CheckMusic();

		/**
		 * MIDIの現在の再生位置を取得する
		 */
		extern int GetMusicPosition();

		/**
		 * MIDIの再生形式を設定する
		 */
		extern int SelectMidiMode(int Mode);
	}

	// DxArchive_.cpp 関数 プロトタイプ宣言

	/**
	 * DXアーカイブファイルの読み込み機能を使うかどうかを設定する
	 *
	 * Returns: FALSE:使用しない  TRUE:使用する
	 */
	extern int SetUseDXArchiveFlag(int Flag);

	/**
	 * 同名のDXアーカイブファイルとフォルダが存在した場合、どちらを優先させるかを設定する
	 *
	 * Params:
	 *      Priority = 1:フォルダを優先  0:DXアーカイブファイルを優先( デフォルト )
	 */
	extern int SetDXArchivePriority(int Priority = 0);

	/**
	 * 検索するDXアーカイブファイルの拡張子を設定する
	 *
	 * Params:
	 *      Extension = 拡張子名文字列
	 */
	extern int SetDXArchiveExtension(const (dxlib_d.DxDataType.TCHAR)* Extension = null);

	/**
	 * 検索するDXアーカイブファイルの拡張子を設定する
	 *
	 * Params:
	 *      Extension = 拡張子名文字列
	 *      ExtensionLength = ?
	 */
	extern int SetDXArchiveExtensionWithStrLen(const (dxlib_d.DxDataType.TCHAR)* Extension = null, size_t ExtensionLength = 0);

	/**
	 * DXアーカイブファイルの鍵文字列を設定する
	 *
	 * Params:
	 *      KeyString = 鍵文字列
	 */
	extern int SetDXArchiveKeyString(const (dxlib_d.DxDataType.TCHAR)* KeyString = null);

	/**
	 * DXアーカイブファイルの鍵文字列を設定する
	 *
	 * Params:
	 *      KeyString = 鍵文字列
	 *      KeyStringLength = ?
	 */
	extern int SetDXArchiveKeyStringWithStrLen(const (dxlib_d.DxDataType.TCHAR)* KeyString = null, size_t KeyStringLength = 0);

	/**
	 * 指定のDXAファイルを丸ごとメモリに読み込む
	 *
	 * Returns: -1:エラー  0:成功
	 */
	extern int DXArchivePreLoad(const (dxlib_d.DxDataType.TCHAR)* FilePath, int ASync = dxlib_d.DxDataType.FALSE);

	/**
	 * 指定のDXAファイルを丸ごとメモリに読み込む
	 *
	 * Returns: -1:エラー  0:成功
	 */
	extern int DXArchivePreLoadWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FilePath, size_t FilePathLength, int ASync = dxlib_d.DxDataType.FALSE);

	/**
	 * 指定のDXAファイルの事前読み込みが完了したかどうかを取得する
	 *
	 * Returns: TRUE:完了した FALSE:まだ
	 */
	extern int DXArchiveCheckIdle(const (dxlib_d.DxDataType.TCHAR)* FilePath);

	/**
	 * 指定のDXAファイルの事前読み込みが完了したかどうかを取得する
	 *
	 * Returns: TRUE:完了した FALSE:まだ
	 */
	extern int DXArchiveCheckIdleWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FilePath, size_t FilePathLength);

	/**
	 * 指定のDXAファイルをメモリから解放する
	 */
	extern int DXArchiveRelease(const (dxlib_d.DxDataType.TCHAR)* FilePath);

	/**
	 * 指定のDXAファイルをメモリから解放する
	 */
	extern int DXArchiveReleaseWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FilePath, size_t FilePathLength);

	/**
	 * DXAファイルの中に指定のファイルが存在するかどうかを調べる、TargetFilePath はDXAファイルをカレントフォルダとした場合のパス
	 *
	 * Returns: -1:エラー  0:無い  1:ある
	 */
	extern int DXArchiveCheckFile(const (dxlib_d.DxDataType.TCHAR)* FilePath, const (dxlib_d.DxDataType.TCHAR)* TargetFilePath);

	/**
	 * DXAファイルの中に指定のファイルが存在するかどうかを調べる、TargetFilePath はDXAファイルをカレントフォルダとした場合のパス
	 *
	 * Returns: -1:エラー  0:無い  1:ある
	 */
	extern int DXArchiveCheckFileWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FilePath, size_t FilePathLength, const (dxlib_d.DxDataType.TCHAR)* TargetFilePath, size_t TargetFilePathLength);

	/**
	 * メモリ上に展開されたDXAファイルを指定のファイルパスにあることにする( EmulateFilePath は見立てる dxa ファイルのパス、例えばDXAファイルイメージを Image.dxa というファイル名で c:\Temp にあることにしたい場合は EmulateFilePath に "c:\\Temp\\Image.dxa" を渡す、SetDXArchiveExtension で拡張子を変更している場合は EmulateFilePath に渡すファイルパスの拡張子もそれに合わせる必要あり )
	 */
	extern int DXArchiveSetMemImage(void* ArchiveImage, int ArchiveImageSize, const (dxlib_d.DxDataType.TCHAR)* EmulateFilePath, int ArchiveImageCopyFlag = dxlib_d.DxDataType.FALSE, int ArchiveImageReadOnly = dxlib_d.DxDataType.TRUE);

	/**
	 * メモリ上に展開されたDXAファイルを指定のファイルパスにあることにする( EmulateFilePath は見立てる dxa ファイルのパス、例えばDXAファイルイメージを Image.dxa というファイル名で c:\Temp にあることにしたい場合は EmulateFilePath に "c:\\Temp\\Image.dxa" を渡す、SetDXArchiveExtension で拡張子を変更している場合は EmulateFilePath に渡すファイルパスの拡張子もそれに合わせる必要あり )
	 */
	extern int DXArchiveSetMemImageWithStrLen(void* ArchiveImage, int ArchiveImageSize, const (dxlib_d.DxDataType.TCHAR)* EmulateFilePath, size_t EmulateFilePathLength, int ArchiveImageCopyFlag = dxlib_d.DxDataType.FALSE, int ArchiveImageReadOnly = dxlib_d.DxDataType.TRUE);

	/**
	 * DXArchiveSetMemImage の設定を解除する
	 */
	extern int DXArchiveReleaseMemImage(void* ArchiveImage);

	/**
	 * バイナリデータを元に CRC32 のハッシュ値を計算する
	 */
	extern dxlib_d.DxDataType.DWORD HashCRC32(const (void)* SrcData, size_t SrcDataSize);

	// DxModel.cpp 関数 プロトタイプ宣言

	version (DX_NON_MODEL) {
	} else {
		// モデルの読み込み・複製関係

		/**
		 * モデルの読み込み
		 *
		 * Returns: -1:エラー  0以上:モデルハンドル
		 */
		extern int MV1LoadModel(const (dxlib_d.DxDataType.TCHAR)* FileName);

		/**
		 * モデルの読み込み
		 *
		 * Returns: -1:エラー  0以上:モデルハンドル
		 */
		extern int MV1LoadModelWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength);

		/**
		 * メモリ上のモデルファイルイメージと独自の読み込みルーチンを使用してモデルを読み込む
		 */
		extern int MV1LoadModelFromMem(const (void)* FileImage, int FileSize, int function(const (dxlib_d.DxDataType.TCHAR)* FilePath, void** FileImageAddr, int* FileSize, void* FileReadFuncData) FileReadFunc, int function(void* MemoryAddr, void* FileReadFuncData) FileReleaseFunc, void* FileReadFuncData = null);

		/**
		 * 指定のモデルと同じモデル基本データを使用してモデルを作成する
		 *
		 * Returns: -1:エラー  0以上:モデルハンドル
		 */
		extern int MV1DuplicateModel(int SrcMHandle);

		/**
		 * 指定のモデルをモデル基本データも含め複製する( MV1DuplicateModel はモデル基本データは共有しますが、こちらは複製元のモデルとは一切共有データの無いモデルハンドルを作成します )
		 *
		 * Returns: -1:エラー  0以上:モデルハンドル
		 */
		extern int MV1CreateCloneModel(int SrcMHandle);

		/**
		 * モデルを削除する
		 */
		extern int MV1DeleteModel(int MHandle);

		/**
		 * すべてのモデルを削除する
		 */
		extern int MV1InitModel();

		/**
		 * モデルを読み込む際に法線の再計算を行うかどうかを設定する
		 *
		 * Params:
		 *      Flag = TRUE:行う  FALSE:行わない( デフォルト )
		 */
		extern int MV1SetLoadModelReMakeNormal(int Flag);

		/**
		 * モデルを読み込む際に行う法泉の再計算で使用するスムージング角度を設定する( 単位はラジアン )
		 */
		extern int MV1SetLoadModelReMakeNormalSmoothingAngle(float SmoothingAngle = 1.562069f);

		/**
		 * モデルを読み込む際にスケーリングデータを無視するかどうかを設定する
		 *
		 * Params:
		 *      Flag = TRUE:無視する  FALSE:無視しない( デフォルト )
		 */
		extern int MV1SetLoadModelIgnoreScaling(int Flag);

		/**
		 * モデルを読み込む際に座標データの最適化を行うかどうかを設定する
		 *
		 * Params:
		 *      Flag = TRUE:行う  FALSE:行わない( デフォルト )
		 */
		extern int MV1SetLoadModelPositionOptimize(int Flag);

		/**
		 * モデルを読み込む際にポリゴンの辺が接していて、且つ法線の方向が異なる辺に面積0のポリゴンを埋め込むかどうかを設定する、( MV1ファイルの読み込みではこの関数の設定は無視され、ポリゴンの埋め込みは実行されません )
		 *
		 * Params:
		 *      Flag = TRUE:埋め込む FALSE:埋め込まない( デフォルト )
		 */
		extern int MV1SetLoadModelNotEqNormalSide_AddZeroAreaPolygon(int Flag);

		/**
		 * 読み込むモデルの物理演算モードを設定する
		 */
		extern int MV1SetLoadModelUsePhysicsMode(int PhysicsMode /* DX_LOADMODEL_PHYSICS_LOADCALC 等 */);

		/**
		 * 読み込むモデルの物理演算に適用する重力パラメータを設定する
		 */
		extern int MV1SetLoadModelPhysicsWorldGravity(float Gravity);

		/**
		 * 読み込むモデルの物理演算に適用する重力パラメータを取得する
		 */
		extern float MV1GetLoadModelPhysicsWorldGravity();

		/**
		 * 読み込むモデルの物理演算モードが事前計算( DX_LOADMODEL_PHYSICS_LOADCALC )だった場合に適用される重力の設定をする
		 */
		extern int MV1SetLoadCalcPhysicsWorldGravity(int GravityNo, .VECTOR Gravity);

		/**
		 * 読み込むモデルの物理演算モードが事前計算( DX_LOADMODEL_PHYSICS_LOADCALC )だった場合に適用される重力を取得する
		 */
		extern .VECTOR MV1GetLoadCalcPhysicsWorldGravity(int GravityNo);

		/**
		 * 読み込むモデルの物理演算モードが事前計算( DX_LOADMODEL_PHYSICS_LOADCALC )だった場合に適用される物理演算の時間進行の精度を設定する( 0:60FPS  1:120FPS  2:240FPS  3:480FPS  4:960FPS  5:1920FPS )
		 *
		 * Params:
		 *      Precision = ?
		 */
		extern int MV1SetLoadModelPhysicsCalcPrecision(int Precision);

		/**
		 * PMD, PMX ファイルを読み込んだ際のアニメーションの FPS モードを設定する
		 */
		extern int MV1SetLoadModel_PMD_PMX_AnimationFPSMode(int FPSMode /* DX_LOADMODEL_PMD_PMX_ANIMATION_FPSMODE_30 等 */);

		/**
		 * 読み込むモデルの物理演算を特定の剛体のみ無効にするための名前のワードを追加する、追加できるワード文字列の最大長は 63 文字、追加できるワードの数は最大 256 個
		 */
		extern int MV1AddLoadModelDisablePhysicsNameWord(const (dxlib_d.DxDataType.TCHAR)* NameWord);

		/**
		 * 読み込むモデルの物理演算を特定の剛体のみ無効にするための名前のワードを追加する、追加できるワード文字列の最大長は 63 文字、追加できるワードの数は最大 256 個
		 */
		extern int MV1AddLoadModelDisablePhysicsNameWordWithStrLen(const (dxlib_d.DxDataType.TCHAR)* NameWord, size_t NameWordLength);

		/**
		 * MV1AddLoadModelDisablePhysicsNameWord で追加した剛体の無効ワードをリセットして無効ワード無しの初期状態に戻す
		 */
		extern int MV1ResetLoadModelDisablePhysicsNameWord();

		/**
		 * MV1AddLoadModelDisablePhysicsNameWord で追加した剛体の無効ワードの適用ルールを変更する
		 */
		extern int MV1SetLoadModelDisablePhysicsNameWordMode(int DisableNameWordMode /* DX_LOADMODEL_PHYSICS_DISABLENAMEWORD_ALWAYS 等 */);

		/**
		 * 読み込むモデルに適用するアニメーションファイルのパスを設定する、NULLを渡すと設定リセット( 現在は PMD,PMX のみに効果あり )
		 */
		extern int MV1SetLoadModelAnimFilePath(const (dxlib_d.DxDataType.TCHAR)* FileName);

		/**
		 * 読み込むモデルに適用するアニメーションファイルのパスを設定する、NULLを渡すと設定リセット( 現在は PMD,PMX のみに効果あり )
		 */
		extern int MV1SetLoadModelAnimFilePathWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength);

		/**
		 * 読み込むモデルを同時複数描画に対応させるかどうかを設定する、( 「対応させる」にすると描画が高速になる可能性がある代わりに消費VRAMが増えます )
		 *
		 * Params:
		 *      Flag = TRUE:対応させる  FALSE:対応させない( デフォルト )
		 */
		extern int MV1SetLoadModelUsePackDraw(int Flag);

		/**
		 * 読み込むモデルのひとつのトライアングルリストで使用できる最大ボーン数を設定する( UseMaxBoneNum で指定できる値の範囲は 8 〜 54、 0 を指定するとデフォルト動作に戻る )
		 */
		extern int MV1SetLoadModelTriangleListUseMaxBoneNum(int UseMaxBoneNum);

		// モデル保存関係

		/**
		 * 指定のパスにモデルを保存する
		 *
		 * Returns: 0:成功  -1:メモリ不足  -2:使われていないアニメーションがあった
		 */
		extern int MV1SaveModelToMV1File(int MHandle, const (dxlib_d.DxDataType.TCHAR)* FileName, int SaveType = MV1_SAVETYPE_NORMAL, int AnimMHandle = -1, int AnimNameCheck = dxlib_d.DxDataType.TRUE, int Normal8BitFlag = 1, int Position16BitFlag = 1, int Weight8BitFlag = 0, int Anim16BitFlag = 1);

		/**
		 * 指定のパスにモデルを保存する
		 *
		 * Returns: 0:成功  -1:メモリ不足  -2:使われていないアニメーションがあった
		 */
		extern int MV1SaveModelToMV1FileWithStrLen(int MHandle, const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int SaveType = MV1_SAVETYPE_NORMAL, int AnimMHandle = -1, int AnimNameCheck = dxlib_d.DxDataType.TRUE, int Normal8BitFlag = 1, int Position16BitFlag = 1, int Weight8BitFlag = 0, int Anim16BitFlag = 1);

		version (DX_NON_SAVEFUNCTION) {
		} else {
			/**
			 * 指定のパスにモデルをXファイル形式で保存する
			 *
			 * Returns: 0:成功  -1:メモリ不足  -2:使われていないアニメーションがあった
			 */
			extern int MV1SaveModelToXFile(int MHandle, const (dxlib_d.DxDataType.TCHAR)* FileName, int SaveType = MV1_SAVETYPE_NORMAL, int AnimMHandle = -1, int AnimNameCheck = dxlib_d.DxDataType.TRUE);

			/**
			 * 指定のパスにモデルをXファイル形式で保存する
			 *
			 * Returns: 0:成功  -1:メモリ不足  -2:使われていないアニメーションがあった
			 */
			extern int MV1SaveModelToXFileWithStrLen(int MHandle, const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int SaveType = MV1_SAVETYPE_NORMAL, int AnimMHandle = -1, int AnimNameCheck = dxlib_d.DxDataType.TRUE);
		}

		// モデル描画関係

		/**
		 * モデルを描画する
		 */
		extern int MV1DrawModel(int MHandle);

		/**
		 * モデルの指定のフレームを描画する
		 */
		extern int MV1DrawFrame(int MHandle, int FrameIndex);

		/**
		 * モデルの指定のメッシュを描画する
		 */
		extern int MV1DrawMesh(int MHandle, int MeshIndex);

		/**
		 * モデルの指定のトライアングルリストを描画する
		 */
		extern int MV1DrawTriangleList(int MHandle, int TriangleListIndex);

		/**
		 * モデルのデバッグ描画
		 */
		extern int MV1DrawModelDebug(int MHandle, uint Color, int IsNormalLine, float NormalLineLength, int IsPolyLine, int IsCollisionBox);

		// 描画設定関係

		/**
		 * モデルの描画に SetUseVertexShader, SetUsePixelShader で指定したシェーダーを使用するかどうかを設定する
		 *
		 * Params:
		 *      UseFlag = TRUE:使用する  FALSE:使用しない( デフォルト )
		 */
		extern int MV1SetUseOrigShader(int UseFlag);

		/**
		 * モデルの半透明要素がある部分についての描画モードを設定する
		 */
		extern int MV1SetSemiTransDrawMode(int DrawMode /* DX_SEMITRANSDRAWMODE_ALWAYS 等 */);

		// モデル基本制御関係

		/**
		 * モデルのローカル座標からワールド座標に変換する行列を得る
		 */
		extern .MATRIX MV1GetLocalWorldMatrix(int MHandle);

		/**
		 * モデルのローカル座標からワールド座標に変換する行列を得る
		 */
		extern .MATRIX_D MV1GetLocalWorldMatrixD(int MHandle);

		/**
		 * モデルの座標をセット
		 */
		extern int MV1SetPosition(int MHandle, .VECTOR Position);

		/**
		 * モデルの座標をセット
		 */
		extern int MV1SetPositionD(int MHandle, .VECTOR_D Position);

		/**
		 * モデルの座標を取得
		 */
		extern .VECTOR MV1GetPosition(int MHandle);

		/**
		 * モデルの座標を取得
		 */
		extern .VECTOR_D MV1GetPositionD(int MHandle);

		/**
		 * モデルの拡大値をセット
		 */
		extern int MV1SetScale(int MHandle, .VECTOR Scale);

		/**
		 * モデルの拡大値を取得
		 */
		extern .VECTOR MV1GetScale(int MHandle);

		/**
		 * モデルの回転値をセット( X軸回転→Y軸回転→Z軸回転方式 )
		 */
		extern int MV1SetRotationXYZ(int MHandle, .VECTOR Rotate);

		/**
		 * モデルの回転値を取得( X軸回転→Y軸回転→Z軸回転方式 )
		 */
		extern .VECTOR MV1GetRotationXYZ(int MHandle);

		/**
		 * モデルのZ軸とY軸の向きをセットする
		 */
		extern int MV1SetRotationZYAxis(int MHandle, .VECTOR ZAxisDirection, .VECTOR YAxisDirection, float ZAxisTwistRotate);

		/**
		 * モデルのY軸の回転値を指定のベクトルの向きを元に設定する、モデルはZ軸のマイナス方向を向いていることを想定するので、そうではない場合は OffsetYAngle で補正する、X軸回転、Z軸回転は0で固定
		 */
		extern int MV1SetRotationYUseDir(int MHandle, .VECTOR Direction, float OffsetYAngle);

		/**
		 * モデルの回転用行列をセットする
		 */
		extern int MV1SetRotationMatrix(int MHandle, .MATRIX Matrix);

		/**
		 * モデルの回転用行列を取得する
		 */
		extern .MATRIX MV1GetRotationMatrix(int MHandle);

		/**
		 * モデルの変形用行列をセットする
		 */
		extern int MV1SetMatrix(int MHandle, .MATRIX Matrix);

		/**
		 * モデルの変形用行列をセットする
		 */
		extern int MV1SetMatrixD(int MHandle, .MATRIX_D Matrix);

		/**
		 * モデルの変形用行列を取得する
		 */
		extern .MATRIX MV1GetMatrix(int MHandle);

		/**
		 * モデルの変形用行列を取得する
		 */
		extern .MATRIX_D MV1GetMatrixD(int MHandle);

		/**
		 * モデルの表示、非表示状態を変更する
		 *
		 * Params:
		 *      MHandle = ?
		 *      VisibleFlag = TRUE:表示  FALSE:非表示
		 */
		extern int MV1SetVisible(int MHandle, int VisibleFlag);

		/**
		 * モデルの表示、非表示状態を取得する
		 *
		 * Returns: TRUE:表示  FALSE:非表示
		 */
		extern int MV1GetVisible(int MHandle);

		/**
		 * モデルのメッシュの種類( DX_MV1_MESHCATEGORY_NORMAL など )毎の表示、非表示を設定する
		 *
		 * Params:
		 *      MHandle = ?
		 *      MeshCategory = ?
		 *      VisibleFlag = TRUE:表示  FALSE:非表示
		 */
		extern int MV1SetMeshCategoryVisible(int MHandle, int MeshCategory, int VisibleFlag);

		/**
		 * モデルのメッシュの種類( DX_MV1_MESHCATEGORY_NORMAL など )毎の表示、非表示を取得する
		 *
		 * Returns: TRUE:表示  FALSE:非表示
		 */
		extern int MV1GetMeshCategoryVisible(int MHandle, int MeshCategory);

		/**
		 * モデルのディフューズカラーのスケール値を設定する( デフォルト値は 1.0f )
		 */
		extern int MV1SetDifColorScale(int MHandle, .COLOR_F Scale);

		/**
		 * モデルのディフューズカラーのスケール値を取得する( デフォルト値は 1.0f )
		 */
		extern .COLOR_F MV1GetDifColorScale(int MHandle);

		/**
		 * モデルのスペキュラカラーのスケール値を設定する( デフォルト値は 1.0f )
		 */
		extern int MV1SetSpcColorScale(int MHandle, .COLOR_F Scale);

		/**
		 * モデルのスペキュラカラーのスケール値を取得する( デフォルト値は 1.0f )
		 */
		extern .COLOR_F MV1GetSpcColorScale(int MHandle);

		/**
		 * モデルのエミッシブカラーのスケール値を設定する( デフォルト値は 1.0f )
		 */
		extern int MV1SetEmiColorScale(int MHandle, .COLOR_F Scale);

		/**
		 * モデルのエミッシブカラーのスケール値を取得する( デフォルト値は 1.0f )
		 */
		extern .COLOR_F MV1GetEmiColorScale(int MHandle);

		/**
		 * モデルのアンビエントカラーのスケール値を設定する( デフォルト値は 1.0f )
		 */
		extern int MV1SetAmbColorScale(int MHandle, .COLOR_F Scale);

		/**
		 * モデルのアンビエントカラーのスケール値を取得する( デフォルト値は 1.0f )
		 */
		extern .COLOR_F MV1GetAmbColorScale(int MHandle);

		/**
		 * モデルに半透明要素があるかどうかを取得する
		 *
		 * Returns: TRUE:ある  FALSE:ない
		 */
		extern int MV1GetSemiTransState(int MHandle);

		/**
		 * モデルの不透明度を設定する( 不透明 1.0f 〜 透明 0.0f )
		 */
		extern int MV1SetOpacityRate(int MHandle, float Rate);

		/**
		 * モデルの不透明度を取得する( 不透明 1.0f 〜 透明 0.0f )
		 */
		extern float MV1GetOpacityRate(int MHandle);

		/**
		 * モデルを描画する際にRGB値に対してA値を乗算するかどうかを設定する( 描画結果が乗算済みアルファ画像になります )
		 *
		 * Params:
		 *      MHandle = ?
		 *      Flag = TRUE:RGB値に対してA値を乗算する  FALSE:乗算しない(デフォルト)
		 */
		extern int MV1SetUseDrawMulAlphaColor(int MHandle, int Flag);

		/**
		 * モデルを描画する際にRGB値に対してA値を乗算するかどうかを取得する( 描画結果が乗算済みアルファ画像になります )
		 *
		 * Returns: TRUE:RGB値に対してA値を乗算する  FALSE:乗算しない(デフォルト)
		 */
		extern int MV1GetUseDrawMulAlphaColor(int MHandle);

		/**
		 * モデルを描画する際にZバッファを使用するかどうかを設定する
		 */
		extern int MV1SetUseZBuffer(int MHandle, int Flag);

		/**
		 * モデルを描画する際にZバッファに書き込みを行うかどうかを設定する
		 */
		extern int MV1SetWriteZBuffer(int MHandle, int Flag);

		/**
		 * モデルの描画時のZ値の比較モードを設定する
		 */
		extern int MV1SetZBufferCmpType(int MHandle, int CmpType /* DX_CMP_NEVER 等 */);

		/**
		 * モデルの描画時の書き込むZ値のバイアスを設定する
		 */
		extern int MV1SetZBias(int MHandle, int Bias);

		/**
		 * モデルの含まれるメッシュの頂点ディフューズカラーをマテリアルのディフューズカラーの代わりに使用するかどうかを設定する
		 *
		 * Params:
		 *      MHandle = ?
		 *      UseFlag = TRUE:マテリアルカラーの代わりに使用する  FALSE:マテリアルカラーを使用する
		 */
		extern int MV1SetUseVertDifColor(int MHandle, int UseFlag);

		/**
		 * モデルに含まれるメッシュの頂点スペキュラカラーをマテリアルのスペキュラカラーの代わりに使用するかどうかを設定する
		 *
		 * Params:
		 *      MHandle = ?
		 *      UseFlag = TRUE:マテリアルカラーの代わりに使用する  FALSE:マテリアルカラーを使用する
		 */
		extern int MV1SetUseVertSpcColor(int MHandle, int UseFlag);

		/**
		 * モデルのテクスチャのサンプルフィルターモードを変更する( FilterMode は DX_DRAWMODE_NEAREST 等 )
		 *
		 * Params:
		 *      MHandle = ?
		 *      FilterMode = ?
		 */
		extern int MV1SetSampleFilterMode(int MHandle, int FilterMode);

		/**
		 * モデルの異方性フィルタリングの最大次数を設定する
		 */
		extern int MV1SetMaxAnisotropy(int MHandle, int MaxAnisotropy);

		/**
		 * モデルをワイヤーフレームで描画するかどうかを設定する
		 */
		extern int MV1SetWireFrameDrawFlag(int MHandle, int Flag);

		/**
		 * モデルの頂点カラーを現在設定されているマテリアルのカラーにする
		 */
		extern int MV1RefreshVertColorFromMaterial(int MHandle);

		/**
		 * モデルの物理演算の重力を設定する
		 */
		extern int MV1SetPhysicsWorldGravity(int MHandle, .VECTOR Gravity);

		/**
		 * モデルの物理演算を指定時間分経過したと仮定して計算する( MillisecondTime で指定する時間の単位はミリ秒 )
		 */
		extern int MV1PhysicsCalculation(int MHandle, float MillisecondTime);

		/**
		 * モデルの物理演算の状態をリセットする( 位置がワープしたとき用 )
		 */
		extern int MV1PhysicsResetState(int MHandle);

		/**
		 * モデルのシェイプ機能を使用するかどうかを設定する
		 *
		 * Params:
		 *      MHandle = ?
		 *      UseFlag = TRUE:使用する( デフォルト )  FALSE:使用しない
		 */
		extern int MV1SetUseShapeFlag(int MHandle, int UseFlag);

		/**
		 * モデルのマテリアル番号順にメッシュを描画するかどうかのフラグを取得する
		 *
		 * Returns: TRUE:マテリアル番号順に描画  FALSE:不透明メッシュの後半透明メッシュ
		 */
		extern int MV1GetMaterialNumberOrderFlag(int MHandle);

		// アニメーション関係

		/**
		 * アニメーションをアタッチする
		 *
		 * Returns: -1:エラー  0以上:アタッチインデックス
		 */
		extern int MV1AttachAnim(int MHandle, int AnimIndex, int AnimSrcMHandle = -1, int NameCheck = dxlib_d.DxDataType.TRUE);

		/**
		 * アニメーションをデタッチする
		 */
		extern int MV1DetachAnim(int MHandle, int AttachIndex);

		/**
		 * アタッチしているアニメーションの再生時間を設定する
		 */
		extern int MV1SetAttachAnimTime(int MHandle, int AttachIndex, float Time);

		/**
		 * アタッチしているアニメーションの再生時間を取得する
		 */
		extern float MV1GetAttachAnimTime(int MHandle, int AttachIndex);

		/**
		 * アタッチしているアニメーションの総時間を得る
		 */
		extern float MV1GetAttachAnimTotalTime(int MHandle, int AttachIndex);

		/**
		 * アタッチしているアニメーションのブレンド率を設定する
		 */
		extern int MV1SetAttachAnimBlendRate(int MHandle, int AttachIndex, float Rate = 1.0f);

		/**
		 * アタッチしているアニメーションのブレンド率を取得する
		 */
		extern float MV1GetAttachAnimBlendRate(int MHandle, int AttachIndex);

		/**
		 * アタッチしているアニメーションのブレンド率を設定する( フレーム単位 )
		 */
		extern int MV1SetAttachAnimBlendRateToFrame(int MHandle, int AttachIndex, int FrameIndex, float Rate, int SetChild = dxlib_d.DxDataType.TRUE);

		/**
		 * アタッチしているアニメーションのブレンド率を設定する( フレーム単位 )
		 */
		extern float MV1GetAttachAnimBlendRateToFrame(int MHandle, int AttachIndex, int FrameIndex);

		/**
		 * アタッチしているアニメーションのアニメーションインデックスを取得する
		 */
		extern int MV1GetAttachAnim(int MHandle, int AttachIndex);

		/**
		 * アタッチしているアニメーションのシェイプを使用するかどうかを設定する
		 *
		 * Params:
		 *      MHandle = ?
		 *      AttachIndex = ?
		 *      UseFlag = TRUE:使用する( デフォルト )  FALSE:使用しない
		 */
		extern int MV1SetAttachAnimUseShapeFlag(int MHandle, int AttachIndex, int UseFlag);

		/**
		 * アタッチしているアニメーションのシェイプを使用するかどうかを取得する
		 */
		extern int MV1GetAttachAnimUseShapeFlag(int MHandle, int AttachIndex);

		/**
		 * アタッチしているアニメーションの指定のフレームの現在のローカル座標を取得する
		 */
		extern .VECTOR MV1GetAttachAnimFrameLocalPosition(int MHandle, int AttachIndex, int FrameIndex);

		/**
		 * アタッチしているアニメーションの指定のフレームの現在のローカル変換行列を取得する
		 */
		extern .MATRIX MV1GetAttachAnimFrameLocalMatrix(int MHandle, int AttachIndex, int FrameIndex);

		/**
		 * アニメーションの数を取得する
		 */
		extern int MV1GetAnimNum(int MHandle);

		/**
		 * 指定番号のアニメーション名を取得する
		 *
		 * Returns: null:エラー
		 */
		extern const (dxlib_d.DxDataType.TCHAR)* MV1GetAnimName(int MHandle, int AnimIndex);

		/**
		 * 指定番号のアニメーション名を変更する
		 */
		extern int MV1SetAnimName(int MHandle, int AnimIndex, const (dxlib_d.DxDataType.TCHAR)* AnimName);

		/**
		 * 指定番号のアニメーション名を変更する
		 */
		extern int MV1SetAnimNameWithStrLen(int MHandle, int AnimIndex, const (dxlib_d.DxDataType.TCHAR)* AnimName, size_t AnimNameLength);

		/**
		 * 指定名のアニメーション番号を取得する
		 *
		 * Returns: -1:エラー
		 */
		extern int MV1GetAnimIndex(int MHandle, const (dxlib_d.DxDataType.TCHAR)* AnimName);

		/**
		 * 指定名のアニメーション番号を取得する
		 *
		 * Returns: -1:エラー
		 */
		extern int MV1GetAnimIndexWithStrLen(int MHandle, const (dxlib_d.DxDataType.TCHAR)* AnimName, size_t AnimNameLength);

		/**
		 * 指定番号のアニメーションの総時間を得る
		 */
		extern float MV1GetAnimTotalTime(int MHandle, int AnimIndex);

		/**
		 * 指定のアニメーションがターゲットとするフレームの数を取得する
		 */
		extern int MV1GetAnimTargetFrameNum(int MHandle, int AnimIndex);

		/**
		 * 指定のアニメーションがターゲットとするフレームの名前を取得する
		 */
		extern const (dxlib_d.DxDataType.TCHAR)* MV1GetAnimTargetFrameName(int MHandle, int AnimIndex, int AnimFrameIndex);

		/**
		 * 指定のアニメーションがターゲットとするフレームの番号を取得する
		 */
		extern int MV1GetAnimTargetFrame(int MHandle, int AnimIndex, int AnimFrameIndex);

		/**
		 * 指定のアニメーションがターゲットとするフレーム用のアニメーションキーセットの数を取得する
		 */
		extern int MV1GetAnimTargetFrameKeySetNum(int MHandle, int AnimIndex, int AnimFrameIndex);

		/**
		 * 指定のアニメーションがターゲットとするフレーム用のアニメーションキーセットキーセットインデックスを取得する
		 */
		extern int MV1GetAnimTargetFrameKeySet(int MHandle, int AnimIndex, int AnimFrameIndex, int Index);

		/**
		 * モデルに含まれるアニメーションキーセットの総数を得る
		 */
		extern int MV1GetAnimKeySetNum(int MHandle);

		/**
		 * 指定のアニメーションキーセットのタイプを取得する( MV1_ANIMKEY_TYPE_QUATERNION 等 )
		 */
		extern int MV1GetAnimKeySetType(int MHandle, int AnimKeySetIndex);

		/**
		 * 指定のアニメーションキーセットのデータタイプを取得する( MV1_ANIMKEY_DATATYPE_ROTATE 等 )
		 */
		extern int MV1GetAnimKeySetDataType(int MHandle, int AnimKeySetIndex);

		/**
		 * 指定のアニメーションキーセットのキーの時間データタイプを取得する( MV1_ANIMKEY_TIME_TYPE_ONE 等 )
		 */
		extern int MV1GetAnimKeySetTimeType(int MHandle, int AnimKeySetIndex);

		/**
		 * 指定のアニメーションキーセットのキーの数を取得する
		 */
		extern int MV1GetAnimKeySetDataNum(int MHandle, int AnimKeySetIndex);

		/**
		 * 指定のアニメーションキーセットのキーの時間を取得する
		 */
		extern float MV1GetAnimKeyDataTime(int MHandle, int AnimKeySetIndex, int Index);

		/**
		 * 指定のアニメーションキーセットの指定の時間でのキーの番号を取得する
		 */
		extern int MV1GetAnimKeyDataIndexFromTime(int MHandle, int AnimKeySetIndex, float Time);

		/**
		 * 指定のアニメーションキーセットのキーを取得する、キータイプが MV1_ANIMKEY_TYPE_QUATERNION では無かった場合は失敗する
		 */
		extern .FLOAT4 MV1GetAnimKeyDataToQuaternion(int MHandle, int AnimKeySetIndex, int Index);

		/**
		 * 指定のアニメーションキーセットのキーを取得する、キータイプが MV1_ANIMKEY_TYPE_QUATERNION では無かった場合は失敗する( 時間指定版 )
		 */
		extern .FLOAT4 MV1GetAnimKeyDataToQuaternionFromTime(int MHandle, int AnimKeySetIndex, float Time);

		/**
		 * 指定のアニメーションキーセットのキーを取得する、キータイプが MV1_ANIMKEY_TYPE_VECTOR では無かった場合は失敗する
		 */
		extern .VECTOR MV1GetAnimKeyDataToVector(int MHandle, int AnimKeySetIndex, int Index);

		/**
		 * 指定のアニメーションキーセットのキーを取得する、キータイプが MV1_ANIMKEY_TYPE_VECTOR では無かった場合は失敗する( 時間指定版 )
		 */
		extern .VECTOR MV1GetAnimKeyDataToVectorFromTime(int MHandle, int AnimKeySetIndex, float Time);

		/**
		 * 指定のアニメーションキーセットのキーを取得する、キータイプが MV1_ANIMKEY_TYPE_MATRIX4X4C か MV1_ANIMKEY_TYPE_MATRIX3X3 では無かった場合は失敗する
		 */
		extern .MATRIX MV1GetAnimKeyDataToMatrix(int MHandle, int AnimKeySetIndex, int Index);

		/**
		 * 指定のアニメーションキーセットのキーを取得する、キータイプが MV1_ANIMKEY_TYPE_MATRIX4X4C か MV1_ANIMKEY_TYPE_MATRIX3X3 では無かった場合は失敗する( 時間指定版 )
		 */
		extern .MATRIX MV1GetAnimKeyDataToMatrixFromTime(int MHandle, int AnimKeySetIndex, float Time);

		/**
		 * 指定のアニメーションキーセットのキーを取得する、キータイプが MV1_ANIMKEY_TYPE_FLAT では無かった場合は失敗する
		 */
		extern float MV1GetAnimKeyDataToFlat(int MHandle, int AnimKeySetIndex, int Index);

		/**
		 * 指定のアニメーションキーセットのキーを取得する、キータイプが MV1_ANIMKEY_TYPE_FLAT では無かった場合は失敗する( 時間指定版 )
		 */
		extern float MV1GetAnimKeyDataToFlatFromTime(int MHandle, int AnimKeySetIndex, float Time);

		/**
		 * 指定のアニメーションキーセットのキーを取得する、キータイプが MV1_ANIMKEY_TYPE_LINEAR では無かった場合は失敗する
		 */
		extern float MV1GetAnimKeyDataToLinear(int MHandle, int AnimKeySetIndex, int Index);

		/**
		 * 指定のアニメーションキーセットのキーを取得する、キータイプが MV1_ANIMKEY_TYPE_LINEAR では無かった場合は失敗する( 時間指定版 )
		 */
		extern float MV1GetAnimKeyDataToLinearFromTime(int MHandle, int AnimKeySetIndex, float Time);

		// マテリアル関係

		/**
		 * モデルで使用しているマテリアルの数を取得する
		 */
		extern int MV1GetMaterialNum(int MHandle);

		/**
		 * 指定のマテリアルの名前を取得する
		 */
		extern const (dxlib_d.DxDataType.TCHAR)* MV1GetMaterialName(int MHandle, int MaterialIndex);

		/**
		 * 全てのマテリアルのタイプを変更する
		 *
		 * Params:
		 *      MHandle = ?
		 *      Type = DX_MATERIAL_TYPE_NORMAL など
		 */
		extern int MV1SetMaterialTypeAll(int MHandle, int Type);

		/**
		 * 指定のマテリアルのタイプを変更する
		 *
		 * Params:
		 *      MHandle = ?
		 *      MaterialIndex = ?
		 *      Type = DX_MATERIAL_TYPE_NORMAL
		 */
		extern int MV1SetMaterialType(int MHandle, int MaterialIndex, int Type);

		/**
		 * 指定のマテリアルのタイプを取得する
		 *
		 * Returns: DX_MATERIAL_TYPE_NORMAL など
		 */
		extern int MV1GetMaterialType(int MHandle, int MaterialIndex);

		/**
		 * 全てのマテリアルのタイプ別パラメータを変更する( マテリアルタイプ DX_MATERIAL_TYPE_MAT_SPEC_LUMINANCE_TWO_COLOR などで使用 )
		 */
		extern int MV1SetMaterialTypeParamAll(int MHandle, ...);

		/**
		 * 指定のマテリアルのタイプ別パラメータを変更する( マテリアルタイプ DX_MATERIAL_TYPE_MAT_SPEC_LUMINANCE_TWO_COLOR などで使用 )
		 */
		extern int MV1SetMaterialTypeParam(int MHandle, int MaterialIndex, ...);

		// int MV1SetMaterialTypeParam(int MHandle, int MaterialIndex, /* DX_MATERIAL_TYPE_MAT_SPEC_LUMINANCE_UNORM            の場合 */ float MinParam = 正規化の下限値( この値以下が 0.0f になる ), float MaxParam = 正規化の上限値( この値以上が 1.0f になる ));
		// int MV1SetMaterialTypeParam(int MHandle, int MaterialIndex, /* DX_MATERIAL_TYPE_MAT_SPEC_LUMINANCE_CLIP_UNORM       の場合 */ float MinParam = 正規化の下限値( この値以下が 0.0f になる ), float MaxParam = 正規化の上限値( この値以上が 1.0f になる ), float ClipParam = 閾値( この値未満が 0.0f になる ));
		// int MV1SetMaterialTypeParam(int MHandle, int MaterialIndex, /* DX_MATERIAL_TYPE_MAT_SPEC_LUMINANCE_CMP_GREATEREQUAL の場合 */ float CmpParam = 比較値( この値以上の場合は 1.0f が、未満の場合は 0.0f が書き込まれる ));
		// int MV1SetMaterialTypeParam(int MHandle, int MaterialIndex, /* DX_MATERIAL_TYPE_MAT_SPEC_POWER_UNORM                の場合 */ float MinParam = 正規化の下限値( この値以下が 0.0f になる ), float MaxParam = 正規化の上限値( この値以上が 1.0f になる ));
		// int MV1SetMaterialTypeParam(int MHandle, int MaterialIndex, /* DX_MATERIAL_TYPE_MAT_SPEC_POWER_CLIP_UNORM           の場合 */ float MinParam = 正規化の下限値( この値以下が 0.0f になる ), float MaxParam = 正規化の上限値( この値以上が 1.0f になる ), float ClipParam = 閾値( この値未満が 0.0f になる ));
		// int MV1SetMaterialTypeParam(int MHandle, int MaterialIndex, /* DX_MATERIAL_TYPE_MAT_SPEC_POWER_CMP_GREATEREQUAL     の場合 */ float CmpParam = 比較値( この値以上の場合は 1.0f が、未満の場合は 0.0f が書き込まれる ));

		/**
		 * 指定のマテリアルのディフューズカラーを設定する
		 */
		extern int MV1SetMaterialDifColor(int MHandle, int MaterialIndex, .COLOR_F Color);

		/**
		 * 指定のマテリアルのディフューズカラーを取得する
		 */
		extern .COLOR_F MV1GetMaterialDifColor(int MHandle, int MaterialIndex);

		/**
		 * 指定のマテリアルのスペキュラカラーを設定する
		 */
		extern int MV1SetMaterialSpcColor(int MHandle, int MaterialIndex, .COLOR_F Color);

		/**
		 * 指定のマテリアルのスペキュラカラーを取得する
		 */
		extern .COLOR_F MV1GetMaterialSpcColor(int MHandle, int MaterialIndex);

		/**
		 * 指定のマテリアルのエミッシブカラーを設定する
		 */
		extern int MV1SetMaterialEmiColor(int MHandle, int MaterialIndex, .COLOR_F Color);

		/**
		 * 指定のマテリアルのエミッシブカラーを取得する
		 */
		extern .COLOR_F MV1GetMaterialEmiColor(int MHandle, int MaterialIndex);

		/**
		 * 指定のマテリアルのアンビエントカラーを設定する
		 */
		extern int MV1SetMaterialAmbColor(int MHandle, int MaterialIndex, .COLOR_F Color);

		/**
		 * 指定のマテリアルのアンビエントカラーを取得する
		 */
		extern .COLOR_F MV1GetMaterialAmbColor(int MHandle, int MaterialIndex);

		/**
		 * 指定のマテリアルのスペキュラの強さを設定する
		 */
		extern int MV1SetMaterialSpcPower(int MHandle, int MaterialIndex, float Power);

		/**
		 * 指定のマテリアルのスペキュラの強さを取得する
		 */
		extern float MV1GetMaterialSpcPower(int MHandle, int MaterialIndex);

		/**
		 * 指定のマテリアルでディフューズマップとして使用するテクスチャを指定する
		 */
		extern int MV1SetMaterialDifMapTexture(int MHandle, int MaterialIndex, int TexIndex);

		/**
		 * 指定のマテリアルでディフューズマップとして使用されているテクスチャのインデックスを取得する
		 */
		extern int MV1GetMaterialDifMapTexture(int MHandle, int MaterialIndex);

		/**
		 * 指定のマテリアルでサブディフューズマップとして使用するテクスチャを指定する
		 */
		extern int MV1SetMaterialSubDifMapTexture(int MHandle, int MaterialIndex, int TexIndex);

		/**
		 * 指定のマテリアルでサブディフューズマップとして使用されているテクスチャのインデックスを取得する
		 */
		extern int MV1GetMaterialSubDifMapTexture(int MHandle, int MaterialIndex);

		/**
		 * 指定のマテリアルでスペキュラマップとして使用するテクスチャを指定する
		 */
		extern int MV1SetMaterialSpcMapTexture(int MHandle, int MaterialIndex, int TexIndex);

		/**
		 * 指定のマテリアルでスペキュラマップとして使用されているテクスチャのインデックスを取得する
		 */
		extern int MV1GetMaterialSpcMapTexture(int MHandle, int MaterialIndex);

		/**
		 * 指定のマテリアルで法線マップとして使用されているテクスチャのインデックスを取得する
		 */
		extern int MV1GetMaterialNormalMapTexture(int MHandle, int MaterialIndex);

		/**
		 * 指定のマテリアルでトゥーンレンダリングのディフューズグラデーションマップとして使用するテクスチャを設定する
		 */
		extern int MV1SetMaterialDifGradTexture(int MHandle, int MaterialIndex, int TexIndex);

		/**
		 * 指定のマテリアルでトゥーンレンダリングのディフューズグラデーションマップとして使用するテクスチャを取得する
		 */
		extern int MV1GetMaterialDifGradTexture(int MHandle, int MaterialIndex);

		/**
		 * 指定のマテリアルでトゥーンレンダリングのスペキュラグラデーションマップとして使用するテクスチャを設定する
		 */
		extern int MV1SetMaterialSpcGradTexture(int MHandle, int MaterialIndex, int TexIndex);

		/**
		 * 指定のマテリアルでトゥーンレンダリングのスペキュラグラデーションマップとして使用するテクスチャを取得する
		 */
		extern int MV1GetMaterialSpcGradTexture(int MHandle, int MaterialIndex);

		/**
		 * 指定のマテリアルでトゥーンレンダリングのスフィアマップとして使用するテクスチャを設定する
		 */
		extern int MV1SetMaterialSphereMapTexture(int MHandle, int MaterialIndex, int TexIndex);

		/**
		 * 指定のマテリアルでトゥーンレンダリングのスフィアマップとして使用するテクスチャを取得する
		 */
		extern int MV1GetMaterialSphereMapTexture(int MHandle, int MaterialIndex);

		/**
		 * 全てのマテリアルのトゥーンレンダリングで使用するディフューズグラデーションマップとディフューズカラーの合成方法を設定する( DX_MATERIAL_BLENDTYPE_ADDITIVE など )
		 */
		extern int MV1SetMaterialDifGradBlendTypeAll(int MHandle, int BlendType);

		/**
		 * 指定のマテリアルのトゥーンレンダリングで使用するディフューズグラデーションマップとディフューズカラーの合成方法を設定する( DX_MATERIAL_BLENDTYPE_ADDITIVE など )
		 */
		extern int MV1SetMaterialDifGradBlendType(int MHandle, int MaterialIndex, int BlendType);

		/**
		 * 指定のマテリアルのトゥーンレンダリングで使用するディフューズグラデーションマップとディフューズカラーの合成方法を取得する( DX_MATERIAL_BLENDTYPE_ADDITIVE など )
		 */
		extern int MV1GetMaterialDifGradBlendType(int MHandle, int MaterialIndex);

		/**
		 * 全てのマテリアルのトゥーンレンダリングで使用するスペキュラグラデーションマップとスペキュラカラーの合成方法を設定する( DX_MATERIAL_BLENDTYPE_ADDITIVE など )
		 */
		extern int MV1SetMaterialSpcGradBlendTypeAll(int MHandle, int BlendType);

		/**
		 * 指定のマテリアルのトゥーンレンダリングで使用するスペキュラグラデーションマップとスペキュラカラーの合成方法を設定する( DX_MATERIAL_BLENDTYPE_ADDITIVE など )
		 */
		extern int MV1SetMaterialSpcGradBlendType(int MHandle, int MaterialIndex, int BlendType);

		/**
		 * 指定のマテリアルのトゥーンレンダリングで使用するスペキュラグラデーションマップとスペキュラカラーの合成方法を取得する( DX_MATERIAL_BLENDTYPE_ADDITIVE など )
		 */
		extern int MV1GetMaterialSpcGradBlendType(int MHandle, int MaterialIndex);

		/**
		 * 全てのマテリアルのトゥーンレンダリングで使用するスフィアマップの合成方法を設定する( DX_MATERIAL_BLENDTYPE_ADDITIVE など )
		 */
		extern int MV1SetMaterialSphereMapBlendTypeAll(int MHandle, int BlendType);

		/**
		 * 指定のマテリアルのトゥーンレンダリングで使用するスフィアマップの合成方法を設定する( DX_MATERIAL_BLENDTYPE_ADDITIVE など )
		 */
		extern int MV1SetMaterialSphereMapBlendType(int MHandle, int MaterialIndex, int BlendType);

		/**
		 * 指定のマテリアルのトゥーンレンダリングで使用するスフィアマップの合成方法を取得する( DX_MATERIAL_BLENDTYPE_ADDITIVE など )
		 */
		extern int MV1GetMaterialSphereMapBlendType(int MHandle, int MaterialIndex);

		/**
		 * 全てのマテリアルのトゥーンレンダリングで使用する輪郭線の太さを設定する
		 */
		extern int MV1SetMaterialOutLineWidthAll(int MHandle, float Width);

		/**
		 * 指定のマテリアルのトゥーンレンダリングで使用する輪郭線の太さを設定する
		 */
		extern int MV1SetMaterialOutLineWidth(int MHandle, int MaterialIndex, float Width);

		/**
		 * 指定のマテリアルのトゥーンレンダリングで使用する輪郭線の太さを取得する
		 */
		extern float MV1GetMaterialOutLineWidth(int MHandle, int MaterialIndex);

		/**
		 * 全てのマテリアルのトゥーンレンダリングで使用する輪郭線のドット単位の太さを設定する
		 */
		extern int MV1SetMaterialOutLineDotWidthAll(int MHandle, float Width);

		/**
		 * 指定のマテリアルのトゥーンレンダリングで使用する輪郭線のドット単位の太さを設定する
		 */
		extern int MV1SetMaterialOutLineDotWidth(int MHandle, int MaterialIndex, float Width);

		/**
		 * 指定のマテリアルのトゥーンレンダリングで使用する輪郭線のドット単位の太さを取得する
		 */
		extern float MV1GetMaterialOutLineDotWidth(int MHandle, int MaterialIndex);

		/**
		 * 全てのマテリアルのトゥーンレンダリングで使用する輪郭線の色を設定する
		 */
		extern int MV1SetMaterialOutLineColorAll(int MHandle, .COLOR_F Color);

		/**
		 * 指定のマテリアルのトゥーンレンダリングで使用する輪郭線の色を設定する
		 */
		extern int MV1SetMaterialOutLineColor(int MHandle, int MaterialIndex, .COLOR_F Color);

		/**
		 * 指定のマテリアルのトゥーンレンダリングで使用する輪郭線の色を取得する
		 */
		extern .COLOR_F MV1GetMaterialOutLineColor(int MHandle, int MaterialIndex);

		/**
		 * 全てのマテリアルの描画ブレンドモードを設定する( DX_BLENDMODE_ALPHA 等 )
		 */
		extern int MV1SetMaterialDrawBlendModeAll(int MHandle, int BlendMode);

		/**
		 * 指定のマテリアルの描画ブレンドモードを設定する( DX_BLENDMODE_ALPHA 等 )
		 */
		extern int MV1SetMaterialDrawBlendMode(int MHandle, int MaterialIndex, int BlendMode);

		/**
		 * 指定のマテリアルの描画ブレンドモードを取得する( DX_BLENDMODE_ALPHA 等 )
		 */
		extern int MV1GetMaterialDrawBlendMode(int MHandle, int MaterialIndex);

		/**
		 * 全てのマテリアルの描画ブレンドパラメータを設定する
		 */
		extern int MV1SetMaterialDrawBlendParamAll(int MHandle, int BlendParam);

		/**
		 * 指定のマテリアルの描画ブレンドパラメータを設定する
		 */
		extern int MV1SetMaterialDrawBlendParam(int MHandle, int MaterialIndex, int BlendParam);

		/**
		 * 指定のマテリアルの描画ブレンドパラメータを設定する
		 */
		extern int MV1GetMaterialDrawBlendParam(int MHandle, int MaterialIndex);

		/**
		 * 全てのマテリアルの描画時のアルファテストの設定を行う
		 *
		 * Params:
		 *      MHandle = ?
		 *      Enable = αテストを行うかどうか( TRUE:行う  FALSE:行わない( デフォルト ) )
		 *      Mode = テストモード( DX_CMP_GREATER等 )
		 *      Param = 描画アルファ値との比較に使用する値( 0〜255 )
		 */
		extern int MV1SetMaterialDrawAlphaTestAll(int MHandle, int Enable, int Mode, int Param);

		/**
		 * 指定のマテリアルの描画時のアルファテストの設定を行う
		 *
		 * Params:
		 *      MHandle = ?
		 *      MaterialIndex = ?
		 *      Enable = αテストを行うかどうか( TRUE:行う  FALSE:行わない( デフォルト ) )
		 *      Mode = テストモード( DX_CMP_GREATER等 )
		 *      Param = 描画アルファ値との比較に使用する値( 0〜255 )
		 */
		extern int MV1SetMaterialDrawAlphaTest(int MHandle, int MaterialIndex, int Enable, int Mode, int Param);

		/**
		 * 指定のマテリアルの描画時のアルファテストを行うかどうかを取得する
		 *
		 * Returns: TRUE:アルファテストを行う  FALSE:アルファテストを行わない
		 */
		extern int MV1GetMaterialDrawAlphaTestEnable(int MHandle, int MaterialIndex);

		/**
		 * 指定のマテリアルの描画時のアルファテストのテストモードを取得する
		 *
		 * Returns: テストモード( DX_CMP_GREATER等 )
		 */
		extern int MV1GetMaterialDrawAlphaTestMode(int MHandle, int MaterialIndex);

		/**
		 * 指定のマテリアルの描画時のアルファテストの描画アルファ地との比較に使用する値( 0〜255 )を取得する
		 */
		extern int MV1GetMaterialDrawAlphaTestParam(int MHandle, int MaterialIndex);

		// テクスチャ関係

		/**
		 * テクスチャの数を取得
		 */
		extern int MV1GetTextureNum(int MHandle);

		/**
		 * テクスチャの名前を取得
		 */
		extern const (dxlib_d.DxDataType.TCHAR)* MV1GetTextureName(int MHandle, int TexIndex);

		/**
		 * カラーテクスチャのファイルパスを変更する
		 */
		extern int MV1SetTextureColorFilePath(int MHandle, int TexIndex, const (dxlib_d.DxDataType.TCHAR)* FilePath);

		/**
		 * カラーテクスチャのファイルパスを変更する
		 */
		extern int MV1SetTextureColorFilePathWithStrLen(int MHandle, int TexIndex, const (dxlib_d.DxDataType.TCHAR)* FilePath, size_t FilePathLength);

		/**
		 * カラーテクスチャのファイルパスを取得
		 */
		extern const (dxlib_d.DxDataType.TCHAR)* MV1GetTextureColorFilePath(int MHandle, int TexIndex);

		/**
		 * アルファテクスチャのファイルパスを変更する
		 */
		extern int MV1SetTextureAlphaFilePath(int MHandle, int TexIndex, const (dxlib_d.DxDataType.TCHAR)* FilePath);

		/**
		 * アルファテクスチャのファイルパスを変更する
		 */
		extern int MV1SetTextureAlphaFilePathWithStrLen(int MHandle, int TexIndex, const (dxlib_d.DxDataType.TCHAR)* FilePath, size_t FilePathLength);

		/**
		 * アルファテクスチャのファイルパスを取得
		 */
		extern const (dxlib_d.DxDataType.TCHAR)* MV1GetTextureAlphaFilePath(int MHandle, int TexIndex);

		/**
		 * テクスチャで使用するグラフィックハンドルを変更する( GrHandle を -1 にすると解除 )
		 */
		extern int MV1SetTextureGraphHandle(int MHandle, int TexIndex, int GrHandle, int SemiTransFlag);

		/**
		 * テクスチャのグラフィックハンドルを取得する
		 */
		extern int MV1GetTextureGraphHandle(int MHandle, int TexIndex);

		/**
		 * テクスチャのアドレスモードを設定する( AddUMode の値は DX_TEXADDRESS_WRAP 等 )
		 */
		extern int MV1SetTextureAddressMode(int MHandle, int TexIndex, int AddrUMode, int AddrVMode);

		/**
		 * テクスチャのU値のアドレスモードを取得する
		 *
		 * Returns: DX_TEXADDRESS_WRAP 等
		 */
		extern int MV1GetTextureAddressModeU(int MHandle, int TexIndex);

		/**
		 * テクスチャのV値のアドレスモードを取得する
		 *
		 * Returns: DX_TEXADDRESS_WRAP 等
		 */
		extern int MV1GetTextureAddressModeV(int MHandle, int TexIndex);

		/**
		 * テクスチャの幅を取得する
		 */
		extern int MV1GetTextureWidth(int MHandle, int TexIndex);

		/**
		 * テクスチャの高さを取得する
		 */
		extern int MV1GetTextureHeight(int MHandle, int TexIndex);

		/**
		 * テクスチャに半透明要素があるかどうかを取得する
		 *
		 * Returns: TRUE:ある  FALSE:ない
		 */
		extern int MV1GetTextureSemiTransState(int MHandle, int TexIndex);

		/**
		 * テクスチャで使用している画像がバンプマップかどうかを設定する
		 */
		extern int MV1SetTextureBumpImageFlag(int MHandle, int TexIndex, int Flag);

		/**
		 * テクスチャがバンプマップかどうかを取得する
		 *
		 * Returns: TRUE:バンプマップ  FALSE:違う
		 */
		extern int MV1GetTextureBumpImageFlag(int MHandle, int TexIndex);

		/**
		 * バンプマップ画像の場合の隣のピクセルとの距離を設定する
		 */
		extern int MV1SetTextureBumpImageNextPixelLength(int MHandle, int TexIndex, float Length);

		/**
		 * バンプマップ画像の場合の隣のピクセルとの距離を取得する
		 */
		extern float MV1GetTextureBumpImageNextPixelLength(int MHandle, int TexIndex);

		/**
		 * テクスチャのフィルタリングモードを設定する
		 */
		extern int MV1SetTextureSampleFilterMode(int MHandle, int TexIndex, int FilterMode);

		/**
		 * テクスチャのフィルタリングモードを取得する
		 *
		 * Returns: DX_DRAWMODE_BILINEAR等
		 */
		extern int MV1GetTextureSampleFilterMode(int MHandle, int TexIndex);

		/**
		 * 3Dモデルに貼り付けるのに向いた画像の読み込み方式で画像を読み込む
		 *
		 * Returns: -1:エラー  0以上:グラフィックハンドル
		 */
		extern int MV1LoadTexture(const (dxlib_d.DxDataType.TCHAR)* FilePath);

		/**
		 * 3Dモデルに貼り付けるのに向いた画像の読み込み方式で画像を読み込む
		 *
		 * Returns: -1:エラー  0以上:グラフィックハンドル
		 */
		extern int MV1LoadTextureWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FilePath, size_t FilePathLength);

		// フレーム関係

		/**
		 * フレームの数を取得する
		 */
		extern int MV1GetFrameNum(int MHandle);

		/**
		 * フレームの名前からモデル中のフレームのフレームインデックスを取得する
		 *
		 * Returns: 無かった場合は-1
		 */
		extern int MV1SearchFrame(int MHandle, const (dxlib_d.DxDataType.TCHAR)* FrameName);

		/**
		 * フレームの名前からモデル中のフレームのフレームインデックスを取得する
		 *
		 * Returns: 無かった場合は-1
		 */
		extern int MV1SearchFrameWithStrLen(int MHandle, const (dxlib_d.DxDataType.TCHAR)* FrameName, size_t FrameNameLength);

		/**
		 * フレームの名前から指定のフレームの子フレームのフレームインデックスを取得する( 名前指定版 )( FrameIndex を -1 にすると親を持たないフレームを ChildIndex で指定する )
		 *
		 * Returns: 無かった場合は-1
		 */
		extern int MV1SearchFrameChild(int MHandle, int FrameIndex = -1, const (dxlib_d.DxDataType.TCHAR)* ChildName = null);

		/**
		 * フレームの名前から指定のフレームの子フレームのフレームインデックスを取得する( 名前指定版 )( FrameIndex を -1 にすると親を持たないフレームを ChildIndex で指定する )
		 *
		 * Returns: 無かった場合は-1
		 */
		extern int MV1SearchFrameChildWithStrLen(int MHandle, int FrameIndex = -1, const (dxlib_d.DxDataType.TCHAR)* ChildName = null, size_t ChildNameLength = 0);

		/**
		 * 指定のフレームの名前を取得する
		 *
		 * Returns: エラーの場合はNULL
		 */
		extern const (dxlib_d.DxDataType.TCHAR)* MV1GetFrameName(int MHandle, int FrameIndex);

		/**
		 * 指定のフレームの名前を取得する
		 *
		 * Returns: -1:エラー  -1以外:文字列のサイズ
		 */
		extern int MV1GetFrameName2(int MHandle, int FrameIndex, dxlib_d.DxDataType.TCHAR* StrBuffer);

		/**
		 * 指定のフレームの親フレームのインデックスを得る
		 *
		 * Returns: 親がいない場合は -2
		 */
		extern int MV1GetFrameParent(int MHandle, int FrameIndex);

		/**
		 * 指定のフレームの子フレームの数を取得する( FrameIndex を -1 にすると親を持たないフレームの数が返ってくる )
		 */
		extern int MV1GetFrameChildNum(int MHandle, int FrameIndex = -1);

		/**
		 * 指定のフレームの子フレームのフレームインデックスを取得する( 番号指定版 )( FrameIndex を -1 にすると親を持たないフレームを ChildIndex で指定する )
		 *
		 * Returns: エラーの場合は-1
		 */
		extern int MV1GetFrameChild(int MHandle, int FrameIndex = -1, int ChildIndex = 0);

		/**
		 * 指定のフレームの座標を取得する
		 */
		extern .VECTOR MV1GetFramePosition(int MHandle, int FrameIndex);

		/**
		 * 指定のフレームの座標を取得する
		 */
		extern .VECTOR_D MV1GetFramePositionD(int MHandle, int FrameIndex);

		/**
		 * 指定のフレームの初期状態での座標変換行列を取得する
		 */
		extern .MATRIX MV1GetFrameBaseLocalMatrix(int MHandle, int FrameIndex);

		/**
		 * 指定のフレームの初期状態での座標変換行列を取得する
		 */
		extern .MATRIX_D MV1GetFrameBaseLocalMatrixD(int MHandle, int FrameIndex);

		/**
		 * 指定のフレームの座標変換行列を取得する
		 */
		extern .MATRIX MV1GetFrameLocalMatrix(int MHandle, int FrameIndex);

		/**
		 * 指定のフレームの座標変換行列を取得する
		 */
		extern .MATRIX_D MV1GetFrameLocalMatrixD(int MHandle, int FrameIndex);

		/**
		 * 指定のフレームのローカル座標からワールド座標に変換する行列を得る
		 */
		extern .MATRIX MV1GetFrameLocalWorldMatrix(int MHandle, int FrameIndex);

		/**
		 * 指定のフレームのローカル座標からワールド座標に変換する行列を得る
		 */
		extern .MATRIX_D MV1GetFrameLocalWorldMatrixD(int MHandle, int FrameIndex);

		/**
		 * 指定のフレームの座標変換行列( ローカル行列 )を設定する
		 */
		extern int MV1SetFrameUserLocalMatrix(int MHandle, int FrameIndex, .MATRIX Matrix);

		/**
		 * 指定のフレームの座標変換行列( ローカル行列 )を設定する
		 */
		extern int MV1SetFrameUserLocalMatrixD(int MHandle, int FrameIndex, .MATRIX_D Matrix);

		/**
		 * 指定のフレームの座標変換行列( ローカル行列 )をデフォルトに戻す
		 */
		extern int MV1ResetFrameUserLocalMatrix(int MHandle, int FrameIndex);

		/**
		 * 指定のフレームの座標変換行列( ローカル座標からワールド座標に変換する行列 )を設定する
		 */
		extern int MV1SetFrameUserLocalWorldMatrix(int MHandle, int FrameIndex, .MATRIX Matrix);

		/**
		 * 指定のフレームの座標変換行列( ローカル座標からワールド座標に変換する行列 )を設定する
		 */
		extern int MV1SetFrameUserLocalWorldMatrixD(int MHandle, int FrameIndex, .MATRIX_D Matrix);

		/**
		 * 指定のフレームの座標変換行列( ローカル座標からワールド座標に変換する行列 )をデフォルトに戻す
		 */
		extern int MV1ResetFrameUserLocalWorldMatrix(int MHandle, int FrameIndex);

		/**
		 * 指定のフレームが持つメッシュ頂点のローカル座標での最大値を得る
		 */
		extern .VECTOR MV1GetFrameMaxVertexLocalPosition(int MHandle, int FrameIndex);

		/**
		 * 指定のフレームが持つメッシュ頂点のローカル座標での最大値を得る
		 */
		extern .VECTOR_D MV1GetFrameMaxVertexLocalPositionD(int MHandle, int FrameIndex);

		/**
		 * 指定のフレームが持つメッシュ頂点のローカル座標での最小値を得る
		 */
		extern .VECTOR MV1GetFrameMinVertexLocalPosition(int MHandle, int FrameIndex);

		/**
		 * 指定のフレームが持つメッシュ頂点のローカル座標での最小値を得る
		 */
		extern .VECTOR_D MV1GetFrameMinVertexLocalPositionD(int MHandle, int FrameIndex);

		/**
		 * 指定のフレームが持つメッシュ頂点のローカル座標での平均値を得る
		 */
		extern .VECTOR MV1GetFrameAvgVertexLocalPosition(int MHandle, int FrameIndex);

		/**
		 * 指定のフレームが持つメッシュ頂点のローカル座標での平均値を得る
		 */
		extern .VECTOR_D MV1GetFrameAvgVertexLocalPositionD(int MHandle, int FrameIndex);

		/**
		 * 指定のフレームに含まれる頂点の数を取得する
		 */
		extern int MV1GetFrameVertexNum(int MHandle, int FrameIndex);

		/**
		 * 指定のフレームに含まれるポリゴンの数を取得する
		 */
		extern int MV1GetFrameTriangleNum(int MHandle, int FrameIndex);

		/**
		 * 指定のフレームが持つメッシュの数を取得する
		 */
		extern int MV1GetFrameMeshNum(int MHandle, int FrameIndex);

		/**
		 * 指定のフレームが持つメッシュのメッシュインデックスを取得する
		 */
		extern int MV1GetFrameMesh(int MHandle, int FrameIndex, int Index);

		/**
		 * 指定のフレームの表示、非表示状態を変更する
		 *
		 * Params:
		 *      MHandle = ?
		 *      FrameIndex = ?
		 *      VisibleFlag = TRUE:表示  FALSE:非表示
		 */
		extern int MV1SetFrameVisible(int MHandle, int FrameIndex, int VisibleFlag);

		/**
		 * 指定のフレームの表示、非表示状態を取得する
		 *
		 * Returns: TRUE:表示  FALSE:非表示
		 */
		extern int MV1GetFrameVisible(int MHandle, int FrameIndex);

		/**
		 * 指定のフレームのディフューズカラーのスケール値を設定する( デフォルト値は 1.0f )
		 */
		extern int MV1SetFrameDifColorScale(int MHandle, int FrameIndex, .COLOR_F Scale);

		/**
		 * 指定のフレームのスペキュラカラーのスケール値を設定する( デフォルト値は 1.0f )
		 */
		extern int MV1SetFrameSpcColorScale(int MHandle, int FrameIndex, .COLOR_F Scale);

		/**
		 * 指定のフレームのエミッシブカラーのスケール値を設定する( デフォルト値は 1.0f )
		 */
		extern int MV1SetFrameEmiColorScale(int MHandle, int FrameIndex, .COLOR_F Scale);

		/**
		 * 指定のフレームのアンビエントカラーのスケール値を設定する( デフォルト値は 1.0f )
		 */
		extern int MV1SetFrameAmbColorScale(int MHandle, int FrameIndex, .COLOR_F Scale);

		/**
		 * 指定のフレームのディフューズカラーのスケール値を取得する( デフォルト値は 1.0f )
		 */
		extern .COLOR_F MV1GetFrameDifColorScale(int MHandle, int FrameIndex);

		/**
		 * 指定のフレームのスペキュラカラーのスケール値を取得する( デフォルト値は 1.0f )
		 */
		extern .COLOR_F MV1GetFrameSpcColorScale(int MHandle, int FrameIndex);

		/**
		 * 指定のフレームのエミッシブカラーのスケール値を取得する( デフォルト値は 1.0f )
		 */
		extern .COLOR_F MV1GetFrameEmiColorScale(int MHandle, int FrameIndex);

		/**
		 * 指定のフレームのアンビエントカラーのスケール値を取得する( デフォルト値は 1.0f )
		 */
		extern .COLOR_F MV1GetFrameAmbColorScale(int MHandle, int FrameIndex);

		/**
		 * 指定のフレームに半透明要素があるかどうかを取得する
		 *
		 * Returns: TRUE:ある  FALSE:ない
		 */
		extern int MV1GetFrameSemiTransState(int MHandle, int FrameIndex);

		/**
		 * 指定のフレームの不透明度を設定する( 不透明 1.0f 〜 透明 0.0f )
		 */
		extern int MV1SetFrameOpacityRate(int MHandle, int FrameIndex, float Rate);

		/**
		 * 指定のフレームの不透明度を取得する( 不透明 1.0f 〜 透明 0.0f )
		 */
		extern float MV1GetFrameOpacityRate(int MHandle, int FrameIndex);

		/**
		 * 指定のフレームの初期表示状態を設定する
		 *
		 * Params:
		 *      MHandle = ?
		 *      FrameIndex = ?
		 *      VisibleFlag = TRUE:表示  FALSE:非表示
		 */
		extern int MV1SetFrameBaseVisible(int MHandle, int FrameIndex, int VisibleFlag);

		/**
		 * 指定のフレームの初期表示状態を取得する
		 *
		 * Returns: TRUE:表示  FALSE:非表示
		 */
		extern int MV1GetFrameBaseVisible(int MHandle, int FrameIndex);

		/**
		 * 指定のフレームのテクスチャ座標変換パラメータを設定する
		 */
		extern int MV1SetFrameTextureAddressTransform(int MHandle, int FrameIndex, float TransU, float TransV, float ScaleU, float ScaleV, float RotCenterU, float RotCenterV, float Rotate);

		/**
		 * 指定のフレームのテクスチャ座標変換行列をセットする
		 */
		extern int MV1SetFrameTextureAddressTransformMatrix(int MHandle, int FrameIndex, .MATRIX Matrix);

		/**
		 * 指定のフレームのテクスチャ座標変換パラメータをリセットする
		 */
		extern int MV1ResetFrameTextureAddressTransform(int MHandle, int FrameIndex);

		// メッシュ関係

		/**
		 * モデルに含まれるメッシュの数を取得する
		 */
		extern int MV1GetMeshNum(int MHandle);

		/**
		 * 指定メッシュが使用しているマテリアルのインデックスを取得する
		 */
		extern int MV1GetMeshMaterial(int MHandle, int MeshIndex);

		/**
		 * 指定メッシュに含まれる頂点の数を取得する
		 */
		extern int MV1GetMeshVertexNum(int MHandle, int MeshIndex);

		/**
		 * 指定メッシュに含まれる三角形ポリゴンの数を取得する
		 */
		extern int MV1GetMeshTriangleNum(int MHandle, int MeshIndex);

		/**
		 * 指定メッシュの表示、非表示状態を変更する
		 *
		 * Params:
		 *      MHandle = ?
		 *      MeshIndex = ?
		 *      VisibleFlag = TRUE:表示  FALSE:非表示
		 */
		extern int MV1SetMeshVisible(int MHandle, int MeshIndex, int VisibleFlag);

		/**
		 * 指定メッシュの表示、非表示状態を取得する
		 *
		 * Returns: TRUE:表示  FALSE:非表示
		 */
		extern int MV1GetMeshVisible(int MHandle, int MeshIndex);

		/**
		 * 指定のメッシュのディフューズカラーのスケール値を設定する( デフォルト値は 1.0f )
		 */
		extern int MV1SetMeshDifColorScale(int MHandle, int MeshIndex, .COLOR_F Scale);

		/**
		 * 指定のメッシュのスペキュラカラーのスケール値を設定する( デフォルト値は 1.0f )
		 */
		extern int MV1SetMeshSpcColorScale(int MHandle, int MeshIndex, .COLOR_F Scale);

		/**
		 * 指定のメッシュのエミッシブカラーのスケール値を設定する( デフォルト値は 1.0f )
		 */
		extern int MV1SetMeshEmiColorScale(int MHandle, int MeshIndex, .COLOR_F Scale);

		/**
		 * 指定のメッシュのアンビエントカラーのスケール値を設定する( デフォルト値は 1.0f )
		 */
		extern int MV1SetMeshAmbColorScale(int MHandle, int MeshIndex, .COLOR_F Scale);

		/**
		 * 指定のメッシュのディフューズカラーのスケール値を取得する( デフォルト値は 1.0f )
		 */
		extern .COLOR_F MV1GetMeshDifColorScale(int MHandle, int MeshIndex);

		/**
		 * 指定のメッシュのスペキュラカラーのスケール値を取得する( デフォルト値は 1.0f )
		 */
		extern .COLOR_F MV1GetMeshSpcColorScale(int MHandle, int MeshIndex);

		/**
		 * 指定のメッシュのエミッシブカラーのスケール値を取得する( デフォルト値は 1.0f )
		 */
		extern .COLOR_F MV1GetMeshEmiColorScale(int MHandle, int MeshIndex);

		/**
		 * 指定のメッシュのアンビエントカラーのスケール値を取得する( デフォルト値は 1.0f )
		 */
		extern .COLOR_F MV1GetMeshAmbColorScale(int MHandle, int MeshIndex);

		/**
		 * 指定のメッシュの不透明度を設定する( 不透明 1.0f 〜 透明 0.0f )
		 */
		extern int MV1SetMeshOpacityRate(int MHandle, int MeshIndex, float Rate);

		/**
		 * 指定のメッシュの不透明度を取得する( 不透明 1.0f 〜 透明 0.0f )
		 */
		extern float MV1GetMeshOpacityRate(int MHandle, int MeshIndex);

		/**
		 * 指定のメッシュの描画ブレンドモードを設定する( DX_BLENDMODE_ALPHA 等 )
		 */
		extern int MV1SetMeshDrawBlendMode(int MHandle, int MeshIndex, int BlendMode);

		/**
		 * 指定のメッシュの描画ブレンドパラメータを設定する
		 */
		extern int MV1SetMeshDrawBlendParam(int MHandle, int MeshIndex, int BlendParam);

		/**
		 * 指定のメッシュの描画ブレンドモードを取得する( DX_BLENDMODE_ALPHA 等 )
		 */
		extern int MV1GetMeshDrawBlendMode(int MHandle, int MeshIndex);

		/**
		 * 指定のメッシュの描画ブレンドパラメータを設定する
		 */
		extern int MV1GetMeshDrawBlendParam(int MHandle, int MeshIndex);

		/**
		 * 指定のメッシュの初期表示状態を設定する
		 *
		 * Params:
		 *      MHandle = ?
		 *      MeshIndex = ?
		 *      VisibleFlag = TRUE:表示  FALSE:非表示
		 */
		extern int MV1SetMeshBaseVisible(int MHandle, int MeshIndex, int VisibleFlag);

		/**
		 * 指定のメッシュの初期表示状態を取得する
		 *
		 * Returns: TRUE:表示  FALSE:非表示
		 */
		extern int MV1GetMeshBaseVisible(int MHandle, int MeshIndex);

		/**
		 * 指定のメッシュのバックカリングを行うかどうかを設定する( DX_CULLING_LEFT 等 )
		 */
		extern int MV1SetMeshBackCulling(int MHandle, int MeshIndex, int CullingFlag);

		/**
		 * 指定のメッシュのバックカリングを行うかどうかを取得する( DX_CULLING_LEFT 等 )
		 */
		extern int MV1GetMeshBackCulling(int MHandle, int MeshIndex);

		/**
		 * 指定のメッシュに含まれるポリゴンの最大ローカル座標を取得する
		 */
		extern .VECTOR MV1GetMeshMaxPosition(int MHandle, int MeshIndex);

		/**
		 * 指定のメッシュに含まれるポリゴンの最小ローカル座標を取得する
		 */
		extern .VECTOR MV1GetMeshMinPosition(int MHandle, int MeshIndex);

		/**
		 * 指定のメッシュに含まれるトライアングルリストの数を取得する
		 */
		extern int MV1GetMeshTListNum(int MHandle, int MeshIndex);

		/**
		 * 指定のメッシュに含まれるトライアングルリストのインデックスを取得する
		 */
		extern int MV1GetMeshTList(int MHandle, int MeshIndex, int Index);

		/**
		 * 指定のメッシュに半透明要素があるかどうかを取得する
		 *
		 * Returns: TRUE:ある  FALSE:ない
		 */
		extern int MV1GetMeshSemiTransState(int MHandle, int MeshIndex);

		/**
		 * 指定のメッシュの頂点ディフューズカラーをマテリアルのディフューズカラーの代わりに使用するかどうかを設定する
		 *
		 * Params:
		 *      MHandle = ?
		 *      MeshIndex = ?
		 *      UseFlag = TRUE:マテリアルカラーの代わりに使用する  FALSE:マテリアルカラーを使用する
		 */
		extern int MV1SetMeshUseVertDifColor(int MHandle, int MeshIndex, int UseFlag);

		/**
		 * 指定のメッシュの頂点スペキュラカラーをマテリアルのスペキュラカラーの代わりに使用するかどうかを設定する
		 *
		 * Params:
		 *      MHandle = ?
		 *      MeshIndex = ?
		 *      UseFlag = TRUE:マテリアルカラーの代わりに使用する  FALSE:マテリアルカラーを使用する
		 */
		extern int MV1SetMeshUseVertSpcColor(int MHandle, int MeshIndex, int UseFlag);

		/**
		 * 指定のメッシュの頂点ディフューズカラーをマテリアルのディフューズカラーの代わりに使用するかどうかの設定を取得する
		 *
		 * Returns: TRUE:マテリアルカラーの代わりに使用する  FALSE:マテリアルカラーを使用する
		 */
		extern int MV1GetMeshUseVertDifColor(int MHandle, int MeshIndex);

		/**
		 * 指定のメッシュの頂点スペキュラカラーをマテリアルのスペキュラカラーの代わりに使用するかどうかの設定を取得する
		 *
		 * Returns: TRUE:マテリアルカラーの代わりに使用する  FALSE:マテリアルカラーを使用する
		 */
		extern int MV1GetMeshUseVertSpcColor(int MHandle, int MeshIndex);

		/**
		 * 指定のメッシュがシェイプメッシュかどうかを取得する
		 *
		 * Returns: TRUE:シェイプメッシュ  FALSE:通常メッシュ
		 */
		extern int MV1GetMeshShapeFlag(int MHandle, int MeshIndex);

		// シェイプ関係

		/**
		 * モデルに含まれるシェイプの数を取得する
		 */
		extern int MV1GetShapeNum(int MHandle);

		/**
		 * シェイプの名前からモデル中のシェイプのシェイプインデックスを取得する
		 *
		 * Returns: 無かった場合は-1
		 */
		extern int MV1SearchShape(int MHandle, const (dxlib_d.DxDataType.TCHAR)* ShapeName);

		/**
		 * シェイプの名前からモデル中のシェイプのシェイプインデックスを取得する
		 *
		 * Returns: 無かった場合は-1
		 */
		extern int MV1SearchShapeWithStrLen(int MHandle, const (dxlib_d.DxDataType.TCHAR)* ShapeName, size_t ShapeNameLength);

		/**
		 * 指定シェイプの名前を取得する
		 */
		extern const (dxlib_d.DxDataType.TCHAR)* MV1GetShapeName(int MHandle, int ShapeIndex);

		/**
		 * 指定シェイプが対象としているメッシュの数を取得する
		 */
		extern int MV1GetShapeTargetMeshNum(int MHandle, int ShapeIndex);

		/**
		 * 指定シェイプが対象としているメッシュのメッシュインデックスを取得する
		 */
		extern int MV1GetShapeTargetMesh(int MHandle, int ShapeIndex, int Index);

		/**
		 * 指定シェイプの有効率を設定する
		 *
		 * Params:
		 *      MHandle = ?
		 *      ShapeIndex = ?
		 *      Rate = 0.0f:0% 〜 1.0f:100%
		 *      Type = ?
		 */
		extern int MV1SetShapeRate(int MHandle, int ShapeIndex, float Rate, int Type = DX_MV1_SHAPERATE_ADD);

		/**
		 * 指定シェイプの有効率を取得する
		 *
		 * Returns: 0.0f:0% 〜 1.0f:100%
		 */
		extern float MV1GetShapeRate(int MHandle, int ShapeIndex);

		/**
		 * 指定シェイプの有効率を取得する( MV1SetShapeRate で指定した値がそのまま戻り値となる MV1GetShapeRate と異なりアニメーションのシェイプ情報なども加味した値が戻り値となります )
		 *
		 * Returns: 0.0f:0% 〜 1.0f:100%
		 */
		extern float MV1GetShapeApplyRate(int MHandle, int ShapeIndex);

		// トライアングルリスト関係

		/**
		 * モデルに含まれるトライアングルリストの数を取得する
		 */
		extern int MV1GetTriangleListNum(int MHandle);

		/**
		 * 指定のトライアングルリストの頂点データタイプを取得する( DX_MV1_VERTEX_TYPE_1FRAME 等 )
		 */
		extern int MV1GetTriangleListVertexType(int MHandle, int TListIndex);

		/**
		 * 指定のトライアングルリストに含まれるポリゴンの数を取得する
		 */
		extern int MV1GetTriangleListPolygonNum(int MHandle, int TListIndex);

		/**
		 * 指定のトライアングルリストに含まれる頂点データの数を取得する
		 */
		extern int MV1GetTriangleListVertexNum(int MHandle, int TListIndex);

		/**
		 * 指定のトライアングルリストが使用する座標変換行列の数を取得する
		 */
		extern int MV1GetTriangleListLocalWorldMatrixNum(int MHandle, int TListIndex);

		/**
		 * 指定のトライアングルリストが使用する座標変換行列( ローカル→ワールド )を取得する
		 */
		extern .MATRIX MV1GetTriangleListLocalWorldMatrix(int MHandle, int TListIndex, int LWMatrixIndex);

		/**
		 * 指定のトライアングルリストの指定のポリゴンが使用している頂点の座標を取得する
		 *
		 * Returns: エラー:-1  0以上:ポリゴンが使用している頂点の数
		 */
		extern int MV1GetTriangleListPolygonVertexPosition(int MHandle, int TListIndex, int PolygonIndex, .VECTOR* VertexPositionArray = null, float* MatrixWeightArray = null);

		/**
		 * 指定のトライアングルリストが使用しているマテリアルのインデックスを取得する
		 */
		extern int MV1GetTriangleListUseMaterial(int MHandle, int TListIndex);

		// コリジョン関係

		/**
		 * コリジョン情報を構築する
		 */
		extern int MV1SetupCollInfo(int MHandle, int FrameIndex = -1, int XDivNum = 32, int YDivNum = 8, int ZDivNum = 32, int MeshIndex = -1);

		/**
		 * コリジョン情報の後始末
		 */
		extern int MV1TerminateCollInfo(int MHandle, int FrameIndex = -1, int MeshIndex = -1);

		/**
		 * コリジョン情報を更新する
		 */
		extern int MV1RefreshCollInfo(int MHandle, int FrameIndex = -1, int MeshIndex = -1);

		/**
		 * 線とモデルの当たり判定
		 */
		extern .MV1_COLL_RESULT_POLY MV1CollCheck_Line(int MHandle, int FrameIndex, .VECTOR PosStart, .VECTOR PosEnd, int MeshIndex = -1);

		/**
		 * 線とモデルの当たり判定( 戻り値が MV1_COLL_RESULT_POLY_DIM )
		 */
		extern .MV1_COLL_RESULT_POLY_DIM MV1CollCheck_LineDim(int MHandle, int FrameIndex, .VECTOR PosStart, .VECTOR PosEnd, int MeshIndex = -1);

		/**
		 * 球とモデルの当たり判定
		 */
		extern .MV1_COLL_RESULT_POLY_DIM MV1CollCheck_Sphere(int MHandle, int FrameIndex, .VECTOR CenterPos, float r, int MeshIndex = -1);

		/**
		 * カプセルとモデルの当たり判定
		 */
		extern .MV1_COLL_RESULT_POLY_DIM MV1CollCheck_Capsule(int MHandle, int FrameIndex, .VECTOR Pos1, .VECTOR Pos2, float r, int MeshIndex = -1);

		/**
		 * 三角形とモデルの当たり判定
		 */
		extern .MV1_COLL_RESULT_POLY_DIM MV1CollCheck_Triangle(int MHandle, int FrameIndex, .VECTOR Pos1, .VECTOR Pos2, .VECTOR Pos3, int MeshIndex = -1);

		/**
		 * コリジョン結果ポリゴン配列から指定番号のポリゴン情報を取得する
		 */
		extern .MV1_COLL_RESULT_POLY MV1CollCheck_GetResultPoly(.MV1_COLL_RESULT_POLY_DIM ResultPolyDim, int PolyNo);

		/**
		 * コリジョン結果ポリゴン配列の後始末をする
		 */
		extern int MV1CollResultPolyDimTerminate(.MV1_COLL_RESULT_POLY_DIM ResultPolyDim);

		// 参照用メッシュ関係

		/**
		 * 参照用メッシュのセットアップ
		 */
		extern int MV1SetupReferenceMesh(int MHandle, int FrameIndex, int IsTransform, int IsPositionOnly = dxlib_d.DxDataType.FALSE, int MeshIndex = -1);

		/**
		 * 参照用メッシュの後始末
		 */
		extern int MV1TerminateReferenceMesh(int MHandle, int FrameIndex, int IsTransform, int IsPositionOnly = dxlib_d.DxDataType.FALSE, int MeshIndex = -1);

		/**
		 * 参照用メッシュの更新
		 */
		extern int MV1RefreshReferenceMesh(int MHandle, int FrameIndex, int IsTransform, int IsPositionOnly = dxlib_d.DxDataType.FALSE, int MeshIndex = -1);

		/**
		 * 参照用メッシュを取得する
		 */
		extern .MV1_REF_POLYGONLIST MV1GetReferenceMesh(int MHandle, int FrameIndex, int IsTransform, int IsPositionOnly = dxlib_d.DxDataType.FALSE, int MeshIndex = -1);
	}

	// DxLive2DCubism4.cpp 関数 プロトタイプ宣言

	version (DX_NON_LIVE2D_CUBISM4) {
	} else {
		/**
		 * Live2DCubismCore.dll のファイルパスを設定する
		 */
		extern int Live2D_SetCubism4CoreDLLPath(const (dxlib_d.DxDataType.TCHAR)* CoreDLLFilePath);

		/**
		 * Live2DCubismCore.dll のファイルパスを設定する
		 */
		extern int Live2D_SetCubism4CoreDLLPathWithStrLen(const (dxlib_d.DxDataType.TCHAR)* CoreDLLFilePath, size_t CoreDLLFilePathLength);

		/**
		 * Live2DCubismCore.dll のファイルパスを設定する
		 */
		extern int Live2D_SetCubism3CoreDLLPath(const (dxlib_d.DxDataType.TCHAR)* CoreDLLFilePath);

		/**
		 * Live2DCubismCore.dll のファイルパスを設定する
		 */
		extern int Live2D_SetCubism3CoreDLLPathWithStrLen(const (dxlib_d.DxDataType.TCHAR)* CoreDLLFilePath, size_t CoreDLLFilePathLength);

		/**
		 * Live2D の描画処理を開始する
		 */
		extern int Live2D_RenderBegin();

		/**
		 * Live2D の描画処理を終了する
		 */
		extern int Live2D_RenderEnd();

		/**
		 * Live2D のモデルファイルを読み込む
		 *
		 * Returns: 0以上:Live2Dモデルハンドル  マイナス値:エラー発生
		 */
		extern int Live2D_LoadModel(const (dxlib_d.DxDataType.TCHAR)* FilePath);

		/**
		 * Live2D のモデルファイルを読み込む
		 *
		 * Returns: 0以上:Live2Dモデルハンドル  マイナス値:エラー発生
		 */
		extern int Live2D_LoadModelWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FilePath, size_t FilePathLength);

		/**
		 * Live2D のモデルを削除する
		 */
		extern int Live2D_DeleteModel(int Live2DModelHandle);

		/**
		 * すべての Live2D のモデルを削除する
		 */
		extern int Live2D_InitModel();

		/**
		 * Live2D のモデルの状態を更新する
		 */
		extern int Live2D_Model_Update(int Live2DModelHandle, float DeltaTimeSeconds);

		/**
		 * Live2D のモデルの位置を設定する
		 */
		extern int Live2D_Model_SetTranslate(int Live2DModelHandle, float x, float y);

		/**
		 * Live2D のモデルの拡大率を設定する
		 */
		extern int Live2D_Model_SetExtendRate(int Live2DModelHandle, float ExRateX, float ExRateY);

		/**
		 * Live2D のモデルの回転を設定する
		 */
		extern int Live2D_Model_SetRotate(int Live2DModelHandle, float RotAngle);

		/**
		 * Live2D のモデルを描画する
		 */
		extern int Live2D_Model_Draw(int Live2DModelHandle);

		/**
		 * Live2D のモデルの指定のモーションを再生する
		 */
		extern int Live2D_Model_StartMotion(int Live2DModelHandle, const (dxlib_d.DxDataType.TCHAR)* group, int no);

		/**
		 * Live2D のモデルの指定のモーションを再生する
		 */
		extern int Live2D_Model_StartMotionWithStrLen(int Live2DModelHandle, const (dxlib_d.DxDataType.TCHAR)* group, size_t groupLength, int no);

		/**
		 * Live2D のモデルのモーション再生が終了しているかを取得する
		 *
		 * Returns: TRUE:再生が終了している  FALSE:再生中
		 */
		extern int Live2D_Model_IsMotionFinished(int Live2DModelHandle);

		/**
		 * Live2D のモデルの指定の表情モーションを設定する
		 */
		extern int Live2D_Model_SetExpression(int Live2DModelHandle, const (dxlib_d.DxDataType.TCHAR)* expressionID);

		/**
		 * Live2D のモデルの指定の表情モーションを設定する
		 */
		extern int Live2D_Model_SetExpressionWithStrLen(int Live2DModelHandle, const (dxlib_d.DxDataType.TCHAR)* expressionID, size_t expressionIDLength);

		/**
		 * 指定の座標が Live2D のモデルの指定の当たり判定の矩形範囲内か判定する
		 *
		 * Returns: TRUE:矩形範囲内  FALSE:矩形範囲外
		 */
		extern int Live2D_Model_HitTest(int Live2DModelHandle, const (dxlib_d.DxDataType.TCHAR)* hitAreaName, float x, float y);

		/**
		 * 指定の座標が Live2D のモデルの指定の当たり判定の矩形範囲内か判定する
		 *
		 * Returns: TRUE:矩形範囲内  FALSE:矩形範囲外
		 */
		extern int Live2D_Model_HitTestWithStrLen(int Live2DModelHandle, const (dxlib_d.DxDataType.TCHAR)* hitAreaName, size_t hitAreaNameLength, float x, float y);

		/**
		 * Live2D のモデルに設定されているパラメータの数を取得する
		 */
		extern int Live2D_Model_GetParameterCount(int Live2DModelHandle);

		/**
		 * Live2D のモデルに設定されているパラメータのIDを取得する
		 */
		extern const (dxlib_d.DxDataType.TCHAR)* Live2D_Model_GetParameterId(int Live2DModelHandle, int index);

		/**
		 * Live2D のモデルに設定されているパラメータを取得する
		 */
		extern float Live2D_Model_GetParameterValue(int Live2DModelHandle, const (dxlib_d.DxDataType.TCHAR)* parameterId);

		/**
		 * Live2D のモデルに設定されているパラメータを取得する
		 */
		extern float Live2D_Model_GetParameterValueWithStrLen(int Live2DModelHandle, const (dxlib_d.DxDataType.TCHAR)* parameterId, size_t parameterIdLength);

		/**
		 * Live2D のモデルに設定されているパラメータを設定する
		 */
		extern int Live2D_Model_SetParameterValue(int Live2DModelHandle, const (dxlib_d.DxDataType.TCHAR)* parameterId, float value);

		/**
		 * Live2D のモデルに設定されているパラメータを設定する
		 */
		extern int Live2D_Model_SetParameterValueWithStrLen(int Live2DModelHandle, const (dxlib_d.DxDataType.TCHAR)* parameterId, size_t parameterIdLength, float value);

		/**
		 * Live2D のモデルに設定された当たり判定の数を取得する
		 */
		extern int Live2D_Model_GetHitAreasCount(int Live2DModelHandle);

		/**
		 * Live2D のモデルの当たり判定に設定された名前を取得する
		 */
		extern const (dxlib_d.DxDataType.TCHAR)* Live2D_Model_GetHitAreaName(int Live2DModelHandle, int index);

		/**
		 * Live2D のモデルの物理演算設定ファイルの名前を取得する
		 */
		extern const (dxlib_d.DxDataType.TCHAR)* Live2D_Model_GetPhysicsFileName(int Live2DModelHandle);

		/**
		 * Live2D のモデルのパーツ切り替え設定ファイルの名前を取得する
		 */
		extern const (dxlib_d.DxDataType.TCHAR)* Live2D_Model_GetPoseFileName(int Live2DModelHandle);

		/**
		 * Live2D のモデルの表情設定ファイルの数を取得する
		 */
		extern int Live2D_Model_GetExpressionCount(int Live2DModelHandle);

		/**
		 * Live2D のモデルの表情設定ファイルを識別するIDを取得する
		 */
		extern const (dxlib_d.DxDataType.TCHAR)* Live2D_Model_GetExpressionName(int Live2DModelHandle, int index);

		/**
		 * Live2D のモデルの表情設定ファイルの名前を取得する
		 */
		extern const (dxlib_d.DxDataType.TCHAR)* Live2D_Model_GetExpressionFileName(int Live2DModelHandle, int index);

		/**
		 * Live2D のモデルのモーショングループの数を取得する
		 */
		extern int Live2D_Model_GetMotionGroupCount(int Live2DModelHandle);

		/**
		 * Live2D のモデルのモーショングループの名前を取得する
		 */
		extern const (dxlib_d.DxDataType.TCHAR)* Live2D_Model_GetMotionGroupName(int Live2DModelHandle, int index);

		/**
		 * Live2D のモデルのモーショングループに含まれるモーションの数を取得する
		 */
		extern int Live2D_Model_GetMotionCount(int Live2DModelHandle, const (dxlib_d.DxDataType.TCHAR)* groupName);

		/**
		 * Live2D のモデルのモーショングループに含まれるモーションの数を取得する
		 */
		extern int Live2D_Model_GetMotionCountWithStrLen(int Live2DModelHandle, const (dxlib_d.DxDataType.TCHAR)* groupName, size_t groupNameLength);

		/**
		 * Live2D のモデルのグループ名とインデックス値からモーションファイルの名前を取得する
		 */
		extern const (dxlib_d.DxDataType.TCHAR)* Live2D_Model_GetMotionFileName(int Live2DModelHandle, const (dxlib_d.DxDataType.TCHAR)* groupName, int index);

		/**
		 * Live2D のモデルのグループ名とインデックス値からモーションファイルの名前を取得する
		 */
		extern const (dxlib_d.DxDataType.TCHAR)* Live2D_Model_GetMotionFileNameWithStrLen(int Live2DModelHandle, const (dxlib_d.DxDataType.TCHAR)* groupName, size_t groupNameLength, int index);

		/**
		 * Live2D のモデルのモーションに対応するサウンドファイルの名前を取得する
		 */
		extern const (dxlib_d.DxDataType.TCHAR)* Live2D_Model_GetMotionSoundFileName(int Live2DModelHandle, const (dxlib_d.DxDataType.TCHAR)* groupName, int index);

		/**
		 * Live2D のモデルのモーションに対応するサウンドファイルの名前を取得する
		 */
		extern const (dxlib_d.DxDataType.TCHAR)* Live2D_Model_GetMotionSoundFileNameWithStrLen(int Live2DModelHandle, const (dxlib_d.DxDataType.TCHAR)* groupName, size_t groupNameLength, int index);

		/**
		 * Live2D のモデルのモーション開始時のフェードイン処理時間を取得する
		 */
		extern float Live2D_Model_GetMotionFadeInTimeValue(int Live2DModelHandle, const (dxlib_d.DxDataType.TCHAR)* groupName, int index);

		/**
		 * Live2D のモデルのモーション開始時のフェードイン処理時間を取得する
		 */
		extern float Live2D_Model_GetMotionFadeInTimeValueWithStrLen(int Live2DModelHandle, const (dxlib_d.DxDataType.TCHAR)* groupName, size_t groupNameLength, int index);

		/**
		 * Live2D のモデルのモーション終了時のフェードアウト処理時間を取得する
		 */
		extern float Live2D_Model_GetMotionFadeOutTimeValue(int Live2DModelHandle, const (dxlib_d.DxDataType.TCHAR)* groupName, int index);

		/**
		 * Live2D のモデルのモーション終了時のフェードアウト処理時間を取得する
		 */
		extern float Live2D_Model_GetMotionFadeOutTimeValueWithStrLen(int Live2DModelHandle, const (dxlib_d.DxDataType.TCHAR)* groupName, size_t groupNameLength, int index);

		/**
		 * Live2D のモデルのユーザデータのファイル名を取得する
		 */
		extern const (dxlib_d.DxDataType.TCHAR)* Live2D_Model_GetUserDataFile(int Live2DModelHandle);

		/**
		 * Live2D のモデルの目パチに関連付けられたパラメータの数を取得する
		 */
		extern int Live2D_Model_GetEyeBlinkParameterCount(int Live2DModelHandle);

		/**
		 * Live2D のモデルの目パチに関連付けられたパラメータのIDを取得する
		 */
		extern const (dxlib_d.DxDataType.TCHAR)* Live2D_Model_GetEyeBlinkParameterId(int Live2DModelHandle, int index);

		/**
		 * Live2D のモデルのリップシンクに関連付けられたパラメータの数を取得する
		 */
		extern int Live2D_Model_GetLipSyncParameterCount(int Live2DModelHandle);

		/**
		 * Live2D のモデルのリップシンクに関連付けられたパラメータのIDを取得する
		 */
		extern const (dxlib_d.DxDataType.TCHAR)* Live2D_Model_GetLipSyncParameterId(int Live2DModelHandle, int index);
	}
}

// ネームスペース DxLib を使用する ------------------------------------------------------
version (DX_NON_NAMESPACE) {
} else {
	version (DX_NON_USING_NAMESPACE_DXLIB) {
	} else {
		/+
		using namespace DxLib;
		+/
	}
}

// DXライブラリ内部でのみ使用するヘッダファイルのインクルード -------------------------

version (DX_MAKE) {
	//    #include "DxStatic.h"
}
