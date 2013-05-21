.PHONY: stats

split-intransitivity-arawak.pdf: main.tex title.tex bib/references.bib bib/lsalike.bst chapter1/chapter.tex chapter2/chapter.tex chapter3/chapter.tex
	sed -i 's/S\\o ren/S{\\o}ren/g' bib/references.bib # fix Mendeley Bibtex output
	latexmk -xelatex main.tex
	latexmk -c
	mv main.pdf split-intransitivity-arawak.pdf

chapter%/chapter.tex: chapter%/chapter.mmd
	multimarkdown -t latex -b $<

stats:
	@echo `pdfinfo split-intransitivity-arawak.pdf | grep Pages`
	@echo `pdftotext split-intransitivity-arawak.pdf - | wc -l` lines
	@echo `pdftotext split-intransitivity-arawak.pdf - | wc -w` words
	@echo `pdftotext split-intransitivity-arawak.pdf - | wc -m` characters
