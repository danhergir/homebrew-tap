class Seshions < Formula
  desc "Monitor Codex/Claude terminal sessions with macOS notifications"
  homepage "https://github.com/danhergir/seshions"
  url "https://github.com/danhergir/seshions/releases/download/v0.1.11/seshions-0.1.11.tar.gz"
  sha256 "a3c531aafe801f1d947931155e5034ac54476071d73da6ee782f226e173a19e1"
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
