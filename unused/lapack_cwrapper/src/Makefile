include ../make.inc 
include obj_list.in

.c.o:
	$(CC) $(INCLUDE) $(OPTS) -c $<

.f.o:
	$(FORTRAN) $(OPTS) -c $<

all: single complex double complex16 

example2: $(DEMO_DIR)/example2.o single 
	@echo "Compilation done for $<..."
	$(CC) example2.o $(LAWRAPLIB) $(LIB)  -o $(DEMO_DIR)/$@.exe 
	@echo "Link done for $<..."

example4: $(DEMO_DIR)/example4.o complex16
	@echo "Compilation done for $<..."
	$(CC) example4.o $(LAWRAPLIB) $(LIB)  -o $(DEMO_DIR)/$@.exe 
	@echo "Link done for $<..."

example1: $(DEMO_DIR)/example1.o double
	@echo "Compilation done for $<..."
	$(CC) example1.o $(LAWRAPLIB) $(LIB)  -o $(DEMO_DIR)/$@.exe 
	@echo "Link done for $<..."

example_syev: $(DEMO_DIR)/example_syev.o double complex16
	@echo "Compilation done for $<..."
	$(CC) example_syev.o $(LAWRAPLIB) $(LIB) -o $(DEMO_DIR)/$@.exe 
	@echo "Link done for $<..."

example_syevd: $(DEMO_DIR)/example_syevd.o double complex16
	@echo "Compilation done for $<..."
	$(CC) example_syevd.o $(LAWRAPLIB) $(LIB)  -o $(DEMO_DIR)/$@.exe 
	@echo "Link done for $<..."

example_syevr: $(DEMO_DIR)/example_syevr.o double complex16
	@echo "Compilation done for $<..."
	$(CC) example_syevr.o $(LAWRAPLIB) $(LIB)  -o $(DEMO_DIR)/$@.exe 
	@echo "Link done for $<..."

example_syevx: $(DEMO_DIR)/example_syevx.o double complex16
	@echo "Compilation done for $<..."
	$(CC) example_syevx.o $(LAWRAPLIB) $(LIB)  -o $(DEMO_DIR)/$@.exe 
	@echo "Link done for $<..."

example_dlacon: $(DEMO_DIR)/example_dlacon.o double
	@echo "Compilation done for $<..."
	$(CC) example_dlacon.o $(LAWRAPLIB) $(LIB)  -o $(DEMO_DIR)/$@.exe 
	@echo "Link done for $<..."

single: $(SLASRC) $(AUXSRC)
	$(ARCH) $(ARCHFLAGS) $(LAWRAPLIB)  $(SLASRC) $(AUXSRC)
	$(RANLIB) $(LAWRAPLIB)

complex: $(CLASRC) single
	$(ARCH) $(ARCHFLAGS) $(LAWRAPLIB) $(CLASRC) $(SLASRC) $(AUXSRC)
	$(RANLIB) $(LAWRAPLIB)

double: $(DLASRC) $(AUXSRC)
	$(ARCH) $(ARCHFLAGS) $(LAWRAPLIB) $(DLASRC) $(AUXSRC)
	$(RANLIB) $(LAWRAPLIB)

complex16: $(ZLASRC) double
	$(ARCH) $(ARCHFLAGS) $(LAWRAPLIB) $(ZLASRC) $(DLASRC) $(AUXSRC)
	$(RANLIB) $(LAWRAPLIB)

clean:
	rm -f *.o
