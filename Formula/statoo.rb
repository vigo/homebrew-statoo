class Statoo < Formula
  desc "`statoo` is a super simple http GET tool for checking site health"
  homepage "https://github.com/vigo/statoo"
  url "https://github.com/vigo/statoo/archive/refs/tags/v2.0.2.tar.gz"
  sha256 "053b8421b57d95a3b095df3815507e76a2555e0987eb1630665276eda33f59ea"
  license "MIT"

  bottle do
    root_url "https://github.com/vigo/homebrew-statoo/releases/download/statoo-2.0.2"
    sha256 cellar: :any_skip_relocation, big_sur:      "9420ada430bf4ef1ec95a96c2f3968521cd4e6dccb551fc6267d848af8d4a0f1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9073dfa249d8c353616e72adcc087931d095c6686e3624ae2e7e039368a00207"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
    generate_completions_from_executable(bin/"statoo", "bash-completion", "completions", shells: [:bash])
  end

  test do
    require "open3"
    Open3.popen3("#{bin}/statoo", "-version") do |stdin, stdout, _|
      stdin.close
      assert_equal "2.0.2", stdout.read.strip
    end
  end
end
