class Zatsu < Formula
  desc "Code outline viewer for LLMs"
  homepage "https://github.com/shohei81/zatsu"
  version "0.1.2"
  license "GPL-3.0"

  on_macos do
    on_arm do
      url "https://github.com/shohei81/zatsu/releases/download/v0.1.2/zatsu-aarch64-darwin.tar.gz"
      sha256 "b9505776fa1f4abbab69f0c9d124efa25c44fcfbe5705cca71c5797336479cae"
    end
    on_intel do
      url "https://github.com/shohei81/zatsu/releases/download/v0.1.2/zatsu-x86_64-darwin.tar.gz"
      sha256 "2476e3b3b98803c249be90792c5f7fd11f3a315070eb1d115c6d7d1c8b83052f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/shohei81/zatsu/releases/download/v0.1.2/zatsu-x86_64-linux.tar.gz"
      sha256 "1fd39d573f0013e3e0f949041eec296258b71494ad82bb05c491636013459c04"
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
