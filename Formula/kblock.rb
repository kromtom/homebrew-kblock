class Kblock < Formula
  desc "Lock the macOS keyboard from the command line"
  homepage "https://github.com/kromtom/kblock"
  url "https://github.com/kromtom/kblock/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "3266533ac86a984739015256bfb58a84bcfe196794b0918f09b2879638774d48"
  license "MIT"

  depends_on macos: :ventura

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/kblock"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kblock --version")
  end
end
