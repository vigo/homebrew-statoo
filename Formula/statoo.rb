class Statoo < Formula
  desc "`statoo` is a super simple http GET tool for checking site health"
  homepage "https://github.com/vigo/statoo"
  url "https://github.com/vigo/statoo/archive/refs/tags/v2.0.1.tar.gz"
  sha256 "2628d780c584f4e3da588199c2531f0335e29457b0ee28e1ad75632fc5a67b31"
  license "MIT"

  bottle do
    root_url "https://github.com/vigo/homebrew-statoo/releases/download/statoo-2.0.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "4a6458b14b142fc0886e9b6c8377ecf2c361e97e1b8b6750912538afc9a69a4c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8d57f68016e64c776b06d08f6930f70cd12e636370913ff760f518a9cffd4460"
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
      assert_equal "2.0.1", stdout.read.strip
    end
  end
end
