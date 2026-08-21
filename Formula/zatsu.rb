class Zatsu < Formula
  desc "Code outline viewer for LLMs"
  homepage "https://github.com/shohei81/zatsu"
  version "0.1.0"
  license "GPL-3.0"

  on_macos do
    on_arm do
      url "https://github.com/shohei81/zatsu/releases/download/v0.1.0/zatsu-aarch64-darwin.tar.gz"
      sha256 "5a96699fcdedc1f82a0d35fa9ab5b9f060d86faee73cb0fcfdf6ec9831b3ec4b"
    end
    on_intel do
      url "https://github.com/shohei81/zatsu/releases/download/v0.1.0/zatsu-x86_64-darwin.tar.gz"
      sha256 "371d0c2a1428388a5561e3475f19050830fc18c585212a082b9788150c12200c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/shohei81/zatsu/releases/download/v0.1.0/zatsu-x86_64-linux.tar.gz"
      sha256 "dee39dca95ddcbb8991c60f5000560556ebd55603368a68737bf1ee59ebc9eab"
    end
  end

  def install
    bin.install "zatsu"
  end

  test do
    (testpath/"test.ts").write("export function hello(): string { return 'hi'; }\n")
    assert_match "function hello", shell_output("#{bin}/zatsu #{testpath}/test.ts")
  end
end
