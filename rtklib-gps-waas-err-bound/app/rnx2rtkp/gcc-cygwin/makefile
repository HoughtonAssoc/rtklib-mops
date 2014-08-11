# makefile for building rnx2rtkp with Cygwin gcc
#
# Description of the targets:
#
# ./rnx2rtkp.exe :
#	Build the executable file for the rnx2rtkp application with the WAAS
#	study code compiled in.
#
# ./rnx2rtkp-nows.exe :
#	Build the executable file for the rnx2rtkp application without
#	the WAAS study code compiled in.
#
# all :
#	Build both the ./rnx2rtkp.exe and ./rnx2rtkp-nows.exe files.
#
# print-all-test-summary :
# 	Run all test cases with the WAAS study code (1) switched in,
#	(2)compiled in but not switched in, and (3) not compiled in. Print
#	a summary of the test results.
#
# print-ws-test-summary :
# 	Run all test cases with the WAAS study code switched in and print
#	a summary of the test results.
#
# print-co-test-summary :
# 	Run all test cases with the WAAS study code compiled in but
#	not switched in and print a summary of the test results.
#
# print-nows-test-summary :
# 	Run all test cases without the WAAS study code compiled in and print
#   a summary of the test results.
#
# test :
# 	Run all test cases with the WAAS study code switched in.
#
# test-co :
# 	Run all test cases with the WAAS study code compiled in but
#	not switched in.
#
# test-nows :
# 	Run all test cases without the WAAS study code compiled in.
#
# testN.pos :
# 	Run the "testN" test case with the WAAS study code switched in
#	where N represents 1 through 28.
#
# testN-co.pos :
# 	Run the "testN" test case with the WAAS study code compiled in but
#	not switched in where N represents 1 through 28.
#
# testN-nows.pos :
# 	Run the "testN" test case without the WAAS study code compiled in where
#	N represents 1 through 28.
#
# all_trace :
#	Produce trace output for a number of test cases with and without the
#	WAAS study code switched in.
#
# trace_output :
#	Produce trace output for a number of test cases with the WAAS study code
#	switched in.
#
# trace_output_nows :
#	Produce trace output for a number of test cases without the WAAS study code
#	compiled in.
#
# test26-trace.pos.trace :
#	Produce trace output for the case of test26 with the WAAS study code
#	switched in.
#
# test27-trace.pos.trace :
#	Produce trace output for the case of test27 with the WAAS study code
#	switched in.
#
# test28-trace.pos.trace :
#	Produce trace output for the case of test28 with the WAAS study code
#	switched in.
#
# test26-trace-nows.pos.trace :
#	Produce trace output for the case of test26 without the WAAS study code
#	compiled in.
#
# test27-trace-nows.pos.trace :
#	Produce trace output for the case of test27 without the WAAS study code
#	compiled in.
#
# test28-trace-nows.pos.trace :
#	Produce trace output for the case of test28 without the WAAS study code
#	compiled in.
#
# clean :
#	Remove all nonessential files in the build directory.
#
# prof :
#	Profile the rnx2rtkp command with WAAS study code switched in.
#
# install : 
#	Install the rnx2rtkp command with WAAS study code switched in
#	in the /usr/local/bin directory.

BINDIR  = /usr/local/bin
SRC     = ../../../src

OPTIM     = -O3
MOREOPTS  = -DTRACE
OPTS      = -DENAGLO -DENAQZS -DENAGAL -DNFREQ=3 -DWIN32 $(MOREOPTS)

CFLAGS  = -Wall $(OPTIM) -ansi -pedantic -I/usr/include -I$(SRC) $(OPTS)
LDLIBS  = -lm -lrt -lwinmm -L/usr/lib -L/usr/lib/w32api

# List of object files with WAAS study code included
OBJS =  rnx2rtkp.o rtkcmn.o rinex.o rtkpos.o postpos.o solution.o \
        lambda.o geoid.o sbas.o preceph.o pntpos.o ephemeris.o options.o\
        ppp.o ppp_ar.o rtcm.o rtcm2.o rtcm3.o rtcm3e.o ionex.o qzslex.o

