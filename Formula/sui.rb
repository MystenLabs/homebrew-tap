class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.28.1"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.28.1-macos-arm64.tgz"
      sha256 "7cde6e80033f81d6b9d5221b219417adb6314a4202722a3683c76b4d5230a415"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.28.1-macos-x86_64.tgz"
      sha256 "9ea20a8dfa2d5cfc4e9e2ed9ad1ada473080aadbe27e25570d5a85e60af2065a"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.28.1-ubuntu-x86_64.tgz"
      sha256 "5f6ad586f6e45ee3b6eb8938998234a028111f21a7c1332070f28c8f2094125e"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
