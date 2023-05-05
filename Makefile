CFLAGS = -Wall -Werror -Wextra

all: s21_cat clean

s21_cat: s21_cat.o
	gcc $(CFLAGS) s21_cat.o -o s21_cat

s21_cat.o: s21_cat.c
	gcc $(CFLAGS) s21_cat.c -c

test: s21_cat
	chmod +x test_func_cat.sh
	./test_func_cat.sh
	rm -rf *.o

leak: s21_cat
	chmod +x test_leak_cat.sh
	./test_leak_cat.sh
	rm -rf *.o

style:
	cp ../../materials/linters/.clang-format ./
	clang-format -n *.c *.h

clean:
	rm -rf *.o

rebuild: all