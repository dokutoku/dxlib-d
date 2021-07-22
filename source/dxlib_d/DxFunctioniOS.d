// -------------------------------------------------------------------------------
//
//         DXライブラリ        iOS専用関数プロトタイプ宣言用ヘッダファイル
//
//                 Ver 3.22c
//
// -------------------------------------------------------------------------------
module dxlib_d.DxFunctioniOS;


version (iOS):

nothrow @nogc:

// インクルード ------------------------------------------------------------------
private static import dxlib_d.DxLib;
public import dxlib_d.DxDataType;

extern (C++, DxLib) {
	// マクロ定義---------------------------------------------------------------------

	// 振動の種類
	enum IOS_VIBRATE_ONE_STRONG_LONG = 4095;
	enum IOS_VIBRATE_TWO_STRONG_SHORT = 1011;
	enum IOS_VIBRATE_TWO_WEAK_SHORT = 1102;
	enum IOS_VIBRATE_ONE_WEAK_SHORT = 1519;
	enum IOS_VIBRATE_ONE_MIDDLE_SHORT = 1520;
	enum IOS_VIBRATE_THREE_WEAK_SHORT = 1521;

	// 構造体定義 --------------------------------------------------------------------

	package struct tagDEVICEMOTIONINFO_IOS
	{
		double Attitude_Roll = 0;
		double Attitude_Pitch = 0;
		double Attitude_Yaw = 0;
		dxlib_d.DxLib.VECTOR_D RotationRate;
		dxlib_d.DxLib.VECTOR_D Gravity;
		dxlib_d.DxLib.VECTOR_D UserAcceleration;
		dxlib_d.DxLib.VECTOR_D MagneticField;
	}

	public alias DEVICEMOTIONINFO_IOS = .tagDEVICEMOTIONINFO_IOS;

	// 関数プロトタイプ宣言-----------------------------------------------------------

	/**
	 * アプリの外部データ保存用のディレクトリパスを取得する
	 */
	extern int GetDocumentsDirPath(dxlib_d.DxDataType.TCHAR* PathBuffer, size_t PathBufferBytes);

	/**
	 * アプリのデータ保存用のディレクトリパスを取得する
	 */
	extern int GetLibraryPreferencesDirPath(dxlib_d.DxDataType.TCHAR* PathBuffer, size_t PathBufferBytes);

	/**
	 * アプリのキャッシュファイル保存用のディレクトリパスを取得する
	 */
	extern int GetLibraryCachesDirPath(dxlib_d.DxDataType.TCHAR* PathBuffer, size_t PathBufferBytes);

	/**
	 * アプリの一時ファイル保存用のディレクトリパスを取得する
	 */
	extern int GetTmpDirPath(dxlib_d.DxDataType.TCHAR* PathBuffer, size_t PathBufferBytes);

	/**
	 * ディスプレイの解像度を取得する
	 */
	extern int GetDisplayResolution_iOS(int* SizeX, int* SizeY);

	/**
	 * 端末に設定されている言語を取得する
	 *
	 * Returns: -1:エラー 0以上:言語名文字列の格納に必要なバイト数
	 */
	extern int GetLanguage_iOS(dxlib_d.DxDataType.TCHAR* StringBuffer, int StringBufferSize);

	/**
	 * 端末に設定されている国を取得する
	 *
	 * Returns: -1:エラー 0以上:国名文字列の格納に必要なバイト数
	 */
	extern int GetCountry_iOS(dxlib_d.DxDataType.TCHAR* StringBuffer, int StringBufferSize);

	/**
	 * 文字列入力ダイアログを出す
	 *      StringBuffer = 入力された文字列を代入するバッファの先頭アドレス
	 *      StringBufferBytes = 入力された文字列を代入するバッファのサイズ(単位:バイト)
	 *      Title = ダイアログのタイトル
	 *      Message = ダイアログのメッセージ
	 *      IsBlock = 入力が完了するまで関数から出てこないかどうか(1:入力が完了するまで関数から出てこない  0:ダイアログを表示したら関数から出てくる(入力完了のチェックはGetStateInputStringDialogBoxで行う))
	 *
	 * Returns: 0:成功  2:キャンセルされた  -1:エラー発生
	 */
	extern int StartInputStringDialogBox(dxlib_d.DxDataType.TCHAR* StringBuffer, size_t StringBufferBytes, const (dxlib_d.DxDataType.TCHAR)* Title, const (dxlib_d.DxDataType.TCHAR)* Message, int IsBlock);

	/**
	 * 文字列入力ダイアログの処理が終わったかどうかを取得する
	 *
	 * Returns: 0:入力中   1:入力完了  2:キャンセルされた
	 */
	extern int GetStateInputStringDialogBox();

	/**
	 * モーションセンサーの情報を取得する
	 */
	extern int GetDeviceMotionInfo_iOS(.DEVICEMOTIONINFO_IOS* DeviceMotionInfo);

	/**
	 * 振動を再生する
	 *      VibrationType = 振動の種類(IOS_VIBRATE_ONE_STRONG_LONGなど)
	 */
	extern int PlayVibration_iOS(int VibrationType);
}
