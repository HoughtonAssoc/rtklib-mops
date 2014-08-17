# makefile for rtklib unit tests under Cygwin.
#
# Description of some useful targets:
#
# all :
#	Build all unit test executable files.
# print-all-test-summary :
# 	Run all unit tests and print a summary of the results.
#	The unit test executable files are built if needed.
# utest :
# 	Run all unit tests.
#	The unit test executable files are built if needed.
# clean :
# 	Remove all nonessential files.

SRC    = ../../src
#CFLAGS = -Wall -O3 -ansi -pedantic -I$(SRC) -DENAGLO
CFLAGS = -Wall -O3 -ansi -pedantic -I$(SRC) -DTRACE -DENAGLO -DENAQZS -DWIN32 \
         -DWAAS_STUDY
#LDLIBS = -lm -llapack -lblas
LDLIBS = -ggdb -O0 -lm -lrt -lwinmm -L/usr/lib -L/usr/lib/w32api
CC = gcc

T_MATRIX_CMD  = ./t_matrix.exe
T_TIME_CMD    = ./t_time.exe
T_COORD_CMD   = ./t_coord.exe
T_RINEX_CMD   = ./t_rinex.exe
T_LAMBDA_CMD  = ./t_lambda.exe
T_ATMOS_CMD   = ./t_atmos.exe
T_MISC_CMD    = ./t_misc.exe
T_PRECEPH_CMD = ./t_preceph.exe
T_GLOEPH_CMD  = ./t_gloeph.exe
T_GEOID_CMD   = ./t_geoid.exe
T_PPP_CMD     = ./t_ppp.exe
T_IONEX_CMD   = ./t_ionex.exe
T_STEC_CMD    = ./t_stec.exe
T_TLE_CMD     = ./t_tle.exe
T_VAR_CMD     = ./t_var.exe
T_PL_CMD      = ./t_pl.exe

#BIN = $(T_MATRIX_CMD) $(T_TIME_CMD) $(T_COORD_CMD) $(T_RINEX_CMD)  \
#      $(T_LAMBDA_CMD) $(T_ATMOS_CMD) $(T_MISC_CMD) $(T_PRECEPH_CMD) \
#      $(T_GLOEPH_CMD) $(T_GEOID_CMD) $(T_PPP_CMD) $(T_IONEX_CMD) \
#      $(T_STEC_CMD) $(T_TLE_CMD) $(T_VAR_CMD) $(T_PL_CMD)
BIN = $(T_MATRIX_CMD) $(T_TIME_CMD) $(T_COORD_CMD) $(T_RINEX_CMD)  \
      $(T_LAMBDA_CMD) $(T_ATMOS_CMD) $(T_MISC_CMD) $(T_PRECEPH_CMD) \
      $(T_GLOEPH_CMD)  $(T_IONEX_CMD) \
      $(T_TLE_CMD) $(T_VAR_CMD) $(T_PL_CMD)

.PHONY : all
all        : $(BIN)
$(T_MATRIX_CMD)   : t_matrix.o rtkcmn.o preceph.o
	$(CC) -o $@ $^ $(LDLIBS)
$(T_TIME_CMD)     : t_time.o rtkcmn.o preceph.o
	$(CC) -o $@ $^ $(LDLIBS)
$(T_COORD_CMD)    : t_coord.o rtkcmn.o geoid.o preceph.o
	$(CC) -o $@ $^ $(LDLIBS)
$(T_RINEX_CMD)    : t_rinex.o rtkcmn.o rinex.o preceph.o
	$(CC) -o $@ $^ $(LDLIBS)
$(T_LAMBDA_CMD)   : t_lambda.o rtkcmn.o lambda.o preceph.o
	$(CC) -o $@ $^ $(LDLIBS)
$(T_ATMOS_CMD)    : t_atmos.o rtkcmn.o preceph.o
	$(CC) -o $@ $^ $(LDLIBS)
$(T_MISC_CMD)     : t_misc.o rtkcmn.o preceph.o
	$(CC) -o $@ $^ $(LDLIBS)
$(T_PRECEPH_CMD)  : t_preceph.o rtkcmn.o preceph.o rinex.o ephemeris.o \
                    sbas.o qzslex.o rtcm.o rtcm2.o rtcm3.o rtcm3e.o
	$(CC) -o $@ $^ $(LDLIBS)
$(T_GLOEPH_CMD)   : t_gloeph.o rtkcmn.o rinex.o ephemeris.o sbas.o \
                    preceph.o qzslex.o rtcm.o rtcm2.o rtcm3.o rtcm3e.o
	$(CC) -o $@ $^ $(LDLIBS)
