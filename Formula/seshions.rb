class Seshions < Formula
  desc "Monitor Codex/Claude terminal sessions with macOS notifications"
  homepage "https://github.com/danhergir/seshions"
  url "https://github.com/danhergir/seshions/releases/download/v0.1.1/seshions-0.1.1.tar.gz"
  sha256 "5c3e61e1d069c973a8bbd318854208ec8d39b16a8c5b3603524069836a97005b"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["src/*.js"]
    (bin/"seshions").write_env_script libexec/"index.js"
  end

  test do
    assert_match "seshions", shell_output("#{bin}/seshions --help")
  end
end
