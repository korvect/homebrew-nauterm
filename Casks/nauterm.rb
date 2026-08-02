cask "nauterm" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.2"
  sha256 arm:   "bbe97f7c35365b827ffa1a37506675ba396e9b25ae36bccc2af25bbad8d85ff6",
         intel: "34e1e262dd09956f16da7fafefe294e27fdd087921e6d04abd4f6ed1c1aa4532"

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
