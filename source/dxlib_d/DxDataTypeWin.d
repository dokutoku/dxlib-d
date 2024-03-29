// -------------------------------------------------------------------------------
//
//         DXライブラリ        Windows用データタイプ定義
//
//                 Ver 3.22c
//
// -------------------------------------------------------------------------------
module dxlib_d.DxDataTypeWin;


version (Windows):

extern (C):
nothrow @nogc:

// インクルード ------------------------------------------------------------------
public import dxlib_d.DxCompileConfig;

/+
#if defined(__c2__) && __clang_major__ == 3 && __clang_minor__ == 8
	//To avoid compile error
	//C:\Program Files (x86)\Windows Kits\8.1\Include\um\combaseapi.h(229,21): error : unknown type name 'IUnknown'
	//          static_cast<IUnknown*>(*pp);    // make sure everyone derives from IUnknown
	struct IUnknown;
#endif
+/

private static import core.stdcpp.xutility;
private static import core.sys.windows.basetsd;
private static import core.sys.windows.basetyps;
private static import core.sys.windows.windef;
private static import core.sys.windows.wingdi;
private static import core.sys.windows.winnt;
private static import core.sys.windows.winuser;
private static import dxlib_d.DxLib;

// DXライブラリに必要なlibファイルを、プロジェクトのカレントフォルダや
// コンパイラのデフォルトLIBパスに設定せずに使用される場合は以下の
// コメントを外してください
//version = DX_LIB_NOT_DEFAULTPATH;

// ライブラリリンク定義--------------------------------------------------------

