class DhallJson < Formula
  desc "Dhall to JSON compiler and a Dhall to YAML compiler"
  homepage "https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-json"
  url "https://hackage.haskell.org/package/dhall-json-1.7.12/dhall-json-1.7.12.tar.gz"
  sha256 "ca48cd434380cbd979dbb12889f90da8fdc1ea90bc266cab14f061c60e19d5fa"
  license "BSD-3-Clause"
  head "https://github.com/dhall-lang/dhall-haskell.git", branch: "master"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "ab6be0ad3e1bbcfd26a23dbbf26d4a6d4c4d503eb4c3d2c40860476740731fbe"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "c7ab866ec47813ed157b45eb104a1066a9fb8ff331bdbf1f8064b508d0477f58"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "3a7b56e38dbedd7640bf311a0fc9f3f7c45b669e7ce1e82d39c0d2bf54919d7e"
    sha256 cellar: :any_skip_relocation, ventura:        "a74a00cb4a6dbd48fcc81e1bdc522ee6b05dd2e88ebdaf10ebd4047fb94fc969"
    sha256 cellar: :any_skip_relocation, monterey:       "1739d1d88b428e459c12382334f46368e7f56a576559c2723ea68d241d20390e"
    sha256 cellar: :any_skip_relocation, big_sur:        "eeb1ac02605a19ecd05545d31e9626c001abc6e22be1f929e4c9016162690595"
    sha256 cellar: :any_skip_relocation, catalina:       "bb726a70ad686bb99274a509edcd4744f4c04cef7f77a78c73594381f88eb443"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "0fdbf404ad8248fbc394b6dba1342ea550b89edede9cedac49336ac3636dc3ca"
  end

  depends_on "cabal-install" => :build
  depends_on "ghc" => :build

  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  def install
    system "cabal", "v2-update"
    system "cabal", "v2-install", *std_cabal_v2_args
  end

  test do
    assert_match "1", pipe_output("#{bin}/dhall-to-json", "1", 0)
  end
end
