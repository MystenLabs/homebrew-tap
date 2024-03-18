class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.21.0"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.21.0-macos-arm64.tgz"
      sha256 "670f0147b406f39e9d2f89d1736c663475e7b6290bbd8b0d5f8c414162a5f522"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.21.0-macos-x86_64.tgz"
      sha256 "ad6b404c951e403bbe22278a77a9e6987d0945a8978fc7612b328fac14c855d7"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.21.0-ubuntu-x86_64.tgz"
      sha256 "28eacd4b7b1851d2bcbf829e68b36c41184f100ed8edf29205c6bc229aa8acd4"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
