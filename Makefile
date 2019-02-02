all: viuavm-dzw.pdf viuavm-wpp.pdf viuact-specification.pdf viuact-sws.pdf viuact-ps.pdf

.PHONY: watch

%.pdf: %.tex
	pdflatex $^

%.png: %.dot
	dot -Tpng $^ > $@

viuact-ps.pdf: \
	fig/viuact-pipeline.png \
	fig/viuact-ogolny-schemat-kompilatora.png \
	fig/basic-compiler-flow.png

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
	rm *.synctex.gz || true
