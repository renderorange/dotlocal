export EDITOR='vim'
export VISUAL='vim'

export PATH=~/git/dotlocal/bin:~/bin:$PATH

if [[ -d ~/perl5/lib/perl5/ ]]; then
    eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
fi

. ~/git/dotlocal/.bash/aliases
. ~/git/dotlocal/.bash/shell
