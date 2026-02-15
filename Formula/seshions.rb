class Seshions < Formula
  desc "Monitor Codex/Claude terminal sessions with macOS notifications"
  homepage "https://github.com/danhergir/seshions"
  url "https://github.com/danhergir/seshions/releases/download/v0.1.9/seshions-0.1.9.tar.gz"
  sha256 "61ea8df703af93ef3d64285509fa2e3bddb6c08ac386fded8b6398c5d5fe6af4"
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
