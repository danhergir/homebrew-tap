class Seshions < Formula
  desc "Monitor Codex/Claude terminal sessions with macOS notifications"
  homepage "https://github.com/danhergir/seshions"
  url "https://github.com/danhergir/seshions/releases/download/v0.1.6/seshions-0.1.6.tar.gz"
  sha256 "0022fbb7ff09727ebad47dca9cd72475cc995c31eee9dec929c88ef6fd3fe89d"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["src"]
    (bin/"seshions").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/src/index.js" "$@"
    EOS
    chmod 0755, bin/"seshions"
  end

  test do
    assert_match "seshions", shell_output("#{bin}/seshions --help")
  end
end
