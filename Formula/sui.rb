class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.33.1"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.33.1-macos-arm64.tgz"
      sha256 "172cf16d783b3d13c35736cf037cc0ca7d9fc1c33e495e923fc3cac188983a40"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.33.1-macos-x86_64.tgz"
      sha256 "21b5df0de9a706dc56bf5c52d5e5d8f737015b4de4bbe1ad0a62f807d500acc0"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.33.1-ubuntu-x86_64.tgz"
      sha256 "c8f567f4f874b25894cebf2698d18fb93dfaaa163aa4c09dddc0663ee03aae00"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
