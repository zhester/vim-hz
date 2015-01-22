Desolarized Color Scheme
========================

Useful for colorizing vim when used via 16-color terminals.  The actual
color values are configured in the terminal emulator.  This color scheme
selects reasonable colors that work to differentiate highlighter groups.

Non-standard Color Groups
-------------------------

Several non-standard color groups are referenced and linked through custom
syntax groups.  Those may be found under the `after/syntax` directory in
this plugin.

Display Colors
--------------

The actual "Desolarized" color scheme is a variation on Ethan Schoonover's
["Solarized"][1] color scheme.  This scheme desaturates the strong
background colors, and increases the contrast of a few other color pairings.
The intended values for each of the 16 colors in this theme are as follows.

| Val | Color   |
| --- | ------- |
| 0x0 | #08262A |
| 0x1 | #DC322F |
| 0x2 | #348C28 |
| 0x3 | #B58900 |
| 0x4 | #268BD2 |
| 0x5 | #D33682 |
| 0x6 | #2AA198 |
| 0x7 | #EEEEEE |
| 0x8 | #001620 |
| 0x9 | #CB4B16 |
| 0xA | #586E75 |
| 0xB | #143240 |
| 0xC | #839496 |
| 0xD | #6C71C4 |
| 0xE | #93A1A1 |
| 0xF | #FAFAFA |

The terminal emulator's background should be set to "bright black" (color
0x8).  The default foreground should be set to "white" (color 0x7).

Terminal Color Reference
------------------------

cterm options: bold, underline, reverse, italic, none
ANSI color names:

| mode   | black | red | green | yellow | blue | magenta | cyan | white |
| ------ | ----- | --- | ----- | ------ | ---- | ------- | ---- | ----- |
| normal |   0   |  1  |    2  |    3   |   4  |    5    |   6  |   7   |
| bright |   8   |  9  |   10  |   11   |  12  |   13    |  14  |  15   |

Vim Documentation
-----------------

See :help highlight-groups

Reminders to Self
-----------------

View the defined color settings for any highlight group:

    :set GROUPNAME

View the highlight group(s) for the text under the cursor (from .vimrc):

    SPACE y

[1]: http://ethanschoonover.com/solarized

