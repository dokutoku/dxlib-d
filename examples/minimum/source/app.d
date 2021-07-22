module minimum;

import core.stdc.locale;
import dxlib_d;

int main()

	do
	{
		debug {
		} else {
			SetOutApplicationLogValidFlag(dxlib_d.DxDataType.FALSE);
		}

		SetGraphMode(800, 600, 32);

		version (Windows) {
			dxlib_d.DxFunctionWin.ChangeWindowMode(dxlib_d.DxDataType.TRUE);
		}

		version (ANSI) {
			SetUseCharCodeFormat(DX_CHARCODEFORMAT_UTF8);
			setlocale(LC_ALL, ".utf8");
		}

		SetAlwaysRunFlag(dxlib_d.DxDataType.TRUE);

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
