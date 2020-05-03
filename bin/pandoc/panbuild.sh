#!/bin/bash
#
name=`echo $1 | cut -f1 -d'.'`
style=zenburn
engine=xelatex
template="$HOME/.dotfiles/bin/pandoc/default-md.tex"
#
pandoc -H "$HOME/.dotfiles/bin/pandoc/pandoc-md.tex" \
	  "$HOME/.dotfiles/bin/pandoc/pandoc-md.yaml" -o $name.$2  $1.md	\
	--pdf-engine="$engine" 		\
	--highlight-style="$style" 		\
	--template="$template"			\
	--listings						\
	--variable subparagraph			\