version (DX_MAKE) {
} else {
	version (DX_LIB_NOT_DEFAULTPATH) {
	} else {
		version (DX_GCC_COMPILE) {
		} else {
			version (DX_SRC_COMPILE) {
			} else {
				 static if (__traits(compiles, core.stdcpp.xutility._MSC_VER)) {
					static if (core.stdcpp.xutility._MSC_VER < 1700) {
						version (Win64) {
							debug {
								//  描画部分の抜き出し
								pragma(lib, "DxDrawFunc_x64_d.lib");

								version (Unicode) {
									//  DXライブラリ使用指定
									pragma(lib, "DxLibW_x64_d.lib");

									//  標準Cライブラリを使用する部分のlibファイルの使用指定
									pragma(lib, "DxUseCLibW_x64_d.lib");
								} else {
									//  DXライブラリ使用指定
									pragma(lib, "DxLib_x64_d.lib");

									//  標準Cライブラリを使用する部分のlibファイルの使用指定
									pragma(lib, "DxUseCLib_x64_d.lib");
								}
							} else {
								//  描画部分の抜き出し
								pragma(lib, "DxDrawFunc_x64.lib");

								version (Unicode) {
									//  DXライブラリ使用指定
									pragma(lib, "DxLibW_x64.lib");

									//  標準Cライブラリを使用する部分のlibファイルの使用指定
									pragma(lib, "DxUseCLibW_x64.lib");
								} else {
									//  DXライブラリ使用指定
									pragma(lib, "DxLib_x64.lib");

									//  標準Cライブラリを使用する部分のlibファイルの使用指定
									pragma(lib, "DxUseCLib_x64.lib");
								}
							}
						} else {
							debug {
								//  描画部分の抜き出し
								pragma(lib, "DxDrawFunc_d.lib");

								version (Unicode) {
									//  DXライブラリ使用指定
									pragma(lib, "DxLibW_d.lib");

									//  標準Cライブラリを使用する部分のlibファイルの使用指定
									pragma(lib, "DxUseCLibW_d.lib");
								} else {
									//  DXライブラリ使用指定
									pragma(lib, "DxLib_d.lib");

									//  標準Cライブラリを使用する部分のlibファイルの使用指定
									pragma(lib, "DxUseCLib_d.lib");
								}
							} else {
								//  描画部分の抜き出し
								pragma(lib, "DxDrawFunc.lib");

								version (Unicode) {
									//  DXライブラリ使用指定
									pragma(lib, "DxLibW.lib");

									//  標準Cライブラリを使用する部分のlibファイルの使用指定
									pragma(lib, "DxUseCLibW.lib");
								} else {
									//  DXライブラリ使用指定
									pragma(lib, "DxLib.lib");

									//  標準Cライブラリを使用する部分のlibファイルの使用指定
									pragma(lib, "DxUseCLib.lib");
								}
							}
						}
					} else {
						static if (core.stdcpp.xutility._MSC_VER >= 1900) {
							version (_DLL) {
								version (Win64) {
									debug {
										//  描画部分の抜き出し
										pragma(lib, "DxDrawFunc_vs2015_x64_MDd.lib");

										version (Unicode) {
											//  DXライブラリ使用指定
											pragma(lib, "DxLibW_vs2015_x64_MDd.lib");

											static if ((__traits(compiles, core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL)) && (core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL == 0)) {
												//  標準Cライブラリを使用する部分のlibファイルの使用指定
												pragma(lib, "DxUseCLibW_vs2015_x64_ItrDbgLv0_MDd.lib");
											} else {
												//  標準Cライブラリを使用する部分のlibファイルの使用指定
												pragma(lib, "DxUseCLibW_vs2015_x64_MDd.lib");
											}
										} else {
											//  DXライブラリ使用指定
											pragma(lib, "DxLib_vs2015_x64_MDd.lib");

											static if ((__traits(compiles, core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL)) && (core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL == 0)) {
												//  標準Cライブラリを使用する部分のlibファイルの使用指定
												pragma(lib, "DxUseCLib_vs2015_x64_ItrDbgLv0_MDd.lib");
											} else {
												//  標準Cライブラリを使用する部分のlibファイルの使用指定
												pragma(lib, "DxUseCLib_vs2015_x64_MDd.lib");
											}
										}
									} else {
										//  描画部分の抜き出し
										pragma(lib, "DxDrawFunc_vs2015_x64_MD.lib");

										version (Unicode) {
											//  DXライブラリ使用指定
											pragma(lib, "DxLibW_vs2015_x64_MD.lib");

											//  標準Cライブラリを使用する部分のlibファイルの使用指定
											pragma(lib, "DxUseCLibW_vs2015_x64_MD.lib");
										} else {
											//  DXライブラリ使用指定
											pragma(lib, "DxLib_vs2015_x64_MD.lib");

											//  標準Cライブラリを使用する部分のlibファイルの使用指定
											pragma(lib, "DxUseCLib_vs2015_x64_MD.lib");
										}
									}
								} else {
									debug {
										//  描画部分の抜き出し
										pragma(lib, "DxDrawFunc_vs2015_x86_MDd.lib");

										version (Unicode) {
											//  DXライブラリ使用指定
											pragma(lib, "DxLibW_vs2015_x86_MDd.lib");

											static if ((__traits(compiles, core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL)) && (core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL == 0)) {
												//  標準Cライブラリを使用する部分のlibファイルの使用指定
												pragma(lib, "DxUseCLibW_vs2015_x86_ItrDbgLv0_MDd.lib");
											} else {
												//  標準Cライブラリを使用する部分のlibファイルの使用指定
												pragma(lib, "DxUseCLibW_vs2015_x86_MDd.lib");
											}
										} else {
											//  DXライブラリ使用指定
											pragma(lib, "DxLib_vs2015_x86_MDd.lib");

											static if ((__traits(compiles, core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL)) && (core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL == 0)) {
												//  標準Cライブラリを使用する部分のlibファイルの使用指定
												pragma(lib, "DxUseCLib_vs2015_x86_ItrDbgLv0_MDd.lib");
											} else {
												//  標準Cライブラリを使用する部分のlibファイルの使用指定
												pragma(lib, "DxUseCLib_vs2015_x86_MDd.lib");
											}
										}
									} else {
										//  描画部分の抜き出し
										pragma(lib, "DxDrawFunc_vs2015_x86_MD.lib");

										version (Unicode) {
											//  DXライブラリ使用指定
											pragma(lib, "DxLibW_vs2015_x86_MD.lib");

											//  標準Cライブラリを使用する部分のlibファイルの使用指定
											pragma(lib, "DxUseCLibW_vs2015_x86_MD.lib");
										} else {
											//  DXライブラリ使用指定
											pragma(lib, "DxLib_vs2015_x86_MD.lib");

											//  標準Cライブラリを使用する部分のlibファイルの使用指定
											pragma(lib, "DxUseCLib_vs2015_x86_MD.lib");
										}
									}
								}
							} else {
								version (Win64) {
									debug {
										//  描画部分の抜き出し
										pragma(lib, "DxDrawFunc_vs2015_x64_MTd.lib");

										version (Unicode) {
											//  DXライブラリ使用指定
											pragma(lib, "DxLibW_vs2015_x64_MTd.lib");

											static if ((__traits(compiles, core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL)) && (core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL == 0)) {
												//  標準Cライブラリを使用する部分のlibファイルの使用指定
												pragma(lib, "DxUseCLibW_vs2015_x64_ItrDbgLv0_MTd.lib");
											} else {
												//  標準Cライブラリを使用する部分のlibファイルの使用指定
												pragma(lib, "DxUseCLibW_vs2015_x64_MTd.lib");
											}
										} else {
											//  DXライブラリ使用指定
											pragma(lib, "DxLib_vs2015_x64_MTd.lib");

											static if ((__traits(compiles, core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL)) && (core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL == 0)) {
												//  標準Cライブラリを使用する部分のlibファイルの使用指定
												pragma(lib, "DxUseCLib_vs2015_x64_ItrDbgLv0_MTd.lib");
											} else {
												//  標準Cライブラリを使用する部分のlibファイルの使用指定
												pragma(lib, "DxUseCLib_vs2015_x64_MTd.lib");
											}
										}
									} else {
										//  描画部分の抜き出し
										pragma(lib, "DxDrawFunc_vs2015_x64_MT.lib");

										version (Unicode) {
											//  DXライブラリ使用指定
											pragma(lib, "DxLibW_vs2015_x64_MT.lib");

											//  標準Cライブラリを使用する部分のlibファイルの使用指定
											pragma(lib, "DxUseCLibW_vs2015_x64_MT.lib");
										} else {
											//  DXライブラリ使用指定
											pragma(lib, "DxLib_vs2015_x64_MT.lib");

											//  標準Cライブラリを使用する部分のlibファイルの使用指定
											pragma(lib, "DxUseCLib_vs2015_x64_MT.lib");
										}
									}
								} else {
									debug {
										//  描画部分の抜き出し
										pragma(lib, "DxDrawFunc_vs2015_x86_MTd.lib");

										version (Unicode) {
											//  DXライブラリ使用指定
											pragma(lib, "DxLibW_vs2015_x86_MTd.lib");

											static if ((__traits(compiles, core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL)) && (core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL == 0)) {
												//  標準Cライブラリを使用する部分のlibファイルの使用指定
												pragma(lib, "DxUseCLibW_vs2015_x86_ItrDbgLv0_MTd.lib");
											} else {
												//  標準Cライブラリを使用する部分のlibファイルの使用指定
												pragma(lib, "DxUseCLibW_vs2015_x86_MTd.lib");
											}
										} else {
											//  DXライブラリ使用指定
											pragma(lib, "DxLib_vs2015_x86_MTd.lib");

											static if ((__traits(compiles, core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL)) && (core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL == 0)) {
												//  標準Cライブラリを使用する部分のlibファイルの使用指定
												pragma(lib, "DxUseCLib_vs2015_x86_ItrDbgLv0_MTd.lib");
											} else {
												//  標準Cライブラリを使用する部分のlibファイルの使用指定
												pragma(lib, "DxUseCLib_vs2015_x86_MTd.lib");
											}
										}
									} else {
										//  描画部分の抜き出し
										pragma(lib, "DxDrawFunc_vs2015_x86_MT.lib");

										version (Unicode) {
											//  DXライブラリ使用指定
											pragma(lib, "DxLibW_vs2015_x86_MT.lib");

											//  標準Cライブラリを使用する部分のlibファイルの使用指定
											pragma(lib, "DxUseCLibW_vs2015_x86_MT.lib");
										} else {
											//  DXライブラリ使用指定
											pragma(lib, "DxLib_vs2015_x86_MT.lib");

											//  標準Cライブラリを使用する部分のlibファイルの使用指定
											pragma(lib, "DxUseCLib_vs2015_x86_MT.lib");
										}
									}
								}
							}
						} else static if (core.stdcpp.xutility._MSC_VER >= 1800) {
							version (Win64) {
								debug {
									//  描画部分の抜き出し
									pragma(lib, "DxDrawFunc_vs2012_x64_d.lib");

									version (Unicode) {
										//  DXライブラリ使用指定
										pragma(lib, "DxLibW_vs2012_x64_d.lib");

										static if ((__traits(compiles, core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL)) && (core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL == 0)) {
											//  標準Cライブラリを使用する部分のlibファイルの使用指定
											pragma(lib, "DxUseCLibW_vs2013_x64_ItrDbgLv0_d.lib");
										} else {
											//  標準Cライブラリを使用する部分のlibファイルの使用指定
											pragma(lib, "DxUseCLibW_vs2013_x64_d.lib");
										}
									} else {
										//  DXライブラリ使用指定
										pragma(lib, "DxLib_vs2012_x64_d.lib");

										static if ((__traits(compiles, core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL)) && (core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL == 0)) {
											//  標準Cライブラリを使用する部分のlibファイルの使用指定
											pragma(lib, "DxUseCLib_vs2013_x64_ItrDbgLv0_d.lib");
										} else {
											//  標準Cライブラリを使用する部分のlibファイルの使用指定
											pragma(lib, "DxUseCLib_vs2013_x64_d.lib");
										}
									}
								} else {
									//  描画部分の抜き出し
									pragma(lib, "DxDrawFunc_vs2012_x64.lib");

									version (Unicode) {
										//  DXライブラリ使用指定
										pragma(lib, "DxLibW_vs2012_x64.lib");

										//  標準Cライブラリを使用する部分のlibファイルの使用指定
										pragma(lib, "DxUseCLibW_vs2013_x64.lib");
									} else {
										//  DXライブラリ使用指定
										pragma(lib, "DxLib_vs2012_x64.lib");

										//  標準Cライブラリを使用する部分のlibファイルの使用指定
										pragma(lib, "DxUseCLib_vs2013_x64.lib");
									}
								}
							} else {
								debug {
									//  描画部分の抜き出し
									pragma(lib, "DxDrawFunc_vs2012_x86_d.lib");

									version (Unicode) {
										//  DXライブラリ使用指定
										pragma(lib, "DxLibW_vs2012_x86_d.lib");

										static if ((__traits(compiles, core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL)) && (core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL == 0)) {
											//  標準Cライブラリを使用する部分のlibファイルの使用指定
											pragma(lib, "DxUseCLibW_vs2013_x86_ItrDbgLv0_d.lib");
										} else {
											//  標準Cライブラリを使用する部分のlibファイルの使用指定
											pragma(lib, "DxUseCLibW_vs2013_x86_d.lib");
										}
									} else {
										//  DXライブラリ使用指定
										pragma(lib, "DxLib_vs2012_x86_d.lib");

										static if ((__traits(compiles, core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL)) && (core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL == 0)) {
											//  標準Cライブラリを使用する部分のlibファイルの使用指定
											pragma(lib, "DxUseCLib_vs2013_x86_ItrDbgLv0_d.lib");
										} else {
											//  標準Cライブラリを使用する部分のlibファイルの使用指定
											pragma(lib, "DxUseCLib_vs2013_x86_d.lib");
										}
									}
								} else {
									//  描画部分の抜き出し
									pragma(lib, "DxDrawFunc_vs2012_x86.lib");

									version (Unicode) {
										//  DXライブラリ使用指定
										pragma(lib, "DxLibW_vs2012_x86.lib");

										//  標準Cライブラリを使用する部分のlibファイルの使用指定
										pragma(lib, "DxUseCLibW_vs2013_x86.lib");
									} else {
										//  DXライブラリ使用指定
										pragma(lib, "DxLib_vs2012_x86.lib");

										//  標準Cライブラリを使用する部分のlibファイルの使用指定
										pragma(lib, "DxUseCLib_vs2013_x86.lib");
									}
								}
							}
						} else static if (core.stdcpp.xutility._MSC_VER >= 1700) {
							version (Win64) {
								debug {
									//  描画部分の抜き出し
									pragma(lib, "DxDrawFunc_vs2012_x64_d.lib");

									version (Unicode) {
										//  DXライブラリ使用指定
										pragma(lib, "DxLibW_vs2012_x64_d.lib");

										static if ((__traits(compiles, core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL)) && (core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL == 0)) {
											//  標準Cライブラリを使用する部分のlibファイルの使用指定
											pragma(lib, "DxUseCLibW_vs2012_x64_ItrDbgLv0_d.lib");
										} else {
											//  標準Cライブラリを使用する部分のlibファイルの使用指定
											pragma(lib, "DxUseCLibW_vs2012_x64_d.lib");
										}
									} else {
										//  DXライブラリ使用指定
										pragma(lib, "DxLib_vs2012_x64_d.lib");

										static if ((__traits(compiles, core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL)) && (core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL == 0)) {
											//  標準Cライブラリを使用する部分のlibファイルの使用指定
											pragma(lib, "DxUseCLib_vs2012_x64_ItrDbgLv0_d.lib");
										} else {
											//  標準Cライブラリを使用する部分のlibファイルの使用指定
											pragma(lib, "DxUseCLib_vs2012_x64_d.lib");
										}
									}
								} else {
									//  描画部分の抜き出し
									pragma(lib, "DxDrawFunc_vs2012_x64.lib");

									version (Unicode) {
										//  DXライブラリ使用指定
										pragma(lib, "DxLibW_vs2012_x64.lib");

										//  標準Cライブラリを使用する部分のlibファイルの使用指定
										pragma(lib, "DxUseCLibW_vs2012_x64.lib");
									} else {
										//  DXライブラリ使用指定
										pragma(lib, "DxLib_vs2012_x64.lib");

										//  標準Cライブラリを使用する部分のlibファイルの使用指定
										pragma(lib, "DxUseCLib_vs2012_x64.lib");
									}
								}
							} else {
								debug {
									//  描画部分の抜き出し
									pragma(lib, "DxDrawFunc_vs2012_x86_d.lib");

									version (Unicode) {
										//  DXライブラリ使用指定
										pragma(lib, "DxLibW_vs2012_x86_d.lib");

										static if ((__traits(compiles, core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL)) && (core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL == 0)) {
											//  標準Cライブラリを使用する部分のlibファイルの使用指定
											pragma(lib, "DxUseCLibW_vs2012_x86_ItrDbgLv0_d.lib");
										} else {
											//  標準Cライブラリを使用する部分のlibファイルの使用指定
											pragma(lib, "DxUseCLibW_vs2012_x86_d.lib");
										}
									} else {
										//  DXライブラリ使用指定
										pragma(lib, "DxLib_vs2012_x86_d.lib");

										static if ((__traits(compiles, core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL)) && (core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL == 0)) {
											//  標準Cライブラリを使用する部分のlibファイルの使用指定
											pragma(lib, "DxUseCLib_vs2012_x86_ItrDbgLv0_d.lib");
										} else {
											//  標準Cライブラリを使用する部分のlibファイルの使用指定
											pragma(lib, "DxUseCLib_vs2012_x86_d.lib");
										}
									}
								} else {
									//  描画部分の抜き出し
									pragma(lib, "DxDrawFunc_vs2012_x86.lib");

									version (Unicode) {
										//  DXライブラリ使用指定
										pragma(lib, "DxLibW_vs2012_x86.lib");

										//  標準Cライブラリを使用する部分のlibファイルの使用指定
										pragma(lib, "DxUseCLibW_vs2012_x86.lib");
									} else {
										//  DXライブラリ使用指定
										pragma(lib, "DxLib_vs2012_x86.lib");

										//  標準Cライブラリを使用する部分のlibファイルの使用指定
										pragma(lib, "DxUseCLib_vs2012_x86.lib");
									}
								}
							}
						}
					}
				} else {
					//  描画部分の抜き出し
					pragma(lib, "DxDrawFunc.lib");

					version (Unicode) {
						//  DXライブラリ使用指定
						pragma(lib, "DxLibW.lib");

						//  標準Cライブラリを使用する部分のlibファイルの使用指定
						pragma(lib, "DxUseCLibW.lib");
					} else {
						//  DXライブラリ使用指定
						pragma(lib, "DxLib.lib");

						//  標準Cライブラリを使用する部分のlibファイルの使用指定
						pragma(lib, "DxUseCLib.lib");
					}
				}

				debug {
					pragma(linkerDirective, "/NODEFAULTLIB:libcmt.lib");
					pragma(linkerDirective, "/NODEFAULTLIB:libc.lib");
					pragma(linkerDirective, "/NODEFAULTLIB:libcd.lib");
					//pragma(linkerDirective, "/NODEFAULTLIB:msvcrt.lib");
					//pragma(linkerDirective, "/NODEFAULTLIB:msvcrtd.lib");
				} else {
					pragma(linkerDirective, "/NODEFAULTLIB:libcmtd.lib");
					pragma(linkerDirective, "/NODEFAULTLIB:libc.lib");
					pragma(linkerDirective, "/NODEFAULTLIB:libcd.lib");
					//pragma(linkerDirective, "/NODEFAULTLIB:msvcrt.lib");
					//pragma(linkerDirective, "/NODEFAULTLIB:msvcrtd.lib");
				}
			}

			//  C標準マルチスレッド対応ライブラリ
			//pragma(lib, "libcmt.lib");

			//  Win32カーネルライブラリ
			pragma(lib, "kernel32.lib");

			// Win32APIライブラリ
			//pragma(lib, "comctl32.lib");

			//  Win32APIライブラリ
			pragma(lib, "user32.lib");

			//  Win32APIライブラリ
			pragma(lib, "gdi32.lib");

			//  Win32APIライブラリ
			pragma(lib, "advapi32.lib");

			//  Win32APIライブラリ
			//pragma(lib, "ole32.lib");

			//  マルチメディアライブラリ
			pragma(lib, "shell32.lib");

			//  マルチメディアライブラリ
			//pragma(lib, "winmm.lib");

			version (DX_NON_MOVIE) {
			} else {
				// DirectShowライブラリ
				//pragma(lib, "Strmiids.lib");
			}

			version (DX_NON_NETWORK) {
			} else {
				//  WinSocketsライブラリ
				//pragma(lib, "wsock32.lib");
			}

			version (DX_NON_KEYEX) {
			} else {
				// IME操作用ライブラリ
				//pragma(lib, "imm32.lib");
			}

			version (DX_NON_ACM) {
			} else {
				// ACM操作用ライブラリ
				//pragma(lib, "msacm32.lib");
			}

			version (DX_NON_BULLET_PHYSICS) {
			} else {
				 static if (__traits(compiles, core.stdcpp.xutility._MSC_VER)) {
					static if (core.stdcpp.xutility._MSC_VER < 1700) {
						version (DX_USE_VC8_BULLET_PHYSICS_LIB) {
							version (Win64) {
								debug {
									// Visual C++ 8.0でコンパイルしたBullet Physics ライブラリ
									pragma(lib, "libbulletcollision_vc8_x64_d.lib");

									pragma(lib, "libbulletdynamics_vc8_x64_d.lib");
									pragma(lib, "libbulletmath_vc8_x64_d.lib");
								} else {
									// Visual C++ 8.0でコンパイルしたBullet Physics ライブラリ
									pragma(lib, "libbulletcollision_vc8_x64.lib");

									pragma(lib, "libbulletdynamics_vc8_x64.lib");
									pragma(lib, "libbulletmath_vc8_x64.lib");
								}
							} else {
								debug {
									// Visual C++ 8.0でコンパイルしたBullet Physics ライブラリ
									pragma(lib, "libbulletcollision_vc8_d.lib");

									pragma(lib, "libbulletdynamics_vc8_d.lib");
									pragma(lib, "libbulletmath_vc8_d.lib");
								} else {
									// Visual C++ 8.0でコンパイルしたBullet Physics ライブラリ
									pragma(lib, "libbulletcollision_vc8.lib");

									pragma(lib, "libbulletdynamics_vc8.lib");
									pragma(lib, "libbulletmath_vc8.lib");
								}
							}
						} else {
							version (Win64) {
								debug {
									// Visual C++ 8.0でコンパイルしたBullet Physics ライブラリ
									pragma(lib, "libbulletcollision_vc8_x64_d.lib");

									pragma(lib, "libbulletdynamics_vc8_x64_d.lib");
									pragma(lib, "libbulletmath_vc8_x64_d.lib");
								} else {
									// Visual C++ 8.0でコンパイルしたBullet Physics ライブラリ
									pragma(lib, "libbulletcollision_vc8_x64.lib");

									pragma(lib, "libbulletdynamics_vc8_x64.lib");
									pragma(lib, "libbulletmath_vc8_x64.lib");
								}
							} else {
								debug {
									// Visual C++ 6.0でコンパイルしたBullet Physics ライブラリ
									pragma(lib, "libbulletcollision_vc6_d.lib");

									pragma(lib, "libbulletdynamics_vc6_d.lib");
									pragma(lib, "libbulletmath_vc6_d.lib");
								} else {
									// Visual C++ 6.0でコンパイルしたBullet Physics ライブラリ
									pragma(lib, "libbulletcollision_vc6.lib");

									pragma(lib, "libbulletdynamics_vc6.lib");
									pragma(lib, "libbulletmath_vc6.lib");
								}
							}
						}
					} else {
						static if (core.stdcpp.xutility._MSC_VER >= 1900) {
							version (_DLL) {
								version (Win64) {
									debug {
										static if ((__traits(compiles, core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL)) && (core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL == 0)) {
											pragma(lib, "libbulletcollision_vs2015_x64_ItrDbgLv0_MDd.lib");
											pragma(lib, "libbulletdynamics_vs2015_x64_ItrDbgLv0_MDd.lib");
											pragma(lib, "libbulletmath_vs2015_x64_ItrDbgLv0_MDd.lib");
										} else {
											pragma(lib, "libbulletcollision_vs2015_x64_MDd.lib");
											pragma(lib, "libbulletdynamics_vs2015_x64_MDd.lib");
											pragma(lib, "libbulletmath_vs2015_x64_MDd.lib");
										}
									} else {
										pragma(lib, "libbulletcollision_vs2015_x64_MD.lib");
										pragma(lib, "libbulletdynamics_vs2015_x64_MD.lib");
										pragma(lib, "libbulletmath_vs2015_x64_MD.lib");
									}
								} else {
									debug {
										static if ((__traits(compiles, core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL)) && (core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL == 0)) {
											pragma(lib, "libbulletcollision_vs2015_x86_ItrDbgLv0_MDd.lib");
											pragma(lib, "libbulletdynamics_vs2015_x86_ItrDbgLv0_MDd.lib");
											pragma(lib, "libbulletmath_vs2015_x86_ItrDbgLv0_MDd.lib");
										} else {
											pragma(lib, "libbulletcollision_vs2015_x86_MDd.lib");
											pragma(lib, "libbulletdynamics_vs2015_x86_MDd.lib");
											pragma(lib, "libbulletmath_vs2015_x86_MDd.lib");
										}
									} else {
										pragma(lib, "libbulletcollision_vs2015_x86_MD.lib");
										pragma(lib, "libbulletdynamics_vs2015_x86_MD.lib");
										pragma(lib, "libbulletmath_vs2015_x86_MD.lib");
									}
								}
							} else {
								version (Win64) {
									debug {
										static if ((__traits(compiles, core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL)) && (core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL == 0)) {
											pragma(lib, "libbulletcollision_vs2015_x64_ItrDbgLv0_MTd.lib");
											pragma(lib, "libbulletdynamics_vs2015_x64_ItrDbgLv0_MTd.lib");
											pragma(lib, "libbulletmath_vs2015_x64_ItrDbgLv0_MTd.lib");
										} else {
											pragma(lib, "libbulletcollision_vs2015_x64_MTd.lib");
											pragma(lib, "libbulletdynamics_vs2015_x64_MTd.lib");
											pragma(lib, "libbulletmath_vs2015_x64_MTd.lib");
										}
									} else {
										pragma(lib, "libbulletcollision_vs2015_x64_MT.lib");
										pragma(lib, "libbulletdynamics_vs2015_x64_MT.lib");
										pragma(lib, "libbulletmath_vs2015_x64_MT.lib");
									}
								} else {
									debug {
										static if ((__traits(compiles, core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL)) && (core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL == 0)) {
											pragma(lib, "libbulletcollision_vs2015_x86_ItrDbgLv0_MTd.lib");
											pragma(lib, "libbulletdynamics_vs2015_x86_ItrDbgLv0_MTd.lib");
											pragma(lib, "libbulletmath_vs2015_x86_ItrDbgLv0_MTd.lib");
										} else {
											pragma(lib, "libbulletcollision_vs2015_x86_MTd.lib");
											pragma(lib, "libbulletdynamics_vs2015_x86_MTd.lib");
											pragma(lib, "libbulletmath_vs2015_x86_MTd.lib");
										}
									} else {
										pragma(lib, "libbulletcollision_vs2015_x86_MT.lib");
										pragma(lib, "libbulletdynamics_vs2015_x86_MT.lib");
										pragma(lib, "libbulletmath_vs2015_x86_MT.lib");
									}
								}
							}
						} else static if (core.stdcpp.xutility._MSC_VER >= 1800) {
							version (Win64) {
								debug {
									static if ((__traits(compiles, core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL)) && (core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL == 0)) {
										pragma(lib, "libbulletcollision_vs2013_x64_ItrDbgLv0_d.lib");
										pragma(lib, "libbulletdynamics_vs2013_x64_ItrDbgLv0_d.lib");
										pragma(lib, "libbulletmath_vs2013_x64_ItrDbgLv0_d.lib");
									} else {
										pragma(lib, "libbulletcollision_vs2013_x64_d.lib");
										pragma(lib, "libbulletdynamics_vs2013_x64_d.lib");
										pragma(lib, "libbulletmath_vs2013_x64_d.lib");
									}
								} else {
									pragma(lib, "libbulletcollision_vs2013_x64.lib");
									pragma(lib, "libbulletdynamics_vs2013_x64.lib");
									pragma(lib, "libbulletmath_vs2013_x64.lib");
								}
							} else {
								debug {
									static if ((__traits(compiles, core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL)) && (core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL == 0)) {
										pragma(lib, "libbulletcollision_vs2013_x86_ItrDbgLv0_d.lib");
										pragma(lib, "libbulletdynamics_vs2013_x86_ItrDbgLv0_d.lib");
										pragma(lib, "libbulletmath_vs2013_x86_ItrDbgLv0_d.lib");
									} else {
										pragma(lib, "libbulletcollision_vs2013_x86_d.lib");
										pragma(lib, "libbulletdynamics_vs2013_x86_d.lib");
										pragma(lib, "libbulletmath_vs2013_x86_d.lib");
									}
								} else {
									pragma(lib, "libbulletcollision_vs2013_x86.lib");
									pragma(lib, "libbulletdynamics_vs2013_x86.lib");
									pragma(lib, "libbulletmath_vs2013_x86.lib");
								}
							}
						} else static if (core.stdcpp.xutility._MSC_VER >= 1700) {
							version (Win64) {
								debug {
									static if ((__traits(compiles, core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL)) && (core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL == 0)) {
										pragma(lib, "libbulletcollision_vs2012_x64_ItrDbgLv0_d.lib");
										pragma(lib, "libbulletdynamics_vs2012_x64_ItrDbgLv0_d.lib");
										pragma(lib, "libbulletmath_vs2012_x64_ItrDbgLv0_d.lib");
									} else {
										pragma(lib, "libbulletcollision_vs2012_x64_d.lib");
										pragma(lib, "libbulletdynamics_vs2012_x64_d.lib");
										pragma(lib, "libbulletmath_vs2012_x64_d.lib");
									}
								} else {
									pragma(lib, "libbulletcollision_vs2012_x64.lib");
									pragma(lib, "libbulletdynamics_vs2012_x64.lib");
									pragma(lib, "libbulletmath_vs2012_x64.lib");
								}
							} else {
								debug {
									static if ((__traits(compiles, core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL)) && (core.stdcpp.xutility._ITERATOR_DEBUG_LEVEL == 0)) {
										pragma(lib, "libbulletcollision_vs2012_x86_ItrDbgLv0_d.lib");
										pragma(lib, "libbulletdynamics_vs2012_x86_ItrDbgLv0_d.lib");
										pragma(lib, "libbulletmath_vs2012_x86_ItrDbgLv0_d.lib");
									} else {
										pragma(lib, "libbulletcollision_vs2012_x86_d.lib");
										pragma(lib, "libbulletdynamics_vs2012_x86_d.lib");
										pragma(lib, "libbulletmath_vs2012_x86_d.lib");
									}
								} else {
									pragma(lib, "libbulletcollision_vs2012_x86.lib");
									pragma(lib, "libbulletdynamics_vs2012_x86.lib");
									pragma(lib, "libbulletmath_vs2012_x86.lib");
								}
							}
						}
					}
				} else {
					// Bullet Physics ライブラリ
					pragma(lib, "libbulletcollision.lib");

					pragma(lib, "libbulletdynamics.lib");
					pragma(lib, "libbulletmath.lib");
				}
			}

			version (DX_NON_TIFFREAD) {
			} else {
				 static if (__traits(compiles, core.stdcpp.xutility._MSC_VER)) {
					static if (core.stdcpp.xutility._MSC_VER < 1700) {
						version (Win64) {
							debug {
								// TIFFライブラリ
								pragma(lib, "libtiff_x64_d.lib");
							} else {
								// TIFFライブラリ
								pragma(lib, "libtiff_x64.lib");
							}
						} else {
							debug {
								// TIFFライブラリ
								pragma(lib, "libtiff_d.lib");
							} else {
								// TIFFライブラリ
								pragma(lib, "libtiff.lib");
							}
						}
					} else {
						static if (core.stdcpp.xutility._MSC_VER >= 1900) {
							version (_DLL) {
								version (Win64) {
									debug {
										// TIFFライブラリ
										pragma(lib, "libtiff_vs2015_x64_MDd.lib");
									} else {
										// TIFFライブラリ
										pragma(lib, "libtiff_vs2015_x64_MD.lib");
									}
								} else {
									debug {
										// TIFFライブラリ
										pragma(lib, "libtiff_vs2015_x86_MDd.lib");
									} else {
										// TIFFライブラリ
										pragma(lib, "libtiff_vs2015_x86_MD.lib");
									}
								}
							} else {
								version (Win64) {
									debug {
										// TIFFライブラリ
										pragma(lib, "libtiff_vs2015_x64_MTd.lib");
									} else {
										// TIFFライブラリ
										pragma(lib, "libtiff_vs2015_x64_MT.lib");
									}
								} else {
									debug {
										// TIFFライブラリ
										pragma(lib, "libtiff_vs2015_x86_MTd.lib");
									} else {
										// TIFFライブラリ
										pragma(lib, "libtiff_vs2015_x86_MT.lib");
									}
								}
							}
						} else static if (core.stdcpp.xutility._MSC_VER >= 1800) {
							version (Win64) {
								debug {
									// TIFFライブラリ
									pragma(lib, "libtiff_vs2013_x64_d.lib");
								} else {
									// TIFFライブラリ
									pragma(lib, "libtiff_vs2013_x64.lib");
								}
							} else {
								debug {
									// TIFFライブラリ
									pragma(lib, "libtiff_vs2013_x86_d.lib");
								} else {
									// TIFFライブラリ
									pragma(lib, "libtiff_vs2013_x86.lib");
								}
							}
						} else static if (core.stdcpp.xutility._MSC_VER >= 1700) {
							version (Win64) {
								debug {
									// TIFFライブラリ
									pragma(lib, "libtiff_vs2012_x64_d.lib");
								} else {
									// TIFFライブラリ
									pragma(lib, "libtiff_vs2012_x64.lib");
								}
							} else {
								debug {
									// TIFFライブラリ
									pragma(lib, "libtiff_vs2012_x86_d.lib");
								} else {
									// TIFFライブラリ
									pragma(lib, "libtiff_vs2012_x86.lib");
								}
							}
						}
					}
				} else {
					// TIFFライブラリ
					pragma(lib, "libtiff.lib");
				}
			}

			version (DX_NON_PNGREAD) {
			} else {
				 static if (__traits(compiles, core.stdcpp.xutility._MSC_VER)) {
					static if (core.stdcpp.xutility._MSC_VER < 1700) {
						version (Win64) {
							debug {
								// PNGライブラリ
								pragma(lib, "libpng_x64_d.lib");

								pragma(lib, "zlib_x64_d.lib");
							} else {
								// PNGライブラリ
								pragma(lib, "libpng_x64.lib");

								pragma(lib, "zlib_x64.lib");
							}
						} else {
							debug {
								// PNGライブラリ
								pragma(lib, "libpng_d.lib");

								pragma(lib, "zlib_d.lib");
							} else {
								// PNGライブラリ
								pragma(lib, "libpng.lib");

								pragma(lib, "zlib.lib");
							}
						}
					} else {
						static if (core.stdcpp.xutility._MSC_VER >= 1900) {
							version (_DLL) {
								version (Win64) {
									debug {
										// PNGライブラリ
										pragma(lib, "libpng_vs2015_x64_MDd.lib");

										pragma(lib, "zlib_vs2015_x64_MDd.lib");
									} else {
										// PNGライブラリ
										pragma(lib, "libpng_vs2015_x64_MD.lib");

										pragma(lib, "zlib_vs2015_x64_MD.lib");
									}
								} else {
									debug {
										// PNGライブラリ
										pragma(lib, "libpng_vs2015_x86_MDd.lib");

										pragma(lib, "zlib_vs2015_x86_MDd.lib");
									} else {
										// PNGライブラリ
										pragma(lib, "libpng_vs2015_x86_MD.lib");

										pragma(lib, "zlib_vs2015_x86_MD.lib");
									}
								}
							} else {
								version (Win64) {
									debug {
										// PNGライブラリ
										pragma(lib, "libpng_vs2015_x64_MTd.lib");

										pragma(lib, "zlib_vs2015_x64_MTd.lib");
									} else {
										// PNGライブラリ
										pragma(lib, "libpng_vs2015_x64_MT.lib");

										pragma(lib, "zlib_vs2015_x64_MT.lib");
									}
								} else {
									debug {
										// PNGライブラリ
										pragma(lib, "libpng_vs2015_x86_MTd.lib");

										pragma(lib, "zlib_vs2015_x86_MTd.lib");
									} else {
										// PNGライブラリ
										pragma(lib, "libpng_vs2015_x86_MT.lib");

										pragma(lib, "zlib_vs2015_x86_MT.lib");
									}
								}
							}
						} else static if (core.stdcpp.xutility._MSC_VER >= 1800) {
							version (Win64) {
								debug {
									// PNGライブラリ
									pragma(lib, "libpng_vs2013_x64_d.lib");

									pragma(lib, "zlib_vs2013_x64_d.lib");
								} else {
									// PNGライブラリ
									pragma(lib, "libpng_vs2013_x64.lib");

									pragma(lib, "zlib_vs2013_x64.lib");
								}
							} else {
								debug {
									// PNGライブラリ
									pragma(lib, "libpng_vs2013_x86_d.lib");

									pragma(lib, "zlib_vs2013_x86_d.lib");
								} else {
									// PNGライブラリ
									pragma(lib, "libpng_vs2013_x86.lib");

									pragma(lib, "zlib_vs2013_x86.lib");
								}
							}
						} else static if (core.stdcpp.xutility._MSC_VER >= 1700) {
							version (Win64) {
								debug {
									// PNGライブラリ
									pragma(lib, "libpng_vs2012_x64_d.lib");

									pragma(lib, "zlib_vs2012_x64_d.lib");
								} else {
									// PNGライブラリ
									pragma(lib, "libpng_vs2012_x64.lib");

									pragma(lib, "zlib_vs2012_x64.lib");
								}
							} else {
								debug {
									// PNGライブラリ
									pragma(lib, "libpng_vs2012_x86_d.lib");

									pragma(lib, "zlib_vs2012_x86_d.lib");
								} else {
									// PNGライブラリ
									pragma(lib, "libpng_vs2012_x86.lib");

									pragma(lib, "zlib_vs2012_x86.lib");
								}
							}
						}
					}
				} else {
					// PNGライブラリ
					pragma(lib, "libpng.lib");

					pragma(lib, "zlib.lib");
				}
			}

			version (DX_NON_JPEGREAD) {
			} else {
				 static if (__traits(compiles, core.stdcpp.xutility._MSC_VER)) {
					static if (core.stdcpp.xutility._MSC_VER < 1700) {
						version (Win64) {
							debug {
								// JPEGライブラリ
								pragma(lib, "libjpeg_x64_d.lib");
							} else {
								// JPEGライブラリ
								pragma(lib, "libjpeg_x64.lib");
							}
						} else {
							debug {
								// JPEGライブラリ
								pragma(lib, "libjpeg_d.lib");
							} else {
								// JPEGライブラリ
								pragma(lib, "libjpeg.lib");
							}
						}
					} else {
						static if (core.stdcpp.xutility._MSC_VER >= 1900) {
							version (_DLL) {
								version (Win64) {
									debug {
										// JPEGライブラリ
										pragma(lib, "libjpeg_vs2015_x64_MDd.lib");
									} else {
										// JPEGライブラリ
										pragma(lib, "libjpeg_vs2015_x64_MD.lib");
									}
								} else {
									debug {
										// JPEGライブラリ
										pragma(lib, "libjpeg_vs2015_x86_MDd.lib");
									} else {
										// JPEGライブラリ
										pragma(lib, "libjpeg_vs2015_x86_MD.lib");
									}
								}
							} else {
								version (Win64) {
									debug {
										// JPEGライブラリ
										pragma(lib, "libjpeg_vs2015_x64_MTd.lib");
									} else {
										// JPEGライブラリ
										pragma(lib, "libjpeg_vs2015_x64_MT.lib");
									}
								} else {
									debug {
										// JPEGライブラリ
										pragma(lib, "libjpeg_vs2015_x86_MTd.lib");
									} else {
										// JPEGライブラリ
										pragma(lib, "libjpeg_vs2015_x86_MT.lib");
									}
								}
							}
						} else static if (core.stdcpp.xutility._MSC_VER >= 1800) {
							version (Win64) {
								debug {
									// JPEGライブラリ
									pragma(lib, "libjpeg_vs2013_x64_d.lib");
								} else {
									// JPEGライブラリ
									pragma(lib, "libjpeg_vs2013_x64.lib");
								}
							} else {
								debug {
									// JPEGライブラリ
									pragma(lib, "libjpeg_vs2013_x86_d.lib");
								} else {
									// JPEGライブラリ
									pragma(lib, "libjpeg_vs2013_x86.lib");
								}
							}
						} else static if (core.stdcpp.xutility._MSC_VER >= 1700) {
							version (Win64) {
								debug {
									// JPEGライブラリ
									pragma(lib, "libjpeg_vs2012_x64_d.lib");
								} else {
									// JPEGライブラリ
									pragma(lib, "libjpeg_vs2012_x64.lib");
								}
							} else {
								debug {
									// JPEGライブラリ
									pragma(lib, "libjpeg_vs2012_x86_d.lib");
								} else {
									// JPEGライブラリ
									pragma(lib, "libjpeg_vs2012_x86.lib");
								}
							}
						}
					}
				} else {
					// JPEGライブラリ
					pragma(lib, "libjpeg.lib");
				}
			}

			// OggVorbisライブラリ
			version (DX_NON_OGGVORBIS) {
			} else {
				 static if (__traits(compiles, core.stdcpp.xutility._MSC_VER)) {
					static if (core.stdcpp.xutility._MSC_VER < 1700) {
						version (Win64) {
							debug {
								pragma(lib, "ogg_static_x64_d.lib");
								pragma(lib, "vorbis_static_x64_d.lib");
								pragma(lib, "vorbisfile_static_x64_d.lib");
							} else {
								pragma(lib, "ogg_static_x64.lib");
								pragma(lib, "vorbis_static_x64.lib");
								pragma(lib, "vorbisfile_static_x64.lib");
							}
						} else {
							debug {
								pragma(lib, "ogg_static_d.lib");
								pragma(lib, "vorbis_static_d.lib");
								pragma(lib, "vorbisfile_static_d.lib");
							} else {
								pragma(lib, "ogg_static.lib");
								pragma(lib, "vorbis_static.lib");
								pragma(lib, "vorbisfile_static.lib");
							}
						}
					} else {
						static if (core.stdcpp.xutility._MSC_VER >= 1900) {
							version (_DLL) {
								version (Win64) {
									debug {
										pragma(lib, "ogg_static_vs2015_x64_MDd.lib");
										pragma(lib, "vorbis_static_vs2015_x64_MDd.lib");
										pragma(lib, "vorbisfile_static_vs2015_x64_MDd.lib");
									} else {
										pragma(lib, "ogg_static_vs2015_x64_MD.lib");
										pragma(lib, "vorbis_static_vs2015_x64_MD.lib");
										pragma(lib, "vorbisfile_static_vs2015_x64_MD.lib");
									}
								} else {
									debug {
										pragma(lib, "ogg_static_vs2015_x86_MDd.lib");
										pragma(lib, "vorbis_static_vs2015_x86_MDd.lib");
										pragma(lib, "vorbisfile_static_vs2015_x86_MDd.lib");
									} else {
										pragma(lib, "ogg_static_vs2015_x86_MD.lib");
										pragma(lib, "vorbis_static_vs2015_x86_MD.lib");
										pragma(lib, "vorbisfile_static_vs2015_x86_MD.lib");
									}
								}
							} else {
								version (Win64) {
									debug {
										pragma(lib, "ogg_static_vs2015_x64_MTd.lib");
										pragma(lib, "vorbis_static_vs2015_x64_MTd.lib");
										pragma(lib, "vorbisfile_static_vs2015_x64_MTd.lib");
									} else {
										pragma(lib, "ogg_static_vs2015_x64_MT.lib");
										pragma(lib, "vorbis_static_vs2015_x64_MT.lib");
										pragma(lib, "vorbisfile_static_vs2015_x64_MT.lib");
									}
								} else {
									debug {
										pragma(lib, "ogg_static_vs2015_x86_MTd.lib");
										pragma(lib, "vorbis_static_vs2015_x86_MTd.lib");
										pragma(lib, "vorbisfile_static_vs2015_x86_MTd.lib");
									} else {
										pragma(lib, "ogg_static_vs2015_x86_MT.lib");
										pragma(lib, "vorbis_static_vs2015_x86_MT.lib");
										pragma(lib, "vorbisfile_static_vs2015_x86_MT.lib");
									}
								}
							}
						} else static if (core.stdcpp.xutility._MSC_VER >= 1800) {
							version (Win64) {
								debug {
									pragma(lib, "ogg_static_vs2013_x64_d.lib");
									pragma(lib, "vorbis_static_vs2013_x64_d.lib");
									pragma(lib, "vorbisfile_static_vs2013_x64_d.lib");
								} else {
									pragma(lib, "ogg_static_vs2013_x64.lib");
									pragma(lib, "vorbis_static_vs2013_x64.lib");
									pragma(lib, "vorbisfile_static_vs2013_x64.lib");
								}
							} else {
								debug {
									pragma(lib, "ogg_static_vs2013_x86_d.lib");
									pragma(lib, "vorbis_static_vs2013_x86_d.lib");
									pragma(lib, "vorbisfile_static_vs2013_x86_d.lib");
								} else {
									pragma(lib, "ogg_static_vs2013_x86.lib");
									pragma(lib, "vorbis_static_vs2013_x86.lib");
									pragma(lib, "vorbisfile_static_vs2013_x86.lib");
								}
							}
						} else static if (core.stdcpp.xutility._MSC_VER >= 1700) {
							version (Win64) {
								debug {
									pragma(lib, "ogg_static_vs2012_x64_d.lib");
									pragma(lib, "vorbis_static_vs2012_x64_d.lib");
									pragma(lib, "vorbisfile_static_vs2012_x64_d.lib");
								} else {
									pragma(lib, "ogg_static_vs2012_x64.lib");
									pragma(lib, "vorbis_static_vs2012_x64.lib");
									pragma(lib, "vorbisfile_static_vs2012_x64.lib");
								}
							} else {
								debug {
									pragma(lib, "ogg_static_vs2012_x86_d.lib");
									pragma(lib, "vorbis_static_vs2012_x86_d.lib");
									pragma(lib, "vorbisfile_static_vs2012_x86_d.lib");
								} else {
									pragma(lib, "ogg_static_vs2012_x86.lib");
									pragma(lib, "vorbis_static_vs2012_x86.lib");
									pragma(lib, "vorbisfile_static_vs2012_x86.lib");
								}
							}
						}
					}
				} else {
					pragma(lib, "ogg_static.lib");
					pragma(lib, "vorbis_static.lib");
					pragma(lib, "vorbisfile_static.lib");
				}
			}

			// OggTheoraライブラリ
			version (DX_NON_OGGTHEORA) {
			} else {
				 static if (__traits(compiles, core.stdcpp.xutility._MSC_VER)) {
					static if (core.stdcpp.xutility._MSC_VER < 1700) {
						version (Win64) {
							debug {
								pragma(lib, "ogg_static_x64_d.lib");
								pragma(lib, "vorbis_static_x64_d.lib");
								pragma(lib, "vorbisfile_static_x64_d.lib");

								pragma(lib, "libtheora_static_x64_d.lib");
							} else {
								pragma(lib, "ogg_static_x64.lib");
								pragma(lib, "vorbis_static_x64.lib");
								pragma(lib, "vorbisfile_static_x64.lib");

								pragma(lib, "libtheora_static_x64.lib");
							}
						} else {
							debug {
								pragma(lib, "ogg_static_d.lib");
								pragma(lib, "vorbis_static_d.lib");
								pragma(lib, "vorbisfile_static_d.lib");

								pragma(lib, "libtheora_static_d.lib");
							} else {
								pragma(lib, "ogg_static.lib");
								pragma(lib, "vorbis_static.lib");
								pragma(lib, "vorbisfile_static.lib");

								pragma(lib, "libtheora_static.lib");
							}
						}
					} else {
						static if (core.stdcpp.xutility._MSC_VER >= 1900) {
							version (_DLL) {
								version (Win64) {
									debug {
										pragma(lib, "ogg_static_vs2015_x64_MDd.lib");
										pragma(lib, "vorbis_static_vs2015_x64_MDd.lib");
										pragma(lib, "vorbisfile_static_vs2015_x64_MDd.lib");

										pragma(lib, "libtheora_static_vs2015_x64_MDd.lib");
									} else {
										pragma(lib, "ogg_static_vs2015_x64_MD.lib");
										pragma(lib, "vorbis_static_vs2015_x64_MD.lib");
										pragma(lib, "vorbisfile_static_vs2015_x64_MD.lib");

										pragma(lib, "libtheora_static_vs2015_x64_MD.lib");
									}
								} else {
									debug {
										pragma(lib, "ogg_static_vs2015_x86_MDd.lib");
										pragma(lib, "vorbis_static_vs2015_x86_MDd.lib");
										pragma(lib, "vorbisfile_static_vs2015_x86_MDd.lib");

										pragma(lib, "libtheora_static_vs2015_x86_MDd.lib");
									} else {
										pragma(lib, "ogg_static_vs2015_x86_MD.lib");
										pragma(lib, "vorbis_static_vs2015_x86_MD.lib");
										pragma(lib, "vorbisfile_static_vs2015_x86_MD.lib");

										pragma(lib, "libtheora_static_vs2015_x86_MD.lib");
									}
								}
							} else {
								version (Win64) {
									debug {
										pragma(lib, "ogg_static_vs2015_x64_MTd.lib");
										pragma(lib, "vorbis_static_vs2015_x64_MTd.lib");
										pragma(lib, "vorbisfile_static_vs2015_x64_MTd.lib");

										pragma(lib, "libtheora_static_vs2015_x64_MTd.lib");
									} else {
										pragma(lib, "ogg_static_vs2015_x64_MT.lib");
										pragma(lib, "vorbis_static_vs2015_x64_MT.lib");
										pragma(lib, "vorbisfile_static_vs2015_x64_MT.lib");

										pragma(lib, "libtheora_static_vs2015_x64_MT.lib");
									}
								} else {
									debug {
										pragma(lib, "ogg_static_vs2015_x86_MTd.lib");
										pragma(lib, "vorbis_static_vs2015_x86_MTd.lib");
										pragma(lib, "vorbisfile_static_vs2015_x86_MTd.lib");

										pragma(lib, "libtheora_static_vs2015_x86_MTd.lib");
									} else {
										pragma(lib, "ogg_static_vs2015_x86_MT.lib");
										pragma(lib, "vorbis_static_vs2015_x86_MT.lib");
										pragma(lib, "vorbisfile_static_vs2015_x86_MT.lib");

										pragma(lib, "libtheora_static_vs2015_x86_MT.lib");
									}
								}
							}
						} else static if (core.stdcpp.xutility._MSC_VER >= 1800) {
							version (Win64) {
								debug {
									pragma(lib, "ogg_static_vs2013_x64_d.lib");
									pragma(lib, "vorbis_static_vs2013_x64_d.lib");
									pragma(lib, "vorbisfile_static_vs2013_x64_d.lib");

									pragma(lib, "libtheora_static_vs2013_x64_d.lib");
								} else {
									pragma(lib, "ogg_static_vs2013_x64.lib");
									pragma(lib, "vorbis_static_vs2013_x64.lib");
									pragma(lib, "vorbisfile_static_vs2013_x64.lib");

									pragma(lib, "libtheora_static_vs2013_x64.lib");
								}
							} else {
								debug {
									pragma(lib, "ogg_static_vs2013_x86_d.lib");
									pragma(lib, "vorbis_static_vs2013_x86_d.lib");
									pragma(lib, "vorbisfile_static_vs2013_x86_d.lib");

									pragma(lib, "libtheora_static_vs2013_x86_d.lib");
								} else {
									pragma(lib, "ogg_static_vs2013_x86.lib");
									pragma(lib, "vorbis_static_vs2013_x86.lib");
									pragma(lib, "vorbisfile_static_vs2013_x86.lib");

									pragma(lib, "libtheora_static_vs2013_x86.lib");
								}
							}
						} else static if (core.stdcpp.xutility._MSC_VER >= 1700) {
							version (Win64) {
								debug {
									pragma(lib, "ogg_static_vs2012_x64_d.lib");
									pragma(lib, "vorbis_static_vs2012_x64_d.lib");
									pragma(lib, "vorbisfile_static_vs2012_x64_d.lib");

									pragma(lib, "libtheora_static_vs2012_x64_d.lib");
								} else {
									pragma(lib, "ogg_static_vs2012_x64.lib");
									pragma(lib, "vorbis_static_vs2012_x64.lib");
									pragma(lib, "vorbisfile_static_vs2012_x64.lib");

									pragma(lib, "libtheora_static_vs2012_x64.lib");
								}
							} else {
								debug {
									pragma(lib, "ogg_static_vs2012_x86_d.lib");
									pragma(lib, "vorbis_static_vs2012_x86_d.lib");
									pragma(lib, "vorbisfile_static_vs2012_x86_d.lib");

									pragma(lib, "libtheora_static_vs2012_x86_d.lib");
								} else {
									pragma(lib, "ogg_static_vs2012_x86.lib");
									pragma(lib, "vorbis_static_vs2012_x86.lib");
									pragma(lib, "vorbisfile_static_vs2012_x86.lib");

									pragma(lib, "libtheora_static_vs2012_x86.lib");
								}
							}
						}
					}
				} else {
					pragma(lib, "ogg_static.lib");
					pragma(lib, "vorbis_static.lib");
					pragma(lib, "vorbisfile_static.lib");

					pragma(lib, "libtheora_static.lib");
				}
			}

			// Opusライブラリ
			version (DX_NON_OPUS) {
			} else {
				 static if (__traits(compiles, core.stdcpp.xutility._MSC_VER)) {
					static if (core.stdcpp.xutility._MSC_VER < 1700) {
						version (Win64) {
							debug {
								pragma(lib, "opus_x64_d.lib");
								pragma(lib, "opusfile_x64_d.lib");
								pragma(lib, "silk_common_x64_d.lib");
								pragma(lib, "celt_x64_d.lib");
							} else {
								pragma(lib, "opus_x64.lib");
								pragma(lib, "opusfile_x64.lib");
								pragma(lib, "silk_common_x64.lib");
								pragma(lib, "celt_x64.lib");
							}
						} else {
							debug {
								pragma(lib, "opus_d.lib");
								pragma(lib, "opusfile_d.lib");
								pragma(lib, "silk_common_d.lib");
								pragma(lib, "celt_d.lib");
							} else {
								pragma(lib, "opus.lib");
								pragma(lib, "opusfile.lib");
								pragma(lib, "silk_common.lib");
								pragma(lib, "celt.lib");
							}
						}
					} else {
						static if (core.stdcpp.xutility._MSC_VER >= 1900) {
							version (_DLL) {
								version (Win64) {
									debug {
										pragma(lib, "opus_vs2015_x64_MDd.lib");
										pragma(lib, "opusfile_vs2015_x64_MDd.lib");
										pragma(lib, "silk_common_vs2015_x64_MDd.lib");
										pragma(lib, "celt_vs2015_x64_MDd.lib");
									} else {
										pragma(lib, "opus_vs2015_x64_MD.lib");
										pragma(lib, "opusfile_vs2015_x64_MD.lib");
										pragma(lib, "silk_common_vs2015_x64_MD.lib");
										pragma(lib, "celt_vs2015_x64_MD.lib");
									}
								} else {
									debug {
										pragma(lib, "opus_vs2015_x86_MDd.lib");
										pragma(lib, "opusfile_vs2015_x86_MDd.lib");
										pragma(lib, "silk_common_vs2015_x86_MDd.lib");
										pragma(lib, "celt_vs2015_x86_MDd.lib");
									} else {
										pragma(lib, "opus_vs2015_x86_MD.lib");
										pragma(lib, "opusfile_vs2015_x86_MD.lib");
										pragma(lib, "silk_common_vs2015_x86_MD.lib");
										pragma(lib, "celt_vs2015_x86_MD.lib");
									}
								}
							} else {
								version (Win64) {
									debug {
										pragma(lib, "opus_vs2015_x64_MTd.lib");
										pragma(lib, "opusfile_vs2015_x64_MTd.lib");
										pragma(lib, "silk_common_vs2015_x64_MTd.lib");
										pragma(lib, "celt_vs2015_x64_MTd.lib");
									} else {
										pragma(lib, "opus_vs2015_x64_MT.lib");
										pragma(lib, "opusfile_vs2015_x64_MT.lib");
										pragma(lib, "silk_common_vs2015_x64_MT.lib");
										pragma(lib, "celt_vs2015_x64_MT.lib");
									}
								} else {
									debug {
										pragma(lib, "opus_vs2015_x86_MTd.lib");
										pragma(lib, "opusfile_vs2015_x86_MTd.lib");
										pragma(lib, "silk_common_vs2015_x86_MTd.lib");
										pragma(lib, "celt_vs2015_x86_MTd.lib");
									} else {
										pragma(lib, "opus_vs2015_x86_MT.lib");
										pragma(lib, "opusfile_vs2015_x86_MT.lib");
										pragma(lib, "silk_common_vs2015_x86_MT.lib");
										pragma(lib, "celt_vs2015_x86_MT.lib");
									}
								}
							}
						} else static if (core.stdcpp.xutility._MSC_VER >= 1800) {
							version (Win64) {
								debug {
									pragma(lib, "opus_vs2013_x64_d.lib");
									pragma(lib, "opusfile_vs2013_x64_d.lib");
									pragma(lib, "silk_common_vs2013_x64_d.lib");
									pragma(lib, "celt_vs2013_x64_d.lib");
								} else {
									pragma(lib, "opus_vs2013_x64.lib");
									pragma(lib, "opusfile_vs2013_x64.lib");
									pragma(lib, "silk_common_vs2013_x64.lib");
									pragma(lib, "celt_vs2013_x64.lib");
								}
							} else {
								debug {
									pragma(lib, "opus_vs2013_x86_d.lib");
									pragma(lib, "opusfile_vs2013_x86_d.lib");
									pragma(lib, "silk_common_vs2013_x86_d.lib");
									pragma(lib, "celt_vs2013_x86_d.lib");
								} else {
									pragma(lib, "opus_vs2013_x86.lib");
									pragma(lib, "opusfile_vs2013_x86.lib");
									pragma(lib, "silk_common_vs2013_x86.lib");
									pragma(lib, "celt_vs2013_x86.lib");
								}
							}
						} else static if (core.stdcpp.xutility._MSC_VER >= 1700) {
							version (Win64) {
								debug {
									pragma(lib, "opus_vs2012_x64_d.lib");
									pragma(lib, "opusfile_vs2012_x64_d.lib");
									pragma(lib, "silk_common_vs2012_x64_d.lib");
									pragma(lib, "celt_vs2012_x64_d.lib");
								} else {
									pragma(lib, "opus_vs2012_x64.lib");
									pragma(lib, "opusfile_vs2012_x64.lib");
									pragma(lib, "silk_common_vs2012_x64.lib");
									pragma(lib, "celt_vs2012_x64.lib");
								}
							} else {
								debug {
									pragma(lib, "opus_vs2012_x86_d.lib");
									pragma(lib, "opusfile_vs2012_x86_d.lib");
									pragma(lib, "silk_common_vs2012_x86_d.lib");
									pragma(lib, "celt_vs2012_x86_d.lib");
								} else {
									pragma(lib, "opus_vs2012_x86.lib");
									pragma(lib, "opusfile_vs2012_x86.lib");
									pragma(lib, "silk_common_vs2012_x86.lib");
									pragma(lib, "celt_vs2012_x86.lib");
								}
							}
						}
					}
				} else {
					pragma(lib, "opus.lib");
					pragma(lib, "opusfile.lib");
					pragma(lib, "silk_common.lib");
					pragma(lib, "celt.lib");
				}
			}
		}
	}
}

