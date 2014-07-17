tutorials_for_writing_python_app.pdf:
	pandoc tutorials_for_writing_python_app.md -o tutorials_for_writing_python_app.pdf --include-in-header=header.tex --toc

all: tutorials_for_writing_python_app.pdf
	echo the document was updated


