# makefile for rtklib unit test

SRC    = ../../src
CFLAGS = -Wall -ggdb -O0 -ansi -pedantic -DWIN32 -I$(SRC) -DTRACE -DENAGLO -DENAQZS -DWAAS_STUDY
#LDLIBS = -lm -llapack -lblas
LDLIBS = -ggdb -O0 -lm -lrt -lwinmm -L/usr/lib -L/usr/lib/w32api
CC = gcc

TVAR_CMD = ./t_var.exe
TPL_CMD = ./t_waasprotlevels.exe

BIN    = $(TVAR_CMD) $(TPL_CMD)
TVAR_OBJS = t_var.o rtkcmn.o pntpos.o sbas.o ionex.o qzslex.o ephemeris.o preceph.o rtcm.o rtcm2.o rtcm3.o rtcm3e.o
TPL_OBJS = t_waasprotlevels.o rtkcmn.o sbas.o

.PHONY : all
all        : $(BIN)
$(TVAR_CMD) : $(TVAR_OBJS)
	$(CC) -o $(TVAR_CMD) $(TVAR_OBJS) $(LDLIBS)
$(TPL_CMD) : $(TPL_OBJS)
	$(CC) -o $(TPL_CMD) $(TPL_OBJS) $(LDLIBS)

t_waasprotlevels.o   : $(SRC)/rtklib.h utest.h t_waasprotlevels.c makefile
	$(CC) -c $(CFLAGS) t_waasprotlevels.c
t_var.o   : $(SRC)/rtklib.h t_var.c makefile
	$(CC) -c $(CFLAGS) t_var.c
rtkcmn.o   : $(SRC)/rtklib.h $(SRC)/rtkcmn.c makefile
	$(CC) -c $(CFLAGS) $(SRC)/rtkcmn.c
pntpos.o   : $(SRC)/rtklib.h $(SRC)/pntpos.c makefile
	$(CC) -c $(CFLAGS) $(SRC)/pntpos.c
sbas.o   : $(SRC)/rtklib.h $(SRC)/sbas.c makefile
	$(CC) -c $(CFLAGS) $(SRC)/sbas.c
ionex.o    : $(SRC)/rtklib.h $(SRC)/ionex.c makefile
	$(CC) -c $(CFLAGS) $(SRC)/ionex.c
qzslex.o   : $(SRC)/rtklib.h $(SRC)/qzslex.c makefile
	$(CC) -c $(CFLAGS) $(SRC)/qzslex.c
ephemeris.o   : $(SRC)/rtklib.h $(SRC)/ephemeris.c makefile
	$(CC) -c $(CFLAGS) $(SRC)/ephemeris.c
preceph.o   : $(SRC)/rtklib.h $(SRC)/preceph.c makefile
	$(CC) -c $(CFLAGS) $(SRC)/preceph.c
rtcm.o   : $(SRC)/rtklib.h $(SRC)/rtcm.c makefile
	$(CC) -c $(CFLAGS) $(SRC)/rtcm.c
rtcm2.o   : $(SRC)/rtklib.h $(SRC)/rtcm2.c makefile
	$(CC) -c $(CFLAGS) $(SRC)/rtcm2.c
rtcm3.o   : $(SRC)/rtklib.h $(SRC)/rtcm3.c makefile
	$(CC) -c $(CFLAGS) $(SRC)/rtcm3.c
rtcm3e.o   : $(SRC)/rtklib.h $(SRC)/rtcm3e.c makefile
	$(CC) -c $(CFLAGS) $(SRC)/rtcm3e.c

.PHONY : unittest clean
unittest : unittest_var.out unittest_pl.out

unittest_var.out : $(TVAR_CMD)
	$(TVAR_CMD)  > unittest_var.out

unittest_pl.out : $(TPL_CMD)
	$(TPL_CMD)  > unittest_pl.out

clean :
	rm -f *.o *.out *.exe $(BIN) *.stackdump gmon.out

