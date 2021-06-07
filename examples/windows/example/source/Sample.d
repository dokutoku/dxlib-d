//  ここにサンプルプログラムをペーストしてください
// 初期状態ではサウンドノベル風文字列描画サンプルが入力されています。
//  べつのサンプルプログラムを実行する場合は以下のプログラムをすべて
// 削除して、新たにコピー&ペーストしてください。
module windows_sample.app;


version (Windows):

import core.stdc.math;
import core.sys.windows.windef;
import core.sys.windows.winnt;
import dxlib_d.DxDataType;
import dxlib_d.DxFunctionWin;
import dxlib_d.DxLib;

// サウンドノベル風文字列描画、テキストバッファ使用バージョン

// 文字のサイズ
enum MOJI_SIZE = 24;

//画面の幅と高さ
enum WIDTH = 640;
enum HEIGTH = 480;

// 仮想テキストバッファの横サイズ縦サイズ
enum STRBUF_WIDTH = 24;
enum STRBUF_HEIGHT = 20;

// 仮想テキストバッファ
dxlib_d.DxDataType.TCHAR[(.STRBUF_WIDTH * 4) + 1][.STRBUF_HEIGHT] StringBuf;

// 仮想画面上での文字表示カーソルの位置
int CursorX;
int CursorY;

// 参照する文字列番号と文字列中の文字ポインタ
int SP;
int CP;
int CursorX_CP;

// 終了フラグ
int EndFlag;

// ボタン押し待ちフラグ
int KeyWaitFlag;

// フレームカウンタ
int Count;

