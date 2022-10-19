/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tdubois <tdubois@marvin.42.fr>             +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/12 16:20:34 by tdubois           #+#    #+#             */
/*   Updated: 2022/10/19 10:53:55 by tdubois          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "get_next_line.h"
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int	main(int argc, char **argv)
{
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
