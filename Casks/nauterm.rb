cask "nauterm" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.2"
  sha256 arm:   "fb338da2e2b4e7ce56539bd644d4f1900f0dcd7ea59e254d08049d2e71379560",
         intel: "83b386f72a5c82152ed06e2ba146d786c0942e824bcf7606b682f4b842fe81be"

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
