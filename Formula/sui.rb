class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.28.3"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.28.3-macos-arm64.tgz"
      sha256 "39f38b358e3afc070e85b2816c7374fad961b701531bf1da35122e4e5057a6db"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.28.3-macos-x86_64.tgz"
      sha256 "8a0ba6c8f123617e955a4409d079ec97c9359ddc69a6350ae9918e7c76d8dcb8"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.28.3-ubuntu-x86_64.tgz"
      sha256 "0be4af81811fd087a18422610bf901b92d7029da8a289f70932e4afad53dabb5"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
