.PHONY = clean test
cpp_files := $(wildcard src/*.cpp)

sqifc: $(cpp_files)
	g++ -o $@ $(cpp_files)

tests: sqifc
	./sqifc test/dining.qif
	./sqifc test/grade.qif

clean:
	rm -f sqifc
