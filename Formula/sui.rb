class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.25.1"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.25.1-macos-arm64.tgz"
      sha256 "acdfd54bb76863dc55ffa295b30df5cd0ae0a4433a838a0f287fc4ca69c96c62"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.25.1-macos-x86_64.tgz"
      sha256 "d728ba68fccc2579351cf6338fdb0964386bcdd8e0ab1d42766d53cacb946d8e"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.25.1-ubuntu-x86_64.tgz"
      sha256 "78fcc1f9da1294b19dc5fe7b38e210b3486f6134875910425673991ad210b00b"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
