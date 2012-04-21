VIMRC=$(HOME)/.vimrc
BASHRC=$(HOME)/.bashrc

#install: install_vim

get: get_vimrc get_bashrc

#install_vim:
#	install -m 0644 _vimrc $(HOME)/.vimrc
#
#install_bash:
#	install -m 0644 _bashrc $(HOME)/.bashrc

get_vimrc:
	cp $(VIMRC) _vimrc
	cp -r $(HOME)/.vim _vim

get_bashrc:
	cp $(HOME)/.bashrc _bashrc
	cp $(HOME)/.bash_aliases _bash_aliases
	cp $(HOME)/.bash_profile _bash_profile
