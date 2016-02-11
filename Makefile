.PHONY: main.pdf all clean

AUTO_DIR := auto/data

all: main.pdf

define maketargetdir
		@echo $@
		mkdir -p $(dir $@) > /dev/null 2>&1
endef


main.pdf: main.tex $(AUTO_FILES)
		latexmk -pdf -f  -use-make $<

clean:
		latexmk -C
		rm -rf $(AUTO_DIR)
		rm -f *.fls
		rm -f *.log
		rm -f *.bbl

debug:
		@echo $(TABLE_TEX_FILES)
		@echo $(TABLE_DATA_FILES)
