# Set variables
set -e
NAME=yanone-kaffeesatz
ARCHIVE=YanoneKaffeesatz.zip
DOC=YanoneKaffeesatz.pdf
BASE=http://www.yanone.de/typedesign/kaffeesatz
FONTS=$BASE/$ARCHIVE
SAMPLES=$BASE/$DOC

# Create new download and package directories
if [ -e download ]
then
    rm -rf download
fi
mkdir download
if [ -e $NAME ]
then
    rm -rf $NAME
fi
mkdir $NAME

# Download archive in download and copy essential files to package directory
cd download
if [ ! -e $ARCHIVE ]
then
	wget $FONTS
fi
unzip $ARCHIVE
cp *.otf ../$NAME
wget $SAMPLES
cp $DOC ../$NAME/$NAME.pdf
cd ..
cp README.md $NAME/README

# Create archive for uploading to CTAN
rm -f $NAME.tar.gz $NAME.tar
tar cf $NAME.tar $NAME
gzip $NAME.tar

# Remove download and package directory
rm -rf download $NAME