$(T_GEOID_CMD)    : t_geoid.o rtkcmn.o preceph.o geoid.o
	$(CC) -o $@ $^ $(LDLIBS)
$(T_PPP_CMD)      : t_ppp.o rtkcmn.o ephemeris.o preceph.o sbas.o ionex.o \
                    pntpos.o ppp.o ppp_ar.o stec.o lambda.o qzslex.o
	$(CC) -o $@ $^ $(LDLIBS)
$(T_IONEX_CMD)    : t_ionex.o rtkcmn.o preceph.o ionex.o
	$(CC) -o $@ $^ $(LDLIBS)
$(T_STEC_CMD)     : t_stec.o rtkcmn.o preceph.o stec.o
	$(CC) -o $@ $^ $(LDLIBS)
$(T_TLE_CMD)      : t_tle.o rtkcmn.o rinex.o ephemeris.o sbas.o preceph.o \
                    tle.o qzslex.o rtcm.o rtcm2.o rtcm3.o rtcm3e.o
	$(CC) -o $@ $^ $(LDLIBS)
$(T_VAR_CMD) : t_var.o rtkcmn.o pntpos.o sbas.o ionex.o qzslex.o \
               ephemeris.o preceph.o rtcm.o rtcm2.o rtcm3.o rtcm3e.o
	$(CC) -o $@ $^ $(LDLIBS)
$(T_PL_CMD) : t_waasprotlevels.o rtkcmn.o sbas.o
	$(CC) -o $@ $^ $(LDLIBS)

t_waasprotlevels.o : t_waasprotlevels.c $(SRC)/rtklib.h utest.h makefile
	$(CC) -c $(CFLAGS) t_waasprotlevels.c -o $@

# Pattern rule for generating object files from C files in the RTKLIB
# source directory.
%.o : $(SRC)/%.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) $< -o $@

# Pattern rule for generating object files from C files in this
# directory.
%.o : %.c $(SRC)/rtklib.h makefile
	$(CC) -c $(CFLAGS) $< -o $@

.PHONY : print-all-test-summary
print-all-test-summary : utest
	./print_test_summary.sh;

.PHONY : utest
utest : t_matrix.out t_time.out t_coord.out t_rinex.out t_lambda.out t_atmos.out
utest : t_misc.out t_preceph.out t_gloeph.out
utest : t_ionex.out t_tle.out t_var.out t_pl.out

t_matrix.out : $(T_MATRIX_CMD)
	-$(T_MATRIX_CMD)  > t_matrix.out 2>&1
t_time.out : $(T_TIME_CMD)
	-$(T_TIME_CMD)    > t_time.out 2>&1
t_coord.out : $(T_COORD_CMD)
	-$(T_COORD_CMD)   > t_coord.out 2>&1
t_rinex.out : $(T_RINEX_CMD)
	-$(T_RINEX_CMD)   > t_rinex.out 2>&1
t_lambda.out : $(T_LAMBDA_CMD)
	-$(T_LAMBDA_CMD)  > t_lambda.out 2>&1
t_atmos.out : $(T_ATMOS_CMD)
	-$(T_ATMOS_CMD)   > t_atmos.out 2>&1
t_misc.out : $(T_MISC_CMD)
	-$(T_MISC_CMD)    > t_misc.out 2>&1
t_preceph.out : $(T_PRECEPH_CMD)
	-$(T_PRECEPH_CMD) > t_preceph.out 2>&1
t_gloeph.out : $(T_GLOEPH_CMD)
	-$(T_GLOEPH_CMD)  > t_gloeph.out 2>&1
t_geoid.out : $(T_GEOID_CMD)
	-$(T_GEOID_CMD)   > t_geoid.out 2>&1
t_ppp.out : $(T_PPP_CMD)
	-$(T_PPP_CMD)     > t_ppp.out 2>&1
t_ionex.out : $(T_IONEX_CMD)
	-$(T_IONEX_CMD)   > t_ionex.out 2>&1
t_stec.out : $(T_STEC_CMD)
	-$(T_STEC_CMD)    > t_stec.out 2>&1
t_tle.out : $(T_TLE_CMD)
	-$(T_TLE_CMD)     > t_tle.out 2>&1
t_var.out : $(T_VAR_CMD)
	-$(T_VAR_CMD)  > t_var.out 2>&1
t_pl.out : $(T_PL_CMD)
	-$(T_PL_CMD)  > t_pl.out 2>&1
	
clean :
	rm -f *.o *.out *.exe $(BIN) *.stackdump gmon.out

