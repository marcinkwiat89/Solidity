// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.0; //In Solidity 0.8, the compiler will automatically take care of checking for overflows and underflows

contract RolloverExample {
    uint8 public myUint8;
    
    function decrement () public {
        unchecked{ //with "unchecked" block you can wrap your variables around
            myUint8--;
        }
    }
    
    function increment () public {
        unchecked{ //with "unchecked" block you can wrap your variables around
            myUint8++;
        }
    }
}