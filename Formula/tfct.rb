class Tfct < Formula
  desc "A tool to help manage a toolset that helps manage your deployments"
  homepage "https://tfc-toolset.rs"
  if Hardware::CPU.type == :arm
    url "https://github.com/06chaynes/tfc-toolset/releases/download/tfct/v0.4.1/tfct-aarch64-apple-darwin.tar.xz"
    sha256 "ed5e1b30c388956261d22b5c3d9a7745a411438f09a4f9da5cefc570873f7589"
  else
    url "https://github.com/06chaynes/tfc-toolset/releases/download/tfct/v0.4.1/tfct-x86_64-apple-darwin.tar.xz"
    sha256 "672f2c64fc5e0fde4364c034b8c7f9207546a2e22d4b6a7ec7b73f8a269cc989"
  end
  version "0.4.1"
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
