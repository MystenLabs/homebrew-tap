# homebrew-mylocaltap/Formula/<formula>.rb
class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.14.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-mainnet-v1.14.2-macos-arm64.tgz"
      sha256 "660504c3e36a6e2aa0c975d230cfdfde5197c112d6a4750f340399f017dfe066"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-mainnet-v1.14.2-macos-x86_64.tgz"
      sha256 "bde8e930f46e0cad80f09a0022986e6719871c52fbf923bcb048be3a922d7b9c"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-mainnet-v1.14.2-ubuntu-x86_64.tgz"
      sha256 "56dd25625db4d705ef0edc2acc3db698a0184ecc5e25203ec0cb5e0e84d513ef"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end


