# dotlocal

local environment setup for servers

## DESCRIPTION

`dotlocal` creates a persistent development environment on servers.

## SETUP

    $ ln -s ~/git/dotlocal/.bash_profile ~/.bash_profile
    $ ln -s ~/git/dotlocal/.screenrc ~/.screenrc

### files, settings, and scripts added with this project

The following files, settings, and scripts are added by default.

#### EDITOR and VISUAL

The `EDITOR` and `VISUAL` env variables are set to `vim`.

#### bash PS1 changes

The PS1 prompt is modified to the following, including a git branch status indicator listed below:

    user@host ~ (master) $ 

If within a screen session, the prompt will indicate that as well:

    user@host ~ (master) [screen] $ 

`LS_COLORS` is set to provide extended ANSI color support.

#### git scripts

##### bin/git-completion.bash and bin/git-prompt.sh

These scripts add git tab completion and a git status indicator to the modified PS1.  These scripts come from the git public source.

    user@host ~/git/repo (branch-name *) $ git status
    Changes not staged for commit:
    (use "git add <file>..." to update what will be committed)
    (use "git restore <file>..." to discard changes in working directory)
        modified:   t/unit/lib-Local-Package/get_packages.t
    user@host ~/git/repo (branch-name *) $ git add t/unit/lib-Local-Package/get_packages.t
    user@host ~/git/repo (branch-name +) $ git status
    Changes to be committed:
    (use "git restore --staged <file>..." to unstage)
        modified:   t/unit/lib-Local-Package/get_packages.t

##### bin/git-retrunk

This script is a wrapper for `git rebase --onto` which can be used to update a branch with an updated commit history from where it was branched from.  `git-retrunk` reorders commits correctly to retain an accurate chronology (as opposed to the date of the commits).

For example, if a branch was created from master which has since been updated, after you pull in an updated master, `git-retrunk` will replay the branch's commits on top of the updated master as if it were freshly branched from master.

    ~/git/repo (branch-name) $ git-retrunk master
    First, rewinding head to replay your work on top of it...
    Applying: commit-1
    Applying: commit-2
    Applying: commit-3
    Applying: commit-4

This script is added to PATH.

##### bin/git-which-branch

This script can be used to find which branch a branch was branched from.  It additionally shows how many commits are present in the branch it came from, or if the branch is fully merged.

    user@host ~/git/repo (branch-name) $ git-which-branch
    HEAD branched from origin/master at fb7c03b -- 4 unmerged commits

    user@host ~/git/repo (branch-name) $ git-which-branch
    HEAD is fully merged into origin/master

This script is added to PATH.

##### bin/run-tests

This script is a wrapper for prove to additionally log to a file, silence output to the shell, and run tests in logical blocks by directory, rather than all one harness run.

    user@host ~/git/commonlib (master) $ run-tests --help
    Usage: run-tests [-d <dirpath>] [-o <filepath>] [-q] [-h]
    
    Options:
        -d, --directory <dirpath>    directory containing the tests
        -o, --output <filepath>      write output into a file
        -q, --quiet                  silence output
        -h, --help                   display this dialogue

    user@host ~/git/repo (master) [screen] $ run-tests -d t/unit -o ~/tmp/repo-tests.$(date +%s).txt -q
    user@host ~ (master) $ tail -f tmp/repo-tests.1671753904.txt

This script is added to PATH.

### additional files and settings

This project contains additional files and settings not installed by default.

#### vim settings and colors

Vim color schemes `default-light.vim` and `dim.vim` are added.  `dim.vim` is enabled.

Insert mode is enabled.

Run the following to enable these changes:

    $ ln -s ~/git/dotlocal/.vim ~/.vim
    $ ln -s ~/git/dotlocal/.vimrc ~/.vimrc

#### global gitignore and gitconfig

    $ mkdir -p ~/.config/git
    $ ln -s ~/git/dotlocal/.gitignore ~/.config/git/ignore
    $ ln -s ~/git/dotlocal/.gitconfig ~/.config/git/config

#### perltidy

    $ ln -s ~/git/dotlocal/.perltidyrc ~/.perltidyrc
