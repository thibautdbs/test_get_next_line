# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    test.bash                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tdubois <tdubois@marvin.42.fr>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/12 16:58:46 by tdubois           #+#    #+#              #
#    Updated: 2022/10/12 17:51:42 by tdubois          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

run="$(pwd)/test.out"

read -r -d '' input <<'EOF'
jawdijawid
wdajwdiawd
awdaw
EOF


echo $input

output=$(cat << 'EOF'
jawdijawid
EOF
)


testEquality() {
	assertEquals "$(echo $input | $run 1 0)" "$output"
}

source shunit2/shunit2
