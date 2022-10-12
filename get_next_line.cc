/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line.cc                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tdubois <tdubois@marvin.42.fr>             +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/12 10:39:55 by tdubois           #+#    #+#             */
/*   Updated: 2022/10/12 11:34:05 by tdubois          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "gtest/gtest.h"

extern "C" {
#include "get_next_line.h"
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
}

TEST(get_next_line, empty_file) {
	char path[] = "empty_file.txt";

	int fd = open(path, O_CREAT);
	close(fd);

	fd = open(path, O_RDONLY);
	char *line0 = get_next_line(fd);
	close(fd);

	printf("get_next_line(0)='%s'\n", line0);
	EXPECT_STREQ(line0, nullptr);

	free(line0);
}
