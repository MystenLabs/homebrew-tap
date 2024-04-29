class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.24.0"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.24.0-macos-arm64.tgz"
      sha256 "01efe2df8ed95a2e728828b0db7042b8efa10faae3f1f462724f5b1875660551"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.24.0-macos-x86_64.tgz"
      sha256 "25fdf7d3f3bd34dcc95e658d45060ec377d1a3a90f6b86d2fa2d36ac8be5095c"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.24.0-ubuntu-x86_64.tgz"
      sha256 "7ed3f874f63c7450f4fbfe5b9549ef105e5271874fa30f244ad3e99c222f63dc"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
