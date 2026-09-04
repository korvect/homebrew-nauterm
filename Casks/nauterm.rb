cask "nauterm" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.7"
  sha256 arm:   "ecfdc7df51a45ddba2995e94edc7f76f6766cc0f02d6ce8633b77d49d341b1a0",
         intel: "32eebf034bd4a12fb833b75694ab41368e0f45fc98aa22cdbfafc73fea9b2be5"

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
