# homebrew-mylocaltap/Formula/<formula>.rb
class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.14.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/MystenLabs/sui/releases/download/testnet-v1.14.0/sui-testnet-v1.14.0-macos-arm64.tgz"
      sha256 "6a3259faefcf3d94410acdaf497564e33e6fec9966851b3b6ba33a6273bec8b3"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/MystenLabs/sui/releases/download/testnet-v1.14.0/sui-testnet-v1.14.0-macos-x86_64.tgz"
      sha256 "22b44a5f700ede1a9a40abc9f3633490bd12b5a6d69949d4b08955f02861aeda"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/MystenLabs/sui/releases/download/testnet-v1.14.0/sui-testnet-v1.14.0-ubuntu-x86_64.tgz"
      sha256 "fe9ecee100f6cdf240603b2e507ad8a7d16c0dc9072c478e9f8a352c98e654f3"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end


