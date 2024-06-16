class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.27.2"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.27.2-macos-arm64.tgz"
      sha256 "c41f3c7ca6272f5b37cdaab62d4c4617415d20c0e4e44f8e8d221989032508bc"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.27.2-macos-x86_64.tgz"
      sha256 "f37f8e7d1926be7a17b95557a9d0ea16bfe21ad674ef81e8f73edd6a7ab603ef"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.27.2-ubuntu-x86_64.tgz"
      sha256 "f5055024ad78d9d618446eaa97e0475ee50a8410686a7e6171b4c23c8c2716fe"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
