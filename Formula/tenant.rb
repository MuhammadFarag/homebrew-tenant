class Tenant < Formula
  desc "Provision isolated macOS accounts with per-tenant firewall egress control"
  homepage "https://github.com/MuhammadFarag/tenant"
  url "https://github.com/MuhammadFarag/tenant/releases/download/v0.1.0-alpha.8/tenant-v0.1.0-alpha.8-aarch64-apple-darwin.tar.gz"
  sha256 "90a0762da95c48c3be2f4b2ddad6cd774a10e61d8d93209fd3ef4890cc5d3a9b"
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