# List of object files without WAAS study code included
OBJS_NOWS =  rnx2rtkp-nows.o rtkcmn-nows.o rinex-nows.o rtkpos-nows.o \
        postpos-nows.o solution-nows.o lambda-nows.o geoid-nows.o \
        sbas-nows.o preceph-nows.o pntpos-nows.o ephemeris-nows.o \
        options-nows.o ppp-nows.o ppp_ar-nows.o rtcm-nows.o \
        rtcm2-nows.o rtcm3-nows.o rtcm3e-nows.o ionex-nows.o qzslex-nows.o

CMD_WS   = ./rnx2rtkp.exe
CMD_NOWS = ./rnx2rtkp-nows.exe

.PHONY     : all
all        : $(CMD_WS) $(CMD_NOWS)

# Rule for making exe file with WAAS study code included
$(CMD_WS) : $(OBJS)
	$(CC) -o $(CMD_WS) $(OPTIM) $(OBJS) $(LDLIBS)

# Rule for making exe file without WAAS study code included
$(CMD_NOWS) : $(OBJS_NOWS)
	$(CC) -o $(CMD_NOWS) $(OPTIM) $(OBJS_NOWS) $(LDLIBS)

# Rules for making object files with WAAS study code included
rnx2rtkp.o : ../rnx2rtkp.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) -DWAAS_STUDY ../rnx2rtkp.c
rtkcmn.o   : $(SRC)/rtkcmn.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) -DWAAS_STUDY $(SRC)/rtkcmn.c
rinex.o    : $(SRC)/rinex.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) -DWAAS_STUDY $(SRC)/rinex.c
rtkpos.o   : $(SRC)/rtkpos.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) -DWAAS_STUDY $(SRC)/rtkpos.c
postpos.o  : $(SRC)/postpos.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) -DWAAS_STUDY $(SRC)/postpos.c
solution.o : $(SRC)/solution.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) -DWAAS_STUDY $(SRC)/solution.c
lambda.o   : $(SRC)/lambda.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) -DWAAS_STUDY $(SRC)/lambda.c
geoid.o    : $(SRC)/geoid.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) -DWAAS_STUDY $(SRC)/geoid.c
sbas.o     : $(SRC)/sbas.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) -DWAAS_STUDY $(SRC)/sbas.c
preceph.o  : $(SRC)/preceph.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) -DWAAS_STUDY $(SRC)/preceph.c
pntpos.o   : $(SRC)/pntpos.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) -DWAAS_STUDY $(SRC)/pntpos.c
ephemeris.o: $(SRC)/ephemeris.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) -DWAAS_STUDY $(SRC)/ephemeris.c
options.o  : $(SRC)/options.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) -DWAAS_STUDY $(SRC)/options.c
ppp.o      : $(SRC)/ppp.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) -DWAAS_STUDY $(SRC)/ppp.c
ppp_ar.o   : $(SRC)/ppp_ar.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) -DWAAS_STUDY $(SRC)/ppp_ar.c
rtcm.o     : $(SRC)/rtcm.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) -DWAAS_STUDY $(SRC)/rtcm.c
rtcm2.o    : $(SRC)/rtcm2.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) -DWAAS_STUDY $(SRC)/rtcm2.c
rtcm3.o    : $(SRC)/rtcm3.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) -DWAAS_STUDY $(SRC)/rtcm3.c
rtcm3e.o   : $(SRC)/rtcm3e.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) -DWAAS_STUDY $(SRC)/rtcm3e.c
ionex.o    : $(SRC)/ionex.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) -DWAAS_STUDY $(SRC)/ionex.c
qzslex.o    : $(SRC)/qzslex.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) -DWAAS_STUDY $(SRC)/qzslex.c

