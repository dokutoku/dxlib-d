// -------------------------------------------------------------------------------
//
//         DXライブラリ        Windows専用関数プロトタイプ宣言用
//
//                 Ver 3.22c
//
// -------------------------------------------------------------------------------
module dxlib_d.DxFunctionWin;


version (Windows):

nothrow @nogc:

private static import dxlib_d.DxLib;
public import dxlib_d.DxDataType;

// 関数プロトタイプ宣言------------------------------------------------------------------

extern (C++, DxLib) {
	// DxWindow.cpp関数プロトタイプ宣言

	// 便利関数

	/**
	 * 指定の名前、タイプのリソースのアドレスとサイズを取得する
	 *
	 * Returns: -1:失敗  0:成功
	 */
	extern int GetResourceInfo(const (dxlib_d.DxDataType.TCHAR)* ResourceName, const (dxlib_d.DxDataType.TCHAR)* ResourceType, void** DataPointerP, size_t* DataSizeP);

	///Ditto
	extern int GetResourceInfoWithStrLen(const (dxlib_d.DxDataType.TCHAR)* ResourceName, size_t ResourceNameLength, const (dxlib_d.DxDataType.TCHAR)* ResourceType, size_t ResourceTypeLength, void** DataPointerP, size_t* DataSizeP);

	/**
	 * リソースID値からリソース名を取得する
	 */
	extern const (dxlib_d.DxDataType.TCHAR)* GetResourceIDString(int ResourceID);

	// ウインドウ関係情報取得関数

	/**
	 * GetWindowClientRectの旧名称
	 */
	extern int GetWindowCRect(dxlib_d.DxDataType.RECT* RectBuf);

	/**
	 * メインウインドウのクライアント領域を取得する
	 */
	extern int GetWindowClientRect(dxlib_d.DxDataType.RECT* RectBuf);

	/**
	 * メインウインドウの枠の部分も含めた全体の領域を取得する
	 */
	extern int GetWindowFrameRect(dxlib_d.DxDataType.RECT* RectBuf);

	/**
	 * メインウインドウがアクティブかどうかを取得する
	 *
	 * Returns: dxlib_d.DxDataType.TRUE:アクティブ  dxlib_d.DxDataType.FALSE:非アクティブ
	 */
	extern int GetWindowActiveFlag();

	/**
	 * メインウインドウが最小化されているかどうかを取得する
	 *
	 * Returns: dxlib_d.DxDataType.TRUE:最小化されている  dxlib_d.DxDataType.FALSE:最小化されていない
	 */
	extern int GetWindowMinSizeFlag();

	/**
	 * メインウインドウが最大化されているかどうかを取得する
	 *
	 * Returns: dxlib_d.DxDataType.TRUE:最大化されている  dxlib_d.DxDataType.FALSE:最大化されていない
	 */
	extern int GetWindowMaxSizeFlag();

	/**
	 * GetWindowActiveFlagの別名関数
	 */
	extern int GetActiveFlag();

	/**
	 * メインウインドウのウインドウハンドルを取得する
	 */
	extern dxlib_d.DxDataTypeWin.HWND GetMainWindowHandle();

	/**
	 * ウインドウモードで起動しているかどうかを取得する
	 *
	 * Returns: dxlib_d.DxDataType.TRUE:ウインドウモード  dxlib_d.DxDataType.FALSE:フルスクリーンモード
	 */
	extern int GetWindowModeFlag();

	/**
	 * 起動時のデスクトップの画面情報を取得する
	 *
	 * Params:
	 *      SizeX = デスクトップの横解像度を格納する変数のポインタ
	 *      SizeY = 縦解像度を格納する変数のポインタ
	 *      ColorBitDepth = 画面カラービット数を格納する変数のポインタ
	 *      RefreshRate = デスクトップのリフレッシュレートを格納する変数のポインタ
	 *      LeftTopX = デスクトップの左上X座標を格納する変数のポインタ
	 *      LeftTopY = デスクトップの左上Y座標を格納する変数のポインタ
	 *      PixelSizeX = OSの拡大率設定の影響を受けないデスクトップの横解像度を格納する変数のポインタ
	 *      PixelSizeY = OSの拡大率設定の影響を受けないデスクトップの縦解像度を格納する変数のポインタ
	 *      XDpi = X軸のDPI
	 *      YDpi = Y軸のDPI
	 */
	extern int GetDefaultState(int* SizeX, int* SizeY, int* ColorBitDepth, int* RefreshRate = null, int* LeftTopX = null, int* LeftTopY = null, int* PixelSizeX = null, int* PixelSizeY = null, int* XDpi = null, int* YDpi = null);

	/**
	 * モニターのDPIを取得する
	 */
	extern int GetMonitorDpi(int* XDpi, int* YDpi, int MonitorIndex = -1);

	/**
	 * メインウインドウが非アクティブになり、処理が一時停止していたかどうかを取得する
	 *
	 * Params:
	 *      ResetFlag = dxlib_d.DxDataType.TRUE:状態をリセット dxlib_d.DxDataType.FALSE:状態をリセットしない
	 *
	 * Returns: 0:一時停止はしていない  1:一時停止していた
	 */
	extern int GetNoActiveState(int ResetFlag = dxlib_d.DxDataType.TRUE);

	/**
	 * マウスポインタを表示するかどうかの設定を取得する
	 *
	 * Returns: dxlib_d.DxDataType.TRUE:表示する  dxlib_d.DxDataType.FALSE:表示しない
	 */
	extern int GetMouseDispFlag();

	/**
	 * メインウインドウが非アクティブになっても処理を実行し続けるかどうかの設定を取得する
	 *
	 * Returns: dxlib_d.DxDataType.TRUE:実行する  dxlib_d.DxDataType.FALSE:停止する
	 */
	extern int GetAlwaysRunFlag();

	/**
	 * DXライブラリとDirectXのバージョンとWindowsのバージョン番号を取得する
	 */
	extern int _GetSystemInfo(int* DxLibVer, int* DirectXVer, int* WindowsVer);

	/**
	 * PCの情報を取得する
	 *
	 * Params:
	 *      OSString = ?
	 *      DirectXString = ?
	 *      CPUString = ?
	 *      CPUSpeed = 単位MHz
	 *      FreeMemorySize = 単位MByte
	 *      TotalMemorySize = ?
	 *      VideoDriverFileName = ?
	 *      VideoDriverString = ?
	 *      FreeVideoMemorySize = 単位MByte
	 *      TotalVideoMemorySize = ?
	 */
	extern int GetPcInfo(dxlib_d.DxDataType.TCHAR* OSString, dxlib_d.DxDataType.TCHAR* DirectXString, dxlib_d.DxDataType.TCHAR* CPUString, int* CPUSpeed, double* FreeMemorySize, double* TotalMemorySize, dxlib_d.DxDataType.TCHAR* VideoDriverFileName, dxlib_d.DxDataType.TCHAR* VideoDriverString, double* FreeVideoMemorySize, double* TotalVideoMemorySize);

	/**
	 * MMXが使えるかどうかの情報を得る
	 */
	extern int GetUseMMXFlag();

	/**
	 * SSEが使えるかどうかの情報を得る
	 */
	extern int GetUseSSEFlag();

	/**
	 * SSE2が使えるかどうかの情報を得る
	 */
	extern int GetUseSSE2Flag();

	/**
	 * ウインドウを閉じようとしているかの情報を得る
	 */
	extern int GetWindowCloseFlag();

	/**
	 * ソフトのインスタンスを取得する
	 */
	extern dxlib_d.DxDataType.HINSTANCE GetTaskInstance();

	/**
	 * リージョンを使っているかどうかを取得する
	 */
	extern int GetUseWindowRgnFlag();

	/**
	 * ウインドウのサイズを変更できる設定になっているかどうかを取得する
	 *
	 * Returns: dxlib_d.DxDataType.TRUE:変更できるようになっている  dxlib_d.DxDataType.FALSE:変更できないようになっている
	 */
	extern int GetWindowSizeChangeEnableFlag(int* FitScreen = null);

	/**
	 * 描画画面のサイズに対するウインドウサイズの比率を取得する
	 *
	 * Returns: ExRateXに代入される値と同じ
	 */
	extern double GetWindowSizeExtendRate(double* ExRateX = null, double* ExRateY = null);

	/**
	 * メインウインドウのクライアント領域のサイズを取得する
	 */
	extern int GetWindowSize(int* Width, int* Height);

	/**
	 * ウインドウの上下左右の縁の幅を取得する
	 */
	extern int GetWindowEdgeWidth(int* LeftWidth, int* RightWidth, int* TopWidth, int* BottomWidth);

	/**
	 * メインウインドウのデスクトップ上の左上端座標を取得する(枠も含める)
	 */
	extern int GetWindowPosition(int* x, int* y);

	/**
	 * メインウインドウの閉じるボタンが押されたかどうかを取得する
	 */
	extern int GetWindowUserCloseFlag(int StateResetFlag = dxlib_d.DxDataType.FALSE);

	/**
	 * メインウインドウの最大化ボタンが押されたかどうかを取得する、SetWindowMaximizeButtonBehavior(1);が実行されている場合のみ有効な関数
	 *
	 * Params:
	 *      StateResetFlag = dxlib_d.DxDataType.TRUE:押された状態をリセットする   dxlib_d.DxDataType.FALSE:押された状態をリセットしない
	 */
	extern int CheckWindowMaximizeButtonInput(int StateResetFlag = dxlib_d.DxDataType.TRUE);

	/**
	 * DXライブラリの描画機能を使うかどうかの設定を取得する
	 */
	extern int GetNotDrawFlag();

	/**
	 * WM_PAINTメッセージが来たかどうかを取得する
	 *
	 * Returns: dxlib_d.DxDataType.TRUE:WM_PAINTメッセージが来た(一度取得すると以後、再び WM_PAINTメッセージが来るまでdxlib_d.DxDataType.FALSEが返ってくるようになる)  dxlib_d.DxDataType.FALSE:WM_PAINTメッセージは来ていない
	 */
	extern int GetPaintMessageFlag();

	/**
	 * パフォーマンスカウンタが有効かどうかを取得する
	 *
	 * Returns: dxlib_d.DxDataType.TRUE:有効  dxlib_d.DxDataType.FALSE:無効
	 */
	extern int GetValidHiPerformanceCounter();

	/**
	 * 入力されたシステム文字を取得する
	 */
	extern dxlib_d.DxDataType.TCHAR GetInputSystemChar(int DeleteFlag);

	// 設定系関数

	/**
	 * ウインドウモードを変更する
	 */
	extern int ChangeWindowMode(int Flag);

	/**
	 * DXライブラリの文字列処理で前提とする文字列セットを設定する
	 *
	 * Params:
	 *      CharSet = DX_CHARSET_SHFTJIS等
	 */
	extern int SetUseCharSet(int CharSet);

	/**
	 * アクティブウインドウが他のソフトに移っている際に表示する画像をファイルから読み込む(FileNameにnullを渡すことで解除)
	 */
	extern int LoadPauseGraph(const (dxlib_d.DxDataType.TCHAR)* FileName);

	///Ditto
	extern int LoadPauseGraphWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength);

	/**
	 * アクティブウインドウが他のソフトに移っている際に表示する画像をメモリから読み込む
	 *
	 * Params:
	 *      MemImage = ファイルイメージの先頭アドレス,nullにすることで設定解除
	 *      MemImageSize = ファイルイメージのサイズ(単位:Byte)
	 */
	extern int LoadPauseGraphFromMem(const (void)* MemImage, int MemImageSize);

	/**
	 * メインウインドウのアクティブ状態に変化があったときに呼ばれるコールバック関数を設定する
	 *
	 * Params:
	 *      CallBackFunction = 呼ばれるコールバック関数、nullを渡すと設定解除
	 *      UserData = CallBackFunctionの第2引数に渡される値
	 */
	extern int SetActiveStateChangeCallBackFunction(int function(int ActiveState, void* UserData) CallBackFunction, void* UserData);

	/**
	 * メインウインドウのウインドウテキストを変更する
	 */
	extern int SetWindowText(const (dxlib_d.DxDataType.TCHAR)* WindowText);

	///Ditto
	extern int SetWindowTextWithStrLen(const (dxlib_d.DxDataType.TCHAR)* WindowText, size_t WindowTextLength);

	/**
	 * SetWindowTextの別名関数
	 */
	extern int SetMainWindowText(const (dxlib_d.DxDataType.TCHAR)* WindowText);

	///Ditto
	extern int SetMainWindowTextWithStrLen(const (dxlib_d.DxDataType.TCHAR)* WindowText, size_t WindowTextLength);

	/**
	 * メインウインドウのクラス名を設定する(DxLib_Initの前でのみ使用可能)
	 */
	extern int SetMainWindowClassName(const (dxlib_d.DxDataType.TCHAR)* ClassName);

	///Ditto
	extern int SetMainWindowClassNameWithStrLen(const (dxlib_d.DxDataType.TCHAR)* ClassName, size_t ClassNameLength);

	/**
	 * メインウインドウで使用するアイコンのIDをセットする
	 */
	extern int SetWindowIconID(int ID);

	/**
	 * メインウインドウで使用するアイコンのハンドルをセットする
	 */
	extern int SetWindowIconHandle(dxlib_d.DxDataTypeWin.HICON Icon);

	/**
	 * 最大化ボタンやALT+ENTERキーによる非同期なウインドウモードの変更の機能の設定を行う
	 *
	 * Params:
	 *      Flag = 非同期ウインドウモード変更を有効にするかどうかのフラグ(dxlib_d.DxDataType.TRUE:有効にする  dxlib_d.DxDataType.FALSE:無効にする(デフォルト))
	 *      CallBackFunction = 非同期ウインドウモード変更が行われた場合に呼ばれるコールバック関数のアドレス
	 *      Data = CallBackFunctionの引数に渡されるvoid型のポインタ
	 */
	extern int SetUseASyncChangeWindowModeFunction(int Flag, void function(void*) CallBackFunction, void* Data);

	/**
	 * シャットダウンによるソフトの強制終了の際に呼ばれるコールバック関数を登録する(Messageはコールバック関数の終了を待つ間表示されるメッセージ)
	 */
	extern int SetShutdownCallbackFunction(void function(void*) *CallbackFunction, void* Data, const (dxlib_d.DxDataType.TCHAR)* Message);

	/**
	 * メインウインドウのスタイルを変更する
	 */
	extern int SetWindowStyleMode(int Mode);

	/**
	 * メインウインドウの奥行き位置を変更する
	 *
	 * Params:
	 *      ZType = DX_WIN_ZTYPE_TOP等
	 *      WindowActivateFlag = ?
	 */
	extern int SetWindowZOrder(int ZType, int WindowActivateFlag = dxlib_d.DxDataType.TRUE);

	/**
	 * メインウインドウの端を掴んでウインドウのサイズを変更できるようにするかどうかの設定を行う
	 *
	 * Params:
	 *      Flag = 変更を可能にするかどうか(dxlib_d.DxDataType.TRUE:可能にする  dxlib_d.DxDataType.FALSE:不可能にする(デフォルト))
	 *      FitScreen = ウインドウのクライアント領域に画面をフィットさせる(拡大させる)かどうか  dxlib_d.DxDataType.TRUE:フィットさせる  dxlib_d.DxDataType.FALSE:フィットさせない
	 */
	extern int SetWindowSizeChangeEnableFlag(int Flag, int FitScreen = dxlib_d.DxDataType.TRUE);

	/**
	 * 描画画面のサイズに対するメインウインドウサイズの比率を設定する(ExRateYがマイナスの場合はExRateXの値がExRateYにも使用されます)
	 */
	extern int SetWindowSizeExtendRate(double ExRateX, double ExRateY = -1.0);

	/**
	 * メインウインドウのクライアント領域のサイズを設定する
	 */
	extern int SetWindowSize(int Width, int Height);

	/**
	 * メインウインドウのクライアント領域の最大サイズを設定する(SetWindowSizeChangeEnableFlagの第一引数をdxlib_d.DxDataType.TRUEで呼び出して、ウインドウのサイズが変更できる状態でのみ使用されるパラメータです)
	 */
	extern int SetWindowMaxSize(int MaxWidth, int MaxHeight);

	/**
	 * メインウインドウのクライアント領域の最小サイズを設定する(SetWindowSizeChangeEnableFlagの第一引数をdxlib_d.DxDataType.TRUEで呼び出して、ウインドウのサイズが変更できる状態でのみ使用されるパラメータです)
	 */
	extern int SetWindowMinSize(int MinWidth, int MinHeight);

	/**
	 * メインウインドウの位置を設定する(枠も含めた左上座標)
	 */
	extern int SetWindowPosition(int x, int y);

	/**
	 * タスクスイッチを有効にするかどうかを設定する
	 */
	extern int SetSysCommandOffFlag(int Flag, const (dxlib_d.DxDataType.TCHAR)* HookDllPath = null);

	///Ditto
	extern int SetSysCommandOffFlagWithStrLen(int Flag, const (dxlib_d.DxDataType.TCHAR)* HookDllPath = null, size_t HookDllPathLength = 0);

	/**
	 * メインウインドウの最大化ボタンが押されたときの挙動を設定する(BehaviorType 0:標準動作 1:標準動作は行わず、最大化ボタンが押されたかどうかはCheckWindowMaximizeButtonInputで判定する)
	 */
	extern int SetWindowMaximizeButtonBehavior(int BehaviorType);

	/**
	 * メインウインドウへのメッセージをフックするウインドウプロージャを登録する
	 */
	extern int SetHookWinProc(dxlib_d.DxDataTypeWin.WNDPROC WinProc);

	/**
	 * SetHookWinProcで設定したウインドウプロージャの戻り値を使用するかどうかを設定する、SetHookWinProcで設定したウインドウプロージャの中でのみ使用可能
	 *
	 * Params:
	 *      UseFlag = dxlib_d.DxDataType.TRUE:戻り値を使用して、DXライブラリのウインドウプロージャの処理は行わない  dxlib_d.DxDataType.FALSE:戻り値は使用せず、ウインドウプロージャから出た後、DXライブラリのウインドウプロージャの処理を行う
	 */
	extern int SetUseHookWinProcReturnValue(int UseFlag);

	/**
	 * DXライブラリを使用したソフトの二重起動を可能にするかどうかの設定を行う
	 *
	 * Params:
	 *      Flag = dxlib_d.DxDataType.TRUE:可能にする  dxlib_d.DxDataType.FALSE:不可能にする(デフォルト)
	 */
	extern int SetDoubleStartValidFlag(int Flag);

	/**
	 * DXライブラリを使用したソフトが既に起動しているかどうかを取得する
	 *
	 * Returns: dxlib_d.DxDataType.TRUE:既に起動している  dxlib_d.DxDataType.FALSE:起動していない
	 */
	extern int CheckDoubleStart();

	/**
	 * メッセージ処理をDXライブラリに肩代わりしてもらうウインドウを追加する
	 */
	extern int AddMessageTakeOverWindow(dxlib_d.DxDataTypeWin.HWND Window);

	/**
	 * メッセージ処理をDXライブラリに肩代わりしてもらうウインドウを減らす
	 */
	extern int SubMessageTakeOverWindow(dxlib_d.DxDataTypeWin.HWND Window);

	/**
	 * メインウインドウの初期位置を設定する
	 */
	extern int SetWindowInitPosition(int x, int y);

	/**
	 * DXライブラリのウインドウ関連の機能を使用しないかどうかを設定する
	 *
	 * Params:
	 *      Flag = dxlib_d.DxDataType.TRUE:使用しない  dxlib_d.DxDataType.FALSE:使用する(デフォルト)
	 */
	extern int SetNotWinFlag(int Flag);

	/**
	 * DXライブラリの描画機能を使うかどうかを設定する
	 *
	 * Params:
	 *      Flag = dxlib_d.DxDataType.TRUE:使用しない  dxlib_d.DxDataType.FALSE:使用する(デフォルト)
	 */
	extern int SetNotDrawFlag(int Flag);

	/**
	 * DXライブラリのサウンド機能を使うかどうかを設定する
	 *
	 * Params:
	 *      Flag = dxlib_d.DxDataType.TRUE:使用しない  dxlib_d.DxDataType.FALSE:使用する(デフォルト)
	 */
	extern int SetNotSoundFlag(int Flag);

	/**
	 * DXライブラリの入力状態の取得機能を使うかどうかを設定する
	 *
	 * Params:
	 *      Flag = dxlib_d.DxDataType.TRUE:使用しない  dxlib_d.DxDataType.FALSE:使用する(デフォルト)
	 */
	extern int SetNotInputFlag(int Flag);

	/**
	 * DXライブラリでメッセージ処理を行うダイアログボックスを登録する
	 */
	extern int SetDialogBoxHandle(dxlib_d.DxDataTypeWin.HWND WindowHandle);

	/**
	 * メインウインドウを表示するかどうかを設定する
	 *
	 * Params:
	 *      Flag = dxlib_d.DxDataType.TRUE:表示する  dxlib_d.DxDataType.FALSE:表示しない
	 */
	extern int SetWindowVisibleFlag(int Flag);

	/**
	 * メインウインドウを最小化するかどうかを設定する
	 *
	 * Params:
	 *      Flag = dxlib_d.DxDataType.TRUE:最小化する  dxlib_d.DxDataType.FALSE:最小化を解除
	 */
	extern int SetWindowMinimizeFlag(int Flag);

	/**
	 * メインウインドウの×ボタンを押した時にDXライブラリが自動的にウインドウを閉じるかどうかを設定する
	 *
	 * Params:
	 *      Flag = dxlib_d.DxDataType.TRUE:自動的に閉じる(デフォルト)  dxlib_d.DxDataType.FALSE:閉じない
	 */
	extern int SetWindowUserCloseEnableFlag(int Flag);

	/**
	 * DXライブラリ終了時にPostQuitMessageを呼ぶかどうかを設定する
	 *
	 * Params:
	 *      Flag = dxlib_d.DxDataType.TRUE:PostQuitMessageを呼ぶ(デフォルト)  dxlib_d.DxDataType.FALSE:呼ばない
	 */
	extern int SetDxLibEndPostQuitMessageFlag(int Flag);

	/**
	 * DXライブラリで使用するウインドウのハンドルをセットする(DxLib_Initを実行する以前でのみ有効)
	 */
	extern int SetUserWindow(dxlib_d.DxDataTypeWin.HWND WindowHandle);

	/**
	 * DXライブラリで使用する表示用の子ウインドウのハンドルをセットする(DxLib_Initを実行する以前でのみ有効)
	 */
	extern int SetUserChildWindow(dxlib_d.DxDataTypeWin.HWND WindowHandle);

	/**
	 * SetUseWindowで設定したウインドウのメッセージループ処理をDXライブラリで行うかどうかを設定する
	 *
	 * Params:
	 *      Flag = dxlib_d.DxDataType.TRUE:DXライブラリで行う(デフォルト)  dxlib_d.DxDataType.FALSE:DXライブラリでは行わない
	 */
	extern int SetUserWindowMessageProcessDXLibFlag(int Flag);

	/**
	 * FPUの精度を落とさない設定を使用するかどうかを設定する、DxLib_Initを呼び出す前のみ有効
	 *
	 * Params:
	 *      Flag = dxlib_d.DxDataType.TRUE:使用する(精度が落ちない)  dxlib_d.DxDataType.FALSE:使用しない(精度を落とす(デフォルト)
	 */
	extern int SetUseFPUPreserveFlag(int Flag);

	/**
	 * マウスポインタがウインドウのクライアントエリアの外にいけるかどうかを設定する
	 *
	 * Params:
	 *      Flag = dxlib_d.DxDataType.TRUE:いける(デフォルト設定)  dxlib_d.DxDataType.FALSE:いけない
	 */
	extern int SetValidMousePointerWindowOutClientAreaMoveFlag(int Flag);

	/**
	 * バックバッファの透過色の部分を透過させるかどうかを設定する
	 *
	 * Params:
	 *      Flag = dxlib_d.DxDataType.TRUE:透過させる  dxlib_d.DxDataType.FALSE:透過させない(デフォルト)
	 */
	extern int SetUseBackBufferTransColorFlag(int Flag);

	/**
	 * UpdateLayerdWindowForBaseImageやUpdateLayerdWindowForSoftImageを使用するかどうかを設定する
	 *
	 * Params:
	 *      Flag = dxlib_d.DxDataType.TRUE:使用する  dxlib_d.DxDataType.FALSE:使用しない
	 */
	extern int SetUseUpdateLayerdWindowFlag(int Flag);

	/**
	 * リソースを読み込む際に使用するモジュールを設定する(nullを指定すると初期状態に戻ります、デフォルトではnull)
	 *
	 * Params:
	 *      ResourceModule = ?
	 */
	extern int SetResourceModule(dxlib_d.DxDataTypeWin.HMODULE ResourceModule);

	/**
	 * WM_PAINTメッセージが来た際に『DXライブラリのWM_PAINTメッセージが来た際の処理』を行うかどうかを設定する(別スレッドで描画処理を行う場合などで使用)
	 */
	extern int SetUseDxLibWM_PAINTProcess(int Flag);

	/**
	 * Windows10でWM_CHARで短時間に連続して同じ文字が入力された場合の無効扱いにする時間を設定する(MilliSecondのミリ秒以内に連続して同じ文字が入力された場合に無効にする、MilliSecondの値をマイナスにするとデフォルトの設定に戻る)
	 */
	extern int SetWindows10_WM_CHAR_CancelTime(int MilliSecond);

	// ドラッグ&ドロップされたファイル関係

	/**
	 * ファイルのメインウインドウへのドラッグ&ドロップ機能を有効にするかどうかのフラグをセットする
	 */
	extern int SetDragFileValidFlag(int Flag);

	/**
	 * メインウインドウへドラッグ&ドロップされたファイルの情報をリセットする
	 */
	extern int DragFileInfoClear();

	/**
	 * メインウインドウへドラッグ&ドロップされたファイル名を取得する
	 *
	 * Params:
	 *      FilePathBuffer = ファイル名を格納するバッファの先頭アドレス
	 *
	 * Returns: -1:取得できなかった  0:取得できた
	 */
	extern int GetDragFilePath(dxlib_d.DxDataType.TCHAR* FilePathBuffer);

	/**
	 * メインウインドウへドラッグ&ドロップされたファイルの数を取得する
	 */
	extern int GetDragFileNum();

	// ウインドウ描画領域設定系関数

	/**
	 * 任意の画像イメージからRGNハンドルを作成する
	 *
	 * Params:
	 *      Width = 横ドット数
	 *      Height = 縦ドット数
	 *      MaskData = ドット情報配列の先頭アドレス
	 *      Pitch = 1ラインあたりのbyteサイズ
	 *      Byte = 1ドット辺りのbyteサイズ(対応しているのは1~4)、ドットの数値が0かそれ以外かで判別
	 */
	extern dxlib_d.DxDataTypeWin.HRGN CreateRgnFromGraph(int Width, int Height, const (void)* MaskData, int Pitch, int Byte);

	/**
	 * 任意の基本イメージデータと透過色からRGNハンドルを作成する
	 *
	 * Params:
	 *      BaseImage = 基本イメージデータのアドレス
	 *      TransColorR = 透過色(0~255)
	 *      TransColorG = 透過色(0~255)
	 *      TransColorB = 透過色(0~255)
	 */
	extern dxlib_d.DxDataTypeWin.HRGN CreateRgnFromBaseImage(dxlib_d.DxLib.BASEIMAGE* BaseImage, int TransColorR, int TransColorG, int TransColorB);

	/**
	 * 任意の画像ファイルからRGNをセットする
	 */
	extern int SetWindowRgnGraph(const (dxlib_d.DxDataType.TCHAR)* FileName);

	/**
	 * 任意の画像ファイルからRGNをセットする
	 */
	extern int SetWindowRgnGraphWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength);

	/**
	 * 描画先の画面の透過色の部分を透過させるRGNをセットする(使用される透過色は関数SetTransColorで設定した色)
	 */
	extern int UpdateTransColorWindowRgn();

	// ツールバー関係

	/**
	 * ツールバーの準備、BitmapNameにnull, ResourceIDに-1を渡すとツールバーを解除
	 *
	 * Params:
	 *      BitmapName = ツールバーのボタンに使用する画像ファイルパス、ResourceIDに-1以外を渡す場合はnullにする
	 *      BitmapNameLength = ?
	 *      DivNum = ボタン画像中のボタンの数
	 *      ResourceID = ツールバーのボタンに使用するビットマップリソースのID、BitmapNameにnullを渡すとこの引数が使用される
	 */
	extern int SetupToolBar(const (dxlib_d.DxDataType.TCHAR)* BitmapName, int DivNum, int ResourceID = -1);

	///Ditto
	extern int SetupToolBarWithStrLen(const (dxlib_d.DxDataType.TCHAR)* BitmapName, size_t BitmapNameLength, int DivNum, int ResourceID = -1);

	/**
	 * ツールバーにボタンを追加する
	 *
	 * Params:
	 *      Type = ボタンタイプ(TOOLBUTTON_TYPE_NORMAL等(解説はenumの定義を参照してください))
	 *      State = 初期状態(TOOLBUTTON_STATE_ENABLE等(解説はenumの定義を参照してください))
	 *      ImageIndex = 使用するボタンの画像番号
	 *      ID = ボタンに割り当てる識別番号
	 */
	extern int AddToolBarButton(int Type, int State, int ImageIndex, int ID);

	/**
	 * ツールバーに隙間を追加する
	 */
	extern int AddToolBarSep();

	/**
	 * ツールバーのボタンの状態を取得する
	 *
	 * Params:
	 *      ID = AddToolBarButtonで設定したボタンの識別番号
	 *
	 * Returns: dxlib_d.DxDataType.TRUE:押されているor押された  dxlib_d.DxDataType.FALSE:押されていない
	 */
	extern int GetToolBarButtonState(int ID);

	/**
	 * ツールバーのボタンの状態を設定する
	 *
	 * Params:
	 *      ID = AddToolBarButtonで設定したボタンの識別番号
	 *      State = 設定する状態(TOOLBUTTON_STATE_ENABLE等(解説はenumの定義を参照してください))
	 */
	extern int SetToolBarButtonState(int ID, int State);

	/**
	 * ツールバーのボタンを全て削除する
	 */
	extern int DeleteAllToolBarButton();

	// メニュー関係

	/**
	 * メニューを有効にするかどうかを設定する
	 *
	 * Params:
	 *      Flag = dxlib_d.DxDataType.TRUE:使用する  dxlib_d.DxDataType.FALSE:使用しない
	 */
	extern int SetUseMenuFlag(int Flag);

	/**
	 * キーボードアクセラレーターを使用するかどうかを設定する
	 *
	 * Params:
	 *      Flag = dxlib_d.DxDataType.TRUE:使用する  dxlib_d.DxDataType.FALSE:使用しない
	 */
	extern int SetUseKeyAccelFlag(int Flag);

	/**
	 * ショートカットキーを追加する
	 *
	 * Params:
	 *      ItemName = ショートカットキーを割り当てるメニューのアイテム名(AddMenuItemでNewItemNameに渡した名前)、ItemIDを使用する場合はnullを渡す
	 *      ItemNameLength = ?
	 *      ItemID = メニュー項目の識別番号(AddMenuItemの引数 NewItemIDで指定したもの)、ItemNameを使用する場合は-1を渡す
	 *      KeyCode = ショートカットキーのキー(KEY_INPUT_L等)
	 *      CtrlFlag = 同時にCTRLキーを押す必要があるようにするかどうか(dxlib_d.DxDataType.TRUE:押す必要がある  dxlib_d.DxDataType.FALSE:押さなくても良い)
	 *      AltFlag = 同時にALTキーを押す必要があるようにするかどうか(dxlib_d.DxDataType.TRUE:押す必要がある  dxlib_d.DxDataType.FALSE:押さなくても良い)
	 *      ShiftFlag = 同時にSHIFTキーを押す必要があるようにするかどうか(dxlib_d.DxDataType.TRUE:押す必要がある  dxlib_d.DxDataType.FALSE:押さなくても良い)
	 */
	extern int AddKeyAccel(const (dxlib_d.DxDataType.TCHAR)* ItemName, int ItemID, int KeyCode, int CtrlFlag, int AltFlag, int ShiftFlag);

	///Ditto
	extern int AddKeyAccelWithStrLen(const (dxlib_d.DxDataType.TCHAR)* ItemName, size_t ItemNameLength, int ItemID, int KeyCode, int CtrlFlag, int AltFlag, int ShiftFlag);

	/**
	 * ショートカットキーを追加する(各引数の解説はAddKeyAccelと同じ、ItemIDが無くなっただけ)
	 */
	extern int AddKeyAccel_Name(const (dxlib_d.DxDataType.TCHAR)* ItemName, int KeyCode, int CtrlFlag, int AltFlag, int ShiftFlag);

	///Ditto
	extern int AddKeyAccel_NameWithStrLen(const (dxlib_d.DxDataType.TCHAR)* ItemName, size_t ItemNameLength, int KeyCode, int CtrlFlag, int AltFlag, int ShiftFlag);

	/**
	 * ショートカットキーを追加する(各引数の解説はAddKeyAccelと同じ、ItemNameが無くなっただけ)
	 */
	extern int AddKeyAccel_ID(int ItemID, int KeyCode, int CtrlFlag, int AltFlag, int ShiftFlag);

	/**
	 * ショートカットキーの情報をリセットする
	 */
	extern int ClearKeyAccel();

	/**
	 * メニューに項目を追加する
	 *
	 * Params:
	 *      AddType = 項目タイプ(MENUITEM_ADD_CHILD等(解説はenumの定義を参照してください))
	 *      ItemName = AddTypeがMENUITEM_ADD_CHILDの場合は親となる項目の名前、MENUITEM_ADD_INSERTの場合は挿入位置となる項目の名前、nullを指定するとItemIDが使用される
	 *      ItemNameLength = ?
	 *      ItemID = ItemNameの代わりに識別番号で指定するもの、AddType毎の違いはItemNameの解説の通り、-1を指定するとItemNameが使用される
	 *      SeparatorFlag = 区切り線を追加するかどうか(dxlib_d.DxDataType.TRUE:区切り線を追加、この場合NewItemNameとNewItemIDは無視される  dxlib_d.DxDataType.FALSE:追加するのは区切り線ではない)
	 *      NewItemName = 新しい項目の名前
	 *      NewItemNameLength = ?
	 *      NewItemID = 新しい項目の識別番号、-1を指定すると内部で適当な番号が割り当てられる
	 */
	extern int AddMenuItem(int AddType, const (dxlib_d.DxDataType.TCHAR)* ItemName, int ItemID, int SeparatorFlag, const (dxlib_d.DxDataType.TCHAR)* NewItemName = null, int NewItemID = -1);

	///Ditto
	extern int AddMenuItemWithStrLen(int AddType, const (dxlib_d.DxDataType.TCHAR)* ItemName, size_t ItemNameLength, int ItemID, int SeparatorFlag, const (dxlib_d.DxDataType.TCHAR)* NewItemName = null, size_t NewItemNameLength = 0, int NewItemID = -1);

	/**
	 * メニューから選択項目を削除する
	 *
	 * Params:
	 *      ItemName = 削除する項目の名前(AddMenuItemでNewItemNameに渡した名前)、nullを指定するとItemIDが使用される
	 *      ItemNameLength = ?
	 *      ItemID = 削除する項目の識別番号(AddMenuItemでNewItemIDに渡した番号)、-1を指定するとItemNameが使用される
	 */
	extern int DeleteMenuItem(const (dxlib_d.DxDataType.TCHAR)* ItemName, int ItemID);

	///Ditto
	extern int DeleteMenuItemWithStrLen(const (dxlib_d.DxDataType.TCHAR)* ItemName, size_t ItemNameLength, int ItemID);

	/**
	 * メニューが選択されたかどうかを取得する(ItemNameとItemIDについては関数DeleteMenuItemの注釈を参照してください)
	 *
	 * Returns: 0:選択されていない  1:選択された
	 */
	extern int CheckMenuItemSelect(const (dxlib_d.DxDataType.TCHAR)* ItemName, int ItemID);

	///Ditto
	extern int CheckMenuItemSelectWithStrLen(const (dxlib_d.DxDataType.TCHAR)* ItemName, size_t ItemNameLength, int ItemID);

	/**
	 * メニューの項目を選択出来るかどうかを設定する(ItemNameとItemIDについては関数DeleteMenuItemの注釈を参照してください)
	 *
	 * Params:
	 *      ItemName = ?
	 *      ItemNameLength = ?
	 *      ItemID = ?
	 *      EnableFlag = 項目が選択できるかどうか(dxlib_d.DxDataType.TRUE:選択できる   dxlib_d.DxDataType.FALSE:選択できない)
	 */
	extern int SetMenuItemEnable(const (dxlib_d.DxDataType.TCHAR)* ItemName, int ItemID, int EnableFlag);

	///Ditto
	extern int SetMenuItemEnableWithStrLen(const (dxlib_d.DxDataType.TCHAR)* ItemName, size_t ItemNameLength, int ItemID, int EnableFlag);

	/**
	 * メニューの項目にチェックマークやラジオボタンを表示するかどうかを設定する(ItemNameとItemIDについては関数DeleteMenuItemの注釈を参照してください))
	 *
	 * Params:
	 *      ItemName = ?
	 *      ItemNameLength = ?
	 *      ItemID = ?
	 *      Mark = 設定するマーク(MENUITEM_MARK_NONE等(解説はenumの定義を参照してください)
	 */
	extern int SetMenuItemMark(const (dxlib_d.DxDataType.TCHAR)* ItemName, int ItemID, int Mark);

	///Ditto
	extern int SetMenuItemMarkWithStrLen(const (dxlib_d.DxDataType.TCHAR)* ItemName, size_t ItemNameLength, int ItemID, int Mark);

	/**
	 * メニューの項目がどれか選択されたかどうかを取得する
	 *
	 * Returns: dxlib_d.DxDataType.TRUE:どれか選択された  dxlib_d.DxDataType.FALSE:選択されていない
	 */
	extern int CheckMenuItemSelectAll();

	/**
	 * メニューに選択項目を追加する
	 *
	 * Params:
	 *      ParentItemName = 親となる項目の名前、親が持つリストの末端に新しい項目を追加します
	 *      ParentItemNameLength = ?
	 *      NewItemName = 新しい項目の名前
	 *      NewItemNameLength = ?
	 */
	extern int AddMenuItem_Name(const (dxlib_d.DxDataType.TCHAR)* ParentItemName, const (dxlib_d.DxDataType.TCHAR)* NewItemName);

	///Ditto
	extern int AddMenuItem_NameWithStrLen(const (dxlib_d.DxDataType.TCHAR)* ParentItemName, size_t ParentItemNameLength, const (dxlib_d.DxDataType.TCHAR)* NewItemName, size_t NewItemNameLength);

	/**
	 * メニューのリストに区切り線を追加する
	 *
	 * Params:
	 *      ParentItemName = 区切り線を付ける項目リストの親の名前、リストの末端に区切り線を追加します
	 *      ParentItemNameLength = ?
	 */
	extern int AddMenuLine_Name(const (dxlib_d.DxDataType.TCHAR)* ParentItemName);

	///Ditto
	extern int AddMenuLine_NameWithStrLen(const (dxlib_d.DxDataType.TCHAR)* ParentItemName, size_t ParentItemNameLength);

	/**
	 * 指定の項目と、指定の項目の一つ上の項目との間に新しい項目を追加する
	 */
	extern int InsertMenuItem_Name(const (dxlib_d.DxDataType.TCHAR)* ItemName, const (dxlib_d.DxDataType.TCHAR)* NewItemName);

	///Ditto
	extern int InsertMenuItem_NameWithStrLen(const (dxlib_d.DxDataType.TCHAR)* ItemName, size_t ItemNameLength, const (dxlib_d.DxDataType.TCHAR)* NewItemName, size_t NewItemNameLength);

	/**
	 * 指定の項目と、指定の項目の一つ上の項目との間に区切り線を追加する
	 */
	extern int InsertMenuLine_Name(const (dxlib_d.DxDataType.TCHAR)* ItemName);

	///Ditto
	extern int InsertMenuLine_NameWithStrLen(const (dxlib_d.DxDataType.TCHAR)* ItemName, size_t ItemNameLength);

	/**
	 * メニューから選択項目を削除する
	 */
	extern int DeleteMenuItem_Name(const (dxlib_d.DxDataType.TCHAR)* ItemName);

	///Ditto
	extern int DeleteMenuItem_NameWithStrLen(const (dxlib_d.DxDataType.TCHAR)* ItemName, size_t ItemNameLength);

	/**
	 * メニューが選択されたかどうかを取得する
	 *
	 * Returns: 0:選択されていない  1:選択された
	 */
	extern int CheckMenuItemSelect_Name(const (dxlib_d.DxDataType.TCHAR)* ItemName);

	///Ditto
	extern int CheckMenuItemSelect_NameWithStrLen(const (dxlib_d.DxDataType.TCHAR)* ItemName, size_t ItemNameLength);

	/**
	 * メニューの項目を選択出来るかどうかを設定する
	 *
	 * Params:
	 *      ItemName = ?
	 *      ItemNameLength = ?
	 *      EnableFlag = 1:選択できる  0:選択できない
	 */
	extern int SetMenuItemEnable_Name(const (dxlib_d.DxDataType.TCHAR)* ItemName, int EnableFlag);

	///Ditto
	extern int SetMenuItemEnable_NameWithStrLen(const (dxlib_d.DxDataType.TCHAR)* ItemName, size_t ItemNameLength, int EnableFlag);

	/**
	 * メニューの項目にチェックマークやラジオボタンを表示するかどうかを設定する
	 *
	 * Params:
	 *      ItemName = ?
	 *      ItemNameLength = ?
	 *      Mark = 設定するマーク(MENUITEM_MARK_NONE等)
	 */
	extern int SetMenuItemMark_Name(const (dxlib_d.DxDataType.TCHAR)* ItemName, int Mark);

	///Ditto
	extern int SetMenuItemMark_NameWithStrLen(const (dxlib_d.DxDataType.TCHAR)* ItemName, size_t ItemNameLength, int Mark);

	/**
	 * メニューに選択項目を追加する
	 */
	extern int AddMenuItem_ID(int ParentItemID, const (dxlib_d.DxDataType.TCHAR)* NewItemName, int NewItemID = -1);

	///Ditto
	extern int AddMenuItem_IDWithStrLen(int ParentItemID, const (dxlib_d.DxDataType.TCHAR)* NewItemName, size_t NewItemNameLength, int NewItemID = -1);

	/**
	 * メニューのリストに区切り線を追加する
	 */
	extern int AddMenuLine_ID(int ParentItemID);

	/**
	 * 指定の項目と、指定の項目の一つ上の項目との間に新しい項目を追加する
	 */
	extern int InsertMenuItem_ID(int ItemID, int NewItemID);

	/**
	 * 指定の項目と、指定の項目の一つ上の項目との間に区切り線を追加する
	 */
	extern int InsertMenuLine_ID(int ItemID, int NewItemID);

	/**
	 * メニューから選択項目を削除する
	 */
	extern int DeleteMenuItem_ID(int ItemID);

	/**
	 * メニューが選択されたかどうかを取得する
	 *
	 * Returns: 0:選択されていない  1:選択された
	 */
	extern int CheckMenuItemSelect_ID(int ItemID);

	/**
	 * メニューの項目を選択出来るかどうかを設定する
	 *
	 * Params:
	 *      ItemID = ?
	 *      EnableFlag = 1:選択できる  0:選択できない
	 */
	extern int SetMenuItemEnable_ID(int ItemID, int EnableFlag);

	/**
	 * メニューの項目にチェックマークやラジオボタンを表示するかどうかを設定する(Mark:設定するマーク(MENUITEM_MARK_NONE等))
	 *
	 * Params:
	 *      ItemID = ?
	 *      Mark = ?
	 */
	extern int SetMenuItemMark_ID(int ItemID, int Mark);

	/**
	 * メニューの全ての選択項目を削除する
	 */
	extern int DeleteMenuItemAll();

	/**
	 * メニューが選択されたかどうかの情報をリセット
	 */
	extern int ClearMenuItemSelect();

	/**
	 * メニューの項目名から項目識別番号を取得する
	 */
	extern int GetMenuItemID(const (dxlib_d.DxDataType.TCHAR)* ItemName);

	///Ditto
	extern int GetMenuItemIDWithStrLen(const (dxlib_d.DxDataType.TCHAR)* ItemName, size_t ItemNameLength);

	/**
	 * メニューの項目識別番号から項目名を取得する
	 */
	extern int GetMenuItemName(int ItemID, dxlib_d.DxDataType.TCHAR* NameBuffer);

	/**
	 * メニューをリソースから読み込む
	 */
	extern int LoadMenuResource(int MenuResourceID);

	/**
	 * メニューの選択項目が選択されたときに呼ばれるコールバック関数を設定する
	 *
	 * Params:
	 *      CallBackFunction = 項目が選択されたときに呼ばれるコールバック関数、引数に項目名と項目の識別番号を渡されて呼ばれる
	 *      ItemName = ?
	 *      ItemID = ?
	 */
	extern int SetMenuItemSelectCallBackFunction(void function(const (dxlib_d.DxDataType.TCHAR)* ItemName, int ItemID) CallBackFunction);

	/**
	 * (古い関数)ウインドウにメニューを設定する
	 */
	extern int SetWindowMenu(int MenuID, int function(dxlib_d.DxDataType.WORD ID) MenuProc);

	/**
	 * (古い関数)メニューを表示するかどうかをセットする
	 */
	extern int SetDisplayMenuFlag(int Flag);

	/**
	 * (古い関数)メニューを表示しているかどうかを取得する
	 */
	extern int GetDisplayMenuFlag();

	/**
	 * メニューを使用しているかどうかを得る
	 */
	extern int GetUseMenuFlag();

	/**
	 * フルスクリーン時にメニューを自動で表示したり非表示にしたりするかどうかのフラグをセットする
	 */
	extern int SetAutoMenuDisplayFlag(int Flag);

	// DxNetwork.cpp関数プロトタイプ宣言

	version (DX_NON_NETWORK) {
	} else {
		/**
		 * WinSockで最後に発生したエラーのコードを取得する
		 */
		extern int GetWinSockLastError();
	}

	// DxInputString.cpp関数プロトタイプ宣言

	version (DX_NON_KEYEX) {
	} else {
		/**
		 * IMEの漢字変換候補表示の処理にTSFを使用するかどうかを設定する
		 *
		 * Params:
		 *      UseFlag = dxlib_d.DxDataType.TRUE:使用する(デフォルト)  dxlib_d.DxDataType.FALSE:使用しない
		 */
		extern int SetUseTSFFlag(int UseFlag);
	}

	// DxInput.cpp関数プロトタイプ宣言

	version (DX_NON_INPUT) {
	} else {
		/**
		 * DirectInputのキーボードの協調レベルを排他レベルにするかどうかを設定する、DxLib_Initの呼び出し前でのみ実行可能
		 *
		 * Params:
		 *      Flag = dxlib_d.DxDataType.TRUE:排他レベルにする  dxlib_d.DxDataType.FALSE:標準レベルにする(デフォルト)
		 */
		extern int SetKeyExclusiveCooperativeLevelFlag(int Flag);

		/**
		 * キーボードの入力処理にDirectInputを使わないかどうかを設定する
		 *
		 * Params:
		 *      Flag = dxlib_d.DxDataType.TRUE:DirectInputを使わず、Windows標準機能を使用する  dxlib_d.DxDataType.FALSE:DirectInputを使用する
		 */
		extern int SetKeyboardNotDirectInputFlag(int Flag);

		/**
		 * 入力処理にDirectInputを使用するかどうかを設定する
		 *
		 * Params:
		 *      UseFlag = dxlib_d.DxDataType.TRUE:DirectInputを使用する  dxlib_d.DxDataType.FALSE:DirectInputを使わず、Windows標準機能を使用する
		 */
		extern int SetUseDirectInputFlag(int UseFlag);

		/**
		 * マウスの入力処理にDirectInputを使用する場合の動作モードを設定する
		 *
		 * Params:
		 *      Mode = 0:ウィンドウがアクティブな場合のみ DirectInputを使用する  1:ウィンドウのアクティブ状態に関係なく DirectInputを使用する
		 */
		extern int SetDirectInputMouseMode(int Mode);

		/**
		 * Xbox360コントローラの入力処理にXInputを使用するかどうかを設定する
		 *
		 * Params:
		 *      Flag = dxlib_d.DxDataType.TRUE:XInputを使用する(デフォルト)  dxlib_d.DxDataType.FALSE:XInputを使用しない
		 */
		extern int SetUseXInputFlag(int Flag);

		/**
		 * Xbox360コントローラやXbox OneコントローラをDirectInputコントローラとしても検出するかどうかを設定する、DxLib_Initの呼び出し前でのみ実行可能
		 *
		 * Params:
		 *      Flag = dxlib_d.DxDataType.TRUE:DirectInputコントローラとしても検出する  dxlib_d.DxDataType.FALSE:DirectInputコントローラとしては検出しない(デフォルト)
		 */
		extern int SetUseXboxControllerDirectInputFlag(int Flag);

		/**
		 * ジョイパッドのGUIDを得る
		 */
		extern int GetJoypadGUID(int PadIndex, dxlib_d.DxDataTypeWin.GUID* GuidInstanceBuffer, dxlib_d.DxDataTypeWin.GUID* GuidProductBuffer = null);

		/**
		 * ジョイパッドのデバイス登録名と製品登録名を取得する(InstanceNameBuffer, ProductNameBuffer共に260以上のバッファサイズが必要)
		 */
		extern int GetJoypadName(int InputType, dxlib_d.DxDataType.TCHAR* InstanceNameBuffer, dxlib_d.DxDataType.TCHAR* ProductNameBuffer);

		/**
		 * DXライブラリのキーコード(KEY_INPUT_Aなど)に対応するWindowsの仮想キーコード(VK_LEFTなど)を取得する
		 *
		 * Params:
		 *      KeyCode = 変換したいDXライブラリのキーコード
		 *
		 * Returns: Windowsの仮想キーコード
		 */
		extern int ConvertKeyCodeToVirtualKey(int KeyCode);

		/**
		 * Windowsの仮想キーコード(VK_LEFTなど)に対応するDXライブラリのキーコード(KEY_INPUT_Aなど)を取得する
		 *
		 * Params:
		 *      VirtualKey = 変換したいWindowsの仮想キーコード
		 *
		 * Returns: DXライブラリのキーコード
		 */
		extern int ConvertVirtualKeyToKeyCode(int VirtualKey);
	}

	version (DX_NOTUSE_DRAWFUNCTION) {
	} else {
		// 画像からグラフィックハンドルを作成する関数

		/**
		 * 画像リソースからグラフィックハンドルを作成する
		 */
		extern int LoadGraphToResource(int ResourceID);

		///Ditto
		extern int LoadGraphToResource(const (dxlib_d.DxDataType.TCHAR)* ResourceName, const (dxlib_d.DxDataType.TCHAR)* ResourceType);

		///Ditto
		extern int LoadGraphToResourceWithStrLen(const (dxlib_d.DxDataType.TCHAR)* ResourceName, size_t ResourceNameLength, const (dxlib_d.DxDataType.TCHAR)* ResourceType, size_t ResourceTypeLength);

		/**
		 * 画像リソースを分割してグラフィックハンドルを作成する
		 */
		extern int LoadDivGraphToResource(int ResourceID, int AllNum, int XNum, int YNum, int XSize, int YSize, int* HandleArray);

		///Ditto
		extern int LoadDivGraphToResource(const (dxlib_d.DxDataType.TCHAR)* ResourceName, const (dxlib_d.DxDataType.TCHAR)* ResourceType, int AllNum, int XNum, int YNum, int XSize, int YSize, int* HandleArray);

		///Ditto
		extern int LoadDivGraphToResourceWithStrLen(const (dxlib_d.DxDataType.TCHAR)* ResourceName, size_t ResourceNameLength, const (dxlib_d.DxDataType.TCHAR)* ResourceType, size_t ResourceTypeLength, int AllNum, int XNum, int YNum, int XSize, int YSize, int* HandleArray);

		/**
		 * 画像リソースを分割してグラフィックハンドルを作成する(float型)
		 */
		extern int LoadDivGraphFToResource(int ResourceID, int AllNum, int XNum, int YNum, float XSize, float YSize, int* HandleArray);

		///Ditto
		extern int LoadDivGraphFToResource(const (dxlib_d.DxDataType.TCHAR)* ResourceName, const (dxlib_d.DxDataType.TCHAR)* ResourceType, int AllNum, int XNum, int YNum, float XSize, float YSize, int* HandleArray);

		///Ditto
		extern int LoadDivGraphFToResourceWithStrLen(const (dxlib_d.DxDataType.TCHAR)* ResourceName, size_t ResourceNameLength, const (dxlib_d.DxDataType.TCHAR)* ResourceType, size_t ResourceTypeLength, int AllNum, int XNum, int YNum, float XSize, float YSize, int* HandleArray);

		version (DX_NON_DIRECT3D11) {
		} else {
			/**
			 * ID3D11Texture2Dからグラフィックハンドルを作成する
			 */
			extern int CreateGraphFromID3D11Texture2D(const (void)* pID3D11Texture2D);
		}

		// 画像情報関係関数

		/**
		 * グラフィックハンドルが持つID3D11Texture2Dを取得する(Direct3D11を使用している場合のみ有効)(戻り値をID3D11Texture2D*にキャストしてください)
		 */
		extern const (void)* GetGraphID3D11Texture2D(int GrHandle);

		/**
		 * グラフィックハンドルが持つID3D11RenderTargetViewを取得する(Direct3D11を使用していて、且つ MakeScreenで作成したグラフィックハンドルでのみ有効)(戻り値をID3D11RenderTargetView*にキャストしてください)
		 */
		extern const (void)* GetGraphID3D11RenderTargetView(int GrHandle);

		/**
		 * グラフィックハンドルが持つID3D11DepthStencilViewを取得する(Direct3D11を使用していて、且つ MakeScreenで作成したグラフィックハンドルでのみ有効)(戻り値をID3D11DepthStencilView*にキャストしてください)
		 */
		extern const (void)* GetGraphID3D11DepthStencilView(int GrHandle);

		// 画面関係関数

		/**
		 * 裏画面の内容を指定のウインドウに転送する
		 */
		extern int BltBackScreenToWindow(dxlib_d.DxDataTypeWin.HWND Window, int ClientX, int ClientY);

		/**
		 * 裏画面の指定の領域をウインドウのクライアント領域の指定の領域に転送する
		 */
		extern int BltRectBackScreenToWindow(dxlib_d.DxDataTypeWin.HWND Window, dxlib_d.DxDataType.RECT BackScreenRect, dxlib_d.DxDataType.RECT WindowClientRect);

		/**
		 * ScreenFlipで画像を転送する先のウインドウを設定する(nullを指定すると設定解除)
		 */
		extern int SetScreenFlipTargetWindow(dxlib_d.DxDataTypeWin.HWND TargetWindow, double ScaleX = 1.0, double ScaleY = 1.0);

		/**
		 * デスクトップ画面から指定領域の画像情報をグラフィックハンドルに転送する
		 */
		extern int GetDesktopScreenGraph(int x1, int y1, int x2, int y2, int GrHandle, int DestX = 0, int DestY = 0);

		/**
		 * デスクトップ画面から指定領域の画像のメモリイメージの先頭アドレスとイメージの幅・高さ・ストライドを取得する(イメージのフォーマットはColorBitDepth = 32(バイト順でB8G8R8X8の32bitカラー) ColorBitDepth = 24(バイト順でB8G8R8の24bitカラー))
		 */
		extern void* GetDesktopScreenGraphMemImage(int x1, int y1, int x2, int y2, int* Width, int* Height, int* Stride, int ColorBitDepth = 32);

		// その他設定関係関数

		/**
		 * DirectDrawやDirect3Dの協調レベルをマルチスレッド対応にするかどうかをセットする
		 *
		 * Params:
		 *      Flag = dxlib_d.DxDataType.TRUE:マルチスレッド対応にする  dxlib_d.DxDataType.FALSE:マルチスレッド対応にしない(デフォルト)
		 */
		extern int SetMultiThreadFlag(int Flag);

		/**
		 * 使用するDirectDrawデバイスのインデックスを設定する
		 */
		extern int SetUseDirectDrawDeviceIndex(int Index);

		/**
		 * Vista,7のWindows Aeroを無効にするかどうかを設定する(DxLib_Initの前に呼ぶ必要があります)
		 *
		 * Params:
		 *      Flag = dxlib_d.DxDataType.TRUE:無効にする(デフォルト)  dxlib_d.DxDataType.FALSE:有効にする
		 */
		extern int SetAeroDisableFlag(int Flag);

		/**
		 * Vista以降の環境でDirect3D9Exを使用するかどうかを設定する(DxLib_Initの前に呼ぶ必要があります)
		 *
		 * Params:
		 *      Flag = dxlib_d.DxDataType.TRUE:使用する(デフォルト)  dxlib_d.DxDataType.FALSE:使用しない
		 */
		extern int SetUseDirect3D9Ex(int Flag);

		/**
		 * Direct3D11を使用するかどうかを設定する
		 *
		 * Params:
		 *      Flag = dxlib_d.DxDataType.TRUE:使用する  dxlib_d.DxDataType.FALSE:使用しない
		 */
		extern int SetUseDirect3D11(int Flag);

		/**
		 * Direct3D11で使用する最低機能レベルを指定する関数です、尚、DX_DIRECT3D_11_FEATURE_LEVEL_11_0より低い機能レベルでの正常な動作は保証しません(デフォルトはDX_DIRECT3D_11_FEATURE_LEVEL_11_0)
		 *
		 * Params:
		 *      Level = DX_DIRECT3D_11_FEATURE_LEVEL_10_0など
		 */
		extern int SetUseDirect3D11MinFeatureLevel(int Level);

		/**
		 * D3D_DRIVER_TYPE_WARP タイプのDirect3D 11ドライバを使用するかどうかを設定する
		 *
		 * Params:
		 *      Flag = dxlib_d.DxDataType.TRUE:使用する  dxlib_d.DxDataType.FALSE:使用しない(デフォルト)
		 */
		extern int SetUseDirect3D11WARPDriver(int Flag);

		/**
		 * 使用するDirect3Dのバージョンを設定する、DxLib_Init呼び出しの前でのみ使用可能
		 *
		 * Params:
		 *      Version = DX_DIRECT3D_9など
		 */
		extern int SetUseDirect3DVersion(int Version);

		/**
		 * 使用しているDirect3Dのバージョンを取得する
		 *
		 * Returns: DX_DIRECT3D_9など
		 */
		extern int GetUseDirect3DVersion();

		/**
		 * 使用しているDirect3D11のFeatureLevel(DX_DIRECT3D_11_FEATURE_LEVEL_9_1等)を取得する
		 *
		 * Returns: -1:エラー -1以外:Feature Level
		 */
		extern int GetUseDirect3D11FeatureLevel();

		/**
		 * 使用するグラフィックスデバイスのアダプターのインデックスを設定する
		 */
		extern int SetUseDirect3D11AdapterIndex(int Index);

		/**
		 * (同効果のSetUseSoftwareRenderModeFlagを使用して下さい)DirectDrawを使用するかどうかを設定する
		 */
		extern int SetUseDirectDrawFlag(int Flag);

		/**
		 * GDI描画を使用するかどうかを設定する
		 */
		extern int SetUseGDIFlag(int Flag);

		/**
		 * GDI描画を使用するかどうかを取得する
		 */
		extern int GetUseGDIFlag();

		/**
		 * DirectDrawが使用するGUIDを設定する
		 */
		extern int SetDDrawUseGuid(const (dxlib_d.DxDataTypeWin.GUID)* Guid);

		/**
		 * 現在使用しているDirectDrawオブジェクトのアドレスを取得する(戻り値をIDirectDraw7*にキャストして下さい)
		 */
		extern const (void)* GetUseDDrawObj();

		/**
		 * 有効なDirectDrawデバイスのGUIDを取得する
		 */
		extern const (dxlib_d.DxDataTypeWin.GUID)* GetDirectDrawDeviceGUID(int Number);

		/**
		 * 有効なDirectDrawデバイスの名前を取得する
		 */
		extern int GetDirectDrawDeviceDescription(int Number, char* StringBuffer);

		/**
		 * 有効なDirectDrawデバイスの数を取得する
		 */
		extern int GetDirectDrawDeviceNum();

		/**
		 * 使用中のDirect3DDevice9オブジェクトを取得する(戻り値をIDirect3DDevice9*にキャストして下さい)
		 */
		extern const (void)* GetUseDirect3DDevice9();

		/**
		 * 使用中のバックバッファのDirect3DSurface9オブジェクトを取得する(戻り値をD_IDirect3DSurface9*にキャストしてください)
		 */
		extern const (void)* GetUseDirect3D9BackBufferSurface();

		/**
		 * 使用中のID3D11Deviceオブジェクトを取得する(戻り値をID3D11Device*にキャストして下さい)
		 */
		extern const (void)* GetUseDirect3D11Device();

		/**
		 * 使用中のID3D11DeviceContextオブジェクトを取得する(戻り値をID3D11DeviceContext*にキャストして下さい)
		 */
		extern const (void)* GetUseDirect3D11DeviceContext();

		/**
		 * 使用中のバックバッファのID3D11Texture2Dオブジェクトを取得する(戻り値をID3D11Texture2D*にキャストしてください)
		 */
		extern const (void)* GetUseDirect3D11BackBufferTexture2D();

		/**
		 * 使用中のバックバッファのID3D11RenderTargetViewオブジェクトを取得する(戻り値をID3D11RenderTargetView*にキャストしてください)
		 */
		extern const (void)* GetUseDirect3D11BackBufferRenderTargetView();

		/**
		 * 使用中の深度ステンシルバッファのID3D11Texture2Dオブジェクトを取得する(戻り値をID3D11Texture2D*にキャストしてください)
		 */
		extern const (void)* GetUseDirect3D11DepthStencilTexture2D();

		/**
		 * 指定のID3D11RenderTargetViewを描画対象にする(pID3D11DepthStencilViewがnullの場合はデフォルトの深度ステンシルバッファを使用する)
		 */
		extern int SetDrawScreen_ID3D11RenderTargetView(const (void)* pID3D11RenderTargetView, const (void)* pID3D11DepthStencilView = null);

		/**
		 * DXライブラリが行ったDirect3Dの設定を再度行う(特殊用途)
		 */
		extern int RefreshDxLibDirect3DSetting();

		version (DX_NON_MEDIA_FOUNDATION) {
		} else {
			/**
			 * Media Foundationを使用するかどうかを設定する
			 *
			 * Params:
			 *      Flag = dxlib_d.DxDataType.TRUE:使用する(デフォルト)  dxlib_d.DxDataType.FALSE:使用しない
			 */
			extern int SetUseMediaFoundationFlag(int Flag);
		}

		// 色情報取得用関数

		/**
		 * 色ビット情報解析
		 */
		extern int ColorKaiseki(const (void)* PixelData, dxlib_d.DxLib.COLORDATA* ColorData);

		// DxMask.cpp 関数プロトタイプ宣言
		version (DX_NON_MASK) {
		} else {
			/**
			 * マスクハンドルにBMPデータを転送する
			 */
			extern int BmpBltToMask(dxlib_d.DxDataType.HBITMAP Bmp, int BmpPointX, int BmpPointY, int MaskHandle);
		}
	}

	// DxFont.cpp 関数プロトタイプ宣言

	version (DX_NON_FONT) {
	} else {
		/**
		 * 指定のフォントファイルをシステムに追加する
		 *
		 * Returns: null:失敗  null以外:フォントハンドル(WindowsOSのものなので、DXライブラリのフォントハンドルとは別物です)
		 */
		extern dxlib_d.DxDataTypeWin.HANDLE AddFontFile(const (dxlib_d.DxDataType.TCHAR)* FontFilePath);

		///Ditto
		extern dxlib_d.DxDataTypeWin.HANDLE AddFontFileWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FontFilePath, size_t FontFilePathLength);

		/**
		 * 指定のメモリアドレスに展開したフォントファイルイメージをシステムに追加する)
		 *
		 * Returns: null:失敗  null以外:フォントハンドル(WindowsOSのものなので、DXライブラリのフォントハンドルとは別物です
		 */
		extern dxlib_d.DxDataTypeWin.HANDLE AddFontFileFromMem(const (void)* FontFileImage, int FontFileImageSize);

		/**
		 * 指定のフォントハンドルをシステムから削除する(引数はAddFontFileやAddFontFileFromMemの戻り値)
		 */
		extern int RemoveFontFile(dxlib_d.DxDataTypeWin.HANDLE FontHandle);

		version (DX_NON_SAVEFUNCTION) {
		} else {
			/**
			 * フォントデータファイルを作成する
			 *
			 * Params:
			 *      SaveFilePath = ?
			 *      SaveFilePathLength = ?
			 *      FontName = ?
			 *      FontNameLength = ?
			 *      Size = ?
			 *      BitDepth = DX_FONTIMAGE_BIT_1等
			 *      Thick = ?
			 *      Italic = ?
			 *      CharSet = ?
			 *      SaveCharaList = ?
			 *      SaveCharaListLength = ?
			 */
			extern int CreateFontDataFile(const (dxlib_d.DxDataType.TCHAR)* SaveFilePath, const (dxlib_d.DxDataType.TCHAR)* FontName, int Size, int BitDepth, int Thick, int Italic = dxlib_d.DxDataType.FALSE, int CharSet = -1, const (dxlib_d.DxDataType.TCHAR)* SaveCharaList = null);

			///Ditto
			extern int CreateFontDataFileWithStrLen(const (dxlib_d.DxDataType.TCHAR)* SaveFilePath, size_t SaveFilePathLength, const (dxlib_d.DxDataType.TCHAR)* FontName, size_t FontNameLength, int Size, int BitDepth, int Thick, int Italic = dxlib_d.DxDataType.FALSE, int CharSet = -1, const (dxlib_d.DxDataType.TCHAR)* SaveCharaList = null, size_t SaveCharaListLength = 0);
		}
	}

	// 基本イメージデータのロード+DIB関係

	/**
	 * 画像ファイルからDIBデータを作成する
	 */
	extern dxlib_d.DxDataType.HBITMAP CreateDIBGraph(const (dxlib_d.DxDataType.TCHAR)* FileName, int ReverseFlag, dxlib_d.DxLib.COLORDATA* SrcColor);

	///Ditto
	extern dxlib_d.DxDataType.HBITMAP CreateDIBGraphWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, int ReverseFlag, dxlib_d.DxLib.COLORDATA* SrcColor);

	/**
	 * BMPデータからDIBデータクを作成する
	 */
	extern dxlib_d.DxDataType.HBITMAP CreateDIBGraphToMem(const (dxlib_d.DxDataType.BITMAPINFO)* BmpInfo, const (void)* GraphData, int ReverseFlag, dxlib_d.DxLib.COLORDATA* SrcColor);

	/**
	 * 画像ファイルからDIBデータとマスク用DIBデータを作成する
	 */
	extern int CreateDIBGraph_plus_Alpha(const (dxlib_d.DxDataType.TCHAR)* FileName, dxlib_d.DxDataType.HBITMAP* RGBBmp, dxlib_d.DxDataType.HBITMAP* AlphaBmp, int ReverseFlag = dxlib_d.DxDataType.FALSE, dxlib_d.DxLib.COLORDATA* SrcColor = null);

	///Ditto
	extern int CreateDIBGraph_plus_AlphaWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, dxlib_d.DxDataType.HBITMAP* RGBBmp, dxlib_d.DxDataType.HBITMAP* AlphaBmp, int ReverseFlag = dxlib_d.DxDataType.FALSE, dxlib_d.DxLib.COLORDATA* SrcColor = null);

	/**
	 * 画像ファイル若しくはメモリ上に展開された画像ファイルイメージからDIBデータを作成する
	 */
	extern dxlib_d.DxDataType.HBITMAP CreateDIBGraphVer2(const (dxlib_d.DxDataType.TCHAR)* FileName, const (void)* MemImage, int MemImageSize, int ImageType, int ReverseFlag, dxlib_d.DxLib.COLORDATA* SrcColor);

	///Ditto
	extern dxlib_d.DxDataType.HBITMAP CreateDIBGraphVer2WithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, const (void)* MemImage, int MemImageSize, int ImageType, int ReverseFlag, dxlib_d.DxLib.COLORDATA* SrcColor);

	/**
	 * 画像ファイル若しくはメモリ上に展開された画像ファイルイメージからDIBデータとマスク用DIBデータを作成する
	 */
	extern int CreateDIBGraphVer2_plus_Alpha(const (dxlib_d.DxDataType.TCHAR)* FileName, const (void)* MemImage, int MemImageSize, const (void)* AlphaImage, int AlphaImageSize, int ImageType, dxlib_d.DxDataType.HBITMAP* RGBBmp, dxlib_d.DxDataType.HBITMAP* AlphaBmp, int ReverseFlag, dxlib_d.DxLib.COLORDATA* SrcColor);

	///Ditto
	extern int CreateDIBGraphVer2_plus_AlphaWithStrLen(const (dxlib_d.DxDataType.TCHAR)* FileName, size_t FileNameLength, const (void)* MemImage, int MemImageSize, const (void)* AlphaImage, int AlphaImageSize, int ImageType, dxlib_d.DxDataType.HBITMAP* RGBBmp, dxlib_d.DxDataType.HBITMAP* AlphaBmp, int ReverseFlag, dxlib_d.DxLib.COLORDATA* SrcColor);

	/**
	 * BMPデータから基本イメージデータを構築する
	 *
	 * Returns: 0:正常終了  1:コピーを行った  -1:エラー
	 */
	extern int ConvBitmapToGraphImage(const (dxlib_d.DxDataType.BITMAPINFO)* BmpInfo, void* GraphData, dxlib_d.DxLib.BASEIMAGE* GraphImage, int CopyFlag);

	/**
	 * 基本イメージデータをBMPデータに変換するGraphImageをBMPに変換する(アルファデータはあっても無視される)
	 *
	 * Returns: 0:正常終了  1:コピーを行った  -1:エラー
	 */
	extern int ConvGraphImageToBitmap(const (dxlib_d.DxLib.BASEIMAGE)* GraphImage, dxlib_d.DxDataType.BITMAPINFO* BmpInfo, void** GraphData, int CopyFlag, int FullColorConv = dxlib_d.DxDataType.TRUE);

	// 基本イメージデータ構造体関係

	/**
	 * 基本イメージデータを使用してUpdateLayerdWindowを行う
	 */
	extern int UpdateLayerdWindowForBaseImage(const (dxlib_d.DxLib.BASEIMAGE)* BaseImage);

	/**
	 * 基本イメージデータの指定の範囲を使用してUpdateLayerdWindowを行う
	 */
	extern int UpdateLayerdWindowForBaseImageRect(const (dxlib_d.DxLib.BASEIMAGE)* BaseImage, int x1, int y1, int x2, int y2);

	/**
	 * 乗算済みアルファの基本イメージデータを使用してUpdateLayerdWindowを行う
	 */
	extern int UpdateLayerdWindowForPremultipliedAlphaBaseImage(const (dxlib_d.DxLib.BASEIMAGE)* BaseImage);

	/**
	 * 乗算済みアルファの基本イメージデータの指定の範囲を使用してUpdateLayerdWindowを行う
	 */
	extern int UpdateLayerdWindowForPremultipliedAlphaBaseImageRect(const (dxlib_d.DxLib.BASEIMAGE)* BaseImage, int x1, int y1, int x2, int y2);

	// デスクトップキャプチャ

	/**
	 * デスクトップの指定の領域を基本イメージデータに転送する
	 */
	extern int GetDesktopScreenBaseImage(int x1, int y1, int x2, int y2, dxlib_d.DxLib.BASEIMAGE* BaseImage, int DestX, int DestY);

	// DxSoftImage.cpp関数プロトタイプ宣言
	version (DX_NON_SOFTIMAGE) {
	} else {
		/**
		 * ソフトウエアイメージハンドルを使用してUpdateLayerdWindowを行う
		 */
		extern int UpdateLayerdWindowForSoftImage(int SIHandle);

		/**
		 * ソフトウエアイメージハンドルの指定の範囲を使用してUpdateLayerdWindowを行う
		 */
		extern int UpdateLayerdWindowForSoftImageRect(int SIHandle, int x1, int y1, int x2, int y2);

		/**
		 * 乗算済みアルファのソフトウエアイメージハンドルを使用してUpdateLayerdWindowを行う
		 */
		extern int UpdateLayerdWindowForPremultipliedAlphaSoftImage(int SIHandle);

		/**
		 * 乗算済みアルファのソフトウエアイメージハンドルの指定の範囲を使用してUpdateLayerdWindowを行う
		 */
		extern int UpdateLayerdWindowForPremultipliedAlphaSoftImageRect(int SIHandle, int x1, int y1, int x2, int y2);

		// デスクトップキャプチャ

		/**
		 * デスクトップの指定の領域をソフトウエアイメージハンドルに転送する
		 */
		extern int GetDesktopScreenSoftImage(int x1, int y1, int x2, int y2, int SIHandle, int DestX, int DestY);
	}

	// DxSound.cpp関数プロトタイプ宣言
	version (DX_NON_SOUND) {
	} else {
		// サウンドデータ管理系関数

		/**
		 * サウンドリソースからサウンドハンドルを作成する
		 */
		extern int LoadSoundMemByResource(const (dxlib_d.DxDataType.TCHAR)* ResourceName, const (dxlib_d.DxDataType.TCHAR)* ResourceType, int BufferNum = 1);

		///Ditto
		extern int LoadSoundMemByResourceWithStrLen(const (dxlib_d.DxDataType.TCHAR)* ResourceName, size_t ResourceNameLength, const (dxlib_d.DxDataType.TCHAR)* ResourceType, size_t ResourceTypeLength, int BufferNum = 1);

		// 設定関係関数

		/**
		 * サウンドの処理をソフトウエアで行うかどうかを設定する
		 *
		 * Params:
		 *      Flag = dxlib_d.DxDataType.TRUE:ソフトウエア  dxlib_d.DxDataType.FALSE:ハードウエア(デフォルト)
		 */
		extern int SetUseSoftwareMixingSoundFlag(int Flag);

		/**
		 * サウンドの再生にXAudioを使用するかどうかを設定する
		 *
		 * Params:
		 *      Flag = dxlib_d.DxDataType.TRUE:使用する  dxlib_d.DxDataType.FALSE:使用しない(デフォルト)
		 */
		extern int SetEnableXAudioFlag(int Flag);

		/**
		 * サウンドの再生にWASAPIを使用するかどうかを設定する
		 *
		 * Params:
		 *      Flag = dxlib_d.DxDataType.TRUE:使用する  dxlib_d.DxDataType.FALSE:使用しない(デフォルト)
		 *      IsExclusive = dxlib_d.DxDataType.TRUE:排他モードを使用する  dxlib_d.DxDataType.FALSE:排他モードを使用しない
		 *      DevicePeriod = 再生遅延時間、100ナノ秒単位(100000で10ミリ秒)、-1でデフォルト値
		 *      SamplePerSec = サンプリングレート
		 */
		extern int SetEnableWASAPIFlag(int Flag, int IsExclusive = dxlib_d.DxDataType.TRUE, int DevicePeriod = -1, int SamplePerSec = 44100);

		version (DX_NON_ASIO) {
		} else {
			/**
			 * サウンドの再生にASIOを使用するかどうかを設定する
			 *
			 * Params:
			 *      Flag = dxlib_d.DxDataType.TRUE:使用する  dxlib_d.DxDataType.FALSE:使用しない(デフォルト)
			 *      BufferSize = 再生バッファのサイズ、小さいほど遅延が少なくなりますが、処理が間に合わずにブツブツノイズが発生する可能性も高くなります(-1でデフォルト値)
			 *      SamplePerSec = サンプリングレート
			 */
			extern int SetEnableASIOFlag(int Flag, int BufferSize = -1, int SamplePerSec = 44100);
		}

		// 情報取得系関数

		/**
		 * DXライブラリが使用しているDirectSound オブジェクトを取得する
		 * 戻り値をIDirectSound*にキャストして下さい
		 */
		extern const (void)* GetDSoundObj();

		// MIDI制御関数

		/**
		 * リソース上のMIDIファイルからMIDIハンドルを作成する
		 */
		extern int LoadMusicMemByResource(const (dxlib_d.DxDataType.TCHAR)* ResourceName, const (dxlib_d.DxDataType.TCHAR)* ResourceType);

		///Ditto
		extern int LoadMusicMemByResourceWithStrLen(const (dxlib_d.DxDataType.TCHAR)* ResourceName, size_t ResourceNameLength, const (dxlib_d.DxDataType.TCHAR)* ResourceType, size_t ResourceTypeLength);

		/**
		 * リソースからMIDIファイルを読み込んで演奏する
		 */
		extern int PlayMusicByResource(const (dxlib_d.DxDataType.TCHAR)* ResourceName, const (dxlib_d.DxDataType.TCHAR)* ResourceType, int PlayType);

		///Ditto
		extern int PlayMusicByResourceWithStrLen(const (dxlib_d.DxDataType.TCHAR)* ResourceName, size_t ResourceNameLength, const (dxlib_d.DxDataType.TCHAR)* ResourceType, size_t ResourceTypeLength, int PlayType);
	}
}
