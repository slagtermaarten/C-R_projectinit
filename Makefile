mainprg=main
texdir=./tex
flags=-O2 -Wall
post=-lgsl -lgslcblas -lm
rfiles := $(wildcard *.R)
out_files := $(rfiles:.R=.Rout)
pdffigs := $(wildcard $(figdir)/*.pdf)
crop_files:= $(pdffigs:.pdf=.pdfcrop)

all: o_$(mainprg) dataloaded.Rout mktex 

mktex: runscripts
	$(MAKE) -C $(texdir)

runscripts: $(out_files) $(crop_files)

dataloaded.Rout: runAnalyses.R
	R CMD BATCH $<
	touch $@

o_%: %.c
	gcc $(flags) -o $@ $^ $(post)
	# ./$@ 100 1 .9 1 1 2 1
	./$@

%.Rout: %.R
	R CMD BATCH $<
	touch $@

$(figdir)/%.pdfcrop: $(figdir)/%.pdf
	pdfcrop $< $< 
	touch $@

clean:
	rm -fv $(out_files) 
	rm -fv $(crop_files)
	rm o*

.PHONY: all clean mktex runscripts
