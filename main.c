/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tdubois <tdubois@marvin.42.fr>             +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/12 16:20:34 by tdubois           #+#    #+#             */
/*   Updated: 2022/10/18 18:45:20 by tdubois          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "get_next_line.h"
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int	main(int argc, char **argv)
{
	if (argc == 1)// trhow valgrind error
	{
		char	*ptr = malloc(1);
		ptr[1] = 0;
		free(ptr);
		return (0);
	}

	if ((argc - 1) % 2 != 0)
	{
		printf("wrong number of arguments");
		return (1);
	}

	int		fd;
	int		line_number;
	char	*line;

	for (int i = 1; i < argc; i += 2)
	{
		fd = atoi(argv[i]);
		line_number = atoi(argv[i + 1]);
		for (int j = 0; j < line_number; j +=1)
		{
			line = get_next_line(fd);
			printf("%s", line);
			if (line != NULL)
			{
				free(line);
			}
		}
	}
	return (0);
}
