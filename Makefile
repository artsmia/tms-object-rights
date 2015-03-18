rights.csv: rights.xslx
	j -l $< | while read sheet; do \
		j -s "$$sheet" $< >> $@; \
	done
	sed -i '2,$${ /^ObjectID/d }; /^$$/d' $@
