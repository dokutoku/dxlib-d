// ----------------------------------------------------------------------------
//
//        DXライブラリ コンパイルコンフィグヘッダファイル
//
//                Ver 3.22c
//
// ----------------------------------------------------------------------------

/*
<<注意>>
  このヘッダファイルの #define のコメントアウト状態を変更しても、
  DXライブラリ自体の再コンパイルを行わないと効果はありません。
*/
/**
 * このモジュールは使用されません。使用されたとしても正しく動作しません。
 */
module dxlib_d.DxCompileConfig;


version (none):

version (OSX) {
	version = __APPLE__;
} else version (iOS) {
	version = __APPLE__;
} else version (TVOS) {
	version = __APPLE__;
} else version (WatchOS) {
	version = __APPLE__;
}

version (__APPLE__) {
} else {
	version (Android) {
	} else {
		version = WINDOWS_DESKTOP_OS;
	}
}

// 多重インクルード防止用マクロ
// スタティックライブラリ生成時ライブラリ機能制限用定義 -----------------------

// namespace DxLib を使用しない場合は次のコメントを外してください
//version = DX_NON_NAMESPACE;

// DxLib.h に書かれている using namespace DxLib ; を使用しない場合は次のコメントを外してください
//version = DX_NON_USING_NAMESPACE_DXLIB;

// インラインアセンブラを使用しないソースコードでコンパイルする場合は以下のコメントアウトを外してください
//version = DX_NON_INLINE_ASM;

// DXライブラリのプログラムから文字列を一切排除する場合はコメントを外してください
// (バイナリエディタで実行ファイルを開いてもDXライブラリを使用していることが分かり難くなります(よく調べれば当然分かりますが)
//  因みに、エラー出力が一切されなくなりますので管理人の対応時に支障をきたすかもしれません)
//version = DX_NON_LITERAL_STRING;

// すべての関数をスレッドセーフにする場合はコメントを外してください
//version = DX_THREAD_SAFE;

// ネットワーク関連の関数だけスレッドセーフにする場合はコメントを外して下さい
version = DX_THREAD_SAFE_NETWORK_ONLY;

// DXアーカイブがいらない方は次のコメントを外してください
// ( DXアーカイブを無効にすると、DXアーカイブを内部で使っている関係上 DX_NON_MODEL と DX_NON_FILTER と DX_NON_MOVIE と DX_NON_NORMAL_DRAW_SHADER も有効になります )
//version = DX_NON_DXA;

// ムービー機能がいらない方は次のコメントを外してください
//version = DX_NON_MOVIE;

// TGA画像の読み込み機能がいらない方は次のコメントを外してください
//version = DX_NON_TGA;

// JPEG画像の読みこみ機能がいらない方は次のコメントを外してください
// ※DxUseCLib.lib も再コンパイルする必要があります
//version = DX_NON_JPEGREAD;

// PNG画像の読みこみ機能がいらない方は次のコメントを外してください
// ※DxUseCLib.lib も再コンパイルする必要があります
//version = DX_NON_PNGREAD;

// TIFF画像の読みこみ機能がいらない方は次のコメントを外してください
// ※DxUseCLib.lib も再コンパイルする必要があります
//version = DX_NON_TIFFREAD;

// GraphFilter や GraphBlend を使用しない方は次のコメントを外して下さい
//version = DX_NON_FILTER;

// 通常描画にプログラマブルシェーダーを使用しない方は次のコメントを外してください
//version = DX_NON_NORMAL_DRAW_SHADER;

// グラフィックス処理がいらない方は次のコメントを外してください
//version = DX_NON_GRAPHICS;

// ソフトウエア2D描画がいらない方は次のコメントを外してください
//version = DX_NON_2DDRAW;

// 標準 WAVE ファイル以外の音声ファイルを使用しない方は次のコメントを外してください
//version = DX_NON_ACM;

// DirectShow を使用した MP3 ファイルのデコードを行わない場合は次のコメントをはずしてください
//version = DX_NON_DSHOW_MP3;

// DirectShow を使用した動画ファイルのデコードを行わない場合は次のコメントをはずしてください
//version = DX_NON_DSHOW_MOVIE;

// Media Foundation を使用した動画ファイルのデコードを行わない場合は次のコメントをはずしてください
//version = DX_NON_MEDIA_FOUNDATION;

// キーボードの基本的な入力機能以外はいらない方は次のコメントを外してください
//version = DX_NON_KEYEX;

// 文字列入力機能はいらない方は次のコメントを外して下さい
//version = DX_NON_INPUTSTRING;

