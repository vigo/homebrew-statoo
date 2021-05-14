class Statoo < Formula
  desc "`statoo` is a super simple http GET tool for checking site health"
  homepage "https://github.com/vigo/statoo"
  url "https://github.com/vigo/statoo/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "9893802c14129a6a0954c2170a530db7852faa256750f8fd5ddc9a2858e34f90"
  license "MIT"

  bottle do
    root_url "https://github.com/vigo/homebrew-statoo/releases/download/statoo-1.1.0"
    sha256 cellar: :any_skip_relocation, catalina:     "befb6d69dbd6f5c5f24ed0ea334132f087c130af76c1c0a1579586979994998c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fa583fc2d4b4b059ad296591e26a24284201cf5a74c01d5786ffb7aa5f4b93f8"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    require "open3"
    Open3.popen3("#{bin}/statoo", "-version") do |stdin, stdout, _|
      stdin.close
      assert_equal "1.1.1", stdout.read.strip
    end
  end
end
