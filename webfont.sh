#!/usr/bin/env bash

# Put it in /usr/local/bin/
for f in *.otf *.ttf ; do
	FILE=$(basename "$f")
	if [ "$FILE" != "." ] && [ "$FILE" != ".." ] && [ "$FILE" != "*.otf" ] && [ "$FILE" != "*.ttf" ]
	then
		echo "Converting $FILE"
		echo "=> woff"
		sfnt2woff-zopfli $FILE >/dev/null
		echo "=> woff2"
		woff2_compress $FILE >/dev/null
		echo "=> eot"
		#sfnttool -ex $FILE >/dev/null
	fi
done
echo ""
echo "All done."
