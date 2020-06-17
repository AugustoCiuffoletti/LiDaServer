#!/bin/bash
echo -n "Enter password for admin user: "
read pass
mongo <<-SCRIPT
	use mymongodb	
	db.getCollection("lida_users").remove({userName: "admin"})
	db.getCollection("lida_users").insert({userName: "admin", password: "$pass", email: "void"})
SCRIPT
