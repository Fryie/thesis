.PHONY: chapters

split-intransitivity-arawak.pdf: main.tex title.tex bib/references.bib chapters
	latexmk -xelatex main.tex
	latexmk -c
	mv main.pdf split-intransitivity-arawak.pdf

chapters: chapter1/chapter.tex

chapter%/chapter.tex: chapter%/chapter.md
	multimarkdown -t latex -b $<
