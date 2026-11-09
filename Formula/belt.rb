class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.26"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.26/inferencesh-cli-v1.28.26-darwin-arm64.tar.gz"
      sha256 "063242576b0a987612976d450a6f15ef36bccbc991261cd0078421e84924dea0"
    else
      url "https://dist.inference.sh/cli/v1.28.26/inferencesh-cli-v1.28.26-darwin-amd64.tar.gz"
      sha256 "f7cc2ab6a865c849a68bdaf5448d79167595996cc95459f66929ab573a68dd3d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.26/inferencesh-cli-v1.28.26-linux-arm64.tar.gz"
      sha256 "baeface469222384ccf4e3823a094f9b1075f5c9a4d9e150ccd3fc5190f74cc7"
    else
      url "https://dist.inference.sh/cli/v1.28.26/inferencesh-cli-v1.28.26-linux-amd64.tar.gz"
      sha256 "d367e1797bc3de4e2e626ee8a64a5b711145a5792ab7c7ea6f5ba8b4cde2d5fc"
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
