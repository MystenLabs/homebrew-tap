class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.29.0"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.29.0-macos-arm64.tgz"
      sha256 "87a1608b99f0ff27d7e57d39efe2ae31eb54376e3791d93a978adb66c6e24e2d"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.29.0-macos-x86_64.tgz"
      sha256 "0270cd74ad3f30817e97160021c8cc4482b90f79ec5c6b195edf12ea91a0e8f1"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.29.0-ubuntu-x86_64.tgz"
      sha256 "ae8f08dc05c9a806b1178a4110545c1c6610d2e5b6616ca735451c98557b3eb0"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
