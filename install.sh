red='\e[0;31m'
NC='\e[0m' # No Color

set -e  # Enables checking of all commands

echo This bash script will download and install the dotfiles from
echo http://github.com/stephenyu/dotfiles.
echo
echo The dotfiles will be installed in "$(pwd)"/dotfiles-master

echo
echo Downloading and installing...
wget -q https://github.com/stephenyu/dotfiles/archive/master.zip
unzip -q master.zip && rm master.zip

cd 'dotfiles-master'

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

echo
echo -e "${red}Everything successfully installed.${NC}"
