cask "nauterm" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.4"
  sha256 arm:   "d81fad51cadcf5f3ba85e9dfc2b82b812b42891df8cd2bb6532653d7bc8ac69b",
         intel: "f4a3e8ef753e42f60362eb9c80f0ce3e3db171f7cbe3761cb7e3062a67da5905"

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
