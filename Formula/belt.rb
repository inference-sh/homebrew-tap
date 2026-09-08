class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.23"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.23/inferencesh-cli-v1.18.23-darwin-arm64.tar.gz"
      sha256 "52bd4aa48dd84836ceed004e60866289ea3a290b3b31f4c88fb3f45a2e60bcc3"
    else
      url "https://dist.inference.sh/cli/v1.18.23/inferencesh-cli-v1.18.23-darwin-amd64.tar.gz"
      sha256 "51711fa94427f1b742f8c550b8bf386ee4df0ef42d2a315b2a3ce102866eb16b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.23/inferencesh-cli-v1.18.23-linux-arm64.tar.gz"
      sha256 "a240a2aab54b31f4899ad9c7c6fec8be899af7a23634528fdc6e5d0a3a9652cf"
    else
      url "https://dist.inference.sh/cli/v1.18.23/inferencesh-cli-v1.18.23-linux-amd64.tar.gz"
      sha256 "e12ee568956b460823992bd29c8e62de056aa40c50c7b33f96d27175d5937d91"
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
