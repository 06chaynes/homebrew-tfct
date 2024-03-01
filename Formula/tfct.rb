class Tfct < Formula
  desc "A tool to help manage a toolset that helps manage your deployments"
  homepage "https://tfc-toolset.rs"
  if Hardware::CPU.type == :arm
    url "https://github.com/06chaynes/tfc-toolset/releases/download/tfct/v0.2.0/tfct-aarch64-apple-darwin.tar.xz"
    sha256 "98222f65c3a831b5ce963a479d79f24c2f1e226f38fbf92ae88b1973e3975232"
  else
    url "https://github.com/06chaynes/tfc-toolset/releases/download/tfct/v0.2.0/tfct-x86_64-apple-darwin.tar.xz"
    sha256 "5c6b079d99b6a50527d78adcec59f005b64d34bef822bc715bf1ffeec2a6ae7c"
  end
  version "0.2.0"
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
