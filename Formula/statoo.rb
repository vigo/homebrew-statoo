class Statoo < Formula
  desc "`statoo` is a super simple http GET tool for checking site health"
  homepage "https://github.com/vigo/statoo"
  url "https://github.com/vigo/statoo/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "f9b6767656eb191441c21422f7bee3ab4af8e7111fab43cb2b4b3cdcdb3daa33"
  license "MIT"

  bottle do
    root_url "https://github.com/vigo/homebrew-statoo/releases/download/statoo-1.2.0"
    sha256 cellar: :any_skip_relocation, catalina:     "cd6835f1e6e5c3bc9da73babaf8e996152db04331061330582a36690e953ffbf"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "09eaca62f06cef958df15562978f21a2b9d870b098091f4a750e887ac95a5d84"
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
      assert_equal "1.2.0", stdout.read.strip
    end
  end
end
