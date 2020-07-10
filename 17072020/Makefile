TMP_TOC=TOC.md
TMP_RMD=tmp.Rmd
TMP_OUT=tmp.pdf

all:
	cp presentation.Rmd ${TMP_RMD}
	sed -i "/<!-- AUTO-INSERTED Part I -->/r presentation_I.Rmd" ${TMP_RMD}
	sed -i "/<!-- AUTO-INSERTED Part II -->/r presentation_II.Rmd" ${TMP_RMD}
	sed -i "/<!-- AUTO-INSERTED Part III -->/r presentation_III.Rmd" ${TMP_RMD}

	sed -i -r 's/<!-- AUTO-INSERTED Part I{1,3} -->//g' ${TMP_RMD}

# \ls -1r presentation*.Rmd | xargs cat > ${TMP_RMD}
	./TOC_gen.sh < ${TMP_RMD} > ${TMP_TOC}
	sed -i "/<!-- AUTO GENERATED TOC HERE -->/r ${TMP_TOC}" ${TMP_RMD}
	./rcompile.sh ${TMP_RMD}
	cp ${TMP_OUT} presentation.pdf
	# rm ${TMP_TOC} ${TMP_RMD} ${TMP_OUT}

pdf: all
	evince presentation.pdf

html: all
	firefox presentation.html

publish:
	git checkout gh_pages
	git reset --hard master
	make
	git add presentation.pdf
	git commit -m "Publishing presentation"
	git push -f
	git checkout master


poster:
	./poster_rcompile.sh poster.Rmd

clean:
	rm -f presentation.pdf
	rm -f ${TMP_TOC} ${TMP_RMD} ${TMP_OUT}

## Run background command
# \ls -1 presentation*.Rmd | entr -pc make
