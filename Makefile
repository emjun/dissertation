all:
	latexmk -pdf dissertation
clean:
	latexmk -C dissertation
app: 
	latexmk -pdf tisane/figures/summ-eval-conceptual-model.tex
	latexmk -pdf tisane/figures/summ-eval-statistical-model.tex