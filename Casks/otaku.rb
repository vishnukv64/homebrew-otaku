cask "otaku" do
  version "1.1.0"

  on_arm do
    sha256 "3131bedf4fa69ce9af497f277276b7b36fa0a0c1c7c01c907806a72438fe986b"
    url "https://github.com/vishnukv64/otaku/releases/download/v#{version}/otaku_#{version}_aarch64.dmg",
        verified: "github.com/vishnukv64/otaku/"
  end

  on_intel do
    sha256 "d70b51851c5f0e68ea52820de79d4935cc6c328423b37ca720db943ca16505f8"
    url "https://github.com/vishnukv64/otaku/releases/download/v#{version}/otaku_#{version}_x64.dmg",
        verified: "github.com/vishnukv64/otaku/"
  end

  name "Otaku"
  desc "Anime and manga streaming desktop app"
  homepage "https://github.com/vishnukv64/otaku"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "otaku.app"

  # Otaku is not yet notarized by Apple, so Gatekeeper will refuse to launch
  # the app with a "damaged and can't be opened" error after Homebrew adds the
  # com.apple.quarantine xattr during install. Strip it here so `brew install`
  # leaves the app in a runnable state. This line can be removed once the
  # upstream release workflow signs + notarizes the bundle.
  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-cr", "#{appdir}/otaku.app"],
                   sudo:         false,
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/com.otaku.player",
    "~/Library/Caches/com.otaku.player",
    "~/Library/Logs/com.otaku.player",
    "~/Library/Preferences/com.otaku.player.plist",
    "~/Library/Saved Application State/com.otaku.player.savedState",
    "~/Library/WebKit/com.otaku.player",
  ]
end
