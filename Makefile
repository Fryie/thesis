split-intransitivity-arawak.pdf: main.tex title.tex
	latexmk -xelatex main.tex
	latexmk -c
	mv main.pdf split-intransitivity-arawak.pdf
