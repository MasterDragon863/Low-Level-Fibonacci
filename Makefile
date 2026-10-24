c:
	gcc fib.c -o fib_c

py:
	python fib.py

s:
	as fib.s -o fib_s.o
	ld -o fib_s fib_s.o
	rm *.o

hex:
	cat fib.hex | grep -v "#" | tr -d ' \t\n\r' > clean.hex
	xxd -p -r clean.hex binary.bin
	chmod +x binary.bin

clean:
	rm fib_s fib_c clean.hex binary.bin
