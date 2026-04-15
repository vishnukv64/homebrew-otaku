cask "otaku" do
  version "1.2.0"

  on_arm do
    sha256 "f9d730eb3bc9cdb132efa85d5c602729b2beb7185a458def3849e513bbe1fe87"
    url "https://github.com/vishnukv64/otaku/releases/download/v#{version}/otaku_#{version}_aarch64.dmg",
        verified: "github.com/vishnukv64/otaku/"
  end

  on_intel do
    sha256 "b0d5746d5eb2d523150e14382d90b751dd562a91bcfc3a46f81a73079be2930d"
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
