mkdir 'United States'

#for doc in $(cat stats_in_columns.csv); do
while read doc; do
	category=$(awk '{print $8, $5}' <<< "$doc" | grep 'United_States' | awk '{print $2}')
	if [ -n "$category" ]; then
		echo "Adding $category"
		echo "$doc" >> "United States/$category.txt"
	fi
done < stats_in_columns.csv
#done

# print number of entries
wc -l "United States/Music.txt" >> ws5.txt
wc -l "United States/Entertainment.txt" >> ws5.txt
wc -l "United States/Gaming.txt" >> ws5.txt
wc -l "United States/Comedy.txt" >> ws5.txt

