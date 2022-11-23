class Statoo < Formula
  desc "`statoo` is a super simple http GET tool for checking site health"
  homepage "https://github.com/vigo/statoo"
  url "https://github.com/vigo/statoo/archive/refs/tags/v2.0.2.tar.gz"
  sha256 "053b8421b57d95a3b095df3815507e76a2555e0987eb1630665276eda33f59ea"
  license "MIT"

  bottle do
    root_url "https://github.com/vigo/homebrew-statoo/releases/download/statoo-2.0.2"
    rebuild 1
    sha256 cellar: :any_skip_relocation, big_sur:      "90fe5b679a3716bd623dc80202efc7fedf8cb3e82bcdf50362b01c9eb810d89b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a826d60a2eff9ac9defe1d64d61e7e4e02b593e12652af7627e4298ae298d741"
  end

  depends_on "go" => :build

  def install
    ldflag_param = "-X 'github.com/vigo/statoo/app/version.CommitHash=7f1cc311eb1435a02c7110b52a628bbc91ffbeba'"
    system "go", "build", *std_go_args, "-ldflags", ldflag_param
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
