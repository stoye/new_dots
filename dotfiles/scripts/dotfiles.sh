# clone and setup dotfiles
git clone --bare git@github.com:stoye/dotfiles $HOME/.my_dotfiles

function dotfiles {
    /usr/bin/git --git-dir=$HOME/.my_dotfiles/ --work-tree=$HOME $@
}

# try to checkout
mkdir -p .config-backup
dotfiles checkout

# handle clone conflicts
if [ $? = 0 ]; then
    echo "Checked out config.";
else
    echo "Backing up pre-existing conflicting files.";
    dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;

# checkout again
dotfiles checkout

# don't show untracked files here
dotfiles config status.showUntrackedFiles no
