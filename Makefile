# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tdubois <tdubois@marvin.42.fr>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/12 10:36:13 by tdubois           #+#    #+#              #
#    Updated: 2022/10/12 16:49:44 by tdubois          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC = get_next_line.c get_next_line_utils.c test.c
INCLUDE = ..
PATH = ..

CC = cc
CFLAGS = -Wall -Wextra -Werror -I $(INCLUDE)

all: build

build:
	#echo '=============== BUILD ==============='
	$(CC) $(CFLAGS) $(SRC=%:$(PATH)/%) -o test.out

test: build
	@echo '=============== TEST ================'
	bash ./test.bash test.out

.PHONY: all test build
