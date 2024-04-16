##
## EPITECH PROJECT, 2021
## Makefile
## File description:
## Makefile (Project)
##

NAME        = libasm.so

SRC    = src/strlen.asm        \
          src/strcmp.asm        \
          src/strncmp.asm        \
          src/strchr.asm        \
          src/memset.asm        \
          src/memcpy.asm	\
          src/strcasecmp.asm	\
          src/strstr.asm \
          src/strrchr.asm \
          src/strpbrk.asm \
          src/strcspn.asm \
          src/memmove.asm \
          src/rindex.asm \
          src/index.asm \

OBJS        = $(SRC:.asm=.o)

all: $(NAME)

$(NAME): $(OBJS)
	ld -fPIC -shared -o $(NAME) $(OBJS)
	gcc test/main.c

%.o: %.asm
	nasm -f elf64 $< -o $@

clean:
	rm -rf $(OBJS)

fclean: clean
	rm -rf $(NAME)
	rm -rf a.out

re:    fclean all
