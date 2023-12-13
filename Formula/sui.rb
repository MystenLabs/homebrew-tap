class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.15.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.com/releases/sui-mainnet-v1.15.1-macos-arm64.tgz"
      sha256 "706a156ff17de95a444f806aa0e0f5f2c65c4f3b5286ba0afb1309b8fc4e29b7"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.com/releases/sui-mainnet-v1.15.1-macos-x86_64.tgz"
      sha256 "7739a2e8d795635590a369bdb91105e39b6787fd1f6b419ef47db59712b632ab"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.com/releases/sui-mainnet-v1.15.1-ubuntu-x86_64.tgz"
      sha256 "7fda445a9410992c7a4a909ce60602386793de92702b1f3a3c0dac491232c3bf"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
