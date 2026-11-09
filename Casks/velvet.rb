cask "velvet" do
  arch arm: "AppleSilicon", intel: "Intel"

  version "1.0"
  sha256 arm:   "ed8e062b203ad56d0f435fcadf6ce04bbfb22f074856ae0096ec9a8d78c39981",
         intel: "9463baeadd88bb2fe2fe9dce52fa6d7f3c6e6614955622f6f732739b9beb456d"

  url "https://github.com/subhashhhhhh/Velvet/releases/download/v#{version}/Velvet-#{version}-#{arch}.dmg"
  name "Velvet"
  desc "Native, low-memory YouTube client"
  homepage "https://github.com/subhashhhhhh/Velvet"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Velvet.app"

  # Velvet isn't notarized; clearing the flag spares Homebrew users the Gatekeeper prompt.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Velvet.app"]
  end

  uninstall quit: "com.subhash.Velvet"

  zap trash: [
    "~/Library/Application Support/Velvet",
    "~/Library/Application Support/com.subhash.Velvet",
    "~/Library/Caches/com.subhash.Velvet",
    "~/Library/Caches/VelvetUpdate",
    "~/Library/HTTPStorages/com.subhash.Velvet",
    "~/Library/Preferences/com.subhash.Velvet.plist",
    "~/Library/Saved Application State/com.subhash.Velvet.savedState",
  ]
end
