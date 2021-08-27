class Statoo < Formula
  desc "`statoo` is a super simple http GET tool for checking site health"
  homepage "https://github.com/vigo/statoo"
  url "https://github.com/vigo/statoo/archive/refs/tags/v1.2.3.tar.gz"
  sha256 "c1da9572a288f4c0da615940a136cf23d3987fca51b16fb3755a421f21878617"
  license "MIT"

  bottle do
    root_url "https://github.com/vigo/homebrew-statoo/releases/download/statoo-1.2.3"
    sha256 cellar: :any_skip_relocation, catalina:     "27559ed8d83e87ca7c41577010ea9306424c1582734051ab99a8a9ebc24f7fd0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3bad3590f5006b74eddf79293dfe3c1c70bb870eb56e4494c9605bde8b64dded"
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
      assert_equal "1.2.3", stdout.read.strip
    end
  end
end
