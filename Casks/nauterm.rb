cask "nauterm" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.6"
  sha256 arm:   "1a46e81df17702f169c2c9be2891d52c19b5563fd1177ec85740b84cf684979a",
         intel: "9e7aa91fcbb981068c30f7b9b76510d8cf93896938265ad645b55c70d6c4675e"

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
