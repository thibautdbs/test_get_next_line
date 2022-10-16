# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tdubois <tdubois@marvin.42.fr>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/12 10:36:13 by tdubois           #+#    #+#              #
#    Updated: 2022/10/16 03:15:29 by tdubois          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC = main.c ../get_next_line.c ../get_next_line_utils.c
INCLUDE = ..


CC = cc
CFLAGS := -Wall -Wextra -Werror -I $(INCLUDE)

all: build

build:
	@echo '=============== BUILD ==============='
	$(CC) $(CFLAGS) $(SRC) -o test.out

debug: CFLAGS += -g
debug: build
	gdb ./test.out

test: build
	@echo '=============== TEST ================'
	bash ./test.bash test.out

.PHONY: all test build
