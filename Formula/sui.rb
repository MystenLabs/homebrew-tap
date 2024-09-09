class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.33.0"
  license "Apache-2.0"

  deprecate! date: "2024-02-05", because: "migrated to homebrew-core, untap and install via homebrew core: `brew untap mystenlabs/tap && brew install sui`"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.33.0-macos-arm64.tgz"
      sha256 "f17a948d9254edb5d2f649b6171a2d690aead1fd484c1d231a661398ab9c867b"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.33.0-macos-x86_64.tgz"
      sha256 "7588c123a13a004c53458d41abf3f6846e44a4bbf0e2a565fbeb9a7cd7c0b798"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-testnet-v1.33.0-ubuntu-x86_64.tgz"
      sha256 "933cbe81b6a85c18b7a74ec38564d588a2dfd3c8a132840d8ef319442125e1df"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