# Rules for making object files without WAAS study code included
rnx2rtkp-nows.o : ../rnx2rtkp.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) ../rnx2rtkp.c -o rnx2rtkp-nows.o
rtkcmn-nows.o   : $(SRC)/rtkcmn.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) $(SRC)/rtkcmn.c -o rtkcmn-nows.o
rinex-nows.o    : $(SRC)/rinex.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) $(SRC)/rinex.c -o rinex-nows.o
rtkpos-nows.o   : $(SRC)/rtkpos.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) $(SRC)/rtkpos.c -o rtkpos-nows.o
postpos-nows.o  : $(SRC)/postpos.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) $(SRC)/postpos.c -o postpos-nows.o
solution-nows.o : $(SRC)/solution.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) $(SRC)/solution.c -o solution-nows.o
lambda-nows.o   : $(SRC)/lambda.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) $(SRC)/lambda.c -o lambda-nows.o
geoid-nows.o    : $(SRC)/geoid.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) $(SRC)/geoid.c -o geoid-nows.o
sbas-nows.o     : $(SRC)/sbas.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) $(SRC)/sbas.c -o sbas-nows.o
preceph-nows.o  : $(SRC)/preceph.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) $(SRC)/preceph.c -o preceph-nows.o
pntpos-nows.o   : $(SRC)/pntpos.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) $(SRC)/pntpos.c -o pntpos-nows.o
ephemeris-nows.o: $(SRC)/ephemeris.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) $(SRC)/ephemeris.c -o ephemeris-nows.o
options-nows.o  : $(SRC)/options.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) $(SRC)/options.c -o options-nows.o
ppp-nows.o      : $(SRC)/ppp.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) $(SRC)/ppp.c -o ppp-nows.o
ppp_ar-nows.o   : $(SRC)/ppp_ar.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) $(SRC)/ppp_ar.c -o ppp_ar-nows.o
rtcm-nows.o     : $(SRC)/rtcm.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) $(SRC)/rtcm.c -o rtcm-nows.o
rtcm2-nows.o    : $(SRC)/rtcm2.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) $(SRC)/rtcm2.c -o rtcm2-nows.o
rtcm3-nows.o    : $(SRC)/rtcm3.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) $(SRC)/rtcm3.c -o rtcm3-nows.o
rtcm3e-nows.o   : $(SRC)/rtcm3e.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) $(SRC)/rtcm3e.c -o rtcm3e-nows.o
ionex-nows.o    : $(SRC)/ionex.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) $(SRC)/ionex.c -o ionex-nows.o
qzslex-nows.o    : $(SRC)/qzslex.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) $(SRC)/qzslex.c -o qzslex-nows.o

INPUT11 = ../../../test/data/rinex/07590920.05o ../../../test/data/rinex/30400920.05n
INPUT12 = ../../../test/data/rinex/30400920.05o
OPTS1   = -r -3978241.958 3382840.234 3649900.853
USLO3610INPUT = Uslo3610.06O Uslo3610.06N

.PHONY : print-all-test-summary
print-all-test-summary : all_tests
	./print_test_summary.sh;

.PHONY : all_tests
all_tests : test test-co test-nows

.PHONY : print-ws-test-summary
print-ws-test-summary : test
	./print_test_summary.sh;

# Tests that apply with WAAS_STUDY switched in
.PHONY : test
test : $(CMD_WS)
test : test1.pos test2.pos test3.pos test4.pos test5.pos test6.pos
test : test7.pos test8.pos test9.pos test10.pos
test : test11.pos test12.pos test13.pos test14.pos test15.pos
test : test16.pos test17.pos test18.pos test19.pos test20.pos
test : test21.pos test22.pos test23.pos test24.pos test25.pos
test : test26.pos test27.pos test28.pos

.PHONY : print-co-test-summary
print-co-test-summary : test-co
	./print_test_summary.sh;

# Tests that apply with WAAS_STUDY compiled in but not switched in
.PHONY : test-co
test-co : $(CMD_WS)
test-co : test1-co.pos test2-co.pos test3-co.pos test4-co.pos test5-co.pos test6-co.pos
test-co : test7-co.pos test8-co.pos test9-co.pos test10-co.pos
test-co : test11-co.pos test12-co.pos test13-co.pos test14-co.pos test15-co.pos
test-co : test16-co.pos test17-co.pos test18-co.pos test19-co.pos test20-co.pos
test-co : test21-co.pos test22-co.pos test23-co.pos test24-co.pos test25-co.pos
test-co : test26-co.pos test27-co.pos test28-co.pos

.PHONY : print-nows-test-summary
print-nows-test-summary : test-nows
	./print_test_summary.sh;

# Tests that apply without WAAS_STUDY compiled in
.PHONY : test-nows
test-nows : $(CMD_NOWS)
test-nows : test1-nows.pos test2-nows.pos test3-nows.pos test4-nows.pos test5-nows.pos test6-nows.pos
test-nows : test7-nows.pos test8-nows.pos test9-nows.pos test10-nows.pos
test-nows : test11-nows.pos test12-nows.pos test13-nows.pos test14-nows.pos test15-nows.pos
test-nows : test16-nows.pos test17-nows.pos test18-nows.pos test19-nows.pos test20-nows.pos
test-nows : test21-nows.pos test22-nows.pos test23-nows.pos test24-nows.pos test25-nows.pos
test-nows : test26-nows.pos test27-nows.pos test28-nows.pos

