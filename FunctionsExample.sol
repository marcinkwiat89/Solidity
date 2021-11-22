//SPDX-License-Identifier: MIT

pragma solidity 0.8.3;

contract FunctionsExample {
    
    address payable owner;
    mapping(address => uint) public balanceReceived;
    
    constructor() {
        owner = payable(msg.sender);
    }
    
    function getOwner() public view returns(address) {
        return owner;
    }
    
    function convertWeiToEth(uint _wei) public pure returns(uint) {
        return _wei / 1 ether;
    }
    
    function destroySmartContract() public {
        require(msg.sender == owner, "You are not the owner.");
        selfdestruct(owner);
    }
    
    function receiveMoney() public payable {
        assert(balanceReceived[msg.sender] + msg.value >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += msg.value;
    }
    
    function withdrawMoney(address payable _to, uint _amount) public {
        require(_amount <= balanceReceived[msg.sender], "Not enough funds.");
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
    
    receive() external payable {
        receiveMoney();
    }
}