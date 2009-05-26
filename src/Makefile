all:
	gcc -shared -fPIC $(CFLAGS) -Wall -o lapack_wrapper.so \
		-L$(MKLROOT)/lib/em64t -lmkl_gf_lp64 \
		-lmkl_gnu_thread -lmkl_core -lm -lgomp -lgfortran -lpthread \
		lapack_wrapper.c

clean:
	rm *.so
	rm *.fasl
	rm *.ufasl
	rm *.64ufasl
