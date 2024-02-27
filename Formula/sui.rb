class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.19.1"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.19.1-macos-arm64.tgz"
      sha256 "de395eedf55712d42e163555e9f74741efb2d343523f5e3c7b8e048d88d15ce0"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.19.1-macos-x86_64.tgz"
      sha256 "23ddf46d7d09c7a19e59ffa52e7eee3e189b93783919440faf860a274bd95586"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.19.1-ubuntu-x86_64.tgz"
      sha256 "f079cac97091048b854fb429531d59a9b96ba3797aafa143c512ab1f0be11aac"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