// Dxlibで使う型のエイリアスとか--------------------------------------------------------

version (Win64) {
	alias DWORD_PTR = core.sys.windows.winnt.ULONGLONG;
} else {
	alias DWORD_PTR = core.sys.windows.windef.DWORD;
}

version (Win64) {
	alias LONG_PTR = long;
} else {
	alias LONG_PTR = int;
}

// 全プラットフォーム共通の型
alias BOOL = core.sys.windows.windef.BOOL;
alias BYTE = core.sys.windows.windef.BYTE;
alias DWORD = core.sys.windows.windef.DWORD;
alias FALSE = core.sys.windows.windef.FALSE;
alias HBITMAP = core.sys.windows.windef.HBITMAP;
alias HINSTANCE = core.sys.windows.windef.HINSTANCE;
alias LONG = core.sys.windows.windef.LONG;
alias LONGLONG = core.sys.windows.winnt.LONGLONG;
alias LPDWORD = core.sys.windows.windef.LPDWORD;
alias LPSTR = core.sys.windows.winnt.LPSTR;
alias SIZE = core.sys.windows.windef.SIZE;
alias TCHAR = core.sys.windows.winnt.TCHAR;
alias TRUE = core.sys.windows.windef.TRUE;
alias ULONGLONG = core.sys.windows.winnt.ULONGLONG;
alias WORD = core.sys.windows.windef.WORD;

