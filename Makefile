
NAME= gnl

################################################################################

SRC= ./main.c ../get_next_line.c ../get_next_line_utils.c
INCLUDE= ..

CC= gcc
CFLAGS= -Wall -Werror -Wextra -ggdb3 -I$(INCLUDE)

all: test

################################################################################

test: $(NAME)
	@echo ============================= Test ===================================
	@./test

gdb-%:
	@./test gdb $*

.PHONY: test gdb-%

$(NAME): $(SRC)
	@echo ============================= Build ==================================
	$(CC) $(CFLAGS) -o $(NAME) $(SRC) -D BUFFER_SIZE=1

################################################################################

clean:

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
