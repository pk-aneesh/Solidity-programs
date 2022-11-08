// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;	
contract constructorExample {	
	string str;	
	constructor() public {				
		str = "hello";	
	}	
	function getValue(
	) public view returns (
	string memory) {	
		return str;	
	}	
}
