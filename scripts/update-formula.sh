#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <version-without-v>"
  echo "Example: $0 1.2.11"
  exit 1
fi

v="$1"
repo="JohnThre/pfcode"

arm_url="https://github.com/${repo}/releases/download/v${v}/pfcode-darwin-arm64.zip"
intel_url="https://github.com/${repo}/releases/download/v${v}/pfcode-darwin-x64.zip"

arm_sha="$(curl -fsSL "$arm_url" | shasum -a 256 | awk '{print $1}')"
intel_sha="$(curl -fsSL "$intel_url" | shasum -a 256 | awk '{print $1}')"

cat > Formula/pfcode.rb <<RUBY
class Pfcode < Formula
  desc "Open source AI coding agent"
  homepage "https://github.com/JohnThre/pfcode"
  version "${v}"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "${arm_url}"
      sha256 "${arm_sha}"
    else
      url "${intel_url}"
      sha256 "${intel_sha}"
    end
  end

  def install
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
RUBY

echo "Updated Formula/pfcode.rb for v${v}"
