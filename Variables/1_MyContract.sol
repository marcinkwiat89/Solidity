// SPDX-License-Identifier: GPL-3.0
//The The Software Package Data Exchange® (SPDX®) identifier is there to clearly communicate the license under which the Solidity 
//file will be made available. Well, if you make it available. But you should. Smart Contracts transparency and trust greatly 
//benefit from the source being published and sometimes it's not 100% clear under which license the source is out in the wild. 
//The SPDX identifier is optional, but recommended.

pragma solidity ^0.8.1;
//The pragma keyword is for the compiler to enable certain features or check certain things. The version pragma is a safety measure, 
//to let the compiler know for which compiler version the Solidity file was written for. It follows the SemVer versioning standard. 
//^0.8.1 means >=0.8.1 and <0.9.0.

contract MyContract { //That's the actual beginning of the Smart Contract. Like a Class in almost any other programming language.
    string public myString = 'hello world'; //That is a storage variable. It's public and Solidity will automatically generate a getter function for it - you'll see that in a minute!
}
