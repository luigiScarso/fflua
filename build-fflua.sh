#DIR=/opt/fontforge
DIR=/opt/fontforge
rm -vf fflua_wrap.c
swig -lua fflua.i 
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
perl -i -n -e '$k=chr(0x27); if(/(\(long\))? \(\(\(/){ s/\(([a-zA-Z() ])\)/($k$1$k)/g; print   } else{print};'  fflua_wrap.c
gcc -fPIC -I. -c fflua_wrap.c -I$DIR/include  -I$DIR/include/fontforge -I/usr/include/lua5.1 -o fflua_wrap.o
rm -vf fflua.so
gcc -Wall -shared -I. -I$DIR/include -L. -L$DIR/lib -Wl,-rpath=$DIR -I/usr/include/lua5.1 fflua_wrap.o   -lfontforge -lgunicode -lgutils -o fflua.so
strip --strip-unneeded fflua.so
lua -e 'require("fflua")'