# Rules for running tests with WAAS study code switched in
test1.pos :
	./runtest.sh "$(CMD_WS) -ws $(INPUT11) -x 5 $(OPTS1) -o test1.pos" \
	 test1-ws test1.pos-expected test1.pos
test2.pos :
	./runtest.sh "$(CMD_WS) -ws -t -e $(OPTS1) $(INPUT11)" test2-ws \
	 test2.pos-expected test2.pos > test2.pos
test3.pos :
	./runtest.sh "$(CMD_WS) -ws -t -p 1 -e $(OPTS1) $(INPUT11) $(INPUT12)" \
	 test3-ws test3.pos-expected test3.pos > test3.pos
test4.pos :
	./runtest.sh "$(CMD_WS) -ws -t -p 3 -e $(OPTS1) $(INPUT11) $(INPUT12)" \
	 test4-ws test4.pos-expected test4.pos > test4.pos
test5.pos :
	./runtest.sh "$(CMD_WS) -ws -t -m 15 -e $(OPTS1) $(INPUT11) $(INPUT12)" \
	 test5-ws test5.pos-expected test5.pos > test5.pos
test6.pos :
	./runtest.sh "$(CMD_WS) -ws -t -f 1 -e $(OPTS1) $(INPUT11) $(INPUT12)" \
	 test6-ws test6.pos-expected test6.pos > test6.pos
test7.pos :
	./runtest.sh "$(CMD_WS) -ws -t -v 5 -e $(OPTS1) $(INPUT11) $(INPUT12)" \
	 test7-ws test7.pos-expected test7.pos > test7.pos
test8.pos :
	./runtest.sh "$(CMD_WS) -ws -t -i -e $(OPTS1) $(INPUT11) $(INPUT12)" \
	 test8-ws test8.pos-expected test8.pos > test8.pos
test9.pos :
	./runtest.sh "$(CMD_WS) -ws -t -p 0 $(OPTS1) $(INPUT11)" test9-ws \
	 test9.pos-expected test9.pos > test9.pos
test10.pos :
	./runtest.sh "$(CMD_WS) -ws -t -p 0 $(OPTS1) $(INPUT11) -o test10.pos" \
	 test10-ws test10.pos-expected test10.pos
test11.pos :
	./runtest.sh "$(CMD_WS) -ws -t -p 0 -n $(OPTS1) $(INPUT11)" test11-ws \
	 test11.pos-expected test11.pos > test11.pos
test12.pos :
	./runtest.sh "$(CMD_WS) -ws -t -p 0 -g $(OPTS1) $(INPUT11)" test12-ws \
	 test12.pos-expected test12.pos > test12.pos
test13.pos :
	./runtest.sh "$(CMD_WS) -ws -t -p 0 $(OPTS1) $(INPUT11)" test13-ws \
	 test13.pos-expected test13.pos > test13.pos
test14.pos :
	./runtest.sh "$(CMD_WS) -ws -t -p 0 -u $(OPTS1) $(INPUT11)" test14-ws \
	 test14.pos-expected test14.pos > test14.pos
test15.pos :
	./runtest.sh "$(CMD_WS) -ws -t -p 0 -d 9 $(OPTS1) $(INPUT11)" test15-ws \
	 test15.pos-expected test15.pos > test15.pos
test16.pos :
	./runtest.sh "$(CMD_WS) -ws -t -p 0 -s , $(OPTS1) $(INPUT11)" test16-ws \
	 test16.pos-expected test16.pos > test16.pos
test17.pos :
	./runtest.sh "$(CMD_WS) -ws -t -b -e $(OPTS1) $(INPUT11) $(INPUT12)" \
	 test17-ws test17.pos-expected test17.pos > test17.pos
test18.pos :
	./runtest.sh "$(CMD_WS) -ws -t -c -e $(OPTS1) $(INPUT11) $(INPUT12)" \
	 test18-ws test18.pos-expected test18.pos > test18.pos
test19.pos :
	./runtest.sh "$(CMD_WS) -ws -t -h -e $(OPTS1) $(INPUT11) $(INPUT12)" \
	 test19-ws test19.pos-expected test19.pos > test19.pos
