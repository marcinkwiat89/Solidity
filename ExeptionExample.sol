//SPDX-License-Identifier: MIT

pragma solidity 0.6.12;

contract ExeptionExample {
    mapping(address => uint64) public balanceReceived;
    
    function receiveMoney() public payable {
        assert(msg.value == uint64(msg.value)); //Asserts are here to check states of your Smart Contract that should never be violated. 
        //For example: a balance can only get bigger if we add values or get smaller if we reduce values.
        balanceReceived[msg.sender] += uint64(msg.value); //casting to uint64
        assert(balanceReceived[msg.sender] >= uint64(msg.value));
    }
    
    function withdrawMoney(address payable _to, uint64 _amount) public {
        require(_amount <= balanceReceived[msg.sender], "Not enough funds. Aborting.");
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}