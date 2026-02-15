class Seshions < Formula
  desc "Monitor Codex/Claude terminal sessions with macOS notifications"
  homepage "https://github.com/danhergir/seshions"
  url "https://github.com/danhergir/seshions/releases/download/v0.1.10/seshions-0.1.10.tar.gz"
  sha256 "aca1649671e5980aa5e48101765994ea4e8f8da87bf1ea3f02b2048fad58ad5e"
  license "MIT"

  depends_on "node"
  depends_on "tmux"

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
