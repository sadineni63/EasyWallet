package com.easywallet.users;

import java.util.UUID;

public class RandomUserID {
	public String generateUserID() {

		String temp;
		String uid = "U";
		temp = UUID.randomUUID().toString();
		uid += temp.substring(0, 2);
		uid += temp.substring(9, 10);
		uid += temp.substring(14, 15);
		uid += temp.substring(19, 20);
		uid += temp.substring(24, 25);
		return uid.toUpperCase();

	}

}
