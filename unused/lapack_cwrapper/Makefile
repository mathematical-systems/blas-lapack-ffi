include make.inc


all: source library test

source:
	cd $(SRC_DIR) && $(ROOT_DIR)/script/cwrapper_generator.pl $(LASRCDIR)/*.f && $(ROOT_DIR)/script/make_make_src.pl && cp $(SRC_DIR)/pregen_src/src/* $(SRC_DIR) && make && cd $(ROOT_DIR)

library:
	cd $(SRC_DIR) && make && cd $(ROOT_DIR)

test:
	cd $(TEST_LAPACK_CPREFIX)/lapack/SRC && make
	cd $(TEST_WRAPPER) && $(ROOT_DIR)/script/make_make_src.pl && make
	cd $(TEST_MAIN)/MATGEN && make && cd $(TEST_MAIN) && make

example:
	cd $(EXAMPLE_DIR) && make
