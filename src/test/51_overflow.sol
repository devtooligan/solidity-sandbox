// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
import "forge-std/Test.sol";

contract Test51 is Test {
    uint public x = 0x5;

    function test_overflow() external {
        uint z = x;
        unchecked {
            z = z - 6;
        }
        console.log(z);
    }
}
