/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tdubois <tdubois@marvin.42.fr>             +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/12 16:20:34 by tdubois           #+#    #+#             */
/*   Updated: 2022/10/12 16:36:44 by tdubois          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "get_next_line.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>

#define FILENAME "test.txt"

int	main(int argc, char **argv)
{
	if (argc != 3)
	{
		return (1);
	}

	int const	line_number = atoi(argv[1]);

	int		fd;
	char	*line;

	if (strcmp(argv[1], "null") == 0)
	{
		fd = open(FILENAME, O_RDONLY);
	}
	else
	{
		fd = atoi(argv[2]);
	}

	for (int i = 0; i < line_number; i += 1)
	{
		line = get_next_line(fd);
		printf("%s", line);
	}

	if (strcmp(argv[1], "null") == 0)
	{
		close(fd);
	}

	return (0);
}
