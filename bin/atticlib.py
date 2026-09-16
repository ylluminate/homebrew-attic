"""Shared normalisation for cask text written by attic-sync and attic-recover.

Rescued casks come from two places, and both hand us stale DSL:

  * attic-sync copies from a current homebrew-cask checkout, so it generally
    tracks whatever upstream has already cleaned up;
  * attic-recover digs casks out of homebrew-cask *history*, where deprecated
    syntax lives forever.

Anything written into Casks/ goes through normalise() so the tap does not
accumulate DSL that makes Homebrew print a deprecation warning on every load.
"""
import re

# Cask::URL::DEPRECATED_URL_SPECS — accepted as a no-op, but Homebrew emits
# "Calling the `verified` parameter in the `url` stanza is deprecated!" every
# time such a cask is loaded. Dropping it changes nothing but the noise.
DEPRECATED_URL_SPECS = ("verified",)

_SPEC_RE = re.compile(r"^[ \t]*(?:" + "|".join(DEPRECATED_URL_SPECS) + r"):[ \t]")


def strip_deprecated_url_specs(text):
    """Drop deprecated `url` stanza parameters. Returns (new_text, removed_count).

    Removing the stanza's *final* parameter also has to drop the trailing comma
    from the line above it, or the `url` stanza is left dangling and the cask
    stops parsing. A parameter that still ends in a comma has siblings after it,
    so only its own line goes.
    """
    out, removed = [], 0
    for line in text.split("\n"):
        if _SPEC_RE.match(line):
            removed += 1
            if not line.rstrip().endswith(","):
                for j in range(len(out) - 1, -1, -1):
                    if out[j].strip():
                        out[j] = re.sub(r",[ \t]*$", "", out[j])
                        break
            continue
        out.append(line)
    return "\n".join(out), removed


def normalise(text):
    """Apply every cask-text normalisation. Returns (new_text, removed_count)."""
    return strip_deprecated_url_specs(text)
