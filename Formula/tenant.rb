class Tenant < Formula
  desc "Provision isolated macOS accounts with per-tenant firewall egress control"
  homepage "https://github.com/MuhammadFarag/tenant"
  url "https://github.com/MuhammadFarag/tenant/releases/download/v0.1.0-alpha.6/tenant-v0.1.0-alpha.6-aarch64-apple-darwin.tar.gz"
  sha256 "9d9c66badf70f9b7215db4db1caf92a55a72ba9b34dfefe38e2b05c6d1336266"
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
