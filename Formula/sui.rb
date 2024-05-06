class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.24.1"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.24.1-macos-arm64.tgz"
      sha256 "2fea2615a09729266757278fe78ccae604b43e0b807aa4522f07f47d36d08e3c"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.24.1-macos-x86_64.tgz"
      sha256 "81119adc3a174b4697dcb519b097d0df8d89033f43d54b35740ada0d9f1118df"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.24.1-ubuntu-x86_64.tgz"
      sha256 "4693323d515c64a424ea81ad54975922f98c10375637df2c62c79ba1ab29adbc"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
