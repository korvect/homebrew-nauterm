cask "nauterm" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.11"
  sha256 arm:   "82167a793348f60d4edd6b1500534eebba151d6d0b4fa4ef461349ef193a0c9c",
         intel: "17f4816a22f610ba526c7f1ede771e02f416f69aab1dab65ba1fb6b3014e06c3"

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

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-cr", "{{appdir}}/Nauterm.app"]
  end

  zap trash: [
    "~/Library/Caches/com.korvect.nauterm",
    "~/Library/Preferences/com.korvect.nauterm.plist",
    "~/Library/Saved Application State/com.korvect.nauterm.savedState",
  ]
end