test20.pos :
	./runtest.sh "$(CMD_WS) -ws -t -p 4 -a $(OPTS1) $(INPUT11) $(INPUT12)" \
	 test20-ws test20.pos-expected test20.pos > test20.pos
test21.pos :
	./runtest.sh "$(CMD_WS) -ws $(INPUT11) $(INPUT12)" test21-ws \
	 test21.pos-expected test21.pos > test21.pos
test22.pos :
	./runtest.sh "$(CMD_WS) -ws -k opts1.conf $(INPUT11) $(INPUT12)" \
	 test22-ws test22.pos-expected test22.pos > test22.pos
test23.pos :
	./runtest.sh "$(CMD_WS) -ws -k opts2.conf $(INPUT11) $(INPUT12)" \
	 test23-ws test23.pos-expected test23.pos > test23.pos
test24.pos :
	./runtest.sh "$(CMD_WS) -ws -k opts3.conf $(INPUT11) $(INPUT12) -y 2 \
	 -o test24.pos" test24-ws test24.pos-expected test24.pos
test25.pos :
	./runtest.sh "$(CMD_WS) -ws -k opts4.conf $(INPUT11) $(INPUT12) -y 2 \
	 -o test25.pos" test25-ws test25.pos-expected test25.pos
test26.pos :
	./runtest.sh "$(CMD_WS) -ws -k SSSS.conf $(USLO3610INPUT) \
	 Geo135_00b4_1407_03.sbs -o test26.pos" test26-ws test26-ws.pos-expected \
	 test26.pos
test27.pos :
	./runtest.sh "$(CMD_WS) -ws -k SBMB.conf $(USLO3610INPUT) \
	 -o test27.pos" test27-ws test27.pos-expected test27.pos
test28.pos :
	./runtest.sh "$(CMD_WS) -ws -k SSSS_RAIM.conf $(USLO3610INPUT) \
	 Geo135_00b4_1407_03.sbs -o test28.pos" test28-ws test28-ws.pos-expected \
	 test28.pos

# Rules for running tests with WAAS study code compiled in but not switched in
test1-co.pos :
	./runtest.sh "$(CMD_WS) $(INPUT11) -x 5 $(OPTS1) -o test1-co.pos" \
	 test1-co test1.pos-expected test1-co.pos
test2-co.pos :
	./runtest.sh "$(CMD_WS) -t -e $(OPTS1) $(INPUT11)" test2-co \
	 test2.pos-expected test2-co.pos > test2-co.pos
test3-co.pos :
	./runtest.sh "$(CMD_WS) -t -p 1 -e $(OPTS1) $(INPUT11) $(INPUT12)" \
	 test3-co test3.pos-expected test3-co.pos > test3-co.pos
test4-co.pos :
	./runtest.sh "$(CMD_WS) -t -p 3 -e $(OPTS1) $(INPUT11) $(INPUT12)" \
	 test4-co test4.pos-expected test4-co.pos > test4-co.pos
test5-co.pos :
	./runtest.sh "$(CMD_WS) -t -m 15 -e $(OPTS1) $(INPUT11) $(INPUT12)" \
	 test5-co test5.pos-expected test5-co.pos > test5-co.pos
test6-co.pos :
	./runtest.sh "$(CMD_WS) -t -f 1 -e $(OPTS1) $(INPUT11) $(INPUT12)" \
	 test6-co test6.pos-expected test6-co.pos > test6-co.pos
test7-co.pos :
	./runtest.sh "$(CMD_WS) -t -v 5 -e $(OPTS1) $(INPUT11) $(INPUT12)" \
	 test7-co test7.pos-expected test7-co.pos > test7-co.pos
test8-co.pos :
	./runtest.sh "$(CMD_WS) -t -i -e $(OPTS1) $(INPUT11) $(INPUT12)" \
	 test8-co test8.pos-expected test8-co.pos > test8-co.pos
test9-co.pos :
	./runtest.sh "$(CMD_WS) -t -p 0 $(OPTS1) $(INPUT11)" test9-co \
	 test9.pos-expected test9-co.pos > test9-co.pos
test10-co.pos :
	./runtest.sh "$(CMD_WS) -t -p 0 $(OPTS1) $(INPUT11) -o test10-co.pos" \
	 test10-co test10.pos-expected test10-co.pos
