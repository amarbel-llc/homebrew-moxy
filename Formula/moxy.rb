class Moxy < Formula
  desc "MCP proxy that aggregates multiple child MCP servers"
  homepage "https://github.com/amarbel-llc/moxy"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/amarbel-llc/moxy/releases/download/v#{version}/moxy-darwin-arm64.tar.gz"
      sha256 "e3eefc5742aa85c9df9d447ace390c7bbe152f8c159495db8e680a663b9c5ca8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/amarbel-llc/moxy/releases/download/v#{version}/moxy-linux-amd64.tar.gz"
      sha256 "81458e9d189b2dbcd58de56d0db82bbe2e93a44b23ad42da6191b68d8e6083a2"
    end
  end

  depends_on "coreutils"
  depends_on "gh"
  depends_on "git"
  depends_on "go"
  depends_on "jq"
  depends_on "oven-sh/bun/bun"
  depends_on "python@3"
  depends_on "ripgrep"

  def install
    bin.install "bin/moxy"
    (share/"moxy/moxins").install Dir["share/moxy/moxins/*"]
    man1.install Dir["share/man/man1/*"]
    man5.install Dir["share/man/man5/*"]
    man7.install Dir["share/man/man7/*"]
  end

  test do
    assert_match "moxy", shell_output("#{bin}/moxy --help 2>&1", 0)
  end
end
