include ../make.inc


.c.o:
	$(CC) $(INCLUDE) $(OPTS) -c $<

.f.o:
	$(FORTRAN) $(OPTS) -c $<

all: example2 example4 example1 example_syev example_syevd example_syevr example_syevx 

example2: example2.o 
	@echo "Compilation done for $<..."
	$(CC) example2.o $(LAWRAPLIB) $(LIB)  -o $@.exe 
	@echo "Link done for $<..."

example4: example4.o 
	@echo "Compilation done for $<..."
	$(CC) example4.o $(LAWRAPLIB) $(LIB)  -o $@.exe 
	@echo "Link done for $<..."

example1: example1.o 
	@echo "Compilation done for $<..."
	$(CC) example1.o $(LAWRAPLIB) $(LIB)  -o $@.exe 
	@echo "Link done for $<..."

example_syev: example_syev.o 
	@echo "Compilation done for $<..."
	$(CC) example_syev.o $(LAWRAPLIB) $(LIB) -o $@.exe 
	@echo "Link done for $<..."

example_syevd: example_syevd.o 
	@echo "Compilation done for $<..."
	$(CC) example_syevd.o $(LAWRAPLIB) $(LIB)  -o $@.exe 
	@echo "Link done for $<..."

example_syevr: example_syevr.o 
	@echo "Compilation done for $<..."
	$(CC) example_syevr.o $(LAWRAPLIB) $(LIB)  -o $@.exe 
	@echo "Link done for $<..."

example_syevx: example_syevx.o 
	@echo "Compilation done for $<..."
	$(CC) example_syevx.o $(LAWRAPLIB) $(LIB)  -o $@.exe 
	@echo "Link done for $<..."
