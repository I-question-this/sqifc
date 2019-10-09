.phony = clean test
cpp_files := $(wildcard src/*.cpp)
qif_files := $(wildcard test/*.qif)

sqifc: $(cpp_files)
	g++ -o $@ $(cpp_files)

tests: sqifc logs
	for qif in $(qif_files); do \
		logName=$$(basename $$qif) ; \
		logName=logs/$${logName%.*}.log ; \
		./sqifc $$qif > stdout.txt 2> stderr.txt ; \
		echo "Results:" > $$logName ; \
		cat stdout.txt >> $$logName ; \
		echo "" >> $$logName ; \
		echo "Errors:" >> $$logName ; \
		cat stderr.txt >> $$logName ; \
		rm stdout.txt stderr.txt ; \
	done

logs:
	mkdir logs

clean:
	rm -f sqifc
	rm -rf logs/
