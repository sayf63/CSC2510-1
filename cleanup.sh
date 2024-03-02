#!/bin/bash



for dir in images unknown data pdfs documents executables
do
	if [ -d $dir ];
	then
		echo "$dir already exists"
	else
		echo "$dir does not exist, making file"
		mkdir "$dir"
	fi
done
cd my_directory

totalbytes=0
totalfilesmoved=0
bytesmovedimages=0
bytesmoveddocuments=0
bytesmovedunknown=0
bytesmoveddata=0
bytesmovedpdfs=0
bytesmovedexecutables=0
filesmovedimages=0
filesmoveddocuments=0
filesmovedunknown=0
filesmoveddata=0
filesmovedpdfs=0
filesmovedexecutables=0

for file in *;
do
Extension=${file##*.}
	case "$Extension" in
	 jpg | jpeg | png | gif)
	((filesmovedimages++))
	byteconverter1=$( wc -c < $file )
	let "bytesmovedimages = $bytesmovedimages + $byteconverter1"
	mv $file ../images;;
	 txt | docx | doc | pages | KEY | pptx | PPT | odt | md)
	((filesmoveddocuments++))
	byteconverter2=$( wc -c < $file )
	let "bytesmoveddocuments = $bytesmoveddocuments + $byteconverter2"
	mv $file ../documents;;
	pdf)
	((filesmovedpdfs++))
	byteconverter3=$( wc -c < $file)
        let "bytesmovedpdfs = $bytesmovedpdfs + $byteconverter3"
        mv $file ../pdfs;;
        sh | exe)
        ((filesmovedexecutables++))
        byteconverter4=$( wc -c < $file)
        let "bytesmovedexecutables = $bytesmovedexecutables + $byteconverter4"
        mv $file ../executables;;
        csv | xlsx | json)
        ((filesmoveddata++))
        byteconverter5=$( wc -c < $file)
        let "bytesmoveddata = $bytesmoveddata + $byteconverter5"
        mv $file ../data;;
        zip)
        ((filesmovedunknown++))
        byteconverter6=$( wc -c < $file)
        let "bytesmovedunknown = $bytesmovedunknown + $byteconverter6"
        mv $file ../unknown;;
	esac
done
let "totalbytes = $bytesmovedimages + $bytesmoveddocuuments + $bytesmovedpdfs + $bytesmovedexecutables + $bytesmoveddata + $bytesmovedunknown"
let "totalfilesmoved = $filesmovedimages + $filesmoveddocuments + $filesmovedexecutables + $filesmovedpdfs + $filesmoveddata + $filesmovedunknown"
echo "total files moved: $totalfilesmoved"
echo "total size of files moved: $totalbytes"
echo "Average size of files: $((totalbytes/totalfilesmoved))"
echo "** DOCUMENTS **"
echo "Total files moved: $filesmoveddocuments"
echo "Total bytes moved: $bytesmoveddocuments"
echo "Average file size: $((bytesmoveddocuments/filesmoveddocuments))"
echo "** IMAGES **"
echo "Total files moved: $filesmovedimages"
echo "Total bytes moved: $bytesmovedimages"
echo "Average file size: $((bytesmovedimages/filesmovedimages))"
echo "** PDFS **"
echo "Total files moved: $filesmovedpdfs"
echo "Total bytes moved: $bytesmovedpdfs"
echo "Average file size: $((bytesmovedpdfs/filesmovedpdfs))"
echo "** DATA **"
echo "Total files moved: $filesmoveddata"
echo "Total bytes moved: $bytesmoveddata"
echo "Average file size: $((bytesmoveddata/filesmoveddata))"
echo "** EXECUTABLES **"
echo "Total files moved: $filesmovedexecutables"
echo "Total bytes moved: $bytesmovedexecutables"
echo "Average file size: $((bytesmovedexecutables/filesmovedexecutables))"
echo "** UNKNOWN **"
echo "Total files moved: $filesmovedunknown"
echo "Total bytes moved: $bytesmovedunknown"
echo "Average file size: $((bytesmovedunknown/filesmovedunknown))"
