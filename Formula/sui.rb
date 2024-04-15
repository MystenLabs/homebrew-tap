class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.23.0"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.23.0-macos-arm64.tgz"
      sha256 "3cd5e37a6494bac71e0f7659f919eee2241eccb1c1471f3f67b7830585811187"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.23.0-macos-x86_64.tgz"
      sha256 "0e26e424d8719787839f72c9bc69fc9c1bd898806bbb10820484b503834cf567"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.23.0-ubuntu-x86_64.tgz"
      sha256 "539678b468042c02d7c1108c13a9c91f0e728f7932f6ad3ac07712dc1fb538cf"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
