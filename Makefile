PACKAGES  != find . -type d -depth 1 -not -name .git -exec basename {} \;
STOW_ARGS  = --verbose --no-folding --target ${HOME}

.PHONY: dry-run
dry-run:
	stow --no --restow ${STOW_ARGS} ${PACKAGES}

.PHONY: install
install:
	stow --restow ${STOW_ARGS} ${PACKAGES}

.PHONY: uninstall
uninstall:
	stow --delete ${STOW_ARGS} ${PACKAGES}
