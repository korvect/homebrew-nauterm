cask "nauterm" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.9"
  sha256 arm:   "c70fca691df220bee87fdad6790f6fbd76ca6f4f6d392875f85a567d9aa7073d",
         intel: "68d9dabb79d9bada6aa99e25ef45b23b5272c369ebea57cb1465a27cb52b5325"

  url "https://github.com/korvect/nauterm/releases/download/v#{version}/Nauterm-#{version}-macos-#{arch}.app.zip"
  name "Nauterm"
  desc "Cross-platform terminal and remote access workspace"
  homepage "https://github.com/korvect/nauterm"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

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
