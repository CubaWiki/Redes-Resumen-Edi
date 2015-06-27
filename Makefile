all:
	pandoc unidad1.md -o unidad1.pdf
	pandoc unidad2.md -o unidad2.pdf
	pandoc unidad3.md -o unidad3.pdf
	pandoc unidad4.md -o unidad4.pdf
	pandoc unidad5.md -o unidad5.pdf
	pandoc unidad6.md -o unidad6.pdf
	pandoc unidad7-8.md -o unidad7-8.pdf
	pandoc unidad9.md -o unidad9.pdf

clean:
	rm -rf unidad*.pdf *.toc *.aux *.log *.mtc *.mtc0 *.maf
