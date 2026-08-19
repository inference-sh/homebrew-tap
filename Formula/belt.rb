class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.17.19"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.19/inferencesh-cli-v1.17.19-darwin-arm64.tar.gz"
      sha256 "1d18383a7f32e3525896f68358696350e9f53fc1b45c66d548dcbf112c42fd57"
    else
      url "https://dist.inference.sh/cli/v1.17.19/inferencesh-cli-v1.17.19-darwin-amd64.tar.gz"
      sha256 "6c0e55de17d1a3b5a6ca8f4962dd224182cac57843448f4bfe30fa56fa1cefdf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.19/inferencesh-cli-v1.17.19-linux-arm64.tar.gz"
      sha256 "ef1d798c0062a6f015035cca94b053525a006aaec899f8f96844f111f3142d78"
    else
      url "https://dist.inference.sh/cli/v1.17.19/inferencesh-cli-v1.17.19-linux-amd64.tar.gz"
      sha256 "5fcf39c41c5900d45d24343d742f1b95f8efdb50d8f9c3d84122ee5c7503fe64"
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
