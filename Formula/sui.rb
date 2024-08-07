class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.30.2"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.30.2-macos-arm64.tgz"
      sha256 "614c2f1919889d00b1f6979f03d9cadee91f0176bdb511637b9569d9958858ab"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.30.2-macos-x86_64.tgz"
      sha256 "8236dc70b9ff6e4094d34c11d1440ae9a10f94d203a55bb449b3f7a1e74f5c0d"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.30.2-ubuntu-x86_64.tgz"
      sha256 "924a999e93f2c01331a444a775629d11f2f153d147072c4002dc06fb8b06f6f9"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
