class Tfct < Formula
  desc "A tool to help manage a toolset that helps manage your deployments"
  homepage "https://tfc-toolset.rs"
  if Hardware::CPU.type == :arm
    url "https://github.com/06chaynes/tfc-toolset/releases/download/tfct/v0.4.0/tfct-aarch64-apple-darwin.tar.xz"
    sha256 "8cd0432503838b20524697fa56ced92cf4e21889eabd0c6e3c12149798ed2912"
  else
    url "https://github.com/06chaynes/tfc-toolset/releases/download/tfct/v0.4.0/tfct-x86_64-apple-darwin.tar.xz"
    sha256 "c031487e627f743fe0c0a68125098236eeb31fb9eec6bb642349c109a9273b29"
  end
  version "0.4.0"
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
