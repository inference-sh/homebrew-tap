class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.8/inferencesh-cli-v1.28.8-darwin-arm64.tar.gz"
      sha256 "dcb61747ae72e25bab75a3b7055b8f4b3dcc19669abfa5c700551c96b3b79963"
    else
      url "https://dist.inference.sh/cli/v1.28.8/inferencesh-cli-v1.28.8-darwin-amd64.tar.gz"
      sha256 "03e04fb8c679acbb03e3554ce22d05dce0313a4c63818fd57c3d69b95d6cd93c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.8/inferencesh-cli-v1.28.8-linux-arm64.tar.gz"
      sha256 "3982d1616f59122bb971a5577ce7c29a1564dd9d110378c862a3ddb363d6530c"
    else
      url "https://dist.inference.sh/cli/v1.28.8/inferencesh-cli-v1.28.8-linux-amd64.tar.gz"
      sha256 "486b975bc12caf4940fcfe9f454dd5d3368be9f920b17abf9fb0c53515a65372"
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
