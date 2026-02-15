class Seshions < Formula
  desc "Monitor Codex/Claude terminal sessions with macOS notifications"
  homepage "https://github.com/danhergir/seshions"
  url "https://github.com/danhergir/seshions/releases/download/v0.1.8/seshions-0.1.8.tar.gz"
  sha256 "5e1e87b2684bef3d145d7cb0bd21d2cc267f71ded83922f6cf4579e5ada02fc4"
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
