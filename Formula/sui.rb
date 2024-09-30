class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.34.1"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.34.1-macos-arm64.tgz"
      sha256 "4c1318097702baa93362d5ab8d2d720852de15c790299cfec5a1b1f42e91a96a"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.34.1-macos-x86_64.tgz"
      sha256 "4850364240760f49260078b83171a2fc67f7aa1505db0c146611b542f136fa42"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.34.1-ubuntu-x86_64.tgz"
      sha256 "200d83d86b7da066f8d6de07eaea83915ba195bed6e5725687252babbc134a1e"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
