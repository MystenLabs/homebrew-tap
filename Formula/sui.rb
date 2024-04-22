class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.23.1"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.23.1-macos-arm64.tgz"
      sha256 "d4d1eb3eb9db03c6969116d6877f840f4f48cd925036b206bc7022deecb14499"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.23.1-macos-x86_64.tgz"
      sha256 "2635cdeec013449f05db4ca7c6d81b70131c236545cffffcdfcb2af851431d1e"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.23.1-ubuntu-x86_64.tgz"
      sha256 "c87a2a7f41178468fb7f3e3e1390a66d67bff872522247153f7309a39f628633"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
