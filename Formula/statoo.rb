class Statoo < Formula
  desc "`statoo` is a super simple http GET tool for checking site health"
  homepage "https://github.com/vigo/statoo"
  url "https://github.com/vigo/statoo/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "cfc0deae453316d646d3cb0690e75b4926d6b4579126fa3fcd6cee130ba3a2ab"
  license "MIT"

  bottle do
    root_url "https://github.com/vigo/homebrew-statoo/releases/download/statoo-1.3.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "3aaabf9ec867f18df0cf9986d8221fc9b6336e323f6bd92b46bab9ea418d9553"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7671eee2247796c86b6c6b433adad0198e09e50a431bef44929b38ad0655192a"
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
      assert_equal "1.3.1", stdout.read.strip
    end
  end
end
