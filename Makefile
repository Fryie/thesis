.PHONY: stats

split-intransitivity-arawak.pdf: main.tex title.tex bib/references.bib bib/lsalike.bst chapter1/chapter.tex chapter2/chapter.tex chapter3/chapter.tex
  # some Latex preprocessing
	# fix Mendeley Bibtex output
	sed -i 's/S\\o ren/S{\\o}ren/g' bib/references.bib
	# turn Sa, Sp, etc. into subscripted variant 
	sed -i -r 's/\<S(a|p|o|io)\>/S\\textsubscript{\1}/g' chapter*/chapter.tex
	# exclude citations from list of tables
	sed -i -r 's/(\\caption)(\{(.+) (~?\\citep\[.+\]\{.+\})\})/\1\[\3\]\2/g' chapter*/chapter.tex

  # compile
	latexmk -xelatex main.tex

	# rename
	mv main.pdf split-intransitivity-arawak.pdf

chapter%/chapter.tex: chapter%/chapter.mmd
	multimarkdown -t latex -b $<

clean:
	rm -f main.aux main.fdb_latexmk main.fls main.log main.lot main.out main.pdf main.toc chapter1/chapter.tex chapter2/chapter.tex chapter3/chapter.tex

stats: split-intransitivity-arawak.pdf
	@echo `pdfinfo split-intransitivity-arawak.pdf | grep Pages`
	@echo `pdftotext split-intransitivity-arawak.pdf - | wc -l` lines
	@echo `pdftotext split-intransitivity-arawak.pdf - | wc -w` words
	@echo `pdftotext split-intransitivity-arawak.pdf - | wc -m` characters

open: split-intransitivity-arawak.pdf
	acroread split-intransitivity-arawak.pdf
