# Homebrew Otaku

[Homebrew](https://brew.sh) tap for [Otaku](https://github.com/vishnukv64/otaku) — the cross-platform anime & manga streaming desktop app.

## Install

```bash
brew tap vishnukv64/otaku
brew install --cask otaku
```

Or in one line:

```bash
brew install --cask vishnukv64/otaku/otaku
```

## Upgrade

The app self-updates via its in-app updater, but you can also upgrade through brew:

```bash
brew upgrade --cask otaku
```

## Uninstall

```bash
brew uninstall --cask otaku
```

To remove all user data as well (library, history, cached metadata):

```bash
brew uninstall --zap --cask otaku
```

## About this repo

This tap is automatically kept in sync with [vishnukv64/otaku](https://github.com/vishnukv64/otaku) releases. The `Casks/otaku.rb` file is bumped by a GitHub Action in the main repo every time a new release is published.

Please file issues against the [main Otaku repo](https://github.com/vishnukv64/otaku/issues), not this tap.

## License

The Cask formula is released under the same MIT license as Otaku itself.
