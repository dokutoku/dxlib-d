// -------------------------------------------------------------------------------
//
//         DXライブラリ        Windows専用関数プロトタイプ宣言用ヘッダファイル
//
//                 Ver 3.22a
//
// -------------------------------------------------------------------------------
module dxlib_d.dxfunctionwin;


version (Windows):

nothrow @nogc:

private static import core.sys.windows.basetsd;
private static import core.sys.windows.basetyps;
private static import core.sys.windows.windef;
private static import core.sys.windows.wingdi;
private static import core.sys.windows.winnt;
private static import core.sys.windows.winuser;
private static import dxlib_d.dxlib;

// 関数プロトタイプ宣言------------------------------------------------------------------

extern (C++, DxLib) {
	// DxWindow.cpp関数プロトタイプ宣言

	// 便利関数

	/**
	 * 指定の名前、タイプのリソースのアドレスとサイズを取得する
	 *
	 * Returns: -1:失敗  0:成功
	 */
	extern int GetResourceInfo(const (core.sys.windows.winnt.TCHAR)* ResourceName, const (core.sys.windows.winnt.TCHAR)* ResourceType, void** DataPointerP, size_t* DataSizeP);

	/**
	 * 指定の名前、タイプのリソースのアドレスとサイズを取得する
	 *
	 * Returns: -1:失敗  0:成功
	 */
	extern int GetResourceInfoWithStrLen(const (core.sys.windows.winnt.TCHAR)* ResourceName, size_t ResourceNameLength, const (core.sys.windows.winnt.TCHAR)* ResourceType, size_t ResourceTypeLength, void** DataPointerP, size_t* DataSizeP);

	/**
	 * リソースID値からリソース名を取得する
	 */
	extern const (core.sys.windows.winnt.TCHAR)* GetResourceIDString(int ResourceID);

	// ウインドウ関係情報取得関数

	/**
	 * GetWindowClientRect の旧名称
	 */
	extern int GetWindowCRect(core.sys.windows.windef.RECT* RectBuf);

	/**
	 * メインウインドウのクライアント領域を取得する
	 */
	extern int GetWindowClientRect(core.sys.windows.windef.RECT* RectBuf);

	/**
	 * メインウインドウの枠の部分も含めた全体の領域を取得する
	 */
	extern int GetWindowFrameRect(core.sys.windows.windef.RECT* RectBuf);

	/**
	 * メインウインドウがアクティブかどうかを取得する
	 *
	 * Returns: TRUE:アクティブ  FALSE:非アクティブ
	 */
	extern int GetWindowActiveFlag();

	/**
	 * メインウインドウが最小化されているかどうかを取得する
	 *
	 * Returns: TRUE:最小化されている  FALSE:最小化されていない
	 */
	extern int GetWindowMinSizeFlag();

	/**
	 * メインウインドウが最大化されているかどうかを取得する
	 *
	 * Returns: TRUE:最大化されている  FALSE:最大化されていない
	 */
	extern int GetWindowMaxSizeFlag();

	/**
	 * GetWindowActiveFlag の別名関数
	 */
	extern int GetActiveFlag();

	/**
	 * メインウインドウのウインドウハンドルを取得する
	 */
	extern core.sys.windows.windef.HWND GetMainWindowHandle();

	/**
	 * ウインドウモードで起動しているかどうかを取得する
	 *
	 * Returns: TRUE:ウインドウモード  FALSE:フルスクリーンモード
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
	 *      ResetFlag = TRUE:状態をリセット FALSE:状態をリセットしない
	 *
	 * Returns: 0:一時停止はしていない  1:一時停止していた
	 */
	extern int GetNoActiveState(int ResetFlag = core.sys.windows.windef.TRUE);

	/**
	 * マウスポインタを表示するかどうかの設定を取得する
	 *
	 * Returns: TRUE:表示する  FALSE:表示しない
	 */
	extern int GetMouseDispFlag();

	/**
	 * メインウインドウが非アクティブになっても処理を実行し続けるかどうかの設定を取得する
	 *
	 * Returns: TRUE:実行する  FALSE:停止する
	 */
	extern int GetAlwaysRunFlag();

	/**
	 * DXライブラリと DirectX のバージョンと Windows のバージョン番号を取得する
	 */
	extern int _GetSystemInfo(int* DxLibVer, int* DirectXVer, int* WindowsVer);

	/**
	 * PCの情報を取得する
	 */
	extern int GetPcInfo(core.sys.windows.winnt.TCHAR* OSString, core.sys.windows.winnt.TCHAR* DirectXString, core.sys.windows.winnt.TCHAR* CPUString, int* CPUSpeed /* 単位MHz */, double* FreeMemorySize /* 単位MByte */, double* TotalMemorySize, core.sys.windows.winnt.TCHAR* VideoDriverFileName, core.sys.windows.winnt.TCHAR* VideoDriverString, double* FreeVideoMemorySize /* 単位MByte */, double* TotalVideoMemorySize);

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
	extern core.sys.windows.windef.HINSTANCE GetTaskInstance();

	/**
	 * リージョンを使っているかどうかを取得する
	 */
	extern int GetUseWindowRgnFlag();

	/**
	 * ウインドウのサイズを変更できる設定になっているかどうかを取得する
	 *
	 * Returns: TRUE:変更できるようになっている  FALSE:変更できないようになっている
	 */
	extern int GetWindowSizeChangeEnableFlag(int* FitScreen = null);

	/**
	 * 描画画面のサイズに対するウインドウサイズの比率を取得する
	 *
	 * Returns: ExRateX に代入される値と同じ
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
	 * メインウインドウのデスクトップ上の左上端座標を取得する( 枠も含める )
	 */
	extern int GetWindowPosition(int* x, int* y);

	/**
	 * メインウインドウの閉じるボタンが押されたかどうかを取得する
	 */
	extern int GetWindowUserCloseFlag(int StateResetFlag = core.sys.windows.windef.FALSE);

	/**
	 * メインウインドウの最大化ボタンが押されたかどうかを取得する、SetWindowMaximizeButtonBehavior( 1 ); が実行されている場合のみ有効な関数
	 *
	 * Params:
	 *      StateResetFlag = TRUE:押された状態をリセットする   FALSE:押された状態をリセットしない
	 */
	extern int CheckWindowMaximizeButtonInput(int StateResetFlag = core.sys.windows.windef.TRUE);

	/**
	 * DXライブラリの描画機能を使うかどうかの設定を取得する
	 */
	extern int GetNotDrawFlag();

	/**
	 * WM_PAINT メッセージが来たかどうかを取得する
	 *
	 * Returns: TRUE:WM_PAINTメッセージが来た(一度取得すると以後、再び WM_PAINTメッセージが来るまで FALSE が返ってくるようになる)  FALSE:WM_PAINT メッセージは来ていない
	 */
	extern int GetPaintMessageFlag();

	/**
	 * パフォーマンスカウンタが有効かどうかを取得する
	 *
	 * Returns: TRUE:有効  FALSE:無効
	 */
	extern int GetValidHiPerformanceCounter();

	/**
	 * 入力されたシステム文字を取得する
	 */
	extern core.sys.windows.winnt.TCHAR GetInputSystemChar(int DeleteFlag);

	// 設定系関数

	/**
	 * ウインドウモードを変更する
	 */
	extern int ChangeWindowMode(int Flag);

	/**
	 * DXライブラリの文字列処理で前提とする文字列セットを設定する
	 */
	extern int SetUseCharSet(int CharSet /* = DX_CHARSET_SHFTJIS 等 */);

	/**
	 * アクティブウインドウが他のソフトに移っている際に表示する画像をファイルから読み込む( FileName に null を渡すことで解除)
	 */
	extern int LoadPauseGraph(const (core.sys.windows.winnt.TCHAR)* FileName);

	/**
	 * アクティブウインドウが他のソフトに移っている際に表示する画像をファイルから読み込む( FileName に null を渡すことで解除)
	 */
	extern int LoadPauseGraphWithStrLen(const (core.sys.windows.winnt.TCHAR)* FileName, size_t FileNameLength);

	/**
	 * アクティブウインドウが他のソフトに移っている際に表示する画像をメモリから読み込む
	 *
	 * Params:
	 *      MemImage = ファイルイメージの先頭アドレス,null にすることで設定解除
	 *      MemImageSize = ファイルイメージのサイズ( 単位:Byte )
	 */
	extern int LoadPauseGraphFromMem(const (void)* MemImage, int MemImageSize);

	/**
	 * メインウインドウのアクティブ状態に変化があったときに呼ばれるコールバック関数を設定する
	 *
	 * Params:
	 *      CallBackFunction = 呼ばれるコールバック関数、null を渡すと設定解除
	 *      UserData = CallBackFunction の第2引数に渡される値
	 */
	extern int SetActiveStateChangeCallBackFunction(int function(int ActiveState, void* UserData) CallBackFunction, void* UserData);

	/**
	 * メインウインドウのウインドウテキストを変更する
	 */
	extern int SetWindowText(const (core.sys.windows.winnt.TCHAR)* WindowText);

	/**
	 * メインウインドウのウインドウテキストを変更する
	 */
	extern int SetWindowTextWithStrLen(const (core.sys.windows.winnt.TCHAR)* WindowText, size_t WindowTextLength);

	/**
	 * SetWindowText の別名関数
	 */
	extern int SetMainWindowText(const (core.sys.windows.winnt.TCHAR)* WindowText);

	/**
	 * SetWindowText の別名関数
	 */
	extern int SetMainWindowTextWithStrLen(const (core.sys.windows.winnt.TCHAR)* WindowText, size_t WindowTextLength);

	/**
	 * メインウインドウのクラス名を設定する( DxLib_Init の前でのみ使用可能 )
	 */
	extern int SetMainWindowClassName(const (core.sys.windows.winnt.TCHAR)* ClassName);

	/**
	 * メインウインドウのクラス名を設定する( DxLib_Init の前でのみ使用可能 )
	 */
	extern int SetMainWindowClassNameWithStrLen(const (core.sys.windows.winnt.TCHAR)* ClassName, size_t ClassNameLength);

	/**
	 * メインウインドウで使用するアイコンのIDをセットする
	 */
	extern int SetWindowIconID(int ID);

	/**
	 * メインウインドウで使用するアイコンのハンドルをセットする
	 */
	extern int SetWindowIconHandle(core.sys.windows.windef.HICON Icon);

	/**
	 * 最大化ボタンやALT+ENTERキーによる非同期なウインドウモードの変更の機能の設定を行う
	 *
	 * Params:
	 *      Flag = 非同期ウインドウモード変更を有効にするかどうかのフラグ( TRUE:有効にする  FALSE:無効にする( デフォルト ))
	 *      CallBackFunction = 非同期ウインドウモード変更が行われた場合に呼ばれるコールバック関数のアドレス
	 *      Data = CallBackFunction の引数に渡される void 型のポインタ
	 */
	extern int SetUseASyncChangeWindowModeFunction(int Flag, void function(void*) CallBackFunction, void* Data);

	/**
	 * シャットダウンによるソフトの強制終了の際に呼ばれるコールバック関数を登録する( Message はコールバック関数の終了を待つ間表示されるメッセージ )
	 */
	extern int SetShutdownCallbackFunction(void function(void*) *CallbackFunction, void* Data, const (core.sys.windows.winnt.TCHAR)* Message);

	/**
	 * メインウインドウのスタイルを変更する
	 */
	extern int SetWindowStyleMode(int Mode);

	/**
	 * メインウインドウの奥行き位置を変更する
	 */
	extern int SetWindowZOrder(int ZType /* = DX_WIN_ZTYPE_TOP 等 */, int WindowActivateFlag = core.sys.windows.windef.TRUE);

	/**
	 * メインウインドウの端を掴んでウインドウのサイズを変更できるようにするかどうかの設定を行う
	 *
	 * Params:
	 *      Flag = 変更を可能にするかどうか( TRUE:可能にする  FALSE:不可能にする( デフォルト ) )
	 *      FitScreen = ウインドウのクライアント領域に画面をフィットさせる(拡大させる)かどうか  TRUE:フィットさせる  FALSE:フィットさせない
	 */
	extern int SetWindowSizeChangeEnableFlag(int Flag, int FitScreen = core.sys.windows.windef.TRUE);

	/**
	 * 描画画面のサイズに対するメインウインドウサイズの比率を設定する( ExRateY がマイナスの場合は ExRateX の値が ExRateY にも使用されます )
	 */
	extern int SetWindowSizeExtendRate(double ExRateX, double ExRateY = -1.0);

	/**
	 * メインウインドウのクライアント領域のサイズを設定する
	 */
	extern int SetWindowSize(int Width, int Height);

	/**
	 * メインウインドウのクライアント領域の最大サイズを設定する( SetWindowSizeChangeEnableFlag の第一引数を TRUE で呼び出して、ウインドウのサイズが変更できる状態でのみ使用されるパラメータです )
	 */
	extern int SetWindowMaxSize(int MaxWidth, int MaxHeight);

	/**
	 * メインウインドウのクライアント領域の最小サイズを設定する( SetWindowSizeChangeEnableFlag の第一引数を TRUE で呼び出して、ウインドウのサイズが変更できる状態でのみ使用されるパラメータです )
	 */
	extern int SetWindowMinSize(int MinWidth, int MinHeight);

	/**
	 * メインウインドウの位置を設定する( 枠も含めた左上座標 )
	 */
	extern int SetWindowPosition(int x, int y);

	/**
	 * タスクスイッチを有効にするかどうかを設定する
	 */
	extern int SetSysCommandOffFlag(int Flag, const (core.sys.windows.winnt.TCHAR)* HookDllPath = null);

	/**
	 * タスクスイッチを有効にするかどうかを設定する
	 */
	extern int SetSysCommandOffFlagWithStrLen(int Flag, const (core.sys.windows.winnt.TCHAR)* HookDllPath = null, size_t HookDllPathLength = 0);

	/**
	 * メインウインドウの最大化ボタンが押されたときの挙動を設定する( BehaviorType 0:標準動作 1:標準動作は行わず、最大化ボタンが押されたかどうかは CheckWindowMaximizeButtonInput で判定する )
	 */
	extern int SetWindowMaximizeButtonBehavior(int BehaviorType);

	/**
	 * メインウインドウへのメッセージをフックするウインドウプロージャを登録する
	 */
	extern int SetHookWinProc(core.sys.windows.winuser.WNDPROC WinProc);

	/**
	 * SetHookWinProc で設定したウインドウプロージャの戻り値を使用するかどうかを設定する、SetHookWinProc で設定したウインドウプロージャの中でのみ使用可能
	 *
	 * Params:
	 *      UseFlag = TRUE:戻り値を使用して、DXライブラリのウインドウプロージャの処理は行わない  FALSE:戻り値は使用せず、ウインドウプロージャから出た後、DXライブラリのウインドウプロージャの処理を行う
	 */
	extern int SetUseHookWinProcReturnValue(int UseFlag);

	/**
	 * DXライブラリを使用したソフトの二重起動を可能にするかどうかの設定を行う
	 *
	 * Params:
	 *      Flag = TRUE:可能にする  FALSE:不可能にする( デフォルト )
	 */
	extern int SetDoubleStartValidFlag(int Flag);

	/**
	 * DXライブラリを使用したソフトが既に起動しているかどうかを取得する
	 *
	 * Returns: TRUE:既に起動している  FALSE:起動していない
	 */
	extern int CheckDoubleStart();

	/**
	 * メッセージ処理をDXライブラリに肩代わりしてもらうウインドウを追加する
	 */
	extern int AddMessageTakeOverWindow(core.sys.windows.windef.HWND Window);

	/**
	 * メッセージ処理をDXライブラリに肩代わりしてもらうウインドウを減らす
	 */
	extern int SubMessageTakeOverWindow(core.sys.windows.windef.HWND Window);

	/**
	 * メインウインドウの初期位置を設定する
	 */
	extern int SetWindowInitPosition(int x, int y);

	/**
	 * DXライブラリのウインドウ関連の機能を使用しないかどうかを設定する
	 *
	 * Params:
	 *      Flag = TRUE:使用しない  FALSE:使用する( デフォルト )
	 */
	extern int SetNotWinFlag(int Flag);

	/**
	 * DXライブラリの描画機能を使うかどうかを設定する
	 *
	 * Params:
	 *      Flag = TRUE:使用しない  FALSE:使用する( デフォルト )
	 */
	extern int SetNotDrawFlag(int Flag);

	/**
	 * DXライブラリのサウンド機能を使うかどうかを設定する
	 *
	 * Params:
	 *      Flag = TRUE:使用しない  FALSE:使用する( デフォルト )
	 */
	extern int SetNotSoundFlag(int Flag);

	/**
	 * DXライブラリの入力状態の取得機能を使うかどうかを設定する
	 *
	 * Params:
	 *      Flag = TRUE:使用しない  FALSE:使用する( デフォルト )
	 */
	extern int SetNotInputFlag(int Flag);

	/**
	 * DXライブラリでメッセージ処理を行うダイアログボックスを登録する
	 */
	extern int SetDialogBoxHandle(core.sys.windows.windef.HWND WindowHandle);

	/**
	 * メインウインドウを表示するかどうかを設定する
	 *
	 * Params:
	 *      Flag = TRUE:表示する  FALSE:表示しない
	 */
	extern int SetWindowVisibleFlag(int Flag);

	/**
	 * メインウインドウを最小化するかどうかを設定する
	 *
	 * Params:
	 *      Flag = TRUE:最小化する  FALSE:最小化を解除
	 */
	extern int SetWindowMinimizeFlag(int Flag);

	/**
	 * メインウインドウの×ボタンを押した時にDXライブラリが自動的にウインドウを閉じるかどうかを設定する
	 *
	 * Params:
	 *      Flag = TRUE:自動的に閉じる( デフォルト )  FALSE:閉じない
	 */
	extern int SetWindowUserCloseEnableFlag(int Flag);

	/**
	 * DXライブラリ終了時に PostQuitMessage を呼ぶかどうかを設定する
	 *
	 * Params:
	 *      Flag = TRUE:PostQuitMessage を呼ぶ( デフォルト )  FALSE:呼ばない
	 */
	extern int SetDxLibEndPostQuitMessageFlag(int Flag);

	/**
	 * DXライブラリで使用するウインドウのハンドルをセットする( DxLib_Init を実行する以前でのみ有効 )
	 */
	extern int SetUserWindow(core.sys.windows.windef.HWND WindowHandle);

	/**
	 * DXライブラリで使用する表示用の子ウインドウのハンドルをセットする( DxLib_Init を実行する以前でのみ有効 )
	 */
	extern int SetUserChildWindow(core.sys.windows.windef.HWND WindowHandle);

	/**
	 * SetUseWindow で設定したウインドウのメッセージループ処理をDXライブラリで行うかどうかを設定する
	 *
	 * Params:
	 *      Flag = TRUE:DXライブラリで行う( デフォルト )  FALSE:DXライブラリでは行わない
	 */
	extern int SetUserWindowMessageProcessDXLibFlag(int Flag);

	/**
	 * FPUの精度を落とさない設定を使用するかどうかを設定する、DxLib_Init を呼び出す前のみ有効
	 *
	 * Params:
	 *      Flag = TRUE:使用する(精度が落ちない)  FALSE:使用しない(精度を落とす(デフォルト)
	 */
	extern int SetUseFPUPreserveFlag(int Flag);

	/**
	 * マウスポインタがウインドウのクライアントエリアの外にいけるかどうかを設定する
	 *
	 * Params:
	 *      Flag = TRUE:いける( デフォルト設定 )  FALSE:いけない
	 */
	extern int SetValidMousePointerWindowOutClientAreaMoveFlag(int Flag);

	/**
	 * バックバッファの透過色の部分を透過させるかどうかを設定する
	 *
	 * Params:
	 *      Flag = TRUE:透過させる  FALSE:透過させない( デフォルト )
	 */
	extern int SetUseBackBufferTransColorFlag(int Flag);

	/**
	 * UpdateLayerdWindowForBaseImage や UpdateLayerdWindowForSoftImage を使用するかどうかを設定する
	 *
	 * Params:
	 *      Flag = TRUE:使用する  FALSE:使用しない
	 */
	extern int SetUseUpdateLayerdWindowFlag(int Flag);

	/**
	 * リソースを読み込む際に使用するモジュールを設定する( null を指定すると初期状態に戻ります、デフォルトでは null )
	 *
	 * Params:
	 *      ResourceModule = ?
	 */
	extern int SetResourceModule(core.sys.windows.windef.HMODULE ResourceModule);

	/**
	 * WM_PAINT メッセージが来た際に『DXライブラリの WM_PAINTメッセージが来た際の処理』を行うかどうかを設定する( 別スレッドで描画処理を行う場合などで使用 )
	 */
	extern int SetUseDxLibWM_PAINTProcess(int Flag);

	/**
	 * Windows10 で WM_CHAR で短時間に連続して同じ文字が入力された場合の無効扱いにする時間を設定する( MilliSecond のミリ秒以内に連続して同じ文字が入力された場合に無効にする、MilliSecond の値をマイナスにするとデフォルトの設定に戻る )
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
	extern int GetDragFilePath(core.sys.windows.winnt.TCHAR* FilePathBuffer);

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
	 *      Byte = 1ドット辺りのbyteサイズ( 対応しているのは 1〜4 )、ドットの数値が0かそれ以外かで判別
	 */
	extern core.sys.windows.windef.HRGN CreateRgnFromGraph(int Width, int Height, const (void)* MaskData, int Pitch, int Byte);

	/**
	 * 任意の基本イメージデータと透過色からRGNハンドルを作成する
	 *
	 * Params:
	 *      BaseImage = 基本イメージデータのアドレス
	 *      TransColorR = 透過色( 0〜255 )
	 *      TransColorG = 透過色( 0〜255 )
	 *      TransColorB = 透過色( 0〜255 )
	 */
	extern core.sys.windows.windef.HRGN CreateRgnFromBaseImage(dxlib_d.dxlib.BASEIMAGE* BaseImage, int TransColorR, int TransColorG, int TransColorB);

	/**
	 * 任意の画像ファイルからRGNをセットする
	 */
	extern int SetWindowRgnGraph(const (core.sys.windows.winnt.TCHAR)* FileName);

	/**
	 * 任意の画像ファイルからRGNをセットする
	 */
	extern int SetWindowRgnGraphWithStrLen(const (core.sys.windows.winnt.TCHAR)* FileName, size_t FileNameLength);

	/**
	 * 描画先の画面の透過色の部分を透過させるRGNをセットする( 使用される透過色は関数 SetTransColor で設定した色 )
	 */
	extern int UpdateTransColorWindowRgn();

	// ツールバー関係

	/**
	 * ツールバーの準備、BitmapName に null, ResourceID に -1 を渡すとツールバーを解除
	 *
	 * Params:
	 *      BitmapName = ツールバーのボタンに使用する画像ファイルパス、ResourceID に -1 以外を渡す場合は null にする
	 *      DivNum = ボタン画像中のボタンの数
	 *      ResourceID = ツールバーのボタンに使用するビットマップリソースのID、BitmapName に null を渡すとこの引数が使用される
	 */
	extern int SetupToolBar(const (core.sys.windows.winnt.TCHAR)* BitmapName, int DivNum, int ResourceID = -1);

	/**
	 * ツールバーの準備、BitmapName に null, ResourceID に -1 を渡すとツールバーを解除
	 *
	 * Params:
	 *      BitmapName = ツールバーのボタンに使用する画像ファイルパス、ResourceID に -1 以外を渡す場合は null にする
	 *      BitmapNameLength = ?
	 *      DivNum = ボタン画像中のボタンの数
	 *      ResourceID = ツールバーのボタンに使用するビットマップリソースのID、BitmapName に null を渡すとこの引数が使用される
	 */
	extern int SetupToolBarWithStrLen(const (core.sys.windows.winnt.TCHAR)* BitmapName, size_t BitmapNameLength, int DivNum, int ResourceID = -1);

	/**
	 * ツールバーにボタンを追加する
	 *
	 * Params:
	 *      Type = ボタンタイプ( TOOLBUTTON_TYPE_NORMAL 等( 解説は #define の定義を参照してください ) )
	 *      State = 初期状態( TOOLBUTTON_STATE_ENABLE 等( 解説は #define の定義を参照してください ) )
	 *      ImageIndex = 使用するボタンの画像番号
	 *      ID = ボタンに割り当てる識別番号
	 */
	extern int AddToolBarButton(int Type /* TOOLBUTTON_TYPE_NORMAL 等 */, int State /* TOOLBUTTON_STATE_ENABLE 等 */, int ImageIndex, int ID);

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
	 * Returns: TRUE:押されている or 押された  FALSE:押されていない
	 */
	extern int GetToolBarButtonState(int ID);

	/**
	 * ツールバーのボタンの状態を設定する
	 *
	 * Params:
	 *      ID = AddToolBarButtonで設定したボタンの識別番号
	 *      State = 設定する状態( TOOLBUTTON_STATE_ENABLE 等( 解説は #define の定義を参照してください ))
	 */
	extern int SetToolBarButtonState(int ID, int State /* TOOLBUTTON_STATE_ENABLE 等 */);

	/**
	 * ツールバーのボタンを全て削除する
	 */
	extern int DeleteAllToolBarButton();

	// メニュー関係

	/**
	 * メニューを有効にするかどうかを設定する
	 *
	 * Params:
	 *      Flag = TRUE:使用する  FALSE:使用しない
	 */
	extern int SetUseMenuFlag(int Flag);

	/**
	 * キーボードアクセラレーターを使用するかどうかを設定する
	 *
	 * Params:
	 *      Flag = TRUE:使用する  FALSE:使用しない
	 */
	extern int SetUseKeyAccelFlag(int Flag);

	/**
	 * ショートカットキーを追加する
	 *
	 * Params:
	 *      ItemName = ショートカットキーを割り当てるメニューのアイテム名( AddMenuItem で NewItemName に渡した名前 )、ItemID を使用する場合は null を渡す
	 *      ItemID = メニュー項目の識別番号( AddMenuItem の引数 NewItemID で指定したもの )、ItemName を使用する場合は -1 を渡す
	 *      KeyCode = ショートカットキーのキー( KEY_INPUT_L 等 )
	 *      CtrlFlag = 同時にCTRLキーを押す必要があるようにするかどうか( TRUE:押す必要がある  FALSE:押さなくても良い )
	 *      AltFlag = 同時にALTキーを押す必要があるようにするかどうか( TRUE:押す必要がある  FALSE:押さなくても良い )
	 *      ShiftFlag = 同時にSHIFTキーを押す必要があるようにするかどうか( TRUE:押す必要がある  FALSE:押さなくても良い )
	 */
	extern int AddKeyAccel(const (core.sys.windows.winnt.TCHAR)* ItemName, int ItemID, int KeyCode, int CtrlFlag, int AltFlag, int ShiftFlag);

	/**
	 * ショートカットキーを追加する
	 *
	 * Params:
	 *      ItemName = ショートカットキーを割り当てるメニューのアイテム名( AddMenuItem で NewItemName に渡した名前 )、ItemID を使用する場合は null を渡す
	 *      ItemNameLength = ?
	 *      ItemID = メニュー項目の識別番号( AddMenuItem の引数 NewItemID で指定したもの )、ItemName を使用する場合は -1 を渡す
	 *      KeyCode = ショートカットキーのキー( KEY_INPUT_L 等 )
	 *      CtrlFlag = 同時にCTRLキーを押す必要があるようにするかどうか( TRUE:押す必要がある  FALSE:押さなくても良い )
	 *      AltFlag = 同時にALTキーを押す必要があるようにするかどうか( TRUE:押す必要がある  FALSE:押さなくても良い )
	 *      ShiftFlag = 同時にSHIFTキーを押す必要があるようにするかどうか( TRUE:押す必要がある  FALSE:押さなくても良い )
	 */
	extern int AddKeyAccelWithStrLen(const (core.sys.windows.winnt.TCHAR)* ItemName, size_t ItemNameLength, int ItemID, int KeyCode, int CtrlFlag, int AltFlag, int ShiftFlag);

	/**
	 * ショートカットキーを追加する( 各引数の解説は AddKeyAccel と同じ、ItemID が無くなっただけ )
	 */
	extern int AddKeyAccel_Name(const (core.sys.windows.winnt.TCHAR)* ItemName, int KeyCode, int CtrlFlag, int AltFlag, int ShiftFlag);

	/**
	 * ショートカットキーを追加する( 各引数の解説は AddKeyAccel と同じ、ItemID が無くなっただけ )
	 */
	extern int AddKeyAccel_NameWithStrLen(const (core.sys.windows.winnt.TCHAR)* ItemName, size_t ItemNameLength, int KeyCode, int CtrlFlag, int AltFlag, int ShiftFlag);

	/**
	 * ショートカットキーを追加する( 各引数の解説は AddKeyAccel と同じ、ItemName が無くなっただけ )
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
	 *      AddType = 項目タイプ( MENUITEM_ADD_CHILD 等( 解説は #define の定義を参照してください ) )
	 *      ItemName = AddType が MENUITEM_ADD_CHILDの場合は親となる項目の名前、MENUITEM_ADD_INSERTの場合は挿入位置となる項目の名前、null を指定すると ItemID が使用される
	 *      ItemID = ItemName の代わりに識別番号で指定するもの、AddType毎の違いは ItemName の解説の通り、-1を指定すると ItemName が使用される
	 *      SeparatorFlag = 区切り線を追加するかどうか( TRUE:区切り線を追加、この場合 NewItemName と NewItemID は無視される  FALSE:追加するのは区切り線ではない )
	 *      NewItemName = 新しい項目の名前
	 *      NewItemID = 新しい項目の識別番号、-1を指定すると内部で適当な番号が割り当てられる
	 */
	extern int AddMenuItem(int AddType /* MENUITEM_ADD_CHILD等 */, const (core.sys.windows.winnt.TCHAR)* ItemName, int ItemID, int SeparatorFlag, const (core.sys.windows.winnt.TCHAR)* NewItemName = null, int NewItemID = -1);

	/**
	 * メニューに項目を追加する
	 *
	 * Params:
	 *      AddType = 項目タイプ( MENUITEM_ADD_CHILD 等( 解説は #define の定義を参照してください ) )
	 *      ItemName = AddType が MENUITEM_ADD_CHILDの場合は親となる項目の名前、MENUITEM_ADD_INSERTの場合は挿入位置となる項目の名前、null を指定すると ItemID が使用される
	 *      ItemNameLength = ?
	 *      ItemID = ItemName の代わりに識別番号で指定するもの、AddType毎の違いは ItemName の解説の通り、-1を指定すると ItemName が使用される
	 *      SeparatorFlag = 区切り線を追加するかどうか( TRUE:区切り線を追加、この場合 NewItemName と NewItemID は無視される  FALSE:追加するのは区切り線ではない )
	 *      NewItemName = 新しい項目の名前
	 *      NewItemNameLength = ?
	 *      NewItemID = 新しい項目の識別番号、-1を指定すると内部で適当な番号が割り当てられる
	 */
	extern int AddMenuItemWithStrLen(int AddType /* MENUITEM_ADD_CHILD等 */, const (core.sys.windows.winnt.TCHAR)* ItemName, size_t ItemNameLength, int ItemID, int SeparatorFlag, const (core.sys.windows.winnt.TCHAR)* NewItemName = null, size_t NewItemNameLength = 0, int NewItemID = -1);

	/**
	 * メニューから選択項目を削除する
	 *
	 * Params:
	 *      ItemName = 削除する項目の名前( AddMenuItem で NewItemName に渡した名前 )、null を指定すると ItemID が使用される
	 *      ItemID = 削除する項目の識別番号( AddMenuItem で NewItemID に渡した番号 )、-1 を指定すると ItemName が使用される
	 */
	extern int DeleteMenuItem(const (core.sys.windows.winnt.TCHAR)* ItemName, int ItemID);

	/**
	 * メニューから選択項目を削除する
	 *
	 * Params:
	 *      ItemName = 削除する項目の名前( AddMenuItem で NewItemName に渡した名前 )、null を指定すると ItemID が使用される
	 *      ItemNameLength = ?
	 *      ItemID = 削除する項目の識別番号( AddMenuItem で NewItemID に渡した番号 )、-1 を指定すると ItemName が使用される
	 */
	extern int DeleteMenuItemWithStrLen(const (core.sys.windows.winnt.TCHAR)* ItemName, size_t ItemNameLength, int ItemID);

	/**
	 * メニューが選択されたかどうかを取得する( ItemName と ItemID については関数 DeleteMenuItem の注釈を参照してください )
	 *
	 * Returns: 0:選択されていない  1:選択された
	 */
	extern int CheckMenuItemSelect(const (core.sys.windows.winnt.TCHAR)* ItemName, int ItemID);

	/**
	 * メニューが選択されたかどうかを取得する( ItemName と ItemID については関数 DeleteMenuItem の注釈を参照してください )
	 *
	 * Returns: 0:選択されていない  1:選択された
	 */
	extern int CheckMenuItemSelectWithStrLen(const (core.sys.windows.winnt.TCHAR)* ItemName, size_t ItemNameLength, int ItemID);

	/**
	 * メニューの項目を選択出来るかどうかを設定する( ItemName と ItemID については関数 DeleteMenuItem の注釈を参照してください )
	 *
	 * Params:
	 *      ItemName = ?
	 *      ItemID = ?
	 *      EnableFlag = 項目が選択できるかどうか( TRUE:選択できる   FALSE:選択できない )
	 */
	extern int SetMenuItemEnable(const (core.sys.windows.winnt.TCHAR)* ItemName, int ItemID, int EnableFlag);

	/**
	 * メニューの項目を選択出来るかどうかを設定する( ItemName と ItemID については関数 DeleteMenuItem の注釈を参照してください )
	 *
	 * Params:
	 *      ItemName = ?
	 *      ItemNameLength = ?
	 *      ItemID = ?
	 *      EnableFlag = 項目が選択できるかどうか( TRUE:選択できる   FALSE:選択できない )
	 */
	extern int SetMenuItemEnableWithStrLen(const (core.sys.windows.winnt.TCHAR)* ItemName, size_t ItemNameLength, int ItemID, int EnableFlag);

	/**
	 * メニューの項目にチェックマークやラジオボタンを表示するかどうかを設定する( ItemName と ItemID については関数 DeleteMenuItem の注釈を参照してください ) )
	 *
	 * Params:
	 *      ItemName = ?
	 *      ItemID = ?
	 *      Mark = 設定するマーク( MENUITEM_MARK_NONE 等( 解説は #define の定義を参照してください )
	 */
	extern int SetMenuItemMark(const (core.sys.windows.winnt.TCHAR)* ItemName, int ItemID, int Mark);

	/**
	 * メニューの項目にチェックマークやラジオボタンを表示するかどうかを設定する( ItemName と ItemID については関数 DeleteMenuItem の注釈を参照してください ) )
	 *
	 * Params:
	 *      ItemName = ?
	 *      ItemNameLength = ?
	 *      ItemID = ?
	 *      Mark = 設定するマーク( MENUITEM_MARK_NONE 等( 解説は #define の定義を参照してください )
	 */
	extern int SetMenuItemMarkWithStrLen(const (core.sys.windows.winnt.TCHAR)* ItemName, size_t ItemNameLength, int ItemID, int Mark);

	/**
	 * メニューの項目がどれか選択されたかどうかを取得する
	 *
	 * Returns: TRUE:どれか選択された  FALSE:選択されていない
	 */
	extern int CheckMenuItemSelectAll();

	/**
	 * メニューに選択項目を追加する
	 *
	 * Params:
	 *      ParentItemName = 親となる項目の名前、親が持つリストの末端に新しい項目を追加します
	 *      NewItemName = 新しい項目の名前
	 */
	extern int AddMenuItem_Name(const (core.sys.windows.winnt.TCHAR)* ParentItemName, const (core.sys.windows.winnt.TCHAR)* NewItemName);

	/**
	 * メニューに選択項目を追加する
	 *
	 * Params:
	 *      ParentItemName = 親となる項目の名前、親が持つリストの末端に新しい項目を追加します
	 *      ParentItemNameLength = ?
	 *      NewItemName = 新しい項目の名前
	 *      NewItemNameLength = ?
	 */
	extern int AddMenuItem_NameWithStrLen(const (core.sys.windows.winnt.TCHAR)* ParentItemName, size_t ParentItemNameLength, const (core.sys.windows.winnt.TCHAR)* NewItemName, size_t NewItemNameLength);

	/**
	 * メニューのリストに区切り線を追加する
	 *
	 * Params:
	 *      ParentItemName = 区切り線を付ける項目リストの親の名前、リストの末端に区切り線を追加します
	 */
	extern int AddMenuLine_Name(const (core.sys.windows.winnt.TCHAR)* ParentItemName);

	/**
	 * メニューのリストに区切り線を追加する
	 *
	 * Params:
	 *      ParentItemName = 区切り線を付ける項目リストの親の名前、リストの末端に区切り線を追加します
	 *      ParentItemNameLength = ?
	 */
	extern int AddMenuLine_NameWithStrLen(const (core.sys.windows.winnt.TCHAR)* ParentItemName, size_t ParentItemNameLength);

	/**
	 * 指定の項目と、指定の項目の一つ上の項目との間に新しい項目を追加する
	 */
	extern int InsertMenuItem_Name(const (core.sys.windows.winnt.TCHAR)* ItemName, const (core.sys.windows.winnt.TCHAR)* NewItemName);

	/**
	 * 指定の項目と、指定の項目の一つ上の項目との間に新しい項目を追加する
	 */
	extern int InsertMenuItem_NameWithStrLen(const (core.sys.windows.winnt.TCHAR)* ItemName, size_t ItemNameLength, const (core.sys.windows.winnt.TCHAR)* NewItemName, size_t NewItemNameLength);

	/**
	 * 指定の項目と、指定の項目の一つ上の項目との間に区切り線を追加する
	 */
	extern int InsertMenuLine_Name(const (core.sys.windows.winnt.TCHAR)* ItemName);

	/**
	 * 指定の項目と、指定の項目の一つ上の項目との間に区切り線を追加する
	 */
	extern int InsertMenuLine_NameWithStrLen(const (core.sys.windows.winnt.TCHAR)* ItemName, size_t ItemNameLength);

	/**
	 * メニューから選択項目を削除する
	 */
	extern int DeleteMenuItem_Name(const (core.sys.windows.winnt.TCHAR)* ItemName);

	/**
	 * メニューから選択項目を削除する
	 */
	extern int DeleteMenuItem_NameWithStrLen(const (core.sys.windows.winnt.TCHAR)* ItemName, size_t ItemNameLength);

	/**
	 * メニューが選択されたかどうかを取得する
	 *
	 * Returns: 0:選択されていない  1:選択された
	 */
	extern int CheckMenuItemSelect_Name(const (core.sys.windows.winnt.TCHAR)* ItemName);

	/**
	 * メニューが選択されたかどうかを取得する
	 *
	 * Returns: 0:選択されていない  1:選択された
	 */
	extern int CheckMenuItemSelect_NameWithStrLen(const (core.sys.windows.winnt.TCHAR)* ItemName, size_t ItemNameLength);

	/**
	 * メニューの項目を選択出来るかどうかを設定する
	 *
	 * Params:
	 *      ItemName = ?
	 *      EnableFlag = 1:選択できる  0:選択できない
	 */
	extern int SetMenuItemEnable_Name(const (core.sys.windows.winnt.TCHAR)* ItemName, int EnableFlag);

	/**
	 * メニューの項目を選択出来るかどうかを設定する
	 *
	 * Params:
	 *      ItemName = ?
	 *      ItemNameLength = ?
	 *      EnableFlag = 1:選択できる  0:選択できない
	 */
	extern int SetMenuItemEnable_NameWithStrLen(const (core.sys.windows.winnt.TCHAR)* ItemName, size_t ItemNameLength, int EnableFlag);

	/**
	 * メニューの項目にチェックマークやラジオボタンを表示するかどうかを設定する
	 *
	 * Params:
	 *      ItemName = ?
	 *      Mark = 設定するマーク( MENUITEM_MARK_NONE 等 )
	 */
	extern int SetMenuItemMark_Name(const (core.sys.windows.winnt.TCHAR)* ItemName, int Mark);

	/**
	 * メニューの項目にチェックマークやラジオボタンを表示するかどうかを設定する
	 *
	 * Params:
	 *      ItemName = ?
	 *      ItemNameLength = ?
	 *      Mark = 設定するマーク( MENUITEM_MARK_NONE 等 )
	 */
	extern int SetMenuItemMark_NameWithStrLen(const (core.sys.windows.winnt.TCHAR)* ItemName, size_t ItemNameLength, int Mark);

	/**
	 * メニューに選択項目を追加する
	 */
	extern int AddMenuItem_ID(int ParentItemID, const (core.sys.windows.winnt.TCHAR)* NewItemName, int NewItemID = -1);

	/**
	 * メニューに選択項目を追加する
	 */
	extern int AddMenuItem_IDWithStrLen(int ParentItemID, const (core.sys.windows.winnt.TCHAR)* NewItemName, size_t NewItemNameLength, int NewItemID = -1);

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
	 * メニューの項目にチェックマークやラジオボタンを表示するかどうかを設定する( Mark:設定するマーク( MENUITEM_MARK_NONE 等 ) )
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
	extern int GetMenuItemID(const (core.sys.windows.winnt.TCHAR)* ItemName);

	/**
	 * メニューの項目名から項目識別番号を取得する
	 */
	extern int GetMenuItemIDWithStrLen(const (core.sys.windows.winnt.TCHAR)* ItemName, size_t ItemNameLength);

	/**
	 * メニューの項目識別番号から項目名を取得する
	 */
	extern int GetMenuItemName(int ItemID, core.sys.windows.winnt.TCHAR* NameBuffer);

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
	extern int SetMenuItemSelectCallBackFunction(void function(const (core.sys.windows.winnt.TCHAR)* ItemName, int ItemID) CallBackFunction);

	/**
	 * (古い関数)ウインドウにメニューを設定する
	 */
	extern int SetWindowMenu(int MenuID, int function(core.sys.windows.windef.WORD ID) MenuProc);

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
		 * WinSock で最後に発生したエラーのコードを取得する
		 */
		extern int GetWinSockLastError();
	}

	// DxInputString.cpp関数プロトタイプ宣言

	version (DX_NON_KEYEX) {
	} else {
		/**
		 * IMEの漢字変換候補表示の処理に TSF を使用するかどうかを設定する
		 *
		 * Params:
		 *      UseFlag = TRUE:使用する( デフォルト )  FALSE:使用しない
		 */
		extern int SetUseTSFFlag(int UseFlag);
	}

	// DxInput.cpp関数プロトタイプ宣言

	version (DX_NON_INPUT) {
	} else {
		/**
		 * DirectInput のキーボードの協調レベルを排他レベルにするかどうかを設定する、DxLib_Init の呼び出し前でのみ実行可能
		 *
		 * Params:
		 *      Flag = TRUE:排他レベルにする  FALSE:標準レベルにする( デフォルト )
		 */
		extern int SetKeyExclusiveCooperativeLevelFlag(int Flag);

		/**
		 * キーボードの入力処理に DirectInput を使わないかどうかを設定する
		 *
		 * Params:
		 *      Flag = TRUE:DirectInput を使わず、Windows標準機能を使用する  FALSE:DirectInput を使用する
		 */
		extern int SetKeyboardNotDirectInputFlag(int Flag);

		/**
		 * 入力処理に DirectInput を使用するかどうかを設定する
		 *
		 * Params:
		 *      UseFlag = TRUE:DirectInput を使用する  FALSE:DirectInput を使わず、Windows標準機能を使用する
		 */
		extern int SetUseDirectInputFlag(int UseFlag);

		/**
		 * マウスの入力処理に DirectInput を使用する場合の動作モードを設定する
		 *
		 * Params:
		 *      Mode = 0:ウィンドウがアクティブな場合のみ DirectInput を使用する  1:ウィンドウのアクティブ状態に関係なく DirectInput を使用する
		 */
		extern int SetDirectInputMouseMode(int Mode);

		/**
		 * Xbox360コントローラの入力処理に XInput を使用するかどうかを設定する
		 *
		 * Params:
		 *      Flag = TRUE:XInput を使用する( デフォルト )  FALSE:XInput を使用しない
		 */
		extern int SetUseXInputFlag(int Flag);

		/**
		 * Xbox360コントローラや Xbox Oneコントローラを DirectInputコントローラとしても検出するかどうかを設定する、DxLib_Init の呼び出し前でのみ実行可能
		 *
		 * Params:
		 *      Flag = TRUE:DirectInputコントローラとしても検出する  FALSE:DirectInputコントローラとしては検出しない(デフォルト)
		 */
		extern int SetUseXboxControllerDirectInputFlag(int Flag);

		/**
		 * ジョイパッドのGUIDを得る
		 */
		extern int GetJoypadGUID(int PadIndex, core.sys.windows.basetyps.GUID* GuidInstanceBuffer, core.sys.windows.basetyps.GUID* GuidProductBuffer = null);

		/**
		 * ジョイパッドのデバイス登録名と製品登録名を取得する( InstanceNameBuffer, ProductNameBuffer 共に 260 以上のバッファサイズが必要 )
		 */
		extern int GetJoypadName(int InputType, core.sys.windows.winnt.TCHAR* InstanceNameBuffer, core.sys.windows.winnt.TCHAR* ProductNameBuffer);

		/**
		 * DXライブラリのキーコード( KEY_INPUT_A など )に対応する Windows の仮想キーコード( VK_LEFT など ) を取得する
		 *
		 * Params:
		 *      KeyCode = 変換したいDXライブラリのキーコード
		 *
		 * Returns: Windowsの仮想キーコード
		 */
		extern int ConvertKeyCodeToVirtualKey(int KeyCode);

		/**
		 * Windows の仮想キーコード( VK_LEFT など ) に対応するDXライブラリのキーコード( KEY_INPUT_A など )を取得する
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

		/**
		 * 画像リソースを分割してグラフィックハンドルを作成する
		 */
		extern int LoadDivGraphToResource(int ResourceID, int AllNum, int XNum, int YNum, int XSize, int YSize, int* HandleArray);

		/**
		 * 画像リソースを分割してグラフィックハンドルを作成する( float型 )
		 */
		extern int LoadDivGraphFToResource(int ResourceID, int AllNum, int XNum, int YNum, float XSize, float YSize, int* HandleArray);

		/**
		 * 画像リソースからグラフィックハンドルを作成する
		 */
		extern int LoadGraphToResource(const (core.sys.windows.winnt.TCHAR)* ResourceName, const (core.sys.windows.winnt.TCHAR)* ResourceType);

		/**
		 * 画像リソースからグラフィックハンドルを作成する
		 */
		extern int LoadGraphToResourceWithStrLen(const (core.sys.windows.winnt.TCHAR)* ResourceName, size_t ResourceNameLength, const (core.sys.windows.winnt.TCHAR)* ResourceType, size_t ResourceTypeLength);

		/**
		 * 画像リソースを分割してグラフィックハンドルを作成する
		 */
		extern int LoadDivGraphToResource(const (core.sys.windows.winnt.TCHAR)* ResourceName, const (core.sys.windows.winnt.TCHAR)* ResourceType, int AllNum, int XNum, int YNum, int XSize, int YSize, int* HandleArray);

		/**
		 * 画像リソースを分割してグラフィックハンドルを作成する
		 */
		extern int LoadDivGraphToResourceWithStrLen(const (core.sys.windows.winnt.TCHAR)* ResourceName, size_t ResourceNameLength, const (core.sys.windows.winnt.TCHAR)* ResourceType, size_t ResourceTypeLength, int AllNum, int XNum, int YNum, int XSize, int YSize, int* HandleArray);

		/**
		 * 画像リソースを分割してグラフィックハンドルを作成する( float型 )
		 */
		extern int LoadDivGraphFToResource(const (core.sys.windows.winnt.TCHAR)* ResourceName, const (core.sys.windows.winnt.TCHAR)* ResourceType, int AllNum, int XNum, int YNum, float XSize, float YSize, int* HandleArray);

		/**
		 * 画像リソースを分割してグラフィックハンドルを作成する( float型 )
		 */
		extern int LoadDivGraphFToResourceWithStrLen(const (core.sys.windows.winnt.TCHAR)* ResourceName, size_t ResourceNameLength, const (core.sys.windows.winnt.TCHAR)* ResourceType, size_t ResourceTypeLength, int AllNum, int XNum, int YNum, float XSize, float YSize, int* HandleArray);

		version (DX_NON_DIRECT3D11) {
		} else {
			/**
			 * ID3D11Texture2D からグラフィックハンドルを作成する
			 */
			extern int CreateGraphFromID3D11Texture2D(const (void)* pID3D11Texture2D);
		}

		// 画像情報関係関数

		/**
		 * グラフィックハンドルが持つ ID3D11Texture2D を取得する( Direct3D11 を使用している場合のみ有効 )( 戻り値を ID3D11Texture2D * にキャストしてください )
		 */
		extern const (void)* GetGraphID3D11Texture2D(int GrHandle);

		/**
		 * グラフィックハンドルが持つ ID3D11RenderTargetView を取得する( Direct3D11 を使用していて、且つ MakeScreen で作成したグラフィックハンドルでのみ有効 )( 戻り値を ID3D11RenderTargetView * にキャストしてください )
		 */
		extern const (void)* GetGraphID3D11RenderTargetView(int GrHandle);

		/**
		 * グラフィックハンドルが持つ ID3D11DepthStencilView を取得する( Direct3D11 を使用していて、且つ MakeScreen で作成したグラフィックハンドルでのみ有効 )( 戻り値を ID3D11DepthStencilView * にキャストしてください )
		 */
		extern const (void)* GetGraphID3D11DepthStencilView(int GrHandle);

		// 画面関係関数

		/**
		 * 裏画面の内容を指定のウインドウに転送する
		 */
		extern int BltBackScreenToWindow(core.sys.windows.windef.HWND Window, int ClientX, int ClientY);

		/**
		 * 裏画面の指定の領域をウインドウのクライアント領域の指定の領域に転送する
		 */
		extern int BltRectBackScreenToWindow(core.sys.windows.windef.HWND Window, core.sys.windows.windef.RECT BackScreenRect, core.sys.windows.windef.RECT WindowClientRect);

		/**
		 * ScreenFlip で画像を転送する先のウインドウを設定する( null を指定すると設定解除 )
		 */
		extern int SetScreenFlipTargetWindow(core.sys.windows.windef.HWND TargetWindow, double ScaleX = 1.0, double ScaleY = 1.0);

		/**
		 * デスクトップ画面から指定領域の画像情報をグラフィックハンドルに転送する
		 */
		extern int GetDesktopScreenGraph(int x1, int y1, int x2, int y2, int GrHandle, int DestX = 0, int DestY = 0);

		/**
		 * デスクトップ画面から指定領域の画像のメモリイメージの先頭アドレスとイメージの幅・高さ・ストライドを取得する( イメージのフォーマットは ColorBitDepth = 32( バイト順で B8G8R8X8 の 32bitカラー ) ColorBitDepth = 24( バイト順で B8G8R8 の 24bitカラー ) )
		 */
		extern void* GetDesktopScreenGraphMemImage(int x1, int y1, int x2, int y2, int* Width, int* Height, int* Stride, int ColorBitDepth = 32);

		// その他設定関係関数

		/**
		 * DirectDraw や Direct3D の協調レベルをマルチスレッド対応にするかどうかをセットする
		 *
		 * Params:
		 *      Flag = TRUE:マルチスレッド対応にする  FALSE:マルチスレッド対応にしない( デフォルト )
		 */
		extern int SetMultiThreadFlag(int Flag);

		/**
		 * 使用する DirectDraw デバイスのインデックスを設定する
		 */
		extern int SetUseDirectDrawDeviceIndex(int Index);

		/**
		 * Vista,7 の Windows Aero を無効にするかどうかを設定する( DxLib_Init の前に呼ぶ必要があります )
		 *
		 * Params:
		 *      Flag = TRUE:無効にする( デフォルト )  FALSE:有効にする
		 */
		extern int SetAeroDisableFlag(int Flag);

		/**
		 * Vista以降の環境で Direct3D9Ex を使用するかどうかを設定する( DxLib_Init の前に呼ぶ必要があります )
		 *
		 * Params:
		 *      Flag = TRUE:使用する( デフォルト )  FALSE:使用しない
		 */
		extern int SetUseDirect3D9Ex(int Flag);

		/**
		 * Direct3D11 を使用するかどうかを設定する
		 *
		 * Params:
		 *      Flag = TRUE:使用する  FALSE:使用しない
		 */
		extern int SetUseDirect3D11(int Flag);

		/**
		 * Direct3D11 で使用する最低機能レベルを指定する関数です、尚、DX_DIRECT3D_11_FEATURE_LEVEL_11_0 より低い機能レベルでの正常な動作は保証しません( デフォルトは DX_DIRECT3D_11_FEATURE_LEVEL_11_0 )
		 *
		 * Params:
		 *      Level = DX_DIRECT3D_11_FEATURE_LEVEL_10_0 など
		 */
		extern int SetUseDirect3D11MinFeatureLevel(int Level);

		/**
		 * D3D_DRIVER_TYPE_WARP タイプの Direct3D 11 ドライバを使用するかどうかを設定する
		 *
		 * Params:
		 *      Flag = TRUE:使用する  FALSE:使用しない( デフォルト )
		 */
		extern int SetUseDirect3D11WARPDriver(int Flag);

		/**
		 * 使用する Direct3D のバージョンを設定する、DxLib_Init 呼び出しの前でのみ使用可能
		 *
		 * Params:
		 *      Version = DX_DIRECT3D_9 など
		 */
		extern int SetUseDirect3DVersion(int Version);

		/**
		 * 使用している Direct3D のバージョンを取得する
		 *
		 * Returns: DX_DIRECT3D_9 など
		 */
		extern int GetUseDirect3DVersion();

		/**
		 * 使用している Direct3D11 の FeatureLevel ( DX_DIRECT3D_11_FEATURE_LEVEL_9_1 等 )を取得する
		 *
		 * Returns: -1:エラー -1以外:Feature Level
		 */
		extern int GetUseDirect3D11FeatureLevel();

		/**
		 * 使用するグラフィックスデバイスのアダプターのインデックスを設定する
		 */
		extern int SetUseDirect3D11AdapterIndex(int Index);

		/**
		 * ( 同効果のSetUseSoftwareRenderModeFlag を使用して下さい )DirectDrawを使用するかどうかを設定する
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
		extern int SetDDrawUseGuid(const (core.sys.windows.basetyps.GUID)* Guid);

		/**
		 * 現在使用しているDirectDrawオブジェクトのアドレスを取得する( 戻り値を IDirectDraw7 * にキャストして下さい )
		 */
		extern const (void)* GetUseDDrawObj();

		/**
		 * 有効な DirectDraw デバイスの GUID を取得する
		 */
		extern const (core.sys.windows.basetyps.GUID)* GetDirectDrawDeviceGUID(int Number);

		/**
		 * 有効な DirectDraw デバイスの名前を取得する
		 */
		extern int GetDirectDrawDeviceDescription(int Number, char* StringBuffer);

		/**
		 * 有効な DirectDraw デバイスの数を取得する
		 */
		extern int GetDirectDrawDeviceNum();

		/**
		 * 使用中のDirect3DDevice9オブジェクトを取得する( 戻り値を IDirect3DDevice9 * にキャストして下さい )
		 */
		extern const (void)* GetUseDirect3DDevice9();

		/**
		 * 使用中のバックバッファのDirect3DSurface9オブジェクトを取得する( 戻り値を D_IDirect3DSurface9 * にキャストしてください )
		 */
		extern const (void)* GetUseDirect3D9BackBufferSurface();

		/**
		 * 使用中のID3D11Deviceオブジェクトを取得する( 戻り値を ID3D11Device * にキャストして下さい )
		 */
		extern const (void)* GetUseDirect3D11Device();

		/**
		 * 使用中のID3D11DeviceContextオブジェクトを取得する( 戻り値を ID3D11DeviceContext * にキャストして下さい )
		 */
		extern const (void)* GetUseDirect3D11DeviceContext();

		/**
		 * 使用中のバックバッファのID3D11Texture2Dオブジェクトを取得する( 戻り値を ID3D11Texture2D * にキャストしてください )
		 */
		extern const (void)* GetUseDirect3D11BackBufferTexture2D();

		/**
		 * 使用中のバックバッファのID3D11RenderTargetViewオブジェクトを取得する( 戻り値を ID3D11RenderTargetView * にキャストしてください )
		 */
		extern const (void)* GetUseDirect3D11BackBufferRenderTargetView();

		/**
		 * 使用中の深度ステンシルバッファのID3D11Texture2Dオブジェクトを取得する( 戻り値を ID3D11Texture2D * にキャストしてください )
		 */
		extern const (void)* GetUseDirect3D11DepthStencilTexture2D();

		/**
		 * 指定の ID3D11RenderTargetView を描画対象にする( pID3D11DepthStencilView が null の場合はデフォルトの深度ステンシルバッファを使用する )
		 */
		extern int SetDrawScreen_ID3D11RenderTargetView(const (void)* pID3D11RenderTargetView, const (void)* pID3D11DepthStencilView = null);

		/**
		 * DXライブラリが行ったDirect3Dの設定を再度行う( 特殊用途 )
		 */
		extern int RefreshDxLibDirect3DSetting();

		version (DX_NON_MEDIA_FOUNDATION) {
		} else {
			/**
			 * Media Foundation を使用するかどうかを設定する
			 *
			 * Params:
			 *      Flag = TRUE:使用する( デフォルト )  FALSE:使用しない
			 */
			extern int SetUseMediaFoundationFlag(int Flag);
		}

		// 色情報取得用関数

		/**
		 * 色ビット情報解析
		 */
		extern int ColorKaiseki(const (void)* PixelData, dxlib_d.dxlib.COLORDATA* ColorData);

		// DxMask.cpp 関数プロトタイプ宣言
		version (DX_NON_MASK) {
		} else {
			/**
			 * マスクハンドルにBMPデータを転送する
			 */
			extern int BmpBltToMask(core.sys.windows.windef.HBITMAP Bmp, int BmpPointX, int BmpPointY, int MaskHandle);
		}
	}

	// DxFont.cpp 関数プロトタイプ宣言

	version (DX_NON_FONT) {
	} else {
		/**
		 * 指定のフォントファイルをシステムに追加する
		 *
		 * Returns: null:失敗  NULL以外:フォントハンドル( WindowsOS のものなので、DXライブラリのフォントハンドルとは別物です )
		 */
		extern core.sys.windows.basetsd.HANDLE AddFontFile(const (core.sys.windows.winnt.TCHAR)* FontFilePath);

		/**
		 * 指定のフォントファイルをシステムに追加する
		 *
		 * Returns: null:失敗  NULL以外:フォントハンドル( WindowsOS のものなので、DXライブラリのフォントハンドルとは別物です )
		 */
		extern core.sys.windows.basetsd.HANDLE AddFontFileWithStrLen(const (core.sys.windows.winnt.TCHAR)* FontFilePath, size_t FontFilePathLength);

		/**
		 * 指定のメモリアドレスに展開したフォントファイルイメージをシステムに追加する )
		 *
		 * Returns: null:失敗  NULL以外:フォントハンドル( WindowsOS のものなので、DXライブラリのフォントハンドルとは別物です
		 */
		extern core.sys.windows.basetsd.HANDLE AddFontFileFromMem(const (void)* FontFileImage, int FontFileImageSize);

		/**
		 * 指定のフォントハンドルをシステムから削除する( 引数は AddFontFile や AddFontFileFromMem の戻り値 )
		 */
		extern int RemoveFontFile(core.sys.windows.basetsd.HANDLE FontHandle);

		version (DX_NON_SAVEFUNCTION) {
		} else {
			/**
			 * フォントデータファイルを作成する
			 */
			extern int CreateFontDataFile(const (core.sys.windows.winnt.TCHAR)* SaveFilePath, const (core.sys.windows.winnt.TCHAR)* FontName, int Size, int BitDepth /* DX_FONTIMAGE_BIT_1等 */, int Thick, int Italic = core.sys.windows.windef.FALSE, int CharSet = -1, const (core.sys.windows.winnt.TCHAR)* SaveCharaList = null);

			/**
			 * フォントデータファイルを作成する
			 */
			extern int CreateFontDataFileWithStrLen(const (core.sys.windows.winnt.TCHAR)* SaveFilePath, size_t SaveFilePathLength, const (core.sys.windows.winnt.TCHAR)* FontName, size_t FontNameLength, int Size, int BitDepth /* DX_FONTIMAGE_BIT_1等 */, int Thick, int Italic = core.sys.windows.windef.FALSE, int CharSet = -1, const (core.sys.windows.winnt.TCHAR)* SaveCharaList = null, size_t SaveCharaListLength = 0);
		}
	}

	// 基本イメージデータのロード+DIB関係

	/**
	 * 画像ファイルからDIBデータを作成する
	 */
	extern core.sys.windows.windef.HBITMAP CreateDIBGraph(const (core.sys.windows.winnt.TCHAR)* FileName, int ReverseFlag, dxlib_d.dxlib.COLORDATA* SrcColor);

	/**
	 * 画像ファイルからDIBデータを作成する
	 */
	extern core.sys.windows.windef.HBITMAP CreateDIBGraphWithStrLen(const (core.sys.windows.winnt.TCHAR)* FileName, size_t FileNameLength, int ReverseFlag, dxlib_d.dxlib.COLORDATA* SrcColor);

	/**
	 * BMPデータからDIBデータクを作成する
	 */
	extern core.sys.windows.windef.HBITMAP CreateDIBGraphToMem(const (core.sys.windows.wingdi.BITMAPINFO)* BmpInfo, const (void)* GraphData, int ReverseFlag, dxlib_d.dxlib.COLORDATA* SrcColor);

	/**
	 * 画像ファイルからDIBデータとマスク用DIBデータを作成する
	 */
	extern int CreateDIBGraph_plus_Alpha(const (core.sys.windows.winnt.TCHAR)* FileName, core.sys.windows.windef.HBITMAP* RGBBmp, core.sys.windows.windef.HBITMAP* AlphaBmp, int ReverseFlag = core.sys.windows.windef.FALSE, dxlib_d.dxlib.COLORDATA* SrcColor = null);

	/**
	 * 画像ファイルからDIBデータとマスク用DIBデータを作成する
	 */
	extern int CreateDIBGraph_plus_AlphaWithStrLen(const (core.sys.windows.winnt.TCHAR)* FileName, size_t FileNameLength, core.sys.windows.windef.HBITMAP* RGBBmp, core.sys.windows.windef.HBITMAP* AlphaBmp, int ReverseFlag = core.sys.windows.windef.FALSE, dxlib_d.dxlib.COLORDATA* SrcColor = null);

	/**
	 * 画像ファイル若しくはメモリ上に展開された画像ファイルイメージからDIBデータを作成する
	 */
	extern core.sys.windows.windef.HBITMAP CreateDIBGraphVer2(const (core.sys.windows.winnt.TCHAR)* FileName, const (void)* MemImage, int MemImageSize, int ImageType, int ReverseFlag, dxlib_d.dxlib.COLORDATA* SrcColor);

	/**
	 * 画像ファイル若しくはメモリ上に展開された画像ファイルイメージからDIBデータを作成する
	 */
	extern core.sys.windows.windef.HBITMAP CreateDIBGraphVer2WithStrLen(const (core.sys.windows.winnt.TCHAR)* FileName, size_t FileNameLength, const (void)* MemImage, int MemImageSize, int ImageType, int ReverseFlag, dxlib_d.dxlib.COLORDATA* SrcColor);

	/**
	 * 画像ファイル若しくはメモリ上に展開された画像ファイルイメージからDIBデータとマスク用DIBデータを作成する
	 */
	extern int CreateDIBGraphVer2_plus_Alpha(const (core.sys.windows.winnt.TCHAR)* FileName, const (void)* MemImage, int MemImageSize, const (void)* AlphaImage, int AlphaImageSize, int ImageType, core.sys.windows.windef.HBITMAP* RGBBmp, core.sys.windows.windef.HBITMAP* AlphaBmp, int ReverseFlag, dxlib_d.dxlib.COLORDATA* SrcColor);

	/**
	 * 画像ファイル若しくはメモリ上に展開された画像ファイルイメージからDIBデータとマスク用DIBデータを作成する
	 */
	extern int CreateDIBGraphVer2_plus_AlphaWithStrLen(const (core.sys.windows.winnt.TCHAR)* FileName, size_t FileNameLength, const (void)* MemImage, int MemImageSize, const (void)* AlphaImage, int AlphaImageSize, int ImageType, core.sys.windows.windef.HBITMAP* RGBBmp, core.sys.windows.windef.HBITMAP* AlphaBmp, int ReverseFlag, dxlib_d.dxlib.COLORDATA* SrcColor);

	/**
	 * BMPデータから基本イメージデータを構築する
	 *
	 * Returns: 0:正常終了  1:コピーを行った  -1:エラー
	 */
	extern int ConvBitmapToGraphImage(const (core.sys.windows.wingdi.BITMAPINFO)* BmpInfo, void* GraphData, dxlib_d.dxlib.BASEIMAGE* GraphImage, int CopyFlag);

	/**
	 * 基本イメージデータをBMPデータに変換するGraphImage を BMP に変換する(アルファデータはあっても無視される)
	 *
	 * Returns: 0:正常終了  1:コピーを行った  -1:エラー
	 */
	extern int ConvGraphImageToBitmap(const (dxlib_d.dxlib.BASEIMAGE)* GraphImage, core.sys.windows.wingdi.BITMAPINFO* BmpInfo, void** GraphData, int CopyFlag, int FullColorConv = core.sys.windows.windef.TRUE);

	// 基本イメージデータ構造体関係

	/**
	 * 基本イメージデータを使用して UpdateLayerdWindow を行う
	 */
	extern int UpdateLayerdWindowForBaseImage(const (dxlib_d.dxlib.BASEIMAGE)* BaseImage);

	/**
	 * 基本イメージデータの指定の範囲を使用して UpdateLayerdWindow を行う
	 */
	extern int UpdateLayerdWindowForBaseImageRect(const (dxlib_d.dxlib.BASEIMAGE)* BaseImage, int x1, int y1, int x2, int y2);

	/**
	 * 乗算済みアルファの基本イメージデータを使用して UpdateLayerdWindow を行う
	 */
	extern int UpdateLayerdWindowForPremultipliedAlphaBaseImage(const (dxlib_d.dxlib.BASEIMAGE)* BaseImage);

	/**
	 * 乗算済みアルファの基本イメージデータの指定の範囲を使用して UpdateLayerdWindow を行う
	 */
	extern int UpdateLayerdWindowForPremultipliedAlphaBaseImageRect(const (dxlib_d.dxlib.BASEIMAGE)* BaseImage, int x1, int y1, int x2, int y2);

	// デスクトップキャプチャ

	/**
	 * デスクトップの指定の領域を基本イメージデータに転送する
	 */
	extern int GetDesktopScreenBaseImage(int x1, int y1, int x2, int y2, dxlib_d.dxlib.BASEIMAGE* BaseImage, int DestX, int DestY);

	// DxSoftImage.cpp関数プロトタイプ宣言
	version (DX_NON_SOFTIMAGE) {
	} else {
		/**
		 * ソフトウエアイメージハンドルを使用して UpdateLayerdWindow を行う
		 */
		extern int UpdateLayerdWindowForSoftImage(int SIHandle);

		/**
		 * ソフトウエアイメージハンドルの指定の範囲を使用して UpdateLayerdWindow を行う
		 */
		extern int UpdateLayerdWindowForSoftImageRect(int SIHandle, int x1, int y1, int x2, int y2);

		/**
		 * 乗算済みアルファのソフトウエアイメージハンドルを使用して UpdateLayerdWindow を行う
		 */
		extern int UpdateLayerdWindowForPremultipliedAlphaSoftImage(int SIHandle);

		/**
		 * 乗算済みアルファのソフトウエアイメージハンドルの指定の範囲を使用して UpdateLayerdWindow を行う
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
		extern int LoadSoundMemByResource(const (core.sys.windows.winnt.TCHAR)* ResourceName, const (core.sys.windows.winnt.TCHAR)* ResourceType, int BufferNum = 1);

		/**
		 * サウンドリソースからサウンドハンドルを作成する
		 */
		extern int LoadSoundMemByResourceWithStrLen(const (core.sys.windows.winnt.TCHAR)* ResourceName, size_t ResourceNameLength, const (core.sys.windows.winnt.TCHAR)* ResourceType, size_t ResourceTypeLength, int BufferNum = 1);

		// 設定関係関数

		/**
		 * サウンドの処理をソフトウエアで行うかどうかを設定する
		 *
		 * Params:
		 *      Flag = TRUE:ソフトウエア  FALSE:ハードウエア( デフォルト )
		 */
		extern int SetUseSoftwareMixingSoundFlag(int Flag);

		/**
		 * サウンドの再生にXAudioを使用するかどうかを設定する
		 *
		 * Params:
		 *      Flag = TRUE:使用する  FALSE:使用しない( デフォルト )
		 */
		extern int SetEnableXAudioFlag(int Flag);

		/**
		 * サウンドの再生にWASAPIを使用するかどうかを設定する
		 *
		 * Params:
		 *      Flag = TRUE:使用する  FALSE:使用しない( デフォルト )
		 *      IsExclusive = TRUE:排他モードを使用する  FALSE:排他モードを使用しない
		 *      DevicePeriod = 再生遅延時間、100ナノ秒単位( 100000 で 10ミリ秒 )、-1でデフォルト値
		 *      SamplePerSec = サンプリングレート
		 */
		extern int SetEnableWASAPIFlag(int Flag, int IsExclusive = core.sys.windows.windef.TRUE, int DevicePeriod = -1, int SamplePerSec = 44100);

		version (DX_NON_ASIO) {
		} else {
			/**
			 * サウンドの再生にASIOを使用するかどうかを設定する
			 *
			 * Params:
			 *      Flag = TRUE:使用する  FALSE:使用しない( デフォルト )
			 *      BufferSize = 再生バッファのサイズ、小さいほど遅延が少なくなりますが、処理が間に合わずにブツブツノイズが発生する可能性も高くなります( -1 でデフォルト値 )
			 *      SamplePerSec = サンプリングレート
			 */
			extern int SetEnableASIOFlag(int Flag, int BufferSize = -1, int SamplePerSec = 44100);
		}

		// 情報取得系関数

		/**
		 * DXライブラリが使用している DirectSound オブジェクトを取得する
		 * 戻り値を IDirectSound* にキャストして下さい
		 */
		extern const (void)* GetDSoundObj();

		// MIDI制御関数

		/**
		 * リソース上のMIDIファイルからMIDIハンドルを作成する
		 */
		extern int LoadMusicMemByResource(const (core.sys.windows.winnt.TCHAR)* ResourceName, const (core.sys.windows.winnt.TCHAR)* ResourceType);

		/**
		 * リソース上のMIDIファイルからMIDIハンドルを作成する
		 */
		extern int LoadMusicMemByResourceWithStrLen(const (core.sys.windows.winnt.TCHAR)* ResourceName, size_t ResourceNameLength, const (core.sys.windows.winnt.TCHAR)* ResourceType, size_t ResourceTypeLength);

		/**
		 * リソースからMIDIファイルを読み込んで演奏する
		 */
		extern int PlayMusicByResource(const (core.sys.windows.winnt.TCHAR)* ResourceName, const (core.sys.windows.winnt.TCHAR)* ResourceType, int PlayType);

		/**
		 * リソースからMIDIファイルを読み込んで演奏する
		 */
		extern int PlayMusicByResourceWithStrLen(const (core.sys.windows.winnt.TCHAR)* ResourceName, size_t ResourceNameLength, const (core.sys.windows.winnt.TCHAR)* ResourceType, size_t ResourceTypeLength, int PlayType);
	}
}
