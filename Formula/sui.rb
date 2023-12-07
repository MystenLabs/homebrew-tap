class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "testnet-v1.15.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/MystenLabs/sui/releases/sui-mainnet-vtestnet-v1.15.0-macos-arm64.tgz"
      sha256 "sha256tmp1"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/MystenLabs/sui/releases/sui-mainnet-vtestnet-v1.15.0-macos-x86_64.tgz"
      sha256 "sha256tmp2"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/MystenLabs/sui/releases/sui-mainnet-vtestnet-v1.15.0-ubuntu-x86_64.tgz"
      sha256 "xyz"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