test11-co.pos :
	./runtest.sh "$(CMD_WS) -t -p 0 -n $(OPTS1) $(INPUT11)" test11-co \
	 test11.pos-expected test11-co.pos > test11-co.pos
test12-co.pos :
	./runtest.sh "$(CMD_WS) -t -p 0 -g $(OPTS1) $(INPUT11)" test12-co \
	 test12.pos-expected test12-co.pos > test12-co.pos
test13-co.pos :
	./runtest.sh "$(CMD_WS) -t -p 0 $(OPTS1) $(INPUT11)" test13-co \
	 test13.pos-expected test13-co.pos > test13-co.pos
test14-co.pos :
	./runtest.sh "$(CMD_WS) -t -p 0 -u $(OPTS1) $(INPUT11)" test14-co \
	 test14.pos-expected test14-co.pos > test14-co.pos
test15-co.pos :
	./runtest.sh "$(CMD_WS) -t -p 0 -d 9 $(OPTS1) $(INPUT11)" test15-co \
	 test15.pos-expected test15-co.pos > test15-co.pos
test16-co.pos :
	./runtest.sh "$(CMD_WS) -t -p 0 -s , $(OPTS1) $(INPUT11)" test16-co \
	 test16.pos-expected test16-co.pos > test16-co.pos
test17-co.pos :
	./runtest.sh "$(CMD_WS) -t -b -e $(OPTS1) $(INPUT11) $(INPUT12)" \
	 test17-co test17.pos-expected test17-co.pos > test17-co.pos
test18-co.pos :
	./runtest.sh "$(CMD_WS) -t -c -e $(OPTS1) $(INPUT11) $(INPUT12)" \
	 test18-co test18.pos-expected test18-co.pos > test18-co.pos
test19-co.pos :
	./runtest.sh "$(CMD_WS) -t -h -e $(OPTS1) $(INPUT11) $(INPUT12)" \
	 test19-co test19.pos-expected test19-co.pos > test19-co.pos
test20-co.pos :
	./runtest.sh "$(CMD_WS) -t -p 4 -a $(OPTS1) $(INPUT11) $(INPUT12)" \
	 test20-co test20.pos-expected test20-co.pos > test20-co.pos
test21-co.pos :
	./runtest.sh "$(CMD_WS) $(INPUT11) $(INPUT12)" test21-co \
	 test21.pos-expected test21-co.pos > test21-co.pos
test22-co.pos :
	./runtest.sh "$(CMD_WS) -k opts1.conf $(INPUT11) $(INPUT12)" \
	 test22-co test22.pos-expected test22-co.pos > test22-co.pos
test23-co.pos :
	./runtest.sh "$(CMD_WS) -k opts2.conf $(INPUT11) $(INPUT12)" \
	 test23-co test23.pos-expected test23-co.pos > test23-co.pos
test24-co.pos :
	./runtest.sh "$(CMD_WS) -k opts3.conf $(INPUT11) $(INPUT12) -y 2 \
	 -o test24-co.pos" test24-co test24.pos-expected test24-co.pos
test25-co.pos :
	./runtest.sh "$(CMD_WS) -k opts4.conf $(INPUT11) $(INPUT12) -y 2 \
	 -o test25-co.pos" test25-co test25.pos-expected test25-co.pos
test26-co.pos :
	./runtest.sh "$(CMD_WS) -k SSSS.conf $(USLO3610INPUT) \
	 Geo135_00b4_1407_03.sbs -o test26-co.pos" test26-co test26.pos-expected \
	 test26-co.pos
test27-co.pos :
	./runtest.sh "$(CMD_WS) -k SBMB.conf $(USLO3610INPUT) \
	 -o test27-co.pos" test27-co test27.pos-expected test27-co.pos
test28-co.pos :
	./runtest.sh "$(CMD_WS) -k SSSS_RAIM.conf $(USLO3610INPUT) \
	 Geo135_00b4_1407_03.sbs -o test28-co.pos" test28-co test28.pos-expected \
	 test28-co.pos

# Rules for running tests without WAAS study code compiled in
test1-nows.pos : 
	./runtest.sh "$(CMD_NOWS) $(INPUT11) -x 5 $(OPTS1) -o test1-nows.pos" \
     test1-nows test1.pos-expected test1-nows.pos
