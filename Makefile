tutorials_for_writing_python_app.pdf: tutorials_for_writing_python_app.md
	pandoc tutorials_for_writing_python_app.md -o tutorials_for_writing_python_app.pdf --include-in-header=header.tex --toc -V geometry:margin=2.5cm

tutorials_core_concepts.pdf: tutorials_core_concepts.md
	pandoc tutorials_core_concepts.md -o tutorials_core_concepts.pdf --include-in-header=header.tex --toc -V geometry:margin=2.5cm

all: tutorials_for_writing_python_app.pdf tutorials_core_concepts.pdf
	echo the document was updated
