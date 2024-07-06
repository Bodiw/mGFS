mkdir -p src out lib/include
mv miniGFS.2024/* src
rmdir miniGFS.2024
mv src/master_node/util src
find src -maxdepth 2 -type l -delete
rm src/ejemplos_sockets/common_cln.h src/ejemplos_sockets/common_srv.h
find src -maxdepth 2 -iname "*.h" -exec ln -s ../../{} lib/include/ \;
