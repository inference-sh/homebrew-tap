class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.30"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.30/inferencesh-cli-v1.15.30-darwin-arm64.tar.gz"
      sha256 "b91376e05f4d00c703eff1a63bf1c93c7504fe5f51878961dfbe150a38340e96"
    else
      url "https://dist.inference.sh/cli/v1.15.30/inferencesh-cli-v1.15.30-darwin-amd64.tar.gz"
      sha256 "7facd41551627d29bf47200a95a4aa2e4d913ddb9cfadd60c9795428fa773f70"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.30/inferencesh-cli-v1.15.30-linux-arm64.tar.gz"
      sha256 "4dd1b878afc0e20e3e6e58f6ee8a913666a7307b0216d57598d23a101adf6829"
    else
      url "https://dist.inference.sh/cli/v1.15.30/inferencesh-cli-v1.15.30-linux-amd64.tar.gz"
      sha256 "2bedcce9707b3e2242e7229e9287cacee63283c091d1f549c4ea690ce7e5e42c"
    end
  end

  def install
    binary = Dir["inferencesh-cli-*"].first
    bin.install binary => "belt"
    bin.install_symlink "belt" => "infsh"
    bin.install_symlink "belt" => "inferencesh"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/belt version")
  end
end
