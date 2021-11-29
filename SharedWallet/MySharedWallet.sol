//SPDX-License-Identifier: MIT

pragma solidity ^0.8.1;

contract MySharedWallet {
    mapping(address => uint) public allowance;
    address payable owner;
    
    constructor() {
        owner = payable(msg.sender);
    }
    
    modifier onlyOwner {
        require(msg.sender == owner, "You are not allowed.");
        _;
    }
    
    function receiveMoney() public payable {
    }
    
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
    
    function changeAllowance(address _who, uint _amount) public onlyOwner {
        allowance[_who] = _amount;
    }
    
    function withdrawMoney(uint _amount) public payable {
        require(_amount <= allowance[msg.sender], "You don't have enough allowance.");
        address payable receiver = payable(msg.sender);
        receiver.transfer(_amount);
    }
    
    receive () external payable {
        receiveMoney();
    }
}