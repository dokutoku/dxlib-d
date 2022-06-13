/**
 * Dxlibで使う最小のアプリケーションサンプル
 */
module dxlib_d.example.minumum.app;


import dxlib_d;
import dxlib_d.example.common_init;

/**
 * このアプリケーションの初期設定。DxLib_Initの前に宣言する必要がある。
 */
nothrow @nogc
void app_init()

	do
	{
		version (DX_NOTUSE_DRAWFUNCTION) {
		} else {
			//800×600の32ビットカラーにする
			SetGraphMode(800, 600, 32);
		}

		version (Windows) {
			//ウィンドウクラス名。他のDxlibソフトウェアと衝突しないような名前にする必要がある
			dxlib_d.DxFunctionWin.SetMainWindowClassName("MinimumDxlibApplication");

			//ウィンドウタイトルの名前
			dxlib_d.DxFunctionWin.SetWindowText("MinimumDxlibApplication");

			version (DX_NOTUSE_DRAWFUNCTION) {
			} else {
				version (none) {
					//Direct3Dのバージョンを11.1に指定する。
					SetUseDirect3DVersion(DX_DIRECT3D_11_FEATURE_LEVEL_11_1);
				}
			}
		}
	}

nothrow @nogc
int hello_dxlib()

	do
	{
		//Dxlibの初期設定を変える
		common_dxlib_init();

		//このアプリケーションの初期設定
		app_init();

		if (DxLib_Init() == -1) {
			return 1;
		}

		scope (exit) {
			DxLib_End();
		}

		DrawString(10, 10, "Hello, World!", GetColor(255, 255, 255));

		while (ProcessMessage() == 0) {
			WaitKey();

			break;
		}

		return 0;
	}

version (Windows) {
	extern (Windows)
	nothrow @nogc
	int WinMain(dxlib_d.DxDataType.HINSTANCE hInstance, dxlib_d.DxDataType.HINSTANCE hPrevInstance, dxlib_d.DxDataType.LPSTR lpCmdLine, int nCmdShow)

		do
		{
			return .hello_dxlib();
		}
} else {
	extern (C)
	nothrow @nogc
	int main()

		do
		{
			return .hello_dxlib();
		}
}
