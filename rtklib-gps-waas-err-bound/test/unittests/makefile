# makefile for rtklib unit test

SRC    = ../../src
CFLAGS = -Wall -O3 -ansi -pedantic -DWIN32 -I$(SRC) -DTRACE -DENAGLO -DENAQZS
#LDLIBS = -lm -llapack -lblas
LDLIBS = -ggdb -O0 -lm -lrt -lwinmm -L/usr/lib -L/usr/lib/w32api
CC = gcc

BIN    = t_var

all        : $(BIN)
t_var      : t_var.o rtkcmn.o pntpos.o sbas.o ionex.o qzslex.o ephemeris.o preceph.o rtcm.o rtcm2.o rtcm3.o rtcm3e.o

rtkcmn.o   : $(SRC)/rtklib.h $(SRC)/rtkcmn.c
	$(CC) -c $(CFLAGS) $(SRC)/rtkcmn.c
pntpos.o   : $(SRC)/rtklib.h $(SRC)/pntpos.c
	$(CC) -c $(CFLAGS) $(SRC)/pntpos.c
sbas.o   : $(SRC)/rtklib.h $(SRC)/sbas.c
	$(CC) -c $(CFLAGS) $(SRC)/sbas.c
ionex.o    : $(SRC)/rtklib.h $(SRC)/ionex.c
	$(CC) -c $(CFLAGS) $(SRC)/ionex.c
qzslex.o   : $(SRC)/rtklib.h $(SRC)/qzslex.c
	$(CC) -c $(CFLAGS) $(SRC)/qzslex.c
ephemeris.o   : $(SRC)/rtklib.h $(SRC)/ephemeris.c
	$(CC) -c $(CFLAGS) $(SRC)/ephemeris.c
preceph.o   : $(SRC)/rtklib.h $(SRC)/preceph.c
	$(CC) -c $(CFLAGS) $(SRC)/preceph.c
rtcm.o   : $(SRC)/rtklib.h $(SRC)/rtcm.c
	$(CC) -c $(CFLAGS) $(SRC)/rtcm.c
rtcm2.o   : $(SRC)/rtklib.h $(SRC)/rtcm2.c
	$(CC) -c $(CFLAGS) $(SRC)/rtcm2.c
rtcm3.o   : $(SRC)/rtklib.h $(SRC)/rtcm3.c
	$(CC) -c $(CFLAGS) $(SRC)/rtcm3.c
rtcm3e.o   : $(SRC)/rtklib.h $(SRC)/rtcm3e.c
	$(CC) -c $(CFLAGS) $(SRC)/rtcm3e.c

unittest : unittest_var

unittest_var :
	./t_var  > unittest_var.out

clean :
	rm -f *.o *.out *.exe $(BIN) *.stackdump gmon.out

