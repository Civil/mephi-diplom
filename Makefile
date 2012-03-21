DIPLOM_FILE=diplom.tex
PRESENTATIN_FILE=presentation.tex

.PHONY: all

diplom:
	pdflatex $(DIPLOM_FILE)
	pdflatex $(DIPLOM_FILE)
	pdflatex $(PRESENTATION_FILE)
	pdflatex $(PRESENTATION_FILE)

all: diplom

dist-clean: clean
	rm *~ $(DIPLOM_FILE:.tex=.pdf) $(PRESENTATION_FILE:.tex=.pdf)

clean:
	rm -rf $(DIPLOM_FILE:.tex=.toc) $(DIPLOM_FILE:.tex=.log) $(DIPLOM_FILE:.tex=.aux) $(DIPLOM_FILE:.tex=.lof) $(DIPLOM_FILE:.tex=.lot) $(DIPLOM_FILE:.tex=.out)
