class Statoo < Formula
  desc "`statoo` is a super simple http GET tool for checking site health"
  homepage "https://github.com/vigo/statoo"
  url "https://github.com/vigo/statoo/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "798b8095149943dfdf04592bc540b7a084049e31508387a3ab8ba28054587467"
  license "MIT"

  bottle do
    root_url "https://github.com/vigo/homebrew-statoo/releases/download/statoo-2.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3f1a5dca7c4688f8cc188b1b4fec23eba518e30653d54f8311a2c567f77be35f"
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
