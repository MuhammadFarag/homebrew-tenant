class Tenant < Formula
  desc "Provision isolated macOS accounts with per-tenant firewall egress control"
  homepage "https://github.com/MuhammadFarag/tenant"
  url "https://github.com/MuhammadFarag/tenant/releases/download/v0.1.0-alpha.5/tenant-v0.1.0-alpha.5-aarch64-apple-darwin.tar.gz"
  sha256 "c2192dfb37b478da6b38f2871988bfb1805ff84c20e8b92deae78a2dc0b4b1ec"
  license "Apache-2.0"

  # Release binaries are published only for Apple Silicon (aarch64-apple-darwin).
  depends_on :macos

  def install
    odie "tenant supports Apple Silicon (arm64) only; Intel is unsupported." unless Hardware::CPU.arm?

    bin.install "tenant"
  end

  test do
    assert_match "tenant #{version}", shell_output("#{bin}/tenant --version")
  end
end
