rights.csv: rights.xslx
	j -l $< | while read sheet; do \
		j -s "$$sheet" $< >> $@; \
	done
	sed -i '2,$${ /^ObjectID/d }; /^$$/d' $@

addToES: rights.csv
	file=bulk.json; \
	[ -e $$file ] || tail -n+3 $< | csvcut -c1,2 | while read line; do \
		id=$$(cut -d',' -f1 <<<$$line); \
		rights=$$(cut -d',' -f2 <<<$$line); \
		echo "{ \"update\" : { \"_index\" : \"$(index)\", \"_type\" : \"object_data\", \"_id\" : \"$$id\" } }" >> $$file; \
		echo "{ \"doc\": { \"image_rights_type\": \"$$rights\" } }" >> $$file; \
	done; \
	split -l 1000 bulk.json
	ls x* | while read file; do \
		curl -XPUT "$(ES_URL)/_bulk" --data-binary @$$file; \
		sleep 3; \
	done
	rm x*
  
