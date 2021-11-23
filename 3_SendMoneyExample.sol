pragma solidity ^0.5.13;

contract SendMoneyExample {
    
    uint public balanceReceived;
    
    function receiveMoney() public payable { //'payable': this function is going to receive money
        balanceReceived += msg.value; //amount in wei that was transferred with this transaction
    }
    
    function getBalance () public view returns(uint) {
        return address(this).balance;
    }
    
    function withdrawMoney() public { //does not need to be 'payable', cause we get money out, not sending in
        address payable to = msg.sender; //here is stored address that called this smart contract
        to.transfer(this.getBalance());
    }
    
    function withdrawMoneyTo(address payable _to) public {
        _to.transfer(this.getBalance());
    }
}
