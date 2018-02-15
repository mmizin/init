# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    04                                                 :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nmizin <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/02/13 19:44:34 by nmizin            #+#    #+#              #
#    Updated: 2018/02/13 20:14:18 by nmizin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bash

if [ ! -e .check.md5 ]
then
	md5sum /etc/crontab > ./check.md5
fi

if [[ $(md5sum -c ./check.md5 | grep FAILED) ]]
then 
	echo "File was changed" | mail -s "your file was changed" root
fi

if [[ ! $(crontab -l | grep 04.sh) ]]
then
	(crontab -l 2>/dev/null; echo "0 0 * * * /$(PWD)/04.sh") | crontab -
fi 

