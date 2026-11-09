cask "velvet" do
  arch arm: "AppleSilicon", intel: "Intel"

  version "1.0.1"
  sha256 arm:   "26a2a5b5cfa3646aca16f8e723cafdf7ea70810be696eb4027fb57e3ea747f4e",
         intel: "d1052daae4db9aae00e026bb48ceb5a8126805aa93666140448f5cdef461b2ea"

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
