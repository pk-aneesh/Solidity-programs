pragma solidity ^0.5.0;
contract simpleBank {
    mapping(address => uint256) balances;
    function deposite() payable public {
        balances[msg.sender] += msg.value;
    }
    function withdraw (uint256 amount) public {
        require (balances[msg.sender] > amount );
        if (msg.sender .call.value (amount) ("")) {
             revert ();
        }
        balances[msg.sender] -= amount;
    }
}
