class Tfct < Formula
  desc "A tool to help manage a toolset that helps manage your deployments"
  homepage "https://tfc-toolset.rs"
  if Hardware::CPU.type == :arm
    url "https://github.com/06chaynes/tfc-toolset/releases/download/tfct/v0.1.0/tfct-aarch64-apple-darwin.tar.xz"
    sha256 "4813ddd811d0d916c2f8c1505da2472acfc9f20ef16b6e2a3625f2fb0294e336"
  else
    url "https://github.com/06chaynes/tfc-toolset/releases/download/tfct/v0.1.0/tfct-x86_64-apple-darwin.tar.xz"
    sha256 "4266ee7f6bb46d4154ff747e1b1c7080bea474b8e6f325555c4e14ebfcef83d8"
  end
  version "0.1.0"
  license "MIT OR Apache-2.0"

  def install
    bin.install "tfct"

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
