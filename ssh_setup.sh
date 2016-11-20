readonly SSH_DIR=${HOME}/.ssh
readonly SSH_KEY=${SSH_DIR}/imac
readonly EMAIL=elliot.charney@ithaka.org

generate_ssh_config() {
    cat <<CONFIG
Host *
    IdentitiesOnly yes
Host github.com
    User git
    IdentityFile $SSH_KEY
Host github-shared-libs
    User git
    Hostname github.com
    IdentityFile $SSH_KEY
    StrictHostKeyChecking no
CONFIG
}

configure_ssh() {
    mkdir -p $SSH_DIR

    if [ ! -f $SSH_KEY ]; then
        ssh-keygen -t rsa -b 4096 -C \"$EMAIL\" -f $SSH_KEY
        chmod 400 $SSH_KEY
    fi

    if [ -z "$SSH_AUTH_SOCK" ] ; then
        eval "$(ssh-agent -s)"
    fi
    ssh-add ${SSH_KEY}
    pbcopy < ${SSH_KEY}.pub

    echo Your public SSH key has been copied to your clipboard for you.
    echo Go to https://github.com/settings/keys to add it to your GitHub account.

    generate_ssh_config >> $SSH_DIR/config
}

configure_ssh
