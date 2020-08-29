module minimum;

import dxlib_d;

int main()

	do
	{
		version (Windows) {
			ChangeWindowMode(TRUE);
		}

		version (ANSI) {
			SetUseCharCodeFormat(DX_CHARCODEFORMAT_UTF8);
		}

		if (DxLib_Init() == -1) {
			return 1;
		}

		scope (exit) {
			DxLib_End();
		}

		DrawString(10, 10, "Hello, World!", GetColor(255, 255, 255));

		WaitKey();

		return 0;
	}
