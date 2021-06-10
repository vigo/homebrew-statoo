class Statoo < Formula
  desc "`statoo` is a super simple http GET tool for checking site health"
  homepage "https://github.com/vigo/statoo"
  url "https://github.com/vigo/statoo/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "85e1b2fc6e77c4dcbe7f6dcf91c625ae9fdd3a9ecb0264c9c76cb05002402035"
  license "MIT"

  bottle do
    root_url "https://github.com/vigo/homebrew-statoo/releases/download/statoo-1.2.1"
    sha256 cellar: :any_skip_relocation, catalina:     "6a887054a84fb095fc626dbffbd32004f4cd0c82d797af16d748c0eec839bafb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "37ab07b2c5f09d45acfabe7d5e6a6121e86458b93550d640ec0f2e5643291e47"
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
      assert_equal "1.2.1", stdout.read.strip
    end
  end
end
