#Spectral.vim

A better way to create colorschemes in Neovim.

## Description

Spectral is an easy way to create beautiful Vim colorschemes. The user only
needs to focus on building a colorscheme using true colors and Spectral will do
the rest!

Spectral will

  * Provide powerful utilities to operate on colors to mix and match them
    relative to each other.
  * Generate the cterm colors using the Python colormath library so your
    colorscheme will look just as great on a 256-color terminal!
  * Generate the highlights for the complimentary background setting by flipping
    the brightness using the Python colormath library, so your colorscheme will
    look great as both a light and dark colorscheme! (Manual overrides totally
    possible, too!)
  * Compile the colorscheme to make it blazing fast on reloads. (It is slow on
    first time loads, I'll grant)

## Dependencies

This requires the colormath Python library. Install it with Pip!

    $ pip install colormath

## Included Colorschemes

A list of colorschemes included in Spectral:

  * meltdown
  * cooldown
  * poison
  * royal

## Caveats

Spectral is only really tested using Neovim. There's no reason it shouldn't work
on Vim, but I use Neovim.
