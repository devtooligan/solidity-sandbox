// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";

contract Test92 is Test {

    function test_reverseloop() external {
        uint length = 4;
        for (uint i = length - 1; i >= 0 ; --i ) {
            console.log(i);
            // if (i == 0) break; // Not sure why `for (uint i = length - 1; i >= 0; --i )` doesn't work // @audit what??
        }

    }
}
