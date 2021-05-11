class Statoo < Formula
  desc "`statoo` is a super simple http GET tool for checking site health"
  homepage "https://github.com/vigo/statoo"
  url "https://github.com/vigo/statoo/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "9188474d779832c37d6d67a853d25a0cd25b6c5f8270e20b5b46e533378ee6a4"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, catalina: "a982d31d75952c361a45952658df979ff3aa9e9f32aba5415833105e7593234b"
  end

  depends_on "go" => :build

  def install
      ENV["GOPATH"] = buildpath

      bin_path = buildpath/"src/github.com/vigo/statoo"
      bin_path.install Dir["*"]
      cd bin_path do
        system "go", "build", "-o", bin/"statoo", "."
      end
    end

  test do
    assert_match "1.0.1", shell_output("#{bin}/statoo -version 2>&1", 2)
  end
end
