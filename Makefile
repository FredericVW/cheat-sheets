# Generate PDFs from the Markdown source files
#
# In order to use this makefile, you need some tools:
# - GNU make
# - Pandoc
# - LuaLaTeX
# - DejaVu Sans fonts

# All markdown files, except README.md are considered sources
sources := $(subst README.md,,$(wildcard *.md))

# Target file type is PDF
objects := $(patsubst %.md,%.pdf,$(sources))

all: $(objects)

%.pdf: %.md
	pandoc --variable mainfont="DejaVu Sans" \
		--variable monofont="DejaVu Sans Mono" \
		--variable fontsize=11pt \
		--variable geometry:margin=1.5cm \
		-f markdown \
		$< \
		--latex-engine=lualatex \
		-o $@

clean:
	rm -f *.pdf