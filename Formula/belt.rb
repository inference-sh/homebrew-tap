class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.46"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.46/inferencesh-cli-v1.28.46-darwin-arm64.tar.gz"
      sha256 "5198516a3abdfc5967befaf611687812ed6c4ca22c4a5a20a1305952d786eb81"
    else
      url "https://dist.inference.sh/cli/v1.28.46/inferencesh-cli-v1.28.46-darwin-amd64.tar.gz"
      sha256 "cd2d6e474253641513bcca13a63f4e7ade4dbf735bcec1fbce6a8f3e50899e13"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.46/inferencesh-cli-v1.28.46-linux-arm64.tar.gz"
      sha256 "f4867fc7c83a252f8ae189769e156269d4c65830a5be4dae14044362cb0e8171"
    else
      url "https://dist.inference.sh/cli/v1.28.46/inferencesh-cli-v1.28.46-linux-amd64.tar.gz"
      sha256 "86fd16a30e8d8141eb495b98b3f381b98345f63773f4145c4f87dbc6f1f5820d"
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
