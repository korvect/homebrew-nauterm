cask "nauterm" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.4"
  sha256 arm:   "1b74c2df30c920bb7cc1a0198c14f965e0c8fa901c742c836a75e5acc5928534",
         intel: "e3a418a543bc4d2783edd79667a656890d54c4f840c518448daae94872313a38"

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