//Dxlibの関数に渡される文字列の終端は'\0'でなければならないことに気をつける。
version (Unicode) {
	//正常に動作するかは未確認
	static assert(false);

	//UTF-16 文字列
	static immutable wchar[256][] String =
	[
		"　ゲームプログラムを習得するための一番の近道はとにかく沢山プログラムを組む",
		"ことである。B",
		"@　プログラムの参考書にはゲームのプログラムの方法なんて何も書かれていない、B",
		"変数、B配列、B関数、Bループ、B条件分岐…Bこれらすべての説明はゲームで何に使うか",
		"なんてどこにも書いていない、Bせいぜい住所録を題材にした例がある程度である。B",
		"C　プログラムは習うより慣れろなのでプログラムを組むに当たって少しでも知識が",
		"つけば後はそこからは掘り下げ、広げていけば良いわけで、Bプログラムの参考書を",
		"読んでいて少しでも何か出来るような気がしたらそこでとにかくプログラム",
		"を打ってみることが大事である。E",
	];
} else {
	version (all) {
		//UTF-8文字列
		//Dxlibの関数に文字列を渡す場合、DxLib_Initの前にSetUseCharCodeFormat(DX_CHARCODEFORMAT_UTF8)としないと、UTF-8ではなくSHIFT-JIS文字列と認識されてしまう
		static immutable char[256][] String =
		[
			"　ゲームプログラムを習得するための一番の近道はとにかく沢山プログラムを組む",
			"ことである。B",
			"@　プログラムの参考書にはゲームのプログラムの方法なんて何も書かれていない、B",
			"変数、B配列、B関数、Bループ、B条件分岐…Bこれらすべての説明はゲームで何に使うか",
			"なんてどこにも書いていない、Bせいぜい住所録を題材にした例がある程度である。B",
			"C　プログラムは習うより慣れろなのでプログラムを組むに当たって少しでも知識が",
			"つけば後はそこからは掘り下げ、広げていけば良いわけで、Bプログラムの参考書を",
			"読んでいて少しでも何か出来るような気がしたらそこでとにかくプログラム",
			"を打ってみることが大事である。E",
		];
	} else {
		//SHIFT-JIS 文字列
		static immutable char[256][] String =
		[
			"\x81\x40\x83\x51\x81\x5B\x83\x80\x83\x76\x83\x8D\x83\x4F\x83\x89\x83\x80\x82\xF0\x8F\x4B\x93\xBE\x82\xB7\x82\xE9\x82\xBD\x82\xDF\x82\xCC\x88\xEA\x94\xD4\x82\xCC\x8B\xDF\x93\xB9\x82\xCD\x82\xC6\x82\xC9\x82\xA9\x82\xAD\x91\xF2\x8E\x52\x83\x76\x83\x8D\x83\x4F\x83\x89\x83\x80\x82\xF0\x91\x67\x82\xDE",
			"\x82\xB1\x82\xC6\x82\xC5\x82\xA0\x82\xE9\x81\x42\x42",
			"\x40\x81\x40\x83\x76\x83\x8D\x83\x4F\x83\x89\x83\x80\x82\xCC\x8E\x51\x8D\x6C\x8F\x91\x82\xC9\x82\xCD\x83\x51\x81\x5B\x83\x80\x82\xCC\x83\x76\x83\x8D\x83\x4F\x83\x89\x83\x80\x82\xCC\x95\xFB\x96\x40\x82\xC8\x82\xF1\x82\xC4\x89\xBD\x82\xE0\x8F\x91\x82\xA9\x82\xEA\x82\xC4\x82\xA2\x82\xC8\x82\xA2\x81\x41\x42",
			"\x95\xCF\x90\x94\x81\x41\x42\x94\x7A\x97\xF1\x81\x41\x42\x8A\xD6\x90\x94\x81\x41\x42\x83\x8B\x81\x5B\x83\x76\x81\x41\x42\x8F\xF0\x8C\x8F\x95\xAA\x8A\xF2\x81\x63\x42\x82\xB1\x82\xEA\x82\xE7\x82\xB7\x82\xD7\x82\xC4\x82\xCC\x90\xE0\x96\xBE\x82\xCD\x83\x51\x81\x5B\x83\x80\x82\xC5\x89\xBD\x82\xC9\x8E\x67\x82\xA4\x82\xA9",
			"\x82\xC8\x82\xF1\x82\xC4\x82\xC7\x82\xB1\x82\xC9\x82\xE0\x8F\x91\x82\xA2\x82\xC4\x82\xA2\x82\xC8\x82\xA2\x81\x41\x42\x82\xB9\x82\xA2\x82\xBA\x82\xA2\x8F\x5A\x8F\x8A\x98\x5E\x82\xF0\x91\xE8\x8D\xDE\x82\xC9\x82\xB5\x82\xBD\x97\xE1\x82\xAA\x82\xA0\x82\xE9\x92\xF6\x93\x78\x82\xC5\x82\xA0\x82\xE9\x81\x42\x42",
			"\x43\x81\x40\x83\x76\x83\x8D\x83\x4F\x83\x89\x83\x80\x82\xCD\x8F\x4B\x82\xA4\x82\xE6\x82\xE8\x8A\xB5\x82\xEA\x82\xEB\x82\xC8\x82\xCC\x82\xC5\x83\x76\x83\x8D\x83\x4F\x83\x89\x83\x80\x82\xF0\x91\x67\x82\xDE\x82\xC9\x93\x96\x82\xBD\x82\xC1\x82\xC4\x8F\xAD\x82\xB5\x82\xC5\x82\xE0\x92\x6D\x8E\xAF\x82\xAA",
			"\x82\xC2\x82\xAF\x82\xCE\x8C\xE3\x82\xCD\x82\xBB\x82\xB1\x82\xA9\x82\xE7\x82\xCD\x8C\x40\x82\xE8\x89\xBA\x82\xB0\x81\x41\x8D\x4C\x82\xB0\x82\xC4\x82\xA2\x82\xAF\x82\xCE\x97\xC7\x82\xA2\x82\xED\x82\xAF\x82\xC5\x81\x41\x42\x83\x76\x83\x8D\x83\x4F\x83\x89\x83\x80\x82\xCC\x8E\x51\x8D\x6C\x8F\x91\x82\xF0",
			"\x93\xC7\x82\xF1\x82\xC5\x82\xA2\x82\xC4\x8F\xAD\x82\xB5\x82\xC5\x82\xE0\x89\xBD\x82\xA9\x8F\x6F\x97\x88\x82\xE9\x82\xE6\x82\xA4\x82\xC8\x8B\x43\x82\xAA\x82\xB5\x82\xBD\x82\xE7\x82\xBB\x82\xB1\x82\xC5\x82\xC6\x82\xC9\x82\xA9\x82\xAD\x83\x76\x83\x8D\x83\x4F\x83\x89\x83\x80",
			"\x82\xF0\x91\xC5\x82\xC1\x82\xC4\x82\xDD\x82\xE9\x82\xB1\x82\xC6\x82\xAA\x91\xE5\x8E\x96\x82\xC5\x82\xA0\x82\xE9\x81\x42\x45",
		];
	}
}

