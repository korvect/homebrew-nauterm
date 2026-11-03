cask "nauterm" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.10"
  sha256 arm:   "2e91effaff2bc6bf89f3f7fe4211c8f14547411f8f285742510864a49191c615",
         intel: "d392d563195a2ae0ceae4cb564d3f64b9701b49d9624bc2da0f394eaa35dd463"

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
