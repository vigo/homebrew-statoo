class Statoo < Formula
  desc "`statoo` is a super simple http GET tool for checking site health"
  homepage "https://github.com/vigo/statoo"
  url "https://github.com/vigo/statoo/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "55ed965ae1cc117b9a8a1ce4b8712762b1ae6fe316a434bc22696484eb55c6c7"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    require "open3"
    Open3.popen3("#{bin}/statoo", "-version") do |stdin, stdout, _|
      stdin.close
      assert_equal "1.1.0", stdout.read.strip
    end
  end
end
