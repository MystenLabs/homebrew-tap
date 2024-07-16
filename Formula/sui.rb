class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.29.1"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.29.1-macos-arm64.tgz"
      sha256 "f60725153fdef2a52fd669ad80635fd50e853c17c286f11b5c94223f7d3d068d"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.29.1-macos-x86_64.tgz"
      sha256 "321f7231d7387393ff882091c73155cf4004fa60ddac26ba4f60e93e0a5fd7dc"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.29.1-ubuntu-x86_64.tgz"
      sha256 "12e99f0fb9f55ea255fde139d77dbf6c0966dc91c35f9e000546b81196ad9d71"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
