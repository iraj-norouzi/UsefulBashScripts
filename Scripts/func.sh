#!/bin/bash


function master_monitor {
	usercount_master=` psql -U postgres -h 10.11.14.70 -c 'select count("id") from "user";' | tail -n3 | head -n 1 | awk '{print$1}'  `
	echo "$usercount_master" > /home/script/master_user

}

function slave1_monitor {
	usercount_master=` psql -U postgres -h 10.11.14.71 -c 'select count("id") from "user";' | tail -n3 | head -n 1 | awk '{print$1}'  `
	echo "$usercount_master" > /home/script/slave1_user

}

function slave2_monitor {
	usercount_master=` psql -U postgres -h 10.11.14.72 -c 'select count("id") from "user";' | tail -n3 | head -n 1 | awk '{print$1}'  `
	echo "$usercount_master" > /home/script/slave2_user

}



master_monitor
slave1_monitor
slave2_monitor
