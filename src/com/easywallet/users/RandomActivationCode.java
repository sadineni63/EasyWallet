package com.easywallet.users;

import java.util.ArrayList;
import java.util.UUID;

public class RandomActivationCode {
	public String generateActivationCode() {

		String temp;
		String code = "";
		temp = UUID.randomUUID().toString();
		code += temp.substring(0, 2);
		code += temp.substring(9, 10);
		code += temp.substring(14, 15);
		code += temp.substring(19, 20);
		code += temp.substring(24, 25);
		System.out.println(code.toUpperCase());
		return code.toUpperCase();

	}

}
