# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    test.bash                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tdubois <tdubois@marvin.42.fr>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/12 16:58:46 by tdubois           #+#    #+#              #
#    Updated: 2022/10/13 10:24:14 by tdubois          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

run="$(pwd)/test.out"

test__read_one_line_from_stdin() {
	read -r -d '' input <<-EOF
		jawdijawid
		wdajwdiawd
		awdaw
	EOF

	read -r -d '' expected_output <<-EOF
		jawdijawid
	EOF

	assertEquals "$expected_output" "$(echo "$input" | $run 1 0)"
	return 0
}

source shunit2/shunit2
