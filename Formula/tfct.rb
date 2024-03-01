class Tfct < Formula
  desc "A tool to help manage a toolset that helps manage your deployments"
  homepage "https://tfc-toolset.rs"
  if Hardware::CPU.type == :arm
    url "https://github.com/06chaynes/tfc-toolset/releases/download/tfct/v0.2.1/tfct-aarch64-apple-darwin.tar.xz"
    sha256 "96fd1ac95a0d52dd0ee24af99967a2d98cd3c86c01243a5d5ea2f822c0244d71"
  else
    url "https://github.com/06chaynes/tfc-toolset/releases/download/tfct/v0.2.1/tfct-x86_64-apple-darwin.tar.xz"
    sha256 "f13bca2de45c1d1613a071792436212fd5a0b54f2670d481b1b19374c8272ae0"
  end
  version "0.2.1"
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
