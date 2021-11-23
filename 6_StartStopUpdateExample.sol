// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

contract StartStopUpdateExample {
    address public owner;
    bool public paused;
    
    constructor() { //special function that is called only once during contract deployment
        owner = msg.sender;
    }
    
    function SendMoney() public payable { //receiving Ether
        
    }
    
    function setPaused(bool _paused) public {
        require(msg.sender == owner, "You are not the owner");
        paused = _paused;
    }
    
    function withdrawAllMoney(address payable _to) public {
        //if(msg.sender == owner) {                         this doesn't work in solidity, we need "require"
        require(owner == msg.sender, "You cannot withdraw."); //If the require evaluates to false it will stop the transaction, roll-back any changes made so far and emit the error message as String.
        require(!paused, "Contract is paused");
        _to.transfer(address(this).balance);
        //} else {
        //   new Exception(...)
        //}
    }
    
    //We can not erase information from the Blockchain, but we can update the current state so that you can't interact with an address anymore going forward. 
    //Everyone can always go back in time and check what was the value on day X, but, once selfdestruct is called, you can't interact with a Smart Contract anymore
    //here might be an Ethereum Protocol update coming ahead which removes the SELFDESTRUCT functionality
    function destroySmartContract(address payable _to) public {
        require(msg.sender == owner, "You are not the owner");
        selfdestruct(_to); //selfdestruct(msg.sender) is also possible
    }
    //Once you call destroySmartContract, the address of the Smart Contract will contain no more code. 
    //You can still send transactions to the address and transfer Ether there, but there won't be any code that could send you the Ether back.
    //Once scenario, which is not in the course videos, is in-place upgrades. Since the CREATE2 Op-Code was introduced, you can pre-compute a contract address.
    //With the CREATE2 op-code you can instruct the EVM to place your Smart Contract on a specific address. Then you could call selfdestruct(), thus remove the source code. 
    //Then re-deploy a different Smart Contract to the same address!!!
}
