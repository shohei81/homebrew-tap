class Zatsu < Formula
  desc "Code outline viewer for LLMs"
  homepage "https://github.com/shohei81/zatsu"
  version "0.1.1"
  license "GPL-3.0"

  on_macos do
    on_arm do
      url "https://github.com/shohei81/zatsu/releases/download/v0.1.1/zatsu-aarch64-darwin.tar.gz"
      sha256 "f2f19fb7f4b7eed29a5460e22fb7d24ab77b806a1bd57bf9e6a8e565ae9d6cdb"
    end
    on_intel do
      url "https://github.com/shohei81/zatsu/releases/download/v0.1.1/zatsu-x86_64-darwin.tar.gz"
      sha256 "c31c75e6afb43da212c1178b668b16e5eb032b53de261d76e7c731a646f3e37d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/shohei81/zatsu/releases/download/v0.1.1/zatsu-x86_64-linux.tar.gz"
      sha256 "3d7351fde4b9619d7b5dde1d5ecfb85c9b2b0576e37aa56e74c8032f831618e8"
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
