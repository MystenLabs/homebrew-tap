class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.18.1"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.18.1-macos-arm64.tgz"
      sha256 "1fb7533271e829fa3b9f19e1704921b9d9dd8f56e1032642e0546204a6848529"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.18.1-macos-x86_64.tgz"
      sha256 "ce316eda3c3e9311c36a105b316fa41bd91be77c08a67451038d157f4e81d46c"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.18.1-ubuntu-x86_64.tgz"
      sha256 "69960f677760d41c2e2503de08dd0c5c1fb349999d792aa22c0a78b9d0488827"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
