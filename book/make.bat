for %%f in (fig/*.dot) do (
    echo %%~nf
    dot -Tpng "fig/%%~nf.dot" > "fig/%%~nf.png"
)
pdflatex -synctex=1 -interaction=nonstopmode book.tex
start acrord32 book.pdf
