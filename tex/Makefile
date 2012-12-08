TEXFILE=report

all: $(TEXFILE).tex
	rubber -d $^

view: $(TEXFILE).pdf
	okular $^ &

clean:
	rm -fv *.aux *.log *.toc *.blg *.bbl *.synctex.gz
	rm -fv *.out *.bcf *blx.bib *.run.xml
	rubber --clean $(TEXFILE)
	rm -fv $(TEXFILE).pdf

.PHONY: view all clean
