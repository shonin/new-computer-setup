setup_user() {
  git config --global user.name "Elliot Charney"
  git config --global user.email elliotcharney@gmail.com
}

create_aliases() {
  git config --global alias.s status
  git config --global alias.co checkout
  git config --global alias.cm 'commit -m'
  git config --global alias.cam 'commit -am'
  git config --global alias.aa 'add -A'
}

create_better_defaults() {
  git config --global push.default current
}

setup_user
create_aliases
create_better_defaults