extern (Windows)
nothrow @nogc
int WinMain(core.sys.windows.windef.HINSTANCE hInstance, core.sys.windows.windef.HINSTANCE hPrevInstance, core.sys.windows.winnt.LPSTR lpCmdLine, int nCmdShow)

	do
	{
		//WIDTH × HEIGTH, 色ビット深度 32
		dxlib_d.DxLib.SetGraphMode(WIDTH, HEIGTH, 32);

		//全画面表示にしない
		dxlib_d.DxFunctionWin.ChangeWindowMode(dxlib_d.DxDataType.TRUE);

		version (ANSI) {
			version (all) {
				//UTF-8にする
				dxlib_d.DxLib.SetUseCharCodeFormat(dxlib_d.DxLib.DX_CHARCODEFORMAT_UTF8);
			}
		}

		//ウィンドウが非アクティブ時にも動作させる
		dxlib_d.DxLib.SetAlwaysRunFlag(dxlib_d.DxDataType.TRUE);

		// DXライブラリ初期化処理
		if (dxlib_d.DxLib.DxLib_Init() == -1) {
			// エラーが起きたら直ちに終了
			return -1;
		}

		scope (exit) {
			// DXライブラリ使用の終了処理
			dxlib_d.DxLib.DxLib_End();
		}

		// 描画位置の初期位置セット
		.CursorX = 0;
		.CursorX_CP = 0;
		.CursorY = 0;

		// 参照文字位置をセット

		// 1行目の
		.SP = 0;

		// 0文字
		.CP = 0;

		// フォントのサイズセット
		dxlib_d.DxLib.SetFontSize(.MOJI_SIZE);

		// フォントの太さを変更
		dxlib_d.DxLib.SetFontThickness(1);

		// フォントのタイプをアンチエイリアスフォントに変更
		dxlib_d.DxLib.ChangeFontType(dxlib_d.DxLib.DX_FONTTYPE_ANTIALIASING_EDGE_8X8);

		// 描画先を裏画面にセット
		dxlib_d.DxLib.SetDrawScreen(dxlib_d.DxLib.DX_SCREEN_BACK);

		// フレームカウンタ初期化
		.Count = 0;

		//文字コード形式の取得
		version (Unicode) {
			immutable int code = dxlib_d.DxLib.Get_wchar_t_CharCodeFormat();
		} else {
			immutable int code = dxlib_d.DxLib.GetUseCharCodeFormat();
		}

		// ループ
		while ((dxlib_d.DxLib.ProcessMessage() == 0) && (dxlib_d.DxLib.CheckHitKey(dxlib_d.DxLib.KEY_INPUT_ESCAPE) == 0)) {
			// サウンドノベル風文字列描画処理を行う
			// ただし終了フラグが1だった場合は処理をしない
			if (.EndFlag == 0) {
				// ボタン押し待ちフラグがたっていた場合はボタンが押されるまでここで終了
				if (.KeyWaitFlag == 1) {
					if ((dxlib_d.DxLib.ProcessMessage() == 0) && (dxlib_d.DxLib.CheckHitKeyAll() != 0)) {
						// ボタンが押されていたら解除
						.KeyWaitFlag = 0;
					}
				} else {
					// 文字の描画
					dxlib_d.DxDataType.TCHAR Moji = String[.SP][.CP];

					switch (Moji) {
						// 改行文字
						case '@':
							// 改行処理および参照文字位置を1つ進める
							.Kaigyou();
							.CP++;

							break;


						// ボタン押し待ち文字
						case 'B':
							// ボタンが離されるまで待つ
							while ((dxlib_d.DxLib.ProcessMessage() == 0) && (dxlib_d.DxLib.CheckHitKeyAll() != 0)) {
							}

							// ボタン押し待ちフラグをたてる
							.KeyWaitFlag = 1;
							.CP++;

							break;

						// 終了文字
						case 'E':
							// 終了フラグを立てるおよび参照文字位置を1つ進める
							.EndFlag = 1;
							.CP++;

							break;

						// クリア文字
						case 'C':
							// 仮想テキストバッファを初期化して描画文字位置を初期位置に戻すおよび参照文字位置を1つ進める
							for (size_t i = 0; i < .StringBuf.length; i++) {
								for (size_t j = 0; j < (StringBuf[i - 1].length - 1); j++) {
									.StringBuf[i][j] = 0;
								}
							}

							.CursorY = 0;
							.CursorX = 0;
							.CursorX_CP = 0;
							.CP++;

							break;

						// その他の文字
						default:
							int code_length = GetCharBytes(code, &(String[.SP][.CP]));
							assert(code_length != -1);

							version (Unicode) {
								code_length = cast(int)(code_length / dxlib_d.DxDataType.TCHAR.sizeof);
							}

							// 1文字テキストバッファに代入
							for (size_t i = 0; i < code_length; i++) {
								.StringBuf[.CursorY][.CursorX_CP + i] = String[.SP][.CP + i];
							}

							// 参照文字位置を1文字分進める
							.CP += code_length;
							.CursorX_CP += code_length;

							// カーソルを1文字分進める
							.CursorX++;

							// テキストバッファ横幅からはみ出たら改行する
							if (.CursorX >= .STRBUF_WIDTH) {
								.Kaigyou();
							}

							break;
					}

					// 参照文字列の終端まで行っていたら参照文字列を進める
					if (String[.SP][.CP] == '\0') {
						.SP++;
						.CP = 0;
					}
				}
			}

			// 画面のクリア
			dxlib_d.DxLib.ClsDrawScreen();

			// 背景エフェクトの描画
			{
				int Color = cast(int)(core.stdc.math.sin((.Count / 100.0) * 80.0) + 125.0);
				dxlib_d.DxLib.DrawBox(0, 0, WIDTH, HEIGTH, dxlib_d.DxLib.GetColor(Color, 0, 0), dxlib_d.DxDataType.TRUE);
				.Count++;
			}

			// テキストバッファの描画
			for (size_t i = 0; i < .StringBuf.length; i++) {
				dxlib_d.DxLib.DrawString(8, cast(int)(i * .MOJI_SIZE), &(.StringBuf[i][0]), dxlib_d.DxLib.GetColor(255, 255, 255));
			}

			// 裏画面の内容を表画面に反映させる
			dxlib_d.DxLib.ScreenFlip();
		}

		// ソフトの終了
		return 0;
	}

// テキストバッファの改行処理関数
nothrow @nogc
void Kaigyou()

	do
	{
		// 描画行位置を1つ下げる
		.CursorY++;

		// 描画列を最初に戻す
		.CursorX = 0;
		.CursorX_CP = 0;

		// もしテキストバッファ縦幅からはみ出るならテキストバッファを縦スクロールさせる
		if (.CursorY >= .StringBuf.length) {
			for (size_t i = 1; i < .StringBuf.length; i++) {
				for (size_t j = 0; j < (StringBuf[i - 1].length - 1); j++) {
					.StringBuf[i - 1][j] = .StringBuf[i][j];
				}
			}

			// 描画行位置を1つあげる
			.CursorY--;
		}
	}
