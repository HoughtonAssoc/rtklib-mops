# makefile for building rnx2rtkp with Cygwin gcc

BINDIR  = /usr/local/bin
SRC     = ../../../src

OPTIM     = -O3
MOREOPTS  = -DWAAS_STUDY -DTRACE
OPTS      = -DENAGLO -DENAQZS -DENAGAL -DNFREQ=3 -DWIN32 $(MOREOPTS)

CFLAGS  = -Wall $(OPTIM) -ansi -pedantic -I/usr/include -I$(SRC) $(OPTS)
LDLIBS  = $(OPTIM) -lm -lrt -lwinmm -L/usr/lib -L/usr/lib/w32api

all        : rnx2rtkp
rnx2rtkp   : rnx2rtkp.o rtkcmn.o rinex.o rtkpos.o postpos.o solution.o
rnx2rtkp   : lambda.o geoid.o sbas.o preceph.o pntpos.o ephemeris.o options.o
rnx2rtkp   : ppp.o ppp_ar.o rtcm.o rtcm2.o rtcm3.o rtcm3e.o ionex.o qzslex.o

rnx2rtkp.o : ../rnx2rtkp.c
	$(CC) -c $(CFLAGS) ../rnx2rtkp.c
rtkcmn.o   : $(SRC)/rtkcmn.c
	$(CC) -c $(CFLAGS) $(SRC)/rtkcmn.c
rinex.o    : $(SRC)/rinex.c
	$(CC) -c $(CFLAGS) $(SRC)/rinex.c
rtkpos.o   : $(SRC)/rtkpos.c
	$(CC) -c $(CFLAGS) $(SRC)/rtkpos.c
postpos.o  : $(SRC)/postpos.c
	$(CC) -c $(CFLAGS) $(SRC)/postpos.c
solution.o : $(SRC)/solution.c
	$(CC) -c $(CFLAGS) $(SRC)/solution.c
lambda.o   : $(SRC)/lambda.c
	$(CC) -c $(CFLAGS) $(SRC)/lambda.c
geoid.o    : $(SRC)/geoid.c
	$(CC) -c $(CFLAGS) $(SRC)/geoid.c
sbas.o     : $(SRC)/sbas.c
	$(CC) -c $(CFLAGS) $(SRC)/sbas.c
preceph.o  : $(SRC)/preceph.c
	$(CC) -c $(CFLAGS) $(SRC)/preceph.c
pntpos.o   : $(SRC)/pntpos.c
	$(CC) -c $(CFLAGS) $(SRC)/pntpos.c
ephemeris.o: $(SRC)/ephemeris.c
	$(CC) -c $(CFLAGS) $(SRC)/ephemeris.c
options.o  : $(SRC)/options.c
	$(CC) -c $(CFLAGS) $(SRC)/options.c
ppp.o      : $(SRC)/ppp.c
	$(CC) -c $(CFLAGS) $(SRC)/ppp.c
ppp_ar.o   : $(SRC)/ppp_ar.c
	$(CC) -c $(CFLAGS) $(SRC)/ppp_ar.c
rtcm.o     : $(SRC)/rtcm.c
	$(CC) -c $(CFLAGS) $(SRC)/rtcm.c
rtcm2.o    : $(SRC)/rtcm2.c
	$(CC) -c $(CFLAGS) $(SRC)/rtcm2.c
rtcm3.o    : $(SRC)/rtcm3.c
	$(CC) -c $(CFLAGS) $(SRC)/rtcm3.c
rtcm3e.o   : $(SRC)/rtcm3e.c
	$(CC) -c $(CFLAGS) $(SRC)/rtcm3e.c
ionex.o    : $(SRC)/ionex.c
	$(CC) -c $(CFLAGS) $(SRC)/ionex.c
qzslex.o    : $(SRC)/qzslex.c
	$(CC) -c $(CFLAGS) $(SRC)/qzslex.c

rnx2rtkp.o : $(SRC)/rtklib.h makefile
rtkcmn.o   : $(SRC)/rtklib.h makefile
rinex.o    : $(SRC)/rtklib.h makefile
rtkpos.o   : $(SRC)/rtklib.h makefile
postpos.o  : $(SRC)/rtklib.h makefile
solution.o : $(SRC)/rtklib.h makefile
lambda.o   : $(SRC)/rtklib.h makefile
geoid.o    : $(SRC)/rtklib.h makefile
sbas.o     : $(SRC)/rtklib.h makefile
preceph.o  : $(SRC)/rtklib.h makefile
pntpos.o   : $(SRC)/rtklib.h makefile
ephemeris.o: $(SRC)/rtklib.h makefile
options.o  : $(SRC)/rtklib.h makefile
ppp.o      : $(SRC)/rtklib.h makefile
ppp_ar.o   : $(SRC)/rtklib.h makefile
rtcm.o     : $(SRC)/rtklib.h makefile
rtcm2.o    : $(SRC)/rtklib.h makefile
rtcm3.o    : $(SRC)/rtklib.h makefile
rtcm3e.o   : $(SRC)/rtklib.h makefile
ionex.o    : $(SRC)/rtklib.h makefile
qzslex.o    : $(SRC)/rtklib.h makefile

