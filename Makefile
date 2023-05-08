all:
	latexmk -pdf dissertation
clean:
	latexmk -C dissertation
