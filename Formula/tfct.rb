class Tfct < Formula
  desc "A tool to help manage a toolset that helps manage your deployments"
  homepage "https://tfc-toolset.rs"
  if Hardware::CPU.type == :arm
    url "https://github.com/06chaynes/tfc-toolset/releases/download/tfct/v0.3.0/tfct-aarch64-apple-darwin.tar.xz"
    sha256 "6b4c64411fd2a501e74b11d04f56001dd5afd4540b2b3b82255afc948a5db407"
  else
    url "https://github.com/06chaynes/tfc-toolset/releases/download/tfct/v0.3.0/tfct-x86_64-apple-darwin.tar.xz"
    sha256 "0dabbe4b80a3e1c4159f5c7424a7b9c850dfeee119b6e91e05fe6da40a836f8f"
  end
  version "0.3.0"
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
