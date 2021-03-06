all: bin/teststd bin/testc bin/testas

clean:
	rm -rf bin lib obj

.PHONY: all clean

bin/teststd: obj/main.o | bin
	$(CC) $< -o $@

bin/testc: obj/main.o lib/librandc.a | bin
	$(CC) $< -L./lib -lrandc -o $@

bin/testas: obj/main.o lib/librandas.a | bin
	$(CC) $< -L./lib -lrandas -o $@

lib/libcsrand.a: lib/librandas.a
	cp $< $@

lib/lib%.a: obj/%.o | lib
	rm -rf $@
	ar rcs $@ $<

obj/main.o: src/main.c | obj
	$(CC) -o $@ -c $<

obj/randc.o: src/rand.c | obj
	$(CC) -o $@ -c $<

obj/randstd.o: src/randstd.c | obj
	$(CC) -o $@ -c $<

obj/randas.o: src/rand.S | obj
	as -o $@ $<

obj bin lib:
	mkdir -p $@
