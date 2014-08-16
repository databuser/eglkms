CFLAGS=-c -std=c99 -Wall -m64 -Ofast -flto -march=native -funroll-loops -DLINUX -I/usr/include/libdrm
LDFLAGS=-ldrm -lGL -lgbm -lEGL
SRCS=eglkms.c
OBJS=$(SRCS:.c=.o)
TARGET=eglkms

all: $(SRCS) $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(LDFLAGS) $(OBJS) -o $@

.c.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -fr $(OBJS) $(TARGET)
