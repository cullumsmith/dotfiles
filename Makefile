HOME_PACKAGES = readline sh vi vim
XDG_PACKAGES  = tmux git
STOW_ARGS  = --verbose --no-folding

.PHONY: dry-run
dry-run:
	stow --no --restow ${STOW_ARGS} --target ${HOME}            ${HOME_PACKAGES}
	stow --no --restow ${STOW_ARGS} --target ${XDG_CONFIG_HOME} ${XDG_PACKAGES}

.PHONY: install
install:
	stow --restow ${STOW_ARGS} --target ${HOME}            ${HOME_PACKAGES}
	stow --restow ${STOW_ARGS} --target ${XDG_CONFIG_HOME} ${XDG_PACKAGES}

.PHONY: uninstall
uninstall:
	stow --delete ${STOW_ARGS} --target ${HOME}            ${HOME_PACKAGES}
	stow --delete ${STOW_ARGS} --target ${XDG_CONFIG_HOME} ${XDG_PACKAGES}
