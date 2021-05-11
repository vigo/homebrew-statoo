class Statoo < Formula
  desc "`statoo` is a super simple http GET tool for checking site health"
  homepage "https://github.com/vigo/statoo"
  url "https://github.com/vigo/statoo/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "9188474d779832c37d6d67a853d25a0cd25b6c5f8270e20b5b46e533378ee6a4"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    assert_match "1.0.1", shell_output("#{bin}/statoo -version 2>&1", 2)
  end
end
