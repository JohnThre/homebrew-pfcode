# homebrew-pfcode

Homebrew tap for [pfcode](https://github.com/JohnThre/pfcode) (open source AI coding agent).

## Install

One-line (tap + install):

```bash
brew install JohnThre/pfcode/pfcode
```

Or tap first, then install:

```bash
brew tap JohnThre/pfcode
brew install pfcode
```

## Upgrade

```bash
brew upgrade pfcode
```

## Uninstall

```bash
brew uninstall pfcode
```

To remove the tap as well: `brew untap JohnThre/pfcode`

## Maintainers

This tap currently installs from the latest GitHub release URL.
After each new `JohnThre/pfcode` release, pin the formula version and checksums:

```bash
./scripts/update-formula.sh <version>
# example: ./scripts/update-formula.sh 1.2.11
```

Then commit and push the generated `Formula/pfcode.rb` update.
