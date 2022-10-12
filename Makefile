# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tdubois <tdubois@marvin.42.fr>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/12 10:36:13 by tdubois           #+#    #+#              #
#    Updated: 2022/10/12 11:15:29 by tdubois          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: test

build:
	@echo '=============== BUILD ==============='
	cmake -S . -B build
	cmake --build build

test: build
	@echo '=============== TEST ================'
	cd build && ./runtests

.PHONY: all test build
