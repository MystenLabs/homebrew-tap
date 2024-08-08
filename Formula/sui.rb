class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.30.3"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.30.3-macos-arm64.tgz"
      sha256 "0dc8570b58bd5666ed9c5b4ed301c3c20b9e35be7ca775a38ea2afef49466a71"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.30.3-macos-x86_64.tgz"
      sha256 "806f34e76665105177ec6e5483af9762193bbe35f07bf0384907ae1382b86ff5"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.30.3-ubuntu-x86_64.tgz"
      sha256 "7c4a8d0ad2ecf5df7b716fecc57744c050bcf4bf60547a01c5db6de6095d16ee"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
