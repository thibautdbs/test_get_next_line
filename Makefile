# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tdubois <tdubois@marvin.42.fr>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/12 10:36:13 by tdubois           #+#    #+#              #
#    Updated: 2022/10/12 17:35:08 by tdubois          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC = test.c ../get_next_line.c ../get_next_line_utils.c
INCLUDE = ..


CC = cc
CFLAGS := -Wall -Wextra -Werror -I $(INCLUDE)

all: build

build:
	@echo '=============== BUILD ==============='
	$(CC) $(CFLAGS) $(SRC) -o test.out

test: build
	@echo '=============== TEST ================'
	bash ./test.bash

.PHONY: all test build
