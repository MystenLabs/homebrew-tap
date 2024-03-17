class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.20.1"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.20.1-macos-arm64.tgz"
      sha256 "a69713a2c35afe608f84daa9b7c809ba086568c8824310a164b6d119c1de549c"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.20.1-macos-x86_64.tgz"
      sha256 "465a80e8806d3599a38f5a88ef91b9d3e3d180c825a5168b0fa5fac19d5850f0"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.20.1-ubuntu-x86_64.tgz"
      sha256 "59201d61121c42b4f0fae204f588487b387956dbb7770b65b0f20193d1081ca2"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
