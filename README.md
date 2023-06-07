# linux-env
Basic config files, scripts and aliases that would make it easier to work with the command line

## Usage

### findandvi
Use this to quickly open a file in vi even if you are not sure of the path.

``` bash
findandvi [path] part_of_the_file_name
```
If `path` is omitted, it defaults to the current directory. Here is a simple command that opens the file matching `"*test.c*"` somewhere under the current directory
``` bash
findandvi test.c
```
This uses `find . -iname "*test.c*"` to find the file to edit. This can take a while if there are too many files under the current directory. You can use the optional `path` argument to improve this. Following example looks for test.c within a specific directory under the current directory
``` bash
findandvi packages/multimedia test.c
```
If there are multiple files matching the search keyword, it will list all the files and let you select the desired file.
``` bash
$ findandvi flutter/dev/docs yaml
Multiple files found: 3
1:   flutter/dev/docs/platform_integration/pubspec.yaml
2:   flutter/dev/docs/analysis_options.yaml
3:   flutter/dev/docs/dartdoc_options.yaml
Enter your choice (or an invalid input to cancel): 
```
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

