class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.28.2"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.28.2-macos-arm64.tgz"
      sha256 "cba4a34c7784c08704be339098b87469437c50cddcfd63ddcecd23590d752166"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.28.2-macos-x86_64.tgz"
      sha256 "ea064e82657b0b4d16c093ed0b1b2686c9b707becea72fb66e4c0ebd82af614a"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.28.2-ubuntu-x86_64.tgz"
      sha256 "70a34132eb388eb23836fc60a5698d9f06d17dee1dcb94cd747fa840ddf18ac5"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