// DxFunctionWinで扱う型
version (all) {
	alias HANDLE = core.sys.windows.basetsd.HANDLE;
	alias HICON = core.sys.windows.windef.HICON;
	alias HMODULE = core.sys.windows.windef.HMODULE;
	alias HRGN = core.sys.windows.windef.HRGN;
	alias HWND = core.sys.windows.windef.HWND;
	alias WNDPROC = core.sys.windows.winuser.WNDPROC;
}

//core.sys.windowsの以下の構造体名が不適切なので、必要とする部分だけ修正
version (none) {
	alias BITMAPINFO = core.sys.windows.wingdi.BITMAPINFO;
	alias POINT = core.sys.windows.windef.POINT;
	alias RECT = core.sys.windows.windef.RECT;

	// DxFunctionWinで扱う型
	version (all) {
		alias GUID = core.sys.windows.basetyps.GUID;
	}
} else {
	package struct tagBITMAPINFOHEADER
	{
		.DWORD biSize;
		.LONG biWidth;
		.LONG biHeight;
		.WORD biPlanes;
		.WORD biBitCount;
		.DWORD biCompression;
		.DWORD biSizeImage;
		.LONG biXPelsPerMeter;
		.LONG biYPelsPerMeter;
		.DWORD biClrUsed;
		.DWORD biClrImportant;
	}

	alias BITMAPINFOHEADER = .tagBITMAPINFOHEADER;
	alias LPBITMAPINFOHEADER = /* FAR */.tagBITMAPINFOHEADER*;
	alias PBITMAPINFOHEADER = .tagBITMAPINFOHEADER*;

	package struct tagRGBQUAD
	{
		.BYTE rgbBlue;
		.BYTE rgbGreen;
		.BYTE rgbRed;
		.BYTE rgbReserved;
	}

	alias RGBQUAD = .tagRGBQUAD;

	package struct tagBITMAPINFO
	{
		.BITMAPINFOHEADER bmiHeader;

		/* Dynamic array */
		.RGBQUAD bmiColors;
	}

	alias BITMAPINFO = .tagBITMAPINFO;
	alias LPBITMAPINFO = /* FAR */.tagBITMAPINFO*;
	alias PBITMAPINFO = .tagBITMAPINFO*;

	package struct tagPOINT
	{
		.LONG x;
		.LONG y;
	}

	alias POINT = .tagPOINT;
	alias PPOINT = .tagPOINT*;
	alias NPPOINT = /* NEAR */ .tagPOINT*;
	alias LPPOINT = /* FAR */ .tagPOINT*;

	package struct tagRECT
	{
		.LONG left;
		.LONG top;
		.LONG right;
		.LONG bottom;
	}

	alias RECT = .tagRECT;
	alias PRECT = .tagRECT*;
	alias NPRECT = /* NEAR */ .tagRECT*;
	alias LPRECT = /* FAR */ .tagRECT*;
	alias LPCRECT = const /* FAR */ (.tagRECT)*;

	// DxFunctionWinで扱う型
	version (all) {
		align (1)
		package struct _GUID
		{
			.DWORD Data1;
			.WORD Data2;
			.WORD Data3;
			.BYTE[4] Data4;
		}

		alias GUID = ._GUID;
	}
}

