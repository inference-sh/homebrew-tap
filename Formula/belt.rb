class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.14-darwin-arm64.tar.gz"
      sha256 "202d584c7dffd4d1528dfc4441034b674eec59cc0ed09c73cfff242ef343cb9c"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.14-darwin-amd64.tar.gz"
      sha256 "ab1fc8e3a4d91c7c571a77286033518a95695799413c608562544727fb6776e3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.14-linux-arm64.tar.gz"
      sha256 "46827d4e7a9fb368151f4c1368aa3ac93af9bd40e7eb0cb89a6094e72666ede6"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.14-linux-amd64.tar.gz"
      sha256 "2bd61f201830efa629dfea6222a19597be2a246e6468988e974fd70dd67a2c27"
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
