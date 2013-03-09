green='\e[0;32m'
red='\e[0;31m'
NC='\e[0m' # No Color

set -e  # Enables checking of all commands

# Install Via Git
install(){
  checkGitDependencies

  echo
  echo 'Cloning Git Repository...'

  git clone --quiet -b vundle https://github.com/stephenyu/dotfiles.git
}

checkGitDependencies(){
  type git &> /dev/null || echo -e "${red}Git is a required dependency.${NC}"
}

echo This bash script will download and install the dotfiles from
echo http://github.com/stephenyu/dotfiles.
echo
echo The dotfiles will be installed in "$(pwd)"/dotfiles

while true; do
    read -p "Do you wish to install this program? [yn]" yn
    case $yn in
        [Yy]* ) install; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer [y]es or [n]o.";;
    esac
done

cd dotfiles

# Build up a list of all the dotfiles (ignoring .git)
dotfiles=()
for f in $(find . -maxdepth 1 -name ".[^.]*" -exec basename {} \; | grep -v "^.git$"); do
  dotfiles+=("$f")
done

echo
echo Symlinking the following dotfiles: $dotfiles
echo Existing files will be backed up with the .old extension

for f in "${dotfiles[@]}"; do
  # Back it up if it already exists
  if [[ -f ~/$f ]]; then
    cp -f ~/$f ~/$f.old
  elif [[ -d ~/$f ]]; then
    cp -rf ~/$f ~/$f.old
  fi
  # And symlink it to the relative directory!
  abs_path=$(readlink -f $f)
  rel_path="${abs_path#$HOME/}"
  ln -sf $rel_path ~/$f
done

# Install 
echo
echo -e "Installing Vim Plugins"
git clone --quiet https://github.com/gmarik/vundle.git .vim/bundle/vundle
vim +BundleInstall +qall < /dev/tty # necessary to avoid vim: Input not from terminal warning

echo
echo -e "${green}Everything successfully installed.${NC}"
