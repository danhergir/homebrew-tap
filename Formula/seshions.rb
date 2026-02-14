class Seshions < Formula
  desc "Monitor Codex/Claude terminal sessions with macOS notifications"
  homepage "https://github.com/danhergir/seshions"
  url "https://github.com/danhergir/seshions/releases/download/v0.1.2/seshions-0.1.2.tar.gz"
  sha256 "e11cdf8dd5fc6eb7b5b3d51daa9c694cc682c23e7bee634bb0c0f243af9c4d8b"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["src/*.js"]
    (bin/"seshions").write_exec_script libexec/"index.js"
  end

  test do
    assert_match "seshions", shell_output("#{bin}/seshions --help")
  end
end
