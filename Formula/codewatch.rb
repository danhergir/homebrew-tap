class Codewatch < Formula
  desc "Monitor Codex/Claude terminal sessions with macOS notifications"
  homepage "https://github.com/danhergir/seshions"
  url "https://github.com/danhergir/seshions/releases/download/v0.1.0/codewatch-0.1.0.tar.gz"
  sha256 "c2856129a1993b4956086e90fafdd5185cbbccd5e9c083ccbcf4fe9feb97a137"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["src/*.js"]
    (bin/"codewatch").write_env_script libexec/"index.js"
  end

  test do
    assert_match "codewatch", shell_output("#{bin}/codewatch --help")
  end
end
