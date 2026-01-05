class Statoo < Formula
  desc "`statoo` is a super simple http GET tool for checking site health"
  homepage "https://github.com/vigo/statoo"
  url "https://github.com/vigo/statoo/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "798b8095149943dfdf04592bc540b7a084049e31508387a3ab8ba28054587467"
  license "MIT"

  bottle do
    root_url "https://github.com/vigo/homebrew-statoo/releases/download/statoo-2.0.3"
    sha256 cellar: :any_skip_relocation, monterey:     "9e29de6bc4afe88c51aa2c42cdd4739b5e38455b9e47e877503f99660365ec64"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9ac4181ba6976c06d42c462081702c9aadc9e28fa401bfe52f8178a7979257c1"
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
      assert_equal "2.1.0", stdout.read.strip
    end
  end
end
