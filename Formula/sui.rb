class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.29.2"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.29.2-macos-arm64.tgz"
      sha256 "7c6e00c02c7aa29ed044ad59e05e0c40972ed10b35c98ded1c657f528637ab0b"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.29.2-macos-x86_64.tgz"
      sha256 "ae84002824b3c2ebad2d5bf5ef6dd8b288a2d7929f997d2a274d3c8b948248bc"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.29.2-ubuntu-x86_64.tgz"
      sha256 "10db4aaa8018a3d28359a3f799ec89617fd057e9e947c29317a72e719434a01b"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
