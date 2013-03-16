all: proposal

proposal: proposal.tex proposal.bib
	pdflatex proposal.tex
	bibtex proposal.aux
	pdflatex proposal.tex
	pdflatex proposal.tex

clean:
	rm -f *.aux *.bbl *.blg *.log *.pdf
