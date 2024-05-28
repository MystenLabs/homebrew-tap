class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.26.0"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.26.0-macos-arm64.tgz"
      sha256 "a57f42de5789bf96abe8173ad9d5df215b125dd7232671fced6ec88af7ee3120"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.26.0-macos-x86_64.tgz"
      sha256 "236e26eff0059add0b20161fa3403b49f3674271f8f7569ff6b82d206ffeb615"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.26.0-ubuntu-x86_64.tgz"
      sha256 "8f894e14117b67a96d147821ada283f5fb4449fd0ed4efa79dde8517bf598055"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