// 通信機能がいらない方は次のコメントを外してください
//version = DX_NON_NETWORK;

// マスク機能がいらない方は次のコメントを外してください
//version = DX_NON_MASK;

// Ogg Vorbis データを使用しない方は次のコメントをはずしてください
// ※DxUseCLib.lib も再コンパイルする必要があります
//version = DX_NON_OGGVORBIS;

// Ogg Theora データを使用しない方は次のコメントをはずしてください
// ※DxUseCLib.lib も再コンパイルする必要があります
//version = DX_NON_OGGTHEORA;

// Opus データを使用しない方は次のコメントをはずしてください
// ※DxUseCLib.lib も再コンパイルする必要があります
//version = DX_NON_OPUS;

// ASIO を使用しない方は次のコメントをはずしてください
//version = DX_NON_ASIO;

// 乱数発生器に Mersenne Twister を使用しない場合は以下のコメントを外して下さい
// ※DxUseCLib.lib も再コンパイルする必要があります
//version = DX_NON_MERSENNE_TWISTER;

// DXライブラリ内の確保メモリのダンプ機能を有効にする場合は次のコメントを外してください
version = DX_USE_DXLIB_MEM_DUMP;

// モデルデータを扱う機能を使用しない方は次のコメントを外してください
//version = DX_NON_MODEL;

// Bullet Physics をリンクしない場合は次のコメントを外してください
// ※DxUseCLib.lib も再コンパイルする必要があります
//version = DX_NON_BULLET_PHYSICS;

// FBXファイルを読み込む機能を使用する方は次のコメントを外してください( 使用には FBX SDK のセットアップが必要です )
//version = DX_LOAD_FBX_MODEL;

// ビープ音機能がいらない方は次のコメントを外してください
//version = DX_NON_BEEP;

// タスクスイッチをOFFにする機能がいらない方は次のコメントを外してください
// ( タスクスイッチOFF機能は使用不可です )
//version = DX_NON_STOPTASKSWITCH;

// ログ出力を行わない場合は次のコメントを外して下さい
//version = DX_NON_LOG;

// printfDx を無効にする場合は次のコメントを外して下さい
//version = DX_NON_PRINTF_DX;

// 非同期読み込みを無効にする場合は次のコメントを外して下さい
//version = DX_NON_ASYNCLOAD;

// ファイル保存機能を無効にする場合は次のコメントを外して下さい
//version = DX_NON_SAVEFUNCTION;

// ソフトウェアで扱うイメージを無効にする場合は次のコメントを外して下さい
//version = DX_NON_SOFTIMAGE;

// フォント描画機能を無効にする場合は次のコメントを外して下さい
//version = DX_NON_FONT;

// サウンド再生機能( ソフトウエアサウンド、MIDI含む )を無効にする場合は次のコメントを外して下さい
//version = DX_NON_SOUND;

// 入力機能を無効にする場合は次のコメントを外して下さい
//version = DX_NON_INPUT;

// マルチスレッドを使用しない場合は次のコメントを外してください
//version = DX_NON_MULTITHREAD;

// 各ハンドルのエラーチェックを無効にする場合は次のコメントを外してください( 若干高速化される代わりに無効なハンドルを関数に渡すと即不正なメモリアクセスエラーが発生するようになります )
//version = DX_NON_HANDLE_ERROR_CHECK;

// Direct3D11 を使用しない場合は以下のコメントを外してください( 現在開発中なので、必ずコメントを外した状態にしてください )
//version = DX_NON_DIRECT3D11;

// Direct3D9 を使用しない場合は以下のコメントを外してください
//version = DX_NON_DIRECT3D9;

// 軽量バージョンのDXライブラリを生成する場合は次のコメントを外してください
//version = DX_LIB_LITEVER;

// コンパイル済みのシェーダーバイナリを使用せず、シェーダーコードの実行時コンパイルを利用する場合は次のコメントを外してください
//version = DX_NON_SHADERCODE_BINARY;

version (Android) {
	version = DX_NON_LIVE2D_CUBISM4;
} else version (__APPLE__) {
	version = DX_NON_LIVE2D_CUBISM4;
} else {
	// Live2D Cubism 4 関連の機能を使用しない場合は次のコメントを外してください
	//version = DX_NON_LIVE2D_CUBISM4;
}

version (DX_GCC_COMPILE) {
	version = USE_ULL;
} else version (Android) {
	version = USE_ULL;
} else version (__APPLE__) {
	version = USE_ULL;
} else version (BC2_COMPILER) {
	version = USE_ULL;
}

