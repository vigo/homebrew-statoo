class Statoo < Formula
  desc "`statoo` is a super simple http GET tool for checking site health"
  homepage "https://github.com/vigo/statoo"
  url "https://github.com/vigo/statoo/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "f9b6767656eb191441c21422f7bee3ab4af8e7111fab43cb2b4b3cdcdb3daa33"
  license "MIT"

  bottle do
    root_url "https://github.com/vigo/homebrew-statoo/releases/download/statoo-1.1.3"
    sha256 cellar: :any_skip_relocation, catalina:     "fe560ec24c960d3244e3f4dc0c213bf76da6c3afaefe6b7e801c8ec3a1e5a8cc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "456bdca3ce0c476c9383d50315afed235138c5aa0b456dc195283345d045112b"
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
