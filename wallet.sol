// SPDX-License-Identifier: MIT

pragma solidity ^0.4.19;

contract Wallet {

    address owner;    // current owner of the contract
      mapping (address => uint256 ) public balances;

    constructor() public {
        owner = msg.sender;
    }

    function withdraw() public {
        require(owner == msg.sender);
        msg.sender.transfer(address(this).balance);
    }

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
