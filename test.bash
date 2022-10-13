# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    test.bash                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tdubois <tdubois@marvin.42.fr>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/12 16:58:46 by tdubois           #+#    #+#              #
#    Updated: 2022/10/13 11:29:32 by tdubois          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

bin="$(pwd)/test.out"

function run() {
	local output
	output="$(cat - | valgrind --error-exitcode=1 $bin $1 $2 2>&1)"
	if [ $? -eq 1 ] #if valgrind threw error
	then
		echo -e "\n--> Valgrind error\n$output\n" 1>&2
	fi
	echo "$output" | grep -v ==
}

test__read_one_line_from_stdin() {
	read -r -d '' input <<-EOF
		jawdijawid
		wdajwdiawd
		awdaw
	EOF

	read -r -d '' expected_output <<-EOF
		jawdijawid
	EOF
	
	output="$(echo "$input" | run 1 0)"

	assertEquals "$expected_output"	"$output"
	return 0
}

source shunit2/shunit2
