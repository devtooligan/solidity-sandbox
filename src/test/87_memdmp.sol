// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
import "forge-std/Test.sol";

contract Test87 is Test {

    function test_memdmp() external returns (bytes memory){
        console.logBytes(memdmp());

    }

    function test2() external returns (bytes memory){
        uint freememptr;
        assembly {
            freememptr := mload(0x40)
        }
        console.log("before");
        console.log(freememptr);
        bytes memory data = hex"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff";
        assembly {
            freememptr := mload(0x40)
        }
        console.log("after");
        console.log(freememptr);

    }
    function memdmp() public returns (bytes memory){
        bytes memory UDMV;
        bytes memory data = hex"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff";
        assembly {
            mstore(0x60, 0x40)
        }
        return UDMV;
    }
}
