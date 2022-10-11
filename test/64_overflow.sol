// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";

contract Test64 is Test {

    function test_overflow() external {
        unchecked {
            console.log(uint(0) - 2);
        }
    }
}
