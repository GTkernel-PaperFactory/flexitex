# James Choncholas generic tex Makefile with biliography
#
# Use the target `make help` for more information.

TEX = pdflatex
BIBTEX = bibtex
# Some styles (like gatechthesis) require biber instead of bibtex.
# BIBTEX = biber
PROJECT = paper
BIB_PROJECT = paper

VERBOSE	?= 0
ifeq ($(VERBOSE), 0)
	QUIET=@
else
	QUIET=
endif

.PHONY: all read clean help submodule deps

paper: clean $(PROJECT).pdf ## Build the tex into a PDF.

read: ## Read the generated PDF on MacOS or Ubuntu.
	$(QUIET)if [ -z "$(command -v xdg-open)" ]; then \
		xdg-open $(PROJECT).pdf & \
	elif [ -z "$(command -v open)" ]; then \
		open $(PROJECT).pdf & \
	fi;

clean: SHELL:=/bin/bash
clean: ## Clean up files
	-$(QUIET)rm -vf $(PROJECT).{ps,pdf,log,aux,out,dvi,bbl,blg}

$(PROJECT).pdf: $(PROJECT).tex $(PROJECT).bbl
	$(QUIET)$(TEX) $(PROJECT).tex
	$(QUIET)$(TEX) $(PROJECT).tex
	$(QUIET)$(TEX) $(PROJECT).tex
	$(QUIET)$(TEX) $(PROJECT).tex

$(PROJECT).bbl: $(PROJECT).aux $(BIB_PROJECT).bib #aux must be first
	$(QUIET)$(BIBTEX) $(PROJECT)

$(PROJECT).aux: $(PROJECT).tex
	$(QUIET)$(TEX) $(PROJECT).tex

deps: ## Install latex package dependencies. Requires sudo privileges.
	$(QUIET)if [ -z "$(command -v xdg-open)" ]; then \
		sudo apt install texlive-latex-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra \
    texlive-extra-utils texlive-science chktex git make latexmk ghostscript; \
	else \
		echo "Your OS is not supported"; \
	fi

help: SHELL:=/bin/bash
help: ## Show this help.
	@echo -e "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s :)"


