#!/bin/sh

if [ -d diagrams_pdf ]; then
	rm -rf diagrams_pdf
fi

if [ ! -d diagrams_pdf ]; then
	cp -r diagrams_w_text_as_path diagrams_pdf

  for file in diagrams_pdf/*/*.svg
    do
      inkscape $file --export-pdf=$file
    done
  
  for file in diagrams_pdf/*/*.svg
    do
      mv "$file" "${file/svg/pdf}"
    done
fi
