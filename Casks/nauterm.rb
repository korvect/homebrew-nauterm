cask "nauterm" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.1"
  sha256 arm:   "82749db7efdd337e2ab7cb28c625f2e3248a2253ffbec8b40fdb6a2dec96e965",
         intel: "a4d0284dcbd5d96e81adbdd59dc439fb79948094d2ea5b27d67fa8b0118a1a44"

  url "https://github.com/korvect/nauterm/releases/download/v#{version}/Nauterm-#{version}-macos-#{arch}.app.zip"
  name "Nauterm"
  desc "Cross-platform terminal and remote access workspace"
  homepage "https://github.com/korvect/nauterm"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :catalina

  app "Nauterm.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Nauterm.app"]
  end

  zap trash: [
    "~/Library/Caches/com.korvect.nauterm",
    "~/Library/Preferences/com.korvect.nauterm.plist",
    "~/Library/Saved Application State/com.korvect.nauterm.savedState",
  ]
end
