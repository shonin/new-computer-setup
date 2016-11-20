if [ -f ~/.bash_profile ];
then
    echo "Found .bash_profile, I will append to it"
else
    echo "No .bash_profile found, creating it"
    touch ~/.bash_profile
fi

cat <<"PRETTY" >> ~/.bash_profile

parse_git_branch() {

    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}

green="\[\033[0;32m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
reset="\[\033[0m\]"

export PS1="e$green\$(parse_git_branch)$purple \W $green$ $reset"

PRETTY
