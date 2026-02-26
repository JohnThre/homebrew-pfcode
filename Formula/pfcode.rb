class Pfcode < Formula
  desc "Open source AI coding agent"
  homepage "https://github.com/JohnThre/pfcode"
  license "MIT"

  # Uses latest release URL until the first pinned formula update.
  # Run scripts/update-formula.sh after each new release to pin version and SHA.
  version "0.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/JohnThre/pfcode/releases/latest/download/pfcode-darwin-arm64.zip"
      sha256 :no_check
    else
      url "https://github.com/JohnThre/pfcode/releases/latest/download/pfcode-darwin-x64.zip"
      sha256 :no_check
    end
  end

  def install
    # Support both historical and renamed binary names in release zips.
    exe = if File.exist?("pfcode")
      "pfcode"
    else
      "opencode"
    end

    bin.install exe => "pfcode"
  end

  test do
    output = shell_output("#{bin}/pfcode --help", 0)
    assert_match "pfcode", output.downcase
  end
end
