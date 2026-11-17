# linux-env
Basic config files, scripts and aliases that would make it easier to work with the command line

## Usage

### findandvi
Use this to quickly open a file in your editor (`$EDITOR`, default `vi`) even if you are not sure of the path.

``` bash
findandvi [-g] [-a] [-d dir] pattern
findandvi [-g] [-a] dir pattern
```
Options:

- `-d dir`: directory to search. Defaults to the current directory. The positional `dir` form is equivalent, but giving both is an error.
- `-g`: git-only. Searches tracked files (`git ls-files`). Outside a git repo it prints a warning and falls back to `find`.
- `-a`: in `find` mode, do not skip `.git`, `node_modules`, `build`, `dist`, `target`, `__pycache__` and `.venv`, which are skipped by default.

Matching is case-insensitive on the file name. Names containing spaces are handled. Here is a simple command that opens the file matching `"*test.c*"` somewhere under the current directory
``` bash
findandvi test.c
```
This can take a while if there are too many files under the current directory. Use `-d` (or the positional `dir`) or `-g` to narrow the search. Following example looks for test.c within a specific directory
``` bash
findandvi -d packages/multimedia test.c
findandvi packages/multimedia test.c
```
If there are multiple matches, you pick one with `fzf` if it is installed. Otherwise a built-in menu is shown. Use the up/down arrows or `j`/`k` to move, Enter to open and `q` or Esc to cancel.
``` bash
$ findandvi flutter/dev/docs yaml
3 matches in /home/me/flutter/dev/docs
> platform_integration/pubspec.yaml
  analysis_options.yaml
  dartdoc_options.yaml
[1/3] up/down, Enter=open, q=cancel
```
The script works with bash 3.2 (the macOS default).

### strreplace
``` bash
Recursively search and replace strings in files under `dir`

Usage:
    strreplace [OPTIONS] [dir] SEARCH_STRING REPLACEMENT

Options:
    -w      Match only whole words. Adds \b around the \`SEARCH_STRING\`
    -i      Interactive. Ask for confirmation before each replacement.
    -x      Exclude files matching the pattern (see grep --exclude)
    -X      Exclude directories matching the pattern (see grep --exclude-dir)
    -C      Disable colors (might be required in dark mode)
    -h      Show this help

```
### bashrc
- Adds some handy aliases and sets common variable like `EDITOR=vi`, `GREP_COLOR` etc.
- Sets `PS1` to just the current directory name
- `set -o vi`
- Adds `$HOME/bin` to the `PATH`

### gitconfig
- `git amend-head` : amends HEAD without changing the commit message
- `git lg[1-4]` : various git log shortcuts

### vimrc
- Enables hightlight search, incremental search, cursor line, 
- Custom values for shift width, tabstop etc.
- Maps F7 and F8 keys to next tab and previous tab
- Ctrl+N to open an empty tab
- F9 to open the current symbol in a new tab (requires ctags)


### replace-spaces-in-filename
If any file under the current directory has spaces in its name, this script will replace them with hyphens. Not sure how common this requirement is, but it was important enough at one time for me to save this script!

## Installation

### bashrc:
source this script from `~/.bashrc`

### gitconfig:
Add the following lines to ~/.gitconfig. Please note that $HOME does not work here.
``` conf
[include]
    path = ~/linux-env/gitconfig
```
### vimrc:
Include the customized vimrc from your ~/.vimrc with the following line

``` bash
source $HOME/linux-env/vimrc
```

