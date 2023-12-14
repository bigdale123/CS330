FILE = lab11

build: $(FILE).s
	# Use this command if not compiling on vulcan
	#gcc -Wall -g $(FILE).s -o $(FILE) -lm -fno-pie -no-pie

	# use this command to compile on vulcan (enabled by default)
	gcc -Wall -g $(FILE).s -o $(FILE) -lm

.PHONY: db

db:
	gdb -tui $(FILE)

run:
	./$(FILE)