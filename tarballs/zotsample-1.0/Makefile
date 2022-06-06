#
# Simple compile and link of C and C++ code.
# Need to change the linker to CCC (C++) from CC
#
LD := $(CCC)

all: zotsample
clean:
	rm -f *.o zotsample

check:
	./check.sh

install:
	./install.sh

zotsample: main.o fn.o
	$(LD) $(LDFLAGS) -o$@ $^ 
