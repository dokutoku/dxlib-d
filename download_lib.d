/**
 * download dxlib lib
 *
 * Author: dokutoku
 * License: CC0 Universal
 */
module hello;


private static import std.algorithm;
private static import std.ascii;
private static import std.digest;
private static import std.digest.sha;
private static import std.file;
private static import std.getopt;
private static import std.net.curl;
private static import std.path;
private static import std.zip;

struct download_info
{
	string uri;
	string sha512_hash;

	private bool verify(string file_path) const

		do
		{
			return std.file.exists(file_path) && std.file.isFile(file_path) && std.digest.secureEqual(this.sha512_hash, std.digest.toHexString!(std.ascii.LetterCase.lower)(std.digest.sha.sha512Of(std.file.read(file_path))).idup);
		}

	private void download(string dir_path) const

		in
		{
			assert(dir_path.length != 0);
			assert(std.path.isValidPath(dir_path));
		}

		do
		{
			string file_path = std.path.buildNormalizedPath(dir_path, std.path.baseName(this.uri));

			if (this.verify(file_path)) {
				return;
			}

			std.net.curl.download(this.uri, file_path);

			if (!this.verify(file_path)) {
				throw new Exception(`The hash value of the downloaded file is invalid.`);
			}
		}

	void extract_lib(string dir_path, string base_dir) const

		in
		{
			assert(std.path.extension(this.uri) == `.zip`);
		}

		do
		{
			this.download(dir_path);
			string zip_file = std.path.baseName(this.uri);
			//string base_dir = std.path.buildNormalizedPath(output_dir, `lib`);
			std.file.mkdirRecurse(base_dir);
			auto zip = new std.zip.ZipArchive(std.file.read(std.path.buildNormalizedPath(dir_path, zip_file)));

			foreach (name, am; zip.directory) {
				if (!std.algorithm.endsWith(name, `.a`, `.lib`)) {
					continue;
				}

				string out_filename = std.path.buildPath(base_dir, std.path.baseName(name));
				std.file.write(out_filename, zip.expand(am));
			}
	}
}

static immutable download_info windows_vc_info =
{
	uri: `https://dxlib.xsrv.jp/DxLib/DxLib_VC3_22c.zip`,
	sha512_hash: `1af5ee1c96221db199b4a376df846ede048698488317db7508aec2b4da66356295f8432b4abd6db0b4e29d1524ee15a656e8870fe032d073d85537b6b82b6e67`,
};

static immutable download_info windows_bcc_info =
{
	uri: `https://dxlib.xsrv.jp/DxLib/DxLib_BCC3_22c.zip`,
	sha512_hash: `00211f9ac32c4ac3646b72fbfd53a4ebff02f27ca72531e6248c600a18f52b2e414b9a98b382420a6274d97753ad29f112af9d0fe35282086a5c1040f898e366`,
};

static immutable download_info windows_bcc2_info =
{
	uri: `https://dxlib.xsrv.jp/DxLib/DxLib_BCC23_22c.zip`,
	sha512_hash: `0f7232d51ef720b9e3d32821d81cc27808d9417cf38845982a75e05adf7c67dc5dcb1eec2646e5aa394f1914d193ee77852f9e41417c4ee0f93fcfd96ddb29da`,
};

static immutable download_info windows_gcc_info =
{
	uri: `https://dxlib.xsrv.jp/DxLib/DxLib_GCC3_22c.zip`,
	sha512_hash: `479632f1602a09fd122be54c650310855e07cd998d4d90b174e9b41293dbc9eec4aacd8243a22f7b1c68e26a2f04d5ee54fdb027009fdf3bc41a9fb24a74f22d`,
};

static immutable download_info android_info =
{
	uri: `https://dxlib.xsrv.jp/DxLib_Android3_22c.zip`,
	sha512_hash: `a6a757d9f7df859f7fd181db4263d6903f2daea05edd2bc8b27df1492ca45f855d9d0de7f0548791a7198e8f06ea33c9b5ce6b5efa42ae168ab51c6d9aa4d8e6`,
};

static immutable download_info ios_info =
{
	uri: `https://dxlib.xsrv.jp/DxLib/DxLib_iOS3_22c.zip`,
	sha512_hash: `e18eb3138ec89f79f3835d17f269e4f74a9fd4f2654afe3df6c98e6f29544dc33d0043c14ba5de26a0b617290b7f3b25817198100af631f06e6070e4da6f76ff`,
};

void main(string[] argv)

	do
	{
		string download_path = null;
		string output_path = null;
		bool is_windows = false;
		bool is_windows_vc = false;
		bool is_windows_bcc = false;
		bool is_windows_bcc2 = false;
		bool is_windows_gcc = false;
		bool is_android = false;
		bool is_ios = false;
		bool is_all = false;

		auto helpInformation = std.getopt.getopt
		(
			argv,
			`download-path`, `download zip path.`, &download_path,
			`out-path`, `Output lib path.`, &output_path,
			`Windows`, `Download Visual Studio lib.`, &is_windows,
			`Windows-vc`, `Download Visual Studio lib.`, &is_windows_vc,
			`Windows-bcc`, `Download C++ Builder lib.`, &is_windows_bcc,
			`Windows-bcc2`, `Download Borland C++ Compiler lib.`, &is_windows_bcc2,
			`Windows-gcc`, `Download Gnu C++ lib.`, &is_windows_gcc,
			`Android`, `Download Android lib.`, &is_android,
			`iOS`, `Download iOS lib.`, &is_ios,
			`All`, `All download lib.`, &is_all,
		);

		if (helpInformation.helpWanted) {
			std.getopt.defaultGetoptPrinter(`Some information about the program.`, helpInformation.options);

			return;
		}

		if ((!std.path.isValidPath(download_path)) || (!std.file.isDir(download_path))) {
			download_path = `./`;
		}

		if ((!std.path.isValidPath(output_path)) || (!std.file.isDir(output_path))) {
			output_path = `./`;
		}

		if ((is_all) || (is_windows) || (is_windows_vc)) {
			windows_vc_info.extract_lib(download_path, std.path.buildNormalizedPath(output_path, `lib`, `windows-vc`));
		}

		if ((is_all) || (is_windows_bcc)) {
			windows_bcc_info.extract_lib(download_path, std.path.buildNormalizedPath(output_path, `lib`, `windows-bcc`));
		}

		if ((is_all) || (is_windows_bcc2)) {
			windows_bcc2_info.extract_lib(download_path, std.path.buildNormalizedPath(output_path, `lib`, `windows-bcc2`));
		}

		if ((is_all) || (is_windows_gcc)) {
			windows_gcc_info.extract_lib(download_path, std.path.buildNormalizedPath(output_path, `lib`, `windows-gcc`));
		}

		if ((is_all) || (is_android)) {
			android_info.extract_lib(download_path, std.path.buildNormalizedPath(output_path, `lib`, `android`));
		}

		if ((is_all) || (is_ios)) {
			ios_info.extract_lib(download_path, std.path.buildNormalizedPath(output_path, `lib`, `ios`));
		}
	}
