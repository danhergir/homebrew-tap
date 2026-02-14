class Seshions < Formula
  desc "Monitor Codex/Claude terminal sessions with macOS notifications"
  homepage "https://github.com/danhergir/seshions"
  url "https://github.com/danhergir/seshions/releases/download/v0.1.4/seshions-0.1.4.tar.gz"
  sha256 "5cf4bb5000a205e7378176522f201430085a7868d04a715063c58ee49a437fca"
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
