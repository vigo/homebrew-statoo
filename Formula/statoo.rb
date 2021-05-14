class Statoo < Formula
  desc "`statoo` is a super simple http GET tool for checking site health"
  homepage "https://github.com/vigo/statoo"
  url "https://github.com/vigo/statoo/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "9893802c14129a6a0954c2170a530db7852faa256750f8fd5ddc9a2858e34f90"
  license "MIT"

  bottle do
    root_url "https://github.com/vigo/homebrew-statoo/releases/download/statoo-1.1.1"
    sha256 cellar: :any_skip_relocation, catalina:     "bb0cbb621957ca8cae2c9a7639e6c09b012c3aeb2a3639bbf6ca4338c412269a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4b3f92a10cf966d4d0bffcc3907c7ede6688b43d7a716b434a68301bda848efe"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    require "open3"
    Open3.popen3("#{bin}/statoo", "-version") do |stdin, stdout, _|
      stdin.close
      assert_equal "1.1.1", stdout.read.strip
    end
  end
end
