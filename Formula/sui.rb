class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.35.0"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.35.0-macos-arm64.tgz"
      sha256 "75c805bbca31bdd8be37e9779614d7e7c523dc19c00056aa8cbe4dfdb8481d26"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.35.0-macos-x86_64.tgz"
      sha256 "5039aa3b812346bc7ab9010d59b4444a09e9c208edc061fad21818bb5d3b2f79"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.35.0-ubuntu-x86_64.tgz"
      sha256 "13169a028ddac0080a8eb1c9bc531c31f57f89f0952698a02e97aed8d3777a3c"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
