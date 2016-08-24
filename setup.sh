#!/usr/bin/env bash
echo "Setting up dotfiles and cheat sheets in: $HOME"

declare -r canonicaldir=$(dirname $(readlink -f $0))
declare -r backup_dir="$HOME/old_dotfiles"
declare -r relpath=$(realpath --relative-to=$HOME $canonicaldir)

pushd `dirname $0` > /dev/null

declare -r dotfiles=`rsync --exclude .git/ \
	--exclude README.md \
	--exclude desired_commands \
	--exclude setup2.sh \
	--exclude setup.sh \
	-nPa . $HOME | sed 1d`

while read file; do
	absfile="$HOME/$file"
	absfiledir="$(dirname $absfile)"
	if [[ -f $absfile && ! -L $absfile ]]; then
		echo "Backing up ~/$file to $backup_dir"
		mkdir -p $(dirname "$backup_dir/$file") && mv $absfile $backup_dir
	elif [ -L $absfile ]; then
		if [ "$(readlink -f $absfile)" != "$(readlink -f $file)" ]; then
			echo "Moving old symlink for posterity"
			mkdir -p $(dirname "$backup_dir/$file") && mv $absfile $backup_dir
		fi
	fi
	mkdir -p $(dirname "$HOME/$file") && ln -sv "$(realpath --relative-to=$absfiledir $canonicaldir)/$file" "$HOME/$file"
done <<< "$dotfiles"

popd > /dev/null

