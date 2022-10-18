#!/bin/bash

binary="$(pwd)/$1"
shift $# #erases argv
tmpdir='/tmp/.test_get_next_line'
mkdir -p $tmpdir

function valgrind_run() {
	local vgflags='--error-exitcode=1 -q'
	local output #can't initialize on same line to retrieve exit code

	output="$(cat - | valgrind $vgflags $binary $@ 2>&1)"

	if [ $? -eq 1 ] #if valgrind threw error
	then
		cat <<-END 1>&2

		--> BEGIN Valgrind output
		$output
		--> END Valgrind output

		END
	fi
	echo -n "$output" 
}

function fd() {
	local lines=$(cat)
	local fifo=$tmpdir/fd$1

	rm -f $fifo
	mkfifo $fifo
	eval "exec $1<>$fifo"
	echo "$lines" >& $1
}

#sets var with name $1 to value given with heredoc and remove trailing newline
function heredoc() {
	IFS= read -r -d '' content < <(cat - | sed -z '$ s/\n$//')
	local var="$1"

	declare -g "$var"="$content"
}

test__read_one_line_from_stdin() {
	heredoc input <<-EOF
		jawdijawid
		wdajwdiawd

		awdaw
	EOF

	heredoc expected_output <<-EOF
		jawdijawid
	EOF

	output="$(echo "$input" | valgrind_run 0 1)"

	assertEquals "$expected_output"	"$output"
	return 0
}

test__read_two_lines_from_stdin() {
	heredoc input <<-EOF
		jawdijawid
		wdajwdiawd
		awdaw
	EOF

	heredoc expected_output <<-EOF
		jawdijawid
		wdajwdiawd
	EOF
	
	output="$(echo "$input" | valgrind_run 0 2)"

	assertEquals "$expected_output"	"$output"
	return 0
}

source shunit2/shunit2