test2-nows.pos :
	./runtest.sh "$(CMD_NOWS) -t -e $(OPTS1) $(INPUT11)" test2-nows \
	 test2.pos-expected test2-nows.pos > test2-nows.pos
test3-nows.pos :
	./runtest.sh "$(CMD_NOWS) -t -p 1 -e $(OPTS1) $(INPUT11) $(INPUT12)" \
	 test3-nows test3.pos-expected test3-nows.pos > test3-nows.pos
test4-nows.pos :
	./runtest.sh "$(CMD_NOWS) -t -p 3 -e $(OPTS1) $(INPUT11) $(INPUT12)" \
	 test4-nows test4.pos-expected test4-nows.pos > test4-nows.pos
test5-nows.pos :
	./runtest.sh "$(CMD_NOWS) -t -m 15 -e $(OPTS1) $(INPUT11) $(INPUT12)" \
	 test5-nows test5.pos-expected test5-nows.pos > test5-nows.pos
test6-nows.pos :
	./runtest.sh "$(CMD_NOWS) -t -f 1 -e $(OPTS1) $(INPUT11) $(INPUT12)" \
	 test6-nows test6.pos-expected test6-nows.pos > test6-nows.pos
test7-nows.pos :
	./runtest.sh "$(CMD_NOWS) -t -v 5 -e $(OPTS1) $(INPUT11) $(INPUT12)" \
	 test7-nows test7.pos-expected test7-nows.pos > test7-nows.pos
test8-nows.pos :
	./runtest.sh "$(CMD_NOWS) -t -i -e $(OPTS1) $(INPUT11) $(INPUT12)" \
	 test8-nows test8.pos-expected test8-nows.pos > test8-nows.pos
test9-nows.pos :
	./runtest.sh "$(CMD_NOWS) -t -p 0 $(OPTS1) $(INPUT11)" test9-nows \
	 test9.pos-expected test9-nows.pos > test9-nows.pos
test10-nows.pos :
	./runtest.sh "$(CMD_NOWS) -t -p 0 $(OPTS1) $(INPUT11) -o test10-nows.pos" \
	 test10-nows test10.pos-expected test10-nows.pos
test11-nows.pos :
	./runtest.sh "$(CMD_NOWS) -t -p 0 -n $(OPTS1) $(INPUT11)" test11-nows \
	 test11.pos-expected test11-nows.pos > test11-nows.pos
test12-nows.pos :
	./runtest.sh "$(CMD_NOWS) -t -p 0 -g $(OPTS1) $(INPUT11)" test12-nows \
	 test12.pos-expected test12-nows.pos > test12-nows.pos
test13-nows.pos :
	./runtest.sh "$(CMD_NOWS) -t -p 0 $(OPTS1) $(INPUT11)" test13-nows \
	 test13.pos-expected test13-nows.pos > test13-nows.pos
test14-nows.pos :
	./runtest.sh "$(CMD_NOWS) -t -p 0 -u $(OPTS1) $(INPUT11)" test14-nows \
	 test14.pos-expected test14-nows.pos > test14-nows.pos
test15-nows.pos :
	./runtest.sh "$(CMD_NOWS) -t -p 0 -d 9 $(OPTS1) $(INPUT11)" test15-nows \
	 test15.pos-expected test15-nows.pos > test15-nows.pos
test16-nows.pos :
	./runtest.sh "$(CMD_NOWS) -t -p 0 -s , $(OPTS1) $(INPUT11)" test16-nows \
	 test16.pos-expected test16-nows.pos > test16-nows.pos
test17-nows.pos :
	./runtest.sh "$(CMD_NOWS) -t -b -e $(OPTS1) $(INPUT11) $(INPUT12)" \
	 test17-nows test17.pos-expected test17-nows.pos > test17-nows.pos
test18-nows.pos :
	./runtest.sh "$(CMD_NOWS) -t -c -e $(OPTS1) $(INPUT11) $(INPUT12)" \
	 test18-nows test18.pos-expected test18-nows.pos > test18-nows.pos
test19-nows.pos :
	./runtest.sh "$(CMD_NOWS) -t -h -e $(OPTS1) $(INPUT11) $(INPUT12)" \
	 test19-nows test19.pos-expected test19-nows.pos > test19-nows.pos
