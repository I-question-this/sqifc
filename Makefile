.PHONY = clean
cpp_files := $(wildcard src/*.cpp)

sqifc:
	g++ -o $@ $(cpp_files)

clean:
	rm sqifc
