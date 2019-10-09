TARGET := sqifc

SRCDIR := src
TESTDIR := test
LOGDIR := logs

SOURCES := $(wildcard $(SRCDIR)/*.cpp)
TESTS := $(wildcard $(TESTDIR)/*.qif)

.phony = clean test

$(TARGET): $(SOURCES)
	g++ -o $@ $(SOURCES)

tests: $(TARGET) $(LOGDIR)
	for qif in $(TESTS); do \
		logName=$$(basename $$qif) ; \
		logName=$(LOGDIR)/$${logName%.*}.log ; \
		./$(TARGET) $$qif > stdout.txt 2> stderr.txt ; \
		echo "Results:" > $$logName ; \
		cat stdout.txt >> $$logName ; \
		echo "" >> $$logName ; \
		echo "Errors:" >> $$logName ; \
		cat stderr.txt >> $$logName ; \
		rm stdout.txt stderr.txt ; \
	done

$(LOGDIR):
	mkdir $(LOGDIR)

clean:
	rm -f $(TARGET)
	rm -rf $(LOGDIR)
