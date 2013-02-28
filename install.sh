set -e  # Enables checking of all commands

echo This bash script will download and install the dotfiles from
echo http://github.com/stephenyu/dotfiles.
echo If you want to update, please run this script from the dotfiles directory
echo
echo The dotfiles will be installed in "$(pwd)"/dotfiles
read -p "Is that okay? [Yn] " confirm

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
