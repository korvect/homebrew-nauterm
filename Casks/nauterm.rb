cask "nauterm" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.6"
  sha256 arm:   "e3e920568a8722e520ea890f2a04e7915f23c7878496062d0cb7c542dc05d866",
         intel: "c23c6690a81f05cad85dd073e352e4075a618880d8e13cc1a69aa76ad7194062"

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
