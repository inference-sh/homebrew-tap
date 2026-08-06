class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.17.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.11/inferencesh-cli-v1.17.11-darwin-arm64.tar.gz"
      sha256 "f798f0fd3b117164225569808a02784df4d58a6f711ea1472986386178a2e521"
    else
      url "https://dist.inference.sh/cli/v1.17.11/inferencesh-cli-v1.17.11-darwin-amd64.tar.gz"
      sha256 "d184ebb3c544f0f607b7b236b9888b2d79d6f027e4538697ac26745144e9cc45"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.11/inferencesh-cli-v1.17.11-linux-arm64.tar.gz"
      sha256 "186080856471bd2788110ab5f11827d60f7834f3959e98d6eee3c6dced3e776a"
    else
      url "https://dist.inference.sh/cli/v1.17.11/inferencesh-cli-v1.17.11-linux-amd64.tar.gz"
      sha256 "09ea0db2b635b882f87e9aa80acc4582476fd7cb2bac90b8fa910e9131ac2a7e"
    end
  end

  def install
    binary = Dir["inferencesh-cli-*"].first
    bin.install binary => "belt"
    bin.install_symlink "belt" => "infsh"
    bin.install_symlink "belt" => "inferencesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/belt version")
  end
end
