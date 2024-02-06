class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.18.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.18.0-macos-arm64.tgz"
      sha256 "00be9075838d3c926a9ebc7c6d76449578c6c080cea9cc42819c6c3de57978e3"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.18.0-macos-x86_64.tgz"
      sha256 "25344112fbb52b1967c82b774e3947dd0e63683a3e21455293f21064faa8f9f0"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.18.0-ubuntu-x86_64.tgz"
      sha256 "1c875d64e89ab932c46b9e01032712fd96c3c083dd6d773381de112e3c4d834d"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
