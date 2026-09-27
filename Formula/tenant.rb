class Tenant < Formula
  desc "Provision isolated macOS accounts with per-tenant firewall egress control"
  homepage "https://github.com/MuhammadFarag/tenant"
  url "https://github.com/MuhammadFarag/tenant/releases/download/v0.1.0-alpha.11/tenant-v0.1.0-alpha.11-aarch64-apple-darwin.tar.gz"
  sha256 "8e6314188e740ccda71b55ef30eb7cceb99a70f98a7681884276cabc66a8e18e"
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