test20-nows.pos :
	./runtest.sh "$(CMD_NOWS) -t -p 4 -a $(OPTS1) $(INPUT11) $(INPUT12)" \
	 test20-nows test20.pos-expected test20-nows.pos > test20-nows.pos
test21-nows.pos :
	./runtest.sh "$(CMD_NOWS) $(INPUT11) $(INPUT12)" test21-nows \
	 test21.pos-expected test21-nows.pos > test21-nows.pos
test22-nows.pos :
	./runtest.sh "$(CMD_NOWS) -k opts1.conf $(INPUT11) $(INPUT12)" test22-nows \
	 test22.pos-expected test22-nows.pos > test22-nows.pos
test23-nows.pos :
	./runtest.sh "$(CMD_NOWS) -k opts2.conf $(INPUT11) $(INPUT12)" test23-nows \
	 test23.pos-expected test23-nows.pos > test23-nows.pos
test24-nows.pos :
	./runtest.sh "$(CMD_NOWS) -k opts3.conf $(INPUT11) $(INPUT12) -y 2 \
	 -o test24-nows.pos" test24-nows test24.pos-expected test24-nows.pos
test25-nows.pos :
	./runtest.sh "$(CMD_NOWS) -k opts4.conf $(INPUT11) $(INPUT12) -y 2 \
	 -o test25-nows.pos" test25-nows test25.pos-expected test25-nows.pos
test26-nows.pos :
	./runtest.sh "$(CMD_NOWS) -k SSSS.conf $(USLO3610INPUT) \
	 Geo135_00b4_1407_03.sbs -o test26-nows.pos" test26-nows test26.pos-expected \
	 test26-nows.pos
test27-nows.pos :
	./runtest.sh "$(CMD_NOWS) -k SBMB.conf $(USLO3610INPUT) \
	 -o test27-nows.pos" test27-nows test27.pos-expected test27-nows.pos
test28-nows.pos :
	./runtest.sh "$(CMD_NOWS) -k SSSS_RAIM.conf $(USLO3610INPUT) \
	 Geo135_00b4_1407_03.sbs -o test28-nows.pos" test28-nows test28.pos-expected \
	 test28-nows.pos

.PHONY : all_trace trace_output trace_output_nows
all_trace : trace_output trace_output_nows

# Rules for making trace output with WAAS study code switched in
trace_output : test26-trace.pos.trace test27-trace.pos.trace \
               test28-trace.pos.trace
test27-trace.pos.trace : $(CMD_WS)
	$(CMD_WS) -ws -x 5 -k SBMB.conf Uslo3610.06O-small Uslo3610.06N \
	 -o test27-trace.pos
test26-trace.pos.trace : $(CMD_WS)
	$(CMD_WS) -ws -x 5 -k SSSS.conf Uslo3610.06O-small Uslo3610.06N \
	 Geo135_00b4_1407_03.sbs -o test26-trace.pos
test28-trace.pos.trace : $(CMD_WS)
	$(CMD_WS) -ws -x 5 -k SSSS_RAIM.conf Uslo3610.06O-small Uslo3610.06N \
	 Geo135_00b4_1407_03.sbs -o test28-trace.pos

# Rules for making trace output without WAAS study code switched in
trace_output_nows : test26-trace-nows.pos.trace test27-trace-nows.pos.trace \
               test28-trace-nows.pos.trace
test26-trace-nows.pos.trace : $(CMD_NOWS)
	$(CMD_NOWS) -x 5 -k SSSS.conf Uslo3610.06O-small Uslo3610.06N \
	 Geo135_00b4_1407_03.sbs -o test26-trace-nows.pos
test27-trace-nows.pos.trace : $(CMD_NOWS)
	$(CMD_NOWS) -x 5 -k SBMB.conf Uslo3610.06O-small Uslo3610.06N \
	 -o test27-trace-nows.pos
test28-trace-nows.pos.trace : $(CMD_NOWS)
	$(CMD_NOWS) -x 5 -k SSSS_RAIM.conf Uslo3610.06O-small Uslo3610.06N \
	 Geo135_00b4_1407_03.sbs -o test28-trace-nows.pos

.PHONY : clean prof install
clean :
	rm -f *.exe *.o *.pos *.trace *.stat

prof :
	gprof $(CMD_WS) > prof.txt

install :
	cp $(CMD_WS) $(BINDIR)

