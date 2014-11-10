# Set variables
set -e
TL_VERSION=2014
NAME=yanone-kaffeesatz

# Check if package is available
if [ ! -e $NAME.tar.gz ]
then
    echo ERROR: Please create package $NAME.tar.gz
    exit 1
fi

# Extract package archive
if [ -e $NAME ]
then
    rm -rf $NAME
fi
tar xf $NAME.tar.gz

# Install files in current TeX Live installation
cd $NAME
if [ ! -d /usr/local/texlive/$TL_VERSION/texmf-dist/fonts/opentype/public/$NAME ]
then
    sudo mkdir /usr/local/texlive/$TL_VERSION/texmf-dist/fonts/opentype/public/$NAME
fi
sudo /bin/cp -f *.otf /usr/local/texlive/$TL_VERSION/texmf-dist/fonts/opentype/public/$NAME
sudo /usr/local/texlive/$TL_VERSION/bin/x86_64-linux/texhash
cd ..

# Remove package directory
rm -rf $NAME
