pragma solidity ^0.8.1;

contract SendMoneyExample {
    uint public balanceReceived;
    uint public lockedUntil;
    
    function receiveMoney() public payable {
        balanceReceived += msg.value;
        lockedUntil = block.timestamp + 1 minutes;
    }
    
    function getBalance() public view returns(uint){
        return address(this).balance; //this line essentially returns the amount of Ether that are stored on the Smart Contract itself
    }
    
    function withdrawMoney() public {
        address payable to = payable(msg.sender);
        if(lockedUntil < block.timestamp) {
            to.transfer(getBalance());
        }
    }
    
    function withdrawMoneyTo(address payable _to) public {
        if(lockedUntil < block.timestamp){
            _to.transfer(getBalance());
        }
    }
}
