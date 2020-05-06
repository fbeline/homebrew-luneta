class Luneta < Formula
  desc "Command-line fuzzy finder"
  homepage "https://github.com/fbeline/luneta/"
  url "https://github.com/fbeline/luneta/archive/v0.7.3.tar.gz"
  sha256 "4f8a959132702974d66034b81445c3cfc8e65b69b73b6b276ac30043f83a8823"

  depends_on "dub" => :build
  depends_on "ldc" => :build
  uses_from_macos "ncurses"

  def install
    system "dub", "build", "-b", "release", "--compiler", "ldc2"
    bin.install "luneta"
  end

  test do
    assert_equal "hello", shell_output("echo 'hello\nworld' | #{bin}/luneta -f hl").chomp
  end
end
