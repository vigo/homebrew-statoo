class Statoo < Formula
  desc "`statoo` is a super simple http GET tool for checking site health"
  homepage "https://github.com/vigo/statoo"
  url "https://github.com/vigo/statoo/archive/refs/tags/v2.0.2.tar.gz"
  sha256 "053b8421b57d95a3b095df3815507e76a2555e0987eb1630665276eda33f59ea"
  license "MIT"

  bottle do
    root_url "https://github.com/vigo/homebrew-statoo/releases/download/statoo-2.0.1"
    sha256 cellar: :any_skip_relocation, big_sur:      "e77337c7d7b045795c2c19e96f4eb5c3f99a625b4a511425498e47f382352c67"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b5ff0f8e42756d9be8939a22a95631e7402ea898fe61cfde8ee2597c48ac2c33"
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