version (WINDOWS_DESKTOP_OS) {
} else {
	version = DX_NON_BEEP;
	version = DX_NON_ACM;
	version = DX_NON_DSHOW_MP3;
	version = DX_NON_DSHOW_MOVIE;
	version = DX_NON_MEDIA_FOUNDATION;
}

version (Android) {
	//version = DX_NON_2DDRAW;
	version = DX_NON_ACM;
	version = DX_NON_DSHOW_MP3;
	version = DX_NON_DSHOW_MOVIE;
	version = DX_NON_MEDIA_FOUNDATION;
	version = DX_NON_KEYEX;
	version = DX_NON_INPUTSTRING;
	version = DX_NON_NETWORK;
	version = DX_NON_STOPTASKSWITCH;
	version = DX_NON_DIRECT3D11;
	version = DX_NON_DIRECT3D9;
} else version (__APPLE__) {
	//version = DX_NON_2DDRAW;
	version = DX_NON_ACM;
	version = DX_NON_DSHOW_MP3;
	version = DX_NON_DSHOW_MOVIE;
	version = DX_NON_MEDIA_FOUNDATION;
	version = DX_NON_KEYEX;
	version = DX_NON_INPUTSTRING;
	version = DX_NON_NETWORK;
	version = DX_NON_STOPTASKSWITCH;
	version = DX_NON_DIRECT3D11;
	version = DX_NON_DIRECT3D9;
}

version (DX_LIB_LITEVER) {
	version = DX_NON_ACM;
	version = DX_NON_2DDRAW;
	version = DX_NON_MOVIE;
	version = DX_NON_KEYEX;
	version = DX_NON_NETWORK;
	version = DX_NON_MASK;
	version = DX_NON_JPEGREAD;
	version = DX_NON_PNGREAD;
	version = DX_NON_TIFFREAD;
	version = DX_NON_BEEP;
	version = DX_NON_OGGVORBIS;
	version = DX_NON_OGGTHEORA;
	version = DX_NON_OPUS;
	version = DX_NON_MODEL;
	version = DX_NON_SHADERCODE_BINARY;
}

version (DX_NON_GRAPHICS) {
	version = DX_NON_FONT;
	version = DX_NON_MOVIE;
	version = DX_NON_FILTER;
	version = DX_NON_2DDRAW;
	version = DX_NON_MASK;
	version = DX_NON_MODEL;
	version = DX_NON_BULLET_PHYSICS;
	version = DX_NON_PRINTF_DX;
	version = DX_NON_KEYEX;
	version = DX_NON_DIRECT3D11;
	version = DX_NON_DIRECT3D9;
	version = DX_NOTUSE_DRAWFUNCTION;
	version = DX_NON_LIVE2D_CUBISM4;
}

version (DX_NON_SOUND) {
	version = DX_NON_OPUS;
	version = DX_NON_OGGVORBIS;
	version = DX_NON_OGGTHEORA;
	version = DX_NON_ACM;
	version = DX_NON_DSHOW_MP3;
	version = DX_NON_DSHOW_MOVIE;
	version = DX_NON_MEDIA_FOUNDATION;
	version = DX_NON_MOVIE;
}

version (DX_NON_MULTITHREAD) {
	version = DX_NON_ASYNCLOAD;

	version (DX_THREAD_SAFE) {
		static assert(false);
	}
}

version (DX_NON_INPUTSTRING) {
	version = DX_NON_KEYEX;
}

version (DX_NON_DXA) {
	version = DX_NON_NORMAL_DRAW_SHADER;
	version = DX_NON_MODEL;
	version = DX_NON_FILTER;
	version = DX_NON_MOVIE;
}

version (DX_NON_MOVIE) {
	version = DX_NON_OGGTHEORA;
	version = DX_NON_MEDIA_FOUNDATION;
}

version (DX_NON_INPUT) {
	version = DX_NON_KEYEX;
}

version (DX_NON_FONT) {
	version = DX_NON_PRINTF_DX;
	version = DX_NON_KEYEX;
}

version (DX_NON_OGGVORBIS) {
	version = DX_NON_OGGTHEORA;
	version = DX_NON_OPUS;
}

version (Win64) {
	version = PLATFORM_64BIT;
} else static if (__traits(compiles, __LP64__)) {
	version = PLATFORM_64BIT;
}

version (Win64) {
	version = DX_NON_INLINE_ASM;
} else version (Android) {
	version = DX_NON_INLINE_ASM;
} else version (__APPLE__) {
	version = DX_NON_INLINE_ASM;
}

public import dxlib_d.DxDataType;