CMD1    = ./rnx2rtkp -ws
INPUT11 = ../../../test/data/rinex/07590920.05o ../../../test/data/rinex/30400920.05n
INPUT12 = ../../../test/data/rinex/30400920.05o
OPTS1   = -r -3978241.958 3382840.234 3649900.853
USLO3610INPUT = Uslo3610.06O Uslo3610.06N
test : rnx2rtkp
test : test1 test2 test3 test4 test5 test6 test7 test8 test9 test10
test : test11 test12 test13 test14 test15 test16 test17 test18 test19 test20
test : test21 test22 test23 test24 test25 test26 test27 test28

test1 :
	./runtest.sh "$(CMD1) $(INPUT11) -x 5 $(OPTS1) -o test1.pos" test1
test2 :
	./runtest.sh "$(CMD1) -t -e $(OPTS1) $(INPUT11)" test2 > test2.pos
test3 :
	./runtest.sh "$(CMD1) -t -p 1 -e $(OPTS1) $(INPUT11) $(INPUT12)" test3 > test3.pos
test4 :
	./runtest.sh "$(CMD1) -t -p 3 -e $(OPTS1) $(INPUT11) $(INPUT12)" test4 > test4.pos
test5 :
	./runtest.sh "$(CMD1) -t -m 15 -e $(OPTS1) $(INPUT11) $(INPUT12)" test5 > test5.pos
test6 :
	./runtest.sh "$(CMD1) -t -f 1 -e $(OPTS1) $(INPUT11) $(INPUT12)" test6 > test6.pos
test7 :
	./runtest.sh "$(CMD1) -t -v 5 -e $(OPTS1) $(INPUT11) $(INPUT12)" test7 > test7.pos
test8 :
	./runtest.sh "$(CMD1) -t -i -e $(OPTS1) $(INPUT11) $(INPUT12)" test8 > test8.pos
test9 :
	./runtest.sh "$(CMD1) -t -p 0 $(OPTS1) $(INPUT11)" test9 > test9.pos
test10 :
	./runtest.sh "$(CMD1) -t -p 0 $(OPTS1) $(INPUT11) -o test10.pos" test10
test11 :
	./runtest.sh "$(CMD1) -t -p 0 -n $(OPTS1) $(INPUT11)" test11 > test11.pos
test12 :
	./runtest.sh "$(CMD1) -t -p 0 -g $(OPTS1) $(INPUT11)" test12 > test12.pos
test13 :
	./runtest.sh "$(CMD1) -t -p 0 $(OPTS1) $(INPUT11)" test13 > test13.pos
test14 :
	./runtest.sh "$(CMD1) -t -p 0 -u $(OPTS1) $(INPUT11)" test14 > test14.pos
test15 :
	./runtest.sh "$(CMD1) -t -p 0 -d 9 $(OPTS1) $(INPUT11)" test15 > test15.pos
test16 :
	./runtest.sh "$(CMD1) -t -p 0 -s , $(OPTS1) $(INPUT11)" test16 > test16.pos
test17 :
	./runtest.sh "$(CMD1) -t -b -e $(OPTS1) $(INPUT11) $(INPUT12)" test17 > test17.pos
test18 :
	./runtest.sh "$(CMD1) -t -c -e $(OPTS1) $(INPUT11) $(INPUT12)" test18 > test18.pos
test19 :
	./runtest.sh "$(CMD1) -t -h -e $(OPTS1) $(INPUT11) $(INPUT12)" test19 > test19.pos
test20 :
	./runtest.sh "$(CMD1) -t -p 4 -a $(OPTS1) $(INPUT11) $(INPUT12)" test20 > test20.pos
test21 :
	./runtest.sh "$(CMD1) $(INPUT11) $(INPUT12)" test21 > test21.pos
test22 :
	./runtest.sh "$(CMD1) -k opts1.conf $(INPUT11) $(INPUT12)" test22 > test22.pos
test23 :
	./runtest.sh "$(CMD1) -k opts2.conf $(INPUT11) $(INPUT12)" test23 > test23.pos
test24 :
	./runtest.sh "$(CMD1) -k opts3.conf $(INPUT11) $(INPUT12) -y 2 -o test24.pos" test24
test25 :
	./runtest.sh "$(CMD1) -k opts4.conf $(INPUT11) $(INPUT12) -y 2 -o test25.pos" test25
test26 :
	./runtest.sh "$(CMD1) -k SSSS.conf $(USLO3610INPUT) Geo135_00b4_1407_03.sbs -o test26.pos" test26
test27 :
	./runtest.sh "$(CMD1) -k SBMB.conf $(USLO3610INPUT) -o test27.pos" test27
test28 :
	./runtest.sh "$(CMD1) -k SSSS_RAIM.conf $(USLO3610INPUT) Geo135_00b4_1407_03.sbs -o test28.pos" test28
	
trace_output : test26_trace_output test27_trace_output test28_trace_output

test26_trace_output : rnx2rtkp
	$(CMD1) -x 5 -k SSSS.conf Uslo3610.06O-small Uslo3610.06N Geo135_00b4_1407_03.sbs -o test26_trace_output.pos
test27_trace_output : rnx2rtkp
	$(CMD1) -x 5 -k SBMB.conf Uslo3610.06O-small Uslo3610.06N -o test27_trace_output.pos
test28_trace_output : rnx2rtkp
	$(CMD1) -x 5 -k SSSS_RAIM.conf Uslo3610.06O-small Uslo3610.06N Geo135_00b4_1407_03.sbs -o test28_trace_output.pos

clean :
	rm -f rnx2rtkp rnx2rtkp.exe *.o *.pos *.trace *.stat

prof :
	gprof rnx2rtkp > prof.txt

install :
	cp rnx2rtkp $(BINDIR)

