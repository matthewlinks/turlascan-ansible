# make a couple dirs so that we can have a positive and negative example for scanning
# the positive one is where the yara scanner file for turla will get dropped
mkdir -p /root/yara-turla/positive
mkdir /root/yara-turla/negative

# move into it
cd /root/yara-turla

# pull the source
curl -L https://github.com/plusvic/yara/archive/v3.1.0.tar.gz > v3.1.0.tar.gz

# unpack it 
tar -zxvf v3.1.0.tar.gz

# move into the build directory 
cd yara-3.1.0

# bootstrap yara
./bootstrap.sh

# configure the package
./configure --enable-magic

# make the package
make
