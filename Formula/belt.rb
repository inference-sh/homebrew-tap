class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.14.16-dirty"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.14.16-dirty/inferencesh-cli-v1.14.16-dirty-darwin-arm64.tar.gz"
      sha256 "b85c96efd44327f8fd5e512f70c8c5863d3d0511dd10590116206e1f089ae07e"
    else
      url "https://dist.inference.sh/cli/v1.14.16-dirty/inferencesh-cli-v1.14.16-dirty-darwin-amd64.tar.gz"
      sha256 "ae0166ee9eb4b64b9ebed8a9af735e5a50200e5c087a0c0988b02bff4d7329e9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.14.16-dirty/inferencesh-cli-v1.14.16-dirty-linux-arm64.tar.gz"
      sha256 "e34a9c2631915adef1f495510e072a93bd84c110b8e2a620842bf5e3ce048a8a"
    else
      url "https://dist.inference.sh/cli/v1.14.16-dirty/inferencesh-cli-v1.14.16-dirty-linux-amd64.tar.gz"
      sha256 "327c7724eb66824dd08f9f57606607409035ffd34a7506ec60c471d1eac33e40"
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
