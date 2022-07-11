
### This is the shell script to generate the final CSVs to be processed by the ML program. The CSVs are created in a folder finalcsvoutputs in csvmaker folder
echo "Getting Info of the crops......"
echo ""
while read line;
do
	cd /home/ayan/final_year_project/XMLParser
	crop=`echo $line | cut -d " " -f 1`
	weight=`echo $line | cut -d " " -f 2`
	echo "Crop - $crop , Weight - $weight"
	echo "Generating Datasets for $crop...."
	python3 price_extractor_from_xml.py $crop $weight
	cd /home/ayan/final_year_project/csvmaker
	python3 finalcsvmaker.py $crop
	echo "Generation Successful...."
	echo ""

done < crop_info.txt
echo "Starting the webserver..."
cd ../WebSite
export FLASK_APP=app
flask run

