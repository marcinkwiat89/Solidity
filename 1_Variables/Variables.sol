pragma solidity ^0.5.13;

contract WorkingWithVariables {
    uint256 public myUint; //all variables no matter the type are initialized with the default value for uint is 0
    
    function setMyUint(uint _myUint) public { // '_'before variable name helps understand that variable comes from outside
        myUint = _myUint;
    }
    
    bool public myBool;
    
    function setMyBool (bool _myBool) public {
        myBool = _myBool;
    }
    
    uint8 public myUint8;
    
    function incrementUint() public {
        myUint8++;
    }
    
    function decrementUint() public { //be careful!!! variables are silently wrapping around!!! myUint8=0, decrement -> myUint8=255
        myUint8--;
    }
    
    address public myAddress;
    
    function setAddress (address _address) public {
        myAddress = _address;
    }
    
    function getBalanceOfAddress () public view returns(uint) { // view means it is a reading function, not writing anything
        return myAddress.balance;
    }
    
    string public myString;// = 'hello world';
    
    function setMyString(string memory _myString) public { //for 'string' or any other refernce types must be 'memory', where the argument is stored
        myString = _myString;
        //not as easy as in other lang.-can not concat, search, replace. Are stored as a dynamicallly sized byte array, just converted to UTF8 
        //it is also quite expensive, cost lot of ether. Better - store outside of blockchain, as an event or hash
    }
}
