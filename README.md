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

- **1231 cask definitions**, each with its `disable!` / `deprecate!` stanza stripped
  and nothing else of substance changed:
  - **1002** still in `homebrew/cask` (disabled/deprecated but not yet removed), and
  - **229** no longer there at all — recovered from its git history, or rescued
    here earlier and deleted upstream since.
- **`bin/attic-sync`** — rescues casks currently in `homebrew/cask`. Idempotent.
- **`bin/attic-recover`** — recovers casks Homebrew has already deleted (walks git
  history for cask files that carried a disable stanza before removal).
- **`bin/attic-normalize`** — sweeps casks already on disk for deprecated cask DSL.
  Neither engine above ever rewrites a cask Homebrew has deleted: `attic-sync` only
  sees casks that still exist, and `attic-recover` skips tokens already present. So
  those keep whatever syntax they were rescued with, and need their own pass.
- **`bin/atticlib.py`** — the normalisation all three share, so a rescued cask cannot
  arrive carrying DSL that makes Homebrew print a deprecation warning on every load.
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
bin/attic-sync               # clone homebrew/cask, strip, write Casks/
bin/attic-sync --dry-run     # report only
bin/attic-normalize          # sweep existing casks for deprecated DSL
git add -A && git commit -m "sync $(date +%F)" && git push
```

`attic-normalize` is idempotent and reports `normalised 0` on a clean tap, so it is
safe to run any time. Reach for it when Homebrew deprecates more of the cask DSL:
add the rule to `bin/atticlib.py` and sweep.

## Attribution

Cask definitions are derived from [Homebrew Cask](https://github.com/Homebrew/homebrew-cask)
and remain under its BSD-2-Clause license (see `LICENSE.md`). Only the disabling
stanza is removed.
