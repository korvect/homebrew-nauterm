cask "nauterm" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.5"
  sha256 arm:   "06df1dfa93b9deccc87a5d54ff1f5d489d8d9d03055debfff793af28ca11cb4d",
         intel: "ecc80d381404bbb14b67e4cc04cce0c023c7b0690115a84236ce3c000d1878d5"

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