extern (C++, DxLib) {
	// マクロ定義 --------------------------------------------------------------------

	// 環境依存キーワードなど
	/+
	#ifndef FASTCALL
		#define FASTCALL __fastcall
	#endif
	+/

	// DirectInputのバージョン設定
	enum DIRECTINPUT_VERSION = 0x0700;

	/**
	 * ACMを使用した読み込み処理
	 */
	enum DX_READSOUNDFUNCTION_ACM = 1 << (dxlib_d.DxLib.DX_READSOUNDFUNCTION_DEFAULT_NUM + 0);

	/**
	 * ACMを使用したMP3の読み込み処理
	 */
	enum DX_READSOUNDFUNCTION_MP3 = 1 << (dxlib_d.DxLib.DX_READSOUNDFUNCTION_DEFAULT_NUM + 1);

	/**
	 * DirectShowを使用したMP3の読み込み処理
	 */
	enum DX_READSOUNDFUNCTION_DSMP3 = 1 << (dxlib_d.DxLib.DX_READSOUNDFUNCTION_DEFAULT_NUM + 2);

	/**
	 * Media Foundationを使用した読み込み処理
	 */
	enum DX_READSOUNDFUNCTION_MF = 1 << (dxlib_d.DxLib.DX_READSOUNDFUNCTION_DEFAULT_NUM + 3);

	// Direct3D9用テクスチャフォーマット
	enum DX_TEXTUREFORMAT_DIRECT3D9_R8G8B8 = 1;
	enum DX_TEXTUREFORMAT_DIRECT3D9_A8R8G8B8 = 2;
	enum DX_TEXTUREFORMAT_DIRECT3D9_X8R8G8B8 = 3;
	enum DX_TEXTUREFORMAT_DIRECT3D9_R5G6B5 = 4;
	enum DX_TEXTUREFORMAT_DIRECT3D9_X1R5G5B5 = 5;
	enum DX_TEXTUREFORMAT_DIRECT3D9_A1R5G5B5 = 6;
	enum DX_TEXTUREFORMAT_DIRECT3D9_A4R4G4B4 = 7;
	enum DX_TEXTUREFORMAT_DIRECT3D9_R3G3B2 = 8;
	enum DX_TEXTUREFORMAT_DIRECT3D9_A8R3G3B2 = 9;
	enum DX_TEXTUREFORMAT_DIRECT3D9_X4R4G4B4 = 10;
	enum DX_TEXTUREFORMAT_DIRECT3D9_A2B10G10R10 = 11;
	enum DX_TEXTUREFORMAT_DIRECT3D9_G16R16 = 12;
	enum DX_TEXTUREFORMAT_DIRECT3D9_A8B8G8R8 = 13;
	enum DX_TEXTUREFORMAT_DIRECT3D9_X8B8G8R8 = 14;
	enum DX_TEXTUREFORMAT_DIRECT3D9_A2R10G10B10 = 15;
	enum DX_TEXTUREFORMAT_DIRECT3D9_A16B16G16R16 = 16;
	enum DX_TEXTUREFORMAT_DIRECT3D9_R16F = 17;
	enum DX_TEXTUREFORMAT_DIRECT3D9_G16R16F = 18;
	enum DX_TEXTUREFORMAT_DIRECT3D9_A16B16G16R16F = 19;
	enum DX_TEXTUREFORMAT_DIRECT3D9_R32F = 20;
	enum DX_TEXTUREFORMAT_DIRECT3D9_G32R32F = 21;
	enum DX_TEXTUREFORMAT_DIRECT3D9_A32B32G32R32F = 22;

	// エラーコード

	/**
	 * デスクトップが24ビットカラーモードだった
	 */
	enum DX_ERRORCODE_WIN_DESKTOP_24BIT_COLOR = 0x01010001;

	/**
	 * 二重起動
	 */
	enum DX_ERRORCODE_WIN_DOUBLE_START = 0x01010002;

	/**
	 * ウインドウの作成に失敗
	 */
	enum DX_ERRORCODE_WIN_FAILED_CREATEWINDOW = 0x01010003;

	/**
	 * 非同期読み込み処理を行うスレッドの立ち上げに失敗
	 */
	enum DX_ERRORCODE_WIN_FAILED_ASYNCLOAD_CREATE_THREAD = 0x01010004;

	/**
	 * DirectDraw7の取得に失敗
	 */
	enum DX_ERRORCODE_WIN_FAILED_CREATE_DIRECTDRAW7 = 0x01020001;

	/**
	 * DirectDraw7の初期化に失敗
	 */
	enum DX_ERRORCODE_WIN_FAILED_INITIALIZE_DIRECTDRAW7 = 0x01020002;

	/**
	 * 非対応の画面カラーモードが指定された
	 */
	enum DX_ERRORCODE_WIN_NOT_COMPATIBLE_SCREEN_COLOR_MODE = 0x01020003;

	/**
	 * Win32APIのChangeDisplaySettingsを使用した画面モードの変更に失敗
	 */
	enum DX_ERRORCODE_WIN_FAILED_CHANGE_DISPLAY_SETTINGS = 0x01020004;

	// 構造体定義 --------------------------------------------------------------------

	// テーブル-----------------------------------------------------------------------

	// 内部大域変数宣言 --------------------------------------------------------------

	// 関数プロトタイプ宣言-----------------------------------------------------------
}
