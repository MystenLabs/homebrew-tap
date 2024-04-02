class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.22.0"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.22.0-macos-arm64.tgz"
      sha256 "730b221b9772800e81ef62bc8a68a8341611aed7d877877602e7da8e420ade7c"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.22.0-macos-x86_64.tgz"
      sha256 "4433382adbeab0f520337bfd14a32cf1f8d6f341ee8567c6ec3dde058cf5fae8"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.22.0-ubuntu-x86_64.tgz"
      sha256 "32122c909ff6abfabb20ff6517522cc2f37cc8125606d3148bfd82ce9b772ebd"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
