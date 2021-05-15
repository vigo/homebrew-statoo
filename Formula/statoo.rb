class Statoo < Formula
  desc "`statoo` is a super simple http GET tool for checking site health"
  homepage "https://github.com/vigo/statoo"
  url "https://github.com/vigo/statoo/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "fa4fcf1d04046cddc18e38188556dbd3e18e28c6d7e14a368c8d34cbb2b6674c"
  license "MIT"

  bottle do
    root_url "https://github.com/vigo/homebrew-statoo/releases/download/statoo-1.1.2"
    sha256 cellar: :any_skip_relocation, catalina:     "4bb67315785537c1b0f56473d70ca7b3c9f400abe34b0031595bc6a0a7b4ab07"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "234ec14c252a9e490a3cf449b5d8e7641844fb8b7ca8259f9f2f67cfb797ac08"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    require "open3"
    Open3.popen3("#{bin}/statoo", "-version") do |stdin, stdout, _|
      stdin.close
      assert_equal "1.1.2", stdout.read.strip
    end
  end
end
