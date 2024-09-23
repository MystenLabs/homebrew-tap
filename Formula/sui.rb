class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.34.0"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.34.0-macos-arm64.tgz"
      sha256 "fa84b5e1a846f6aefa4a2f9bf21b133bd89372c8fc65c4cd3e64de498eeff213"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.34.0-macos-x86_64.tgz"
      sha256 "17f81da836387ddcd13192de87193c6ac3ba44cab8730c3b818dfb052feac967"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.34.0-ubuntu-x86_64.tgz"
      sha256 "a9b014b9fb68128f45952195e1075da1caad3e447715932bf13dc1ff1c6dc991"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
