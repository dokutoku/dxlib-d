// -------------------------------------------------------------------------------
//
//         DXライブラリ        Android専用関数プロトタイプ宣言用ヘッダファイル
//
//                 Ver 3.22c
//
// -------------------------------------------------------------------------------
module dxlib_d.DxFunctionAndroid;


version (Android):

extern (C):
nothrow @nogc:

// インクルード ------------------------------------------------------------------
/+
#include <android/native_activity.h>
#include <android/window.h>
+/
private static import dxlib_d.DxDataTypeAndroid;
private static import dxlib_d.DxLib;

// 定義---------------------------------------------------------------------------

// 関数プロトタイプ宣言-----------------------------------------------------------

extern (C++, DxLib) {
	/**
	 * アプリで使用しているNativeActivityを取得する
	 */
	extern const (ANativeActivity)* GetNativeActivity();

	/**
	 * AndroidのAPIレベルを取得する
	 */
	extern int GetAndroidAPILevel();

	/**
	 * ソフトのデータ保存用のディレクトリパスを取得する
	 */
	extern int GetInternalDataPath(dxlib_d.DxDataTypeAndroid.TCHAR* PathBuffer, int PathBufferBytes);

	/**
	 * ソフトの外部データ保存用のディレクトリパスを取得する
	 *      PathBuffer = パスを保存するバッファ
	 *      PathBufferBytes = パスを保存するバッファのサイズ(単位:バイト)
	 *      PathIndex = 外部データ保存用のディレクトリパスの番号(複数個ある場合があるので)
	 *      IsRemovableFlag = PathIndexで指定したパスが取り外し可能なデバイスかどうかを保存するint型変数のアドレス(格納された値 dxlib_d.DxDataType.TRUE:取り外し可能(SDカード等)  dxlib_d.DxDataType.FALSE:取り外し不可能(内蔵ストレージ等))
	 */
	extern int GetExternalDataPath(dxlib_d.DxDataTypeAndroid.TCHAR* PathBuffer, int PathBufferBytes, int PathIndex = 0, int* IsRemovableFlag = null);

	/**
	 * ソフトの外部データ保存用のディレクトリパスの数を取得する
	 */
	extern int GetExternalDataPathNum();

	/**
	 * 端末に設定されている言語を取得する
	 *
	 * Returns: -1:エラー 0以上:言語名文字列の格納に必要なバイト数
	 */
	extern int GetLanguage(dxlib_d.DxDataTypeAndroid.TCHAR* StringBuffer, int StringBufferSize);

	/**
	 * 端末に設定されている国を取得する
	 *
	 * Returns: -1:エラー 0以上:国名文字列の格納に必要なバイト数
	 */
	extern int GetCountry(dxlib_d.DxDataTypeAndroid.TCHAR* StringBuffer, int StringBufferSize);

	/**
	 * メモリ情報を取得する
	 *      TotalMemory = 総メモリ容量を代入する変数(単位:byte)、(情報の取得が不要な場合はnullを渡す)
	 *      FreeMrmoyy = 空きメモリ容量を代入する変数(単位:byte)、(情報の取得が不要な場合はnullを渡す)
	 *      UseMemory = アプリが使用しているメモリ容量を代入する変数(単位:byte)、(情報の取得が不要な場合はnullを渡す)、(使用メモリ量の取得は非常に処理負荷が高いので、不要な場合は必ずnullを渡すようにしてください)
	 */
	extern int GetAndroidMemoryInfo(dxlib_d.DxDataTypeAndroid.LONGLONG* TotalMemory, dxlib_d.DxDataTypeAndroid.LONGLONG* FreeMemory, dxlib_d.DxDataTypeAndroid.LONGLONG* UseMemory);

	/**
	 * ディスプレイの解像度を取得する
	 */
	extern int GetAndroidDisplayResolution(int* SizeX, int* SizeY);

	/**
	 * ディスプレイを本体設定に従って時間経過でスリープ状態になることを許可するかどうかを設定する
	 *
	 * Params:
	 *      Flag = dxlib_d.DxDataType.TRUE:スリープ状態になることを許可しない  dxlib_d.DxDataType.FALSE:スリープ状態を許可する(デフォルト)
	 */
	extern int SetKeepScreenOnFlag(int Flag);

	/**
	 * 加速度センサーのベクトル値を取得する
	 */
	extern dxlib_d.DxLib.VECTOR GetAccelerometerVector();

	/**
	 * センサーから得られる方角を取得する
	 * 縦持ち(地面に対して端末を垂直に持った状態)の場合に正しく値が取得できます
	 * 戻り値のx:方角(単位:ラジアン  0.0f:北  π/2.0f:東  -π/2.0f:西  -π or π:南)
	 * 戻り値のy:前後の傾斜(単位:ラジアン  0.0f:端末が縦持ちで垂直(逆さまで垂直の場合含む)の状態  π/2.0f:前方方向に90度倒した状態(画面が空を向いている状態)  -π/2.0f:後方方向に90度倒した状態(画面が地面を向いている状態))
	 * 戻り値のz:左右の傾斜(単位:ラジアン  0.0f:端末が縦持ちで垂直の状態  π/2.0f:右方向に90度倒した状態  -π/2.0f:左方向に90度倒した状態  -π or π:端末が上下さかさまで垂直の状態)
	 */
	extern dxlib_d.DxLib.VECTOR GetOrientationVector();

	/**
	 * センサーのベクトル値を取得する
	 *
	 * Params:
	 *      SensorType = DX_ANDROID_SENSOR_ACCELEROMETERなど
	 */
	extern dxlib_d.DxLib.VECTOR GetAndroidSensorVector(int SensorType);

	/**
	 * センサーが有効かどうかを取得する
	 *
	 * Params:
	 *      SensorType = DX_ANDROID_SENSOR_ACCELEROMETERなど
	 *
	 * Returns: dxlib_d.DxDataType.TRUE:有効 dxlib_d.DxDataType.FALSE:無効
	 */
	extern int CheckAndroidSensor(int SensorType);

	// 振動機能関係(使用するにはAndroidManifest.xmlに<uses-permission android:name="android.permission.VIBRATE" />を書き加える必要があります)

	/**
	 * 振動機能があるか取得する
	 *
	 * Returns: dxlib_d.DxDataType.TRUE:振動機能あり  dxlib_d.DxDataType.FALSE:振動機能なし
	 */
	extern int Vibrator_hasVibrator();

	/**
	 * 振動機能に振幅制御(振動の強さ制御)機能があるかどうかを取得する
	 *
	 * Returns: dxlib_d.DxDataType.TRUE:振幅制御ができる  dxlib_d.DxDataType.FALSE:振幅制御はできない
	 */
	extern int Vibrator_hasAmplitudeControl();

	/**
	 * 振動を開始する
	 *      Milliseconds = 振動させる時間(単位:ミリ秒)
	 *      Amplitude = 振動の強さ(0(振動なし)~255(最大振幅))、振動の強さの制御に対応していない場合は無視されます
	 */
	extern int Vibrator_vibrate(int Milliseconds, int Amplitude);

	/**
	 * 振動パターン付きの振動を開始する
	 *      Timings = 振動パターンを定義する時間(単位:ミリ秒)の配列(Timings[0]:振動を開始するまでの待ち時間、Timings[1]:振動し続ける時間、Timings[2]:振動を停止している時間、Timings[3]:振動し続ける時間、Timings[4]:振動を停止している時間  以下繰り返し)
	 *      TimingsLength = Timingsの配列の長さ
	 *      Repeat = 振動パターンを繰り返す場合の配列の要素番号(例 0:最初から繰り返し  1:配列要素の1から繰り返し)、-1で繰り返し無し
	 */
	extern int Vibrator_vibrate_with_OnOffTimings(int* Timings, int TimingsLength, int Repeat);

	/**
	 * 振幅制御付き(振動の強さ指定付き)振動を開始する(Vibrator_hasAmplitudeControlの戻り値がdxlib_d.DxDataType.TRUEの場合のみ使用可能)
	 *      Timings = 振動の強さを変更するタイミング(単位:ミリ秒)の配列
	 *      Amplitudes = 振動の強さ(0(振動なし)~255(最大振幅))の配列
	 *      ArrayLength = TimingsとAmplitudesの配列の長さ(配列の長さはどちらも同じである必要があります)
	 *      Repeat = TimingsとAmplitudesで示される振動パターンを繰り返す場合の配列の要素番号(例 0:最初から繰り返し  1:配列要素の1から繰り返し)、-1で繰り返し無し
	 */
	extern int Vibrator_vibrate_with_Amplitudes(int* Timings, int* Amplitudes, int ArrayLength, int Repeat);

	/**
	 * 振動を中断する
	 */
	extern int Vibrator_cancel();

	/**
	 * 曜日や週に関する情報を取得する
	 *      DayOfWeek = 曜日(1:日曜日 2:月曜日 3:火曜日 4:水曜日 5:木曜日 6:金曜日 7:土曜日)
	 *      WeekOfMonth = 今日が今月の何週目なのかの値(1:1週目  2:2週目  3:3週目  4:4週目  5:5週目)
	 *      DayOfWeekInMonth = 今日の曜日が今月何回目に当たるか、の値(1:1回目  2:2回目  3:3回目  4:4回目 ...)
	 */
	extern int GetAndroidWeekInfo(int* DayOfWeek, int* WeekOfMonth, int* DayOfWeekInMonth);

	/**
	 * res/values/strings.xmlのstringリソースを取得する
	 *      ValueName = string情報名
	 *      StringBuffer = ValueNameが示す文字列を格納するバッファの先頭アドレス
	 *      StringBufferBytes = StringBufferのサイズ(単位:バイト)
	 *
	 * Returns: -1:指定のstring情報は無かった  -1以外:StringBufferに必要なバッファのサイズ(単位:バイト)
	 */
	extern int GetAndroidResource_Strings_String(const (dxlib_d.DxDataTypeAndroid.TCHAR)* ValueName, dxlib_d.DxDataTypeAndroid.TCHAR* StringBuffer, int StringBufferBytes);
	extern int GetAndroidResource_Strings_StringWithStrLen(const (dxlib_d.DxDataTypeAndroid.TCHAR)* ValueName, size_t ValueNameLength, dxlib_d.DxDataTypeAndroid.TCHAR* StringBuffer, int StringBufferBytes);

	/**
	 * AndroidManifest.xmlに書かれた<meta-data android:name="test0" android:value="abcde" />などのメタデータの文字列を取得する
	 *      ValueName = メタデータ名
	 *      StringBuffer = ValueNameが示す文字列を格納するバッファの先頭アドレス
	 *      StringBufferBytes = StringBufferのサイズ(単位:バイト)
	 *
	 * Returns: -1:指定のメタデータは無かった  -1以外:StringBufferに必要なバッファのサイズ(単位:バイト)
	 */
	extern int GetAndroidMetaData_String(const (dxlib_d.DxDataTypeAndroid.TCHAR)* ValueName, dxlib_d.DxDataTypeAndroid.TCHAR* StringBuffer, int StringBufferBytes);
	extern int GetAndroidMetaData_StringWithStrLen(const (dxlib_d.DxDataTypeAndroid.TCHAR)* ValueName, size_t ValueNameLength, dxlib_d.DxDataTypeAndroid.TCHAR* StringBuffer, int StringBufferBytes);

	/*
	 * AndroidManifest.xmlに書かれた<meta-data android:name="bool0" android:value="true" />などのBoolean型のメタデータを取得する
	 * ValueName:メタデータ名
	 * Returns: -1:指定のメタデータは無かった  dxlib_d.DxDataType.TRUE:指定のメタデータはtrueだった   dxlib_d.DxDataType.FALSE:指定のメタデータはfalseだった
	 */
	//extern int GetAndroidMetaData_Boolean(const (dxlib_d.DxDataTypeAndroid.TCHAR)* ValueName);
	//extern int GetAndroidMetaData_BooleanWithStrLen(const (dxlib_d.DxDataTypeAndroid.TCHAR)* ValueName, size_t ValueNameLength);

	/**
	 * 通知を発行する
	 *      Title = タイトル
	 *      SubTitle = サブタイトル
	 *      Icon = アイコン(-1でデフォルトのアイコン)
	 *      ShowWhen = 通知時刻を表示するか(dxlib_d.DxDataType.TRUE:表示する  dxlib_d.DxDataType.FALSE:表示しない)
	 *      AutoCancel = 通知がタップされたら通知を削除するか(dxlib_d.DxDataType.TRUE:タップされたら通知を削除する   dxlib_d.DxDataType.FALSE:Cancel されるまで通知を削除しない)
	 *      NotifyID = 通知ID
	 *      Vibrate = 振動パターン用のint型配列(時間の単位はミリ秒)、nullの場合は振動なし(Vibrate[0]:振動停止時間  Vibrate[1]:振動時間  Vibrate[2]:振動停止時間  Vibrate[3]:振動時間  ... 以下繰り返し)
	 *      VibrateLength = Vibrate 配列の要素数
	 *      LightColor = 通知時のライトの色(GetColorで取得)、LightOnTime か LightOffTimeが0の場合はライトの点灯無し
	 *      LightOnTime = ライトの点灯時間(単位:ミリ秒)
	 *      LightOffTime = ライトの消灯時間(単位:ミリ秒)
	extern int AndroidNotification(const (dxlib_d.DxDataTypeAndroid.TCHAR)* Title, const (dxlib_d.DxDataTypeAndroid.TCHAR)* SubTitle, int Icon = -1, int ShowWhen = dxlib_d.DxDataTypeAndroid.TRUE, int AutoCancel = dxlib_d.DxDataTypeAndroid.TRUE, int NotifyId = 0, int* Vibrate = null, int VibrateLength = 0, uint LightColor = 0, int LightOnTime = 0, int LightOffTime = 0);
	extern int AndroidNotificationWithStrLen(const (dxlib_d.DxDataTypeAndroid.TCHAR)* Title, size_t TitleLength, const (dxlib_d.DxDataTypeAndroid.TCHAR)* SubTitle, size_t SubTitleLength, int Icon = -1, int ShowWhen = dxlib_d.DxDataTypeAndroid.TRUE, int AutoCancel = dxlib_d.DxDataTypeAndroid.TRUE, int NotifyId = 0, int* Vibrate = null, int VibrateLength = 0, uint LightColor = 0, int LightOnTime = 0, int LightOffTime = 0);

	/**
	 * 通知をキャンセルする
	 *      NotifyID = 通知ID
	 */
	extern int AndroidNotificationCancel(int NotifyId);

	/**
	 * 全ての通知をキャンセルする
	 */
	extern int AndroidNotificationCancelAll();

	/**
	 * 指定のURLをブラウザで開く(BrowserAppPackageName か BrowserAppClassNameがnullの場合は標準ブラウザで開く)
	 *      URL = 開くURL
	 *      BrowserAppPackageName = ブラウザのパッケージ名(nullで標準ブラウザ)
	 *      BrowserAppClassName = ブラウザのクラス名(nullで標準ブラウザ)
	 */
	extern int AndroidJumpURL(const (dxlib_d.DxDataTypeAndroid.TCHAR)* URL, const (dxlib_d.DxDataTypeAndroid.TCHAR)* BrowserAppPackageName = null, const (dxlib_d.DxDataTypeAndroid.TCHAR)* BrowserAppClassName = null);
	extern int AndroidJumpURLWithStrLen(const (dxlib_d.DxDataTypeAndroid.TCHAR)* URL, size_t URLLength, const (dxlib_d.DxDataTypeAndroid.TCHAR)* BrowserAppPackageName = null, size_t BrowserAppPackageNameLength = 0, const (dxlib_d.DxDataTypeAndroid.TCHAR)* BrowserAppClassName = null, size_t BrowserAppClassNameLength = 0);

	/**
	 * Wifiの電波強度を取得する(使用するにはAndroidManifest.xmlに<uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />を書き加える必要があります)
	 *
	 * Returns: 電波の強度0~100
	 */
	extern int GetWifiSignalLevel();

	/**
	 * アプリが非アクティブになった際に呼ばれるコールバック関数を登録する
	 */
	extern int SetAndroidLostFocusCallbackFunction(void function(void* Data) Callback, void* CallbackData);

	/**
	 * アプリがアクティブになった際に呼ばれるコールバック関数を登録する
	 */
	extern int SetAndroidGainedFocusCallbackFunction(void function(void* Data) Callback, void* CallbackData);

	/**
	 * アプリを終了した際に、プロセスを完全に終了するかを設定する
	 *
	 * Params:
	 *      KillProcessFlag = dxlib_d.DxDataType.TRUE:アプリを終了したら、プロセスを完全に終了する  dxlib_d.DxDataType.FALSE:アプリを終了しても、プロセスは完全には終了されない(デフォルト)
	 */
	extern int SetUseAndroidKillProcessFlag(int KillProcessFlag);

	/**
	 * OpenGL 関係の情報を取得する
	 *
	 * Params:
	 *      Version = ?
	 *      Renderer = ?
	 *      Vendor = ?
	 *      ExtensionNames = ?
	 *      Shader_Language_Version = ?
	 *      Shader_Max_Vertex_Attribs = GL_MAX_VERTEX_ATTRIBS
	 *      Shader_Max_Vertex_Uniform_Vectors = GL_MAX_VERTEX_UNIFORM_VECTORS
	 *      Shader_Max_Varying_Vectors = GL_MAX_VARYING_VECTORS
	 *      Shader_Max_Combined_Texture_Image_Units = GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS
	 *      Shader_Max_Vertex_Texture_Image_Units = GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS
	 *      Shader_Max_Texture_Image_Units = GL_MAX_TEXTURE_IMAGE_UNITS
	 *      Shader_Max_Fragment_Uniform_Vectors = GL_MAX_FRAGMENT_UNIFORM_VECTORS
	 */
	extern int GetOpenGLInfo(dxlib_d.DxDataTypeAndroid.TCHAR** Version = null, dxlib_d.DxDataTypeAndroid.TCHAR** Renderer = null, dxlib_d.DxDataTypeAndroid.TCHAR** Vendor = null, dxlib_d.DxDataTypeAndroid.TCHAR*** ExtensionNames = null, dxlib_d.DxDataTypeAndroid.TCHAR** Shader_Language_Version = null, int* Shader_Max_Vertex_Attribs = null, int* Shader_Max_Vertex_Uniform_Vectors = null, int* Shader_Max_Varying_Vectors = null, int* Shader_Max_Combined_Texture_Image_Units = null, int* Shader_Max_Vertex_Texture_Image_Units = null, int* Shader_Max_Texture_Image_Units = null, int* Shader_Max_Fragment_Uniform_Vectors = null);

	/**
	 * グラフィックハンドルのテクスチャオブジェクトを取得する
	 */
	extern uint GetGraphOpenGLESTextureObject(int GrHandle);

	/**
	 * DXライブラリが行ったOpenGL ESの設定を再度行う(特殊用途)
	 */
	extern int RefreshDxLibOpenGLESSetting();

	/**
	 * イコライザー機能を使用するかどうかを設定する(DxLib_Init呼び出し前のみ実行可能)
	 * UseFlag  dxlib_d.DxDataType.TRUE:使用する  dxlib_d.DxDataType.FALSE:使用しない
	 */
	extern int SetUseEqualizer(int UseFlag);

	// イコライザー関係関数

	/**
	 * イコライザーの与えられた周波数に最も影響を与える周波数帯域を取得します
	 *
	 * Returns: -1:エラー  0以上:周波数帯域インデックス
	 */
	extern int SearchEqualizerBandIndex(int Frequency);

	/**
	 * イコライザーに指定できる周波数帯域の数を取得する
	 */
	extern int GetEqualizerBandNum();

	/**
	 * 与えられたイコライザーの周波数帯域を与えられたゲイン値に設定します
	 */
	extern int SetEqualizerBandLevel(int BandIndex, int Level);

	/**
	 * イコライザーの指定された周波数帯域のゲイン値を取得します
	 */
	extern int GetEqualizerBandLevel(int BandIndex);

	/**
	 * イコライザーの指定された周波数帯域の周波数範囲を取得します
	 *
	 * Params:
	 *      BandIndex = ?
	 *      pMin = 最小周波数(単位:ヘルツ)
	 *      pMax = 最大周波数(単位:ヘルツ)
	 */
	extern int GetEqualizerBandFreqRange(int BandIndex, int* pMin, int* pMax);

	/**
	 * イコライザーの指定された周波数帯域の中心周波数を取得します
	 *
	 * Returns: 中心周波数(単位:ヘルツ)
	 */
	extern int GetEqualizerBandCenterFreq(int BandIndex);

	/**
	 * イコライザーの現在のプリセットを取得します
	 *
	 * Returns: プリセット番号
	 */
	extern int GetEqualizerCurrentPreset();

	/**
	 * イコライザーのプリセットの数を取得します
	 *
	 * Returns: プリセットの数
	 */
	extern int GetEqualizerPresetNum();

	/**
	 * イコライザーのプリセット名を取得します
	 *
	 * Returns: プリセット名の文字列が格納されたメモリ領域の先頭アドレス
	 */
	extern const (dxlib_d.DxDataTypeAndroid.TCHAR)* GetEqualizerPresetName(int PresetIndex);

	/**
	 * 指定したプリセットに従ってイコライザーを設定します
	 */
	extern int SetUseEqualizerPreset(int PresetIndex);
}
