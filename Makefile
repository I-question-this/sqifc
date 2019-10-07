.PHONY = clean
cpp_files := $(wildcard src/*.cpp)

sqifc: $(cpp_files)
	g++ -o $@ $(cpp_files)

clean:
	rm sqifc
