//SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract MappingsStructExample {
    
    struct Payment {
        uint amount;
        uint timestamp;
    }
    
    struct Balance {
        uint totalBalance;
        uint numPayments;
        mapping(uint => Payment) payments;
    }
    
    mapping(address => Balance) public balanceReceived;
    
    function getBalance() public view returns (uint) {
        return address(this).balance; 
    }
    
    function sendMoney() public payable {
        balanceReceived[msg.sender].totalBalance += msg.value; //When someone sends money using the "sendMoney" function, we track the msg.value (amount in Wei) 
                                                //with the balanceReceived mapping for the person who interacted with the Smart Contract.
        Payment memory payment = Payment(msg.value,block.timestamp);
        balanceReceived[msg.sender].payments[balanceReceived[msg.sender].numPayments] = payment;
        balanceReceived[msg.sender].numPayments++;
    }
    
    function withdrawMoney(address payable _to, uint _amount) public {
        require(balanceReceived[msg.sender].totalBalance >= _amount, "Not enough funds");
        balanceReceived[msg.sender].totalBalance -= _amount;
        _to.transfer(_amount);
    } 
    
    function withdrawAllMoney(address payable _to) public {
        uint balanceToSend = balanceReceived[msg.sender].totalBalance; //we look in that mapping how much he sent there previously
        balanceReceived[msg.sender].totalBalance = 0; //then reset the mapping
        _to.transfer(balanceToSend); //and send the amount.
        //Re-Entrancy and Checks-Effects-Interaction Pattern !!!
    }
}
