class Seshions < Formula
  desc "Terminal session orchestrator for coding agents"
  homepage "https://github.com/danhergir/seshions"
  url "https://github.com/danhergir/seshions/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "448cec5d05e3517a8b49ec8bf89e70259ae0e186f0a50e5e1cb9c050b561ceb3"
  license "MIT"

  depends_on "node"
  depends_on "tmux"

  def install
    libexec.install Dir["*"]

    cd libexec do
      system "npm", "install"
      system "npm", "run", "build"
      system "npm", "prune", "--omit=dev"
    end

    (bin/"seshions").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/dist/cli/index.js" "$@"
    EOS
    chmod 0755, bin/"seshions"
  end

  test do
    assert_match "Seshions", shell_output("#{bin}/seshions --help")
  end
end
