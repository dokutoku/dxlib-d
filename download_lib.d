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
	uri: `https://dxlib.xsrv.jp/DxLib/DxLib_VC3_22a.zip`,
	sha512_hash: `ecf6e02163c7f40c0a7661453f2c068fc420422a658a319b96f0ca72d3c87615bb64daa85f1623aa826266cbaa2318d4b3ea46e21a5708839c688bf6a71ef8f5`,
};

static immutable download_info windows_bcc_info =
{
	uri: `https://dxlib.xsrv.jp/DxLib/DxLib_BCC3_22a.zip`,
	sha512_hash: `2ecb3169410ed698ce3f987ff6dc0afb0eddcf5b7e41d1f43fa737bb3a1bb3b3355c76c6f1ea92cedf18bbe8bb537b506208247030c27e060e33319efb3501eb`,
};

static immutable download_info windows_bcc2_info =
{
	uri: `https://dxlib.xsrv.jp/DxLib/DxLib_BCC23_22a.zip`,
	sha512_hash: `b682344aa8b88b95daafea96282444b36f0861ca56fe0b96d1fcb9a10aa80f0e8ae10a3c097016fcfcee321196b3b61c5c2aea6a8d0d8a276db2231789aa2930`,
};

static immutable download_info windows_gcc_info =
{
	uri: `https://dxlib.xsrv.jp/DxLib/DxLib_GCC3_22a.zip`,
	sha512_hash: `6b625a23b6e723bf5a26d6c71ae2d48cbd79e820adeccd26096fd56e2dbaaee5e08095968d68155b62e27756b5ff43d43385740fa79d072ef0488bc901fd66dc`,
};

static immutable download_info android_info =
{
	uri: `https://dxlib.xsrv.jp/DxLib_Android3_22a.zip`,
	sha512_hash: `cbc8c444cd43aba385ce2705a29d0f01ab1637ee01514ab2b9b4112f896b6cf069049724f653de63eb922aa8466bc4afcab1e323b9aae5492332446c5096edd8`,
};

static immutable download_info ios_info =
{
	uri: `https://dxlib.xsrv.jp/DxLib/DxLib_iOS3_22a.zip`,
	sha512_hash: `4cc6e46e592e38ec91bcd981e0f8fa5235e6297a905281cd5f6984496f4830aa6dd4b15b8b44b0b2a4d10a12d83b05c9c9705debc64c30726139d32ea1c0892a`,
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
