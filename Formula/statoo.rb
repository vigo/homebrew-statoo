class Statoo < Formula
  desc "`statoo` is a super simple http GET tool for checking site health"
  homepage "https://github.com/vigo/statoo"
  url "https://github.com/vigo/statoo/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "ba0e576f921768e31cae5a3f0fe603b8ecb89debc87651c1fc117d6e779e378e"
  license "MIT"

  bottle do
    root_url "https://github.com/vigo/homebrew-statoo/releases/download/statoo-1.3.1"
    sha256 cellar: :any_skip_relocation, big_sur:      "9df7151bdd8b8aeaa93d8395a8cea5a72f473532f960bd4102cdee60c3a152c2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "03a115c4971f8426ac2d7f134601bd46f739011ccfb187d04c62600374e3fd05"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
    (bash_completion/"statoo").write `#{bin}/statoo bash-completion`
  end

  test do
    require "open3"
    Open3.popen3("#{bin}/statoo", "-version") do |stdin, stdout, _|
      stdin.close
      assert_equal "2.0.0", stdout.read.strip
    end
  end
end
