all: \
	book.pdf

.PHONY: watch

%.pdf: %.tex
	pdflatex $^

%.png: %.dot
	dot -Tpng $^ > $@

book.pdf: \
	fig/viuact-pipeline.png \
	fig/viuact-ogolny-schemat-kompilatora.png \
	fig/basic-compiler-flow.png

# Sprytyny target, który najpierw zmieni timestamp szablonu, a
# potem wywoła Make żeby ponownie zbudować PDF.
# To jest przydatne jeśli TeX mówi, że nie umiał znaleźć referencji i
# żeby wywołać go jeszcze raz.
# Wystarczy tylko zrobić 'make again' i hula.
again:
	find . -name '*.tex' | xargs -n 1 touch
	make

watch:
	find . -name '*.tex' | entr -pc make again

clean:
	find . -name '*.pdf' | xargs -n 1 --no-run-if-empty rm
	find . -name '*.dvi' | xargs -n 1 --no-run-if-empty rm
	find . -name '*.log' | xargs -n 1 --no-run-if-empty rm
	find . -name '*.lof' | xargs -n 1 --no-run-if-empty rm
	find . -name '*.aux' | xargs -n 1 --no-run-if-empty rm
	find . -name '*.toc' | xargs -n 1 --no-run-if-empty rm
	find . -name '*.out' | xargs -n 1 --no-run-if-empty rm
	find . -name '*.synctex.gz' | xargs -n 1 --no-run-if-empty rm
