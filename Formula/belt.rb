class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.25.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.25.7/inferencesh-cli-v1.25.7-darwin-arm64.tar.gz"
      sha256 "2cde2ce6e8ef12dfb4da2d26cae03138e691cd2e9ae48706b40928673940395d"
    else
      url "https://dist.inference.sh/cli/v1.25.7/inferencesh-cli-v1.25.7-darwin-amd64.tar.gz"
      sha256 "217836b741f9fe6f456a2457f05ca696ee26892fe9b8780faab4deca7a4a3fa7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.25.7/inferencesh-cli-v1.25.7-linux-arm64.tar.gz"
      sha256 "e19e8a16009ee76b93f9705cf8471ba7599ff80fb11d8a056a6e95844dfe0431"
    else
      url "https://dist.inference.sh/cli/v1.25.7/inferencesh-cli-v1.25.7-linux-amd64.tar.gz"
      sha256 "7ed2a4f4acb963ffc32f84515ffbcd0ee23180e5f89315d26fd0afda35b41073"
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
