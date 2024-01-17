class Sui < Formula
  desc "Sui CLI install"
  homepage "https://docs.sui.io"
  version "1.16.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-mainnet-v1.16.2-macos-arm64.tgz"
      sha256 "d0bc062f2aa24a05c20c3ccb9f467064e577886c316c9294a8b68c81f9da7842"

      def install
        bin.install "target/release/sui-macos-arm64" => "sui"
      end
    end
    if Hardware::CPU.intel?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-mainnet-v1.16.2-macos-x86_64.tgz"
      sha256 "7ea08f9947fce60bd6464cb848515be963ad8d392c4d08e771824af00fa741cb"

      def install
        bin.install "target/release/sui-macos-x86_64" => "sui"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://sui-releases.s3-accelerate.amazonaws.com/releases/sui-mainnet-v1.16.2-ubuntu-x86_64.tgz"
      sha256 "cc525fe55408a71b42a1777cd0ce6c8e58d4f1be159f2e7290d1d98e71a1e1a2"

      def install
        bin.install "target/release/sui-ubuntu-x86_64" => "sui"
      end
    end
  end

  test do
    system "#{bin}/sui --version"
  end 
end
