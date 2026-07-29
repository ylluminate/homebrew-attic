# homebrew-attic

A Homebrew tap that keeps casks installable after Homebrew disables them.

Homebrew disables casks that fail its Gatekeeper policy, or that it deems
unmaintained, discontinued, or no longer meeting its criteria. On **2026-09-01**
alone it disables **617 casks** for `fails_gatekeeper_check` — apps like LibreWolf,
qBittorrent, Alacritty, OpenEmu, and hundreds more. The cask definitions are fine;
a single `disable!` line is all that blocks installation.

This tap mirrors those definitions with that line removed, so the apps keep
installing normally.

## Usage

```bash
brew tap ylluminate/attic
brew install --cask ylluminate/attic/librewolf
```

If a cask exists in both `homebrew/cask` and here, prefix the tap name (as above)
to install this one.

## What's inside

- **1226 cask definitions**, each with its `disable!` / `deprecate!` stanza stripped
  and nothing else changed:
  - **1057** still in `homebrew/cask` (disabled/deprecated but not yet removed), and
  - **169** already removed from `homebrew/cask`, recovered from its git history.
- **`bin/attic-sync`** — rescues casks currently in `homebrew/cask`. Idempotent.
- **`bin/attic-recover`** — recovers casks Homebrew has already deleted (walks git
  history for cask files that carried a disable stanza before removal).
- **`MANIFEST.tsv`** — rescued casks with their original disable date and reason.

## Staying current

Two GitHub Actions keep this in step with Homebrew automatically — no machine of
yours needs to be on:

- **`sync`** — weekly. Re-runs `attic-sync`, commits anything newly disabled.
- **`recover`** — monthly. Re-runs `attic-recover` for anything newly removed.

Both also run on demand (`gh workflow run sync.yml` / `recover.yml`).

## Notes

- **Definitions only — no binaries.** Casks download from their upstream URL on
  install, exactly as before. This tap hosts no app payloads.
- **Gatekeeper still applies at the OS level.** Homebrew's check is about *its*
  policy, not your machine. macOS may still gatekeep an unsigned app at first
  launch; clear it the usual way (right-click → Open, or your own `spctl` policy).
- **Dead upstreams.** A minority of casks were disabled because their download
  vanished (`no_longer_available`, `unreachable`, `discontinued`). Those need their
  binaries mirrored to durable storage and the `url` repointed — tracked separately.

## Refreshing

```bash
bin/attic-sync            # clone homebrew/cask, strip, write Casks/
bin/attic-sync --dry-run  # report only
git add -A && git commit -m "sync $(date +%F)" && git push
```

## Attribution

Cask definitions are derived from [Homebrew Cask](https://github.com/Homebrew/homebrew-cask)
and remain under its BSD-2-Clause license (see `LICENSE.md`). Only the disabling
stanza is removed.
