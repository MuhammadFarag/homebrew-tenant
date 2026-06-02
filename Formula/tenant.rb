class Tenant < Formula
  desc "Provision isolated macOS accounts with per-tenant firewall egress control"
  homepage "https://github.com/MuhammadFarag/tenant"
  url "https://github.com/MuhammadFarag/tenant/releases/download/v0.1.0-alpha.2/tenant-v0.1.0-alpha.2-aarch64-apple-darwin.tar.gz"
  sha256 "a591e330f2136368dc168238f9dc4561593e2a2f35056d6b4bee611a7f5cec7c"
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
