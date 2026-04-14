class Moxy < Formula
  desc "MCP proxy that aggregates multiple child MCP servers"
  homepage "https://github.com/amarbel-llc/moxy"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/amarbel-llc/moxy/releases/download/v#{version}/moxy-0.1.0-darwin-arm64.tar.gz"
      sha256 "b0fbb9efa6b1f159e9953b9cb002e0af228d6dda6b72fdc84fc0544b458449f4"
    end
  end

  depends_on "coreutils"  # GNU stat (folio, folio-external)
  depends_on "gh"          # get-hubbed, get-hubbed-external
  depends_on "git"         # grit
  depends_on "go"          # hamster
  depends_on "jq"          # folio, grit, jq, get-hubbed
  depends_on "oven-sh/bun/bun" # get-hubbed, get-hubbed-external, hamster
  depends_on "python@3"    # freud
  depends_on "ripgrep"     # rg

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
