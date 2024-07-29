class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.30.1"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.30.1-macos-arm64.tgz"
      sha256 "f5d55869fcbc1ae5e9373e27575d7c0f49f180b202068542499c87d1de485926"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.30.1-macos-x86_64.tgz"
      sha256 "884f2bf2298c3d45b734ba5e91bc203b9d3fd6396633ff34ef72aa3d9d179e18"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.30.1-ubuntu-x86_64.tgz"
      sha256 "08dd79e264a9cf46caf117d72fae7d7cf5a636104d6abcf48c278c879ed268a2"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
