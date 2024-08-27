class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.32.0"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.32.0-macos-arm64.tgz"
      sha256 "8d46899d334f84cdb4b32e79a6839b386ca069586c58b978a13dc1b06a0e5fa2"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.32.0-macos-x86_64.tgz"
      sha256 "e0c06f7c2dfcd082e13f0e70fa1bd4ed546c6640e0de74a9275721590af27d20"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.32.0-ubuntu-x86_64.tgz"
      sha256 "9cf5688912735b52c19fc6f9c72f51f48a6a099d123ac682f8263fe7c730b967"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
