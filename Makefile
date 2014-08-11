tutorials_for_writing_python_app.pdf: tutorials_for_writing_python_app.md
	pandoc tutorials_for_writing_python_app.md -o tutorials_for_writing_python_app.pdf --include-in-header=header.tex --toc -V geometry:margin=2.5cm

tutorials_core_concepts.pdf: tutorials_core_concepts.md
	pandoc tutorials_core_concepts.md -o tutorials_core_concepts.pdf --template=default.tex --toc -V geometry:margin=2.5cm

writing_gnu_radio_app_on_windows.pdf: writing_gnu_radio_app_on_windows.md
	pandoc writing_gnu_radio_app_on_windows.md -o writing_gnu_radio_app_on_windows.pdf --template=default.tex --toc -V geometry:margin=2.5cm

all: tutorials_for_writing_python_app.pdf tutorials_core_concepts.pdf writing_gnu_radio_app_on_windows.pdf
	echo the document was updated
