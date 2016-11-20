setup_user() {
  git config --global user.name "Elliot Charney"
  git config --global user.email elliot.charney@ithaka.org
}

create_aliases() {
  git config --global alias.s status
  git config --global alias.co checkout
  git config --global alias.cm 'commit -m'
  git config --global alias.cam 'commit -am'
}

setup_user
create_aliases
