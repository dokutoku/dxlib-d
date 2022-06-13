/**
 * Dxlibのほとんどのアプリケーションで使われるであろう共通設定。
 *
 * See_Also:
 *      https://qiita.com/AioiLight/items/7bfbcd4f0ce786a9acc9
 */
module dxlib_d.example.common_init;


version (ANSI) {
	private import core.stdc.locale;
}

import dxlib_d;

/**
 * Dxlibのデフォルトの初期設定を変更する。DxLib_Initの前に宣言する必要がある。
 */
nothrow @nogc
void common_dxlib_init()

	do
	{
		debug {
		} else {
			version (DX_NON_LOG) {
			} else {
				//ログを生成しない
				SetOutApplicationLogValidFlag(dxlib_d.DxDataType.FALSE);
			}
		}

		version (DX_NOTUSE_DRAWFUNCTION) {
		} else {
			//画像の黒色を透過しないようにする
			SetUseTransColor(dxlib_d.DxDataType.FALSE);

			version (all) {
				//垂直同期する
				SetWaitVSyncFlag(dxlib_d.DxDataType.TRUE);
			}
		}

		version (Windows) {
			//多重起動を許可する
			SetDoubleStartValidFlag(dxlib_d.DxDataType.TRUE);

			//起動時にフルスクリーンにしない
			dxlib_d.DxFunctionWin.ChangeWindowMode(dxlib_d.DxDataType.TRUE);
		}

		version (ANSI) {
			//コードフォーマットをUTF-8にする
			SetUseCharCodeFormat(DX_CHARCODEFORMAT_UTF8);

			//C言語のロケールの設定
			setlocale(LC_ALL, ".utf8");
		}

		//ウィンドウがアクディブでないときも動作を継続する
		SetAlwaysRunFlag(dxlib_d.DxDataType.TRUE);
	}
