pragma solidity ^0.5.11;

contract EventExample {
    
    mapping(address => uint) public TokenBalance;
    
    event TokensSend(address _from, address _to, uint _amount);
    
    constructor() public {
        TokenBalance[msg.sender] = 100;
    }
    
    function sendToken(address _to, uint _amount) public returns(bool) {
        require(TokenBalance[msg.sender] >= _amount, "Not enough tokens.");
        assert(TokenBalance[msg.sender] - _amount <= TokenBalance[msg.sender]);
        assert(TokenBalance[_to] + _amount >= TokenBalance[_to]);
        
        TokenBalance[msg.sender] -= _amount;
        TokenBalance[_to] += _amount;
        
        emit TokensSend(msg.sender, _to, _amount);
        
        return true;
    }
    
}