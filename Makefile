all: viuavm-dzw.pdf

.PHONY: watch

%.pdf: %.tex
	pdflatex $^

# Sprytyny target, który najpierw zmieni timestamp szablonu, a
# potem wywoła Make żeby ponownie zbudować PDF.
# To jest przydatne jeśli TeX mówi, że nie umiał znaleźć referencji i
# żeby wywołać go jeszcze raz.
# Wystarczy tylko zrobić 'make again' i hula.
again:
	touch *.tex
	make

watch:
	ls -1 *.tex | entr -pc make again

clean:
	rm *.pdf || true
	rm *.dvi || true
	rm *.log || true
	rm *.aux || true
	rm *.toc || true
	rm *.out || true
