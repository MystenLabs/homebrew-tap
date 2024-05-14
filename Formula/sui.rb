class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.25.0"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.25.0-macos-arm64.tgz"
      sha256 "fde7ed5a2c700fa4a0c54dd47d06d1f05a7dd7bb29c06bbdf6b129a6603421e8"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.25.0-macos-x86_64.tgz"
      sha256 "62d62d8725d42009e4edbc1cf8b0136a2e7f974a1f3c1eae3520fcbe57d5ca2f"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.25.0-ubuntu-x86_64.tgz"
      sha256 "37d23ab6f31feb85629a5dfd69848828e2b94d28583ae0abe328a6e6ad611e64"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
