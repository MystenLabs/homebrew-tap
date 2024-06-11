class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.27.0"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.27.0-macos-arm64.tgz"
      sha256 "46d8cdfa27b3b40ab1a27b9271621bb4550cfa9f03f73ba26aef95aad9941080"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.27.0-macos-x86_64.tgz"
      sha256 "5edd968e43a8107a67c0e69a7a16f358b5e7070653aa73b442ceb31456a9b0cb"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.27.0-ubuntu-x86_64.tgz"
      sha256 "5a49533323bc4945c75bc68ec217d0a10c6ecff62b101b7c29223be4a4ef6216"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
