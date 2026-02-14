class Seshions < Formula
  desc "Monitor Codex/Claude terminal sessions with macOS notifications"
  homepage "https://github.com/danhergir/seshions"
  url "https://github.com/danhergir/seshions/releases/download/v0.1.5/seshions-0.1.5.tar.gz"
  sha256 "21eaaf03ce90c51da1c5abef0d994f8b29e778798dcf036e56827f6ab4af357e"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["src/*.js"]
    (bin/"seshions").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/index.js" "$@"
    EOS
    chmod 0755, bin/"seshions"
  end

  test do
    assert_match "seshions", shell_output("#{bin}/seshions --help")
  end
end
