// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;
import "forge-std/Test.sol";



contract Test44 is Test {

    struct PackedFunctionPointers {
        uint8 a;
        uint8 b;
        uint8 c;
    }

    struct Functions {
        function(uint) returns (uint) a;
        function(uint) returns (uint) b;
        function(uint) returns (uint) c;
    }



    function test_pointers() external {

    }
}
