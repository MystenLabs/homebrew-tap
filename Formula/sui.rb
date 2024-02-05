class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.17.3"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-mainnet-v1.17.3-macos-arm64.tgz"
      sha256 "7790b9a38305e8202f0640b1b1e4b210282477ed64cafdd32f402f4e8018ce30"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-mainnet-v1.17.3-macos-x86_64.tgz"
      sha256 "bf5e10d28e041bd5cd5eb69205c577d085bdb1e6ecaf315dd73ed7ac57425ad6"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-mainnet-v1.17.3-ubuntu-x86_64.tgz"
      sha256 "69610f8c092b7c21436763d5a7d462d1ad39a0382379fbc90c10630425b5e36a"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
