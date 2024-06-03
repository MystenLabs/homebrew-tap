class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.26.1"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.26.1-macos-arm64.tgz"
      sha256 "5267cb395dd9e5a58884dcd8d8be535acaad8baff35ea103a2ba4889e4bc7737"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.26.1-macos-x86_64.tgz"
      sha256 "c19609f021250470c7b264a117a4dd60137bcb3f4b94fd6d3331fa5713e9bd6d"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.26.1-ubuntu-x86_64.tgz"
      sha256 "edf54a18a8a926449814762983d62d2b4af4e04514544b5e09abbd5f2adc9d2d"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
