install:
	ln -sf ~/.dotfiles/ctags ~/.ctags
	ln -sf ~/.dotfiles/Xresources ~/.Xresources
	ln -sf ~/.dotfiles/muttrc ~/.muttrc
	ln -sf ~/.dotfiles/mutt/aliases ~/.mutt/aliases
	ln -sf ~/.dotfiles/mutt/query.pl ~/.mutt/query.pl
	ln -sf ~/.dotfiles/mutt/signature ~/.mutt/signature
	ln -sf ~/.dotfiles/awesome/rc.lua ~/.config/awesome/rc.lua
	ln -sf ~/.dotfiles/awesome/theme.lua ~/.config/awesome/theme.lua
	ln -sf ~/.dotfiles/bashrc ~/.bashrc
	ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
update:
	git pull
