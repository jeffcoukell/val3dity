# Options
CC=c++
IPATH=/usr/include/gdal
LPATH=/usr/local/lib

CFLAGS=-frounding-math -fno-strict-aliasing -O3 -DNDEBUG -I$(IPATH) -L$(LPATH)

LIBS=/usr/local/lib/libCGAL_Core.dylib /usr/local/lib/libCGAL.dylib /usr/local/lib/libmpfr.dylib /usr/local/lib/libgmp.dylib /usr/local/lib/libboost_thread.dylib

LDFLAGS=-frounding-math -fno-strict-aliasing -O3 -DNDEBUG -Wl,-search_paths_first -headerpad_max_install_names  -Wl,-dylib_file,/System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libGL.dylib:/System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libGL.dylib -L$(LPATH) $(LIBS)

all: main

input.o: input.cpp
	$(CC) $(CFLAGS) -c $^

validate.o: validate.cpp
	$(CC) $(CFLAGS) -c $^

validate_shell.o: validate_shell.cpp
	$(CC) $(CFLAGS) -c $^

validate_solid.o: validate_solid.cpp
	$(CC) $(CFLAGS) -c $^

main.o: main.cpp
	$(CC) $(CFLAGS) -c $^

main:  input.o validate.o validate_shell.o validate_solid.o main.o
	$(CC) $(LDFLAGS) $^ -o val3dity 

clean:
	rm -rf *.o main
