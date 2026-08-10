cask "nauterm" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.3"
  sha256 arm:   "7274985c7736f3d8d579072fe427ffcfdd2317b93f55ff0a81ab7299da06a8e3",
         intel: "8cab2f97595f725a71abc0d296dfe8127ce380d7c81878690ad8c3be8a73bc2b"

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
