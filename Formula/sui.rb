class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.20.0"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.20.0-macos-arm64.tgz"
      sha256 "8b8ddc84c1e28e1ef9b757b34c71d1fe97d7eab0f6c2abffba32a94ab96dd3e1"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.20.0-macos-x86_64.tgz"
      sha256 "ceefe21c4deae20b708cfa0f29bb58d111d1cfa81c147745df970a2ce7cc4f07"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.20.0-ubuntu-x86_64.tgz"
      sha256 "862c91b69f3ab31881f2d0d4983d722182ef516f1d2faac7afb2d21fbcc5a9a3"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
