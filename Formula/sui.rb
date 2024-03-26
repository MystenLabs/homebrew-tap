class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.21.1"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.21.1-macos-arm64.tgz"
      sha256 "cb02009956b09d21d20b04ddda280c543edbd37a99b908eebcadac1a4619fb4d"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.21.1-macos-x86_64.tgz"
      sha256 "7dd19b01580843396c94da30d8d3e69256669ef31a8eebf7d6c6b14927642486"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.21.1-ubuntu-x86_64.tgz"
      sha256 "b7bcc30ad2c9d541f3597e7f21e593d22898ee28c08b84f56ecbf666bb3069c5"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
