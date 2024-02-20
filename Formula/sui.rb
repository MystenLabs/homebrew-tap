class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.19.0"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.19.0-macos-arm64.tgz"
      sha256 "19ada0ecd18a0323b5f6c2dc2722caa7ed9d4b13e85ff6583e0f3f32ff9c17b7"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.19.0-macos-x86_64.tgz"
      sha256 "7e13fb4a9aa3f58e6fc06e3639318606c620c0b41d13e26bc1cff1dcd8516d7c"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.19.0-ubuntu-x86_64.tgz"
      sha256 "36b9306ddedd54073d4588edd7f62b4cb468f6f6426aa897e9683393edd9a2a5"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
