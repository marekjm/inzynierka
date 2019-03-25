for %%f in (fig/*.dot) do (
    echo %%~nf
    dot -Tpng "fig/%%~nf.dot" > "fig/%%~nf.png"
)