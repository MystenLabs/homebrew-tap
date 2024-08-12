class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.31.1"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.31.1-macos-arm64.tgz"
      sha256 "25c887431fda94bd4c90e30ae7aa00ae43afb2e81506c0ce88b6cb7c067a9e28"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.31.1-macos-x86_64.tgz"
      sha256 "ecef6d3210397c68b51fdc7393d304d97563fbeb30b4126b79417dd5e8ec7be0"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.31.1-ubuntu-x86_64.tgz"
      sha256 "32db901cfb74abf1456063f695ec3626d36e8ba12df52a39407d44b4d2a7e64b"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
