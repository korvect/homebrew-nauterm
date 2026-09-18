cask "nauterm" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.8"
  sha256 arm:   "adb254f77d732b11ea9f179830c48a6e3269389b306a785f608ee82c5a30886e",
         intel: "ba625ebb3dc2b0ce7f36690ac2caf29c17697f76b3c8b08b87fdac1edb9b1a30"

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
