package com.easywallet.ActivitiesPage;

import java.util.UUID;

public class RandomTransactionID {

	public String generateTransactionID() {

		String temp;
		String code = "TRA";
		temp = UUID.randomUUID().toString();
		code += temp.substring(0, 2);
		code += temp.substring(9, 10);
		code += temp.substring(14, 15);
		code += temp.substring(19, 20);
		code += temp.substring(24, 25);
		return code.toUpperCase();

	}

}
