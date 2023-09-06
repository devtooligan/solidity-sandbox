// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import "forge-std/Test.sol";

contract Test56 is Test {
    function math(uint256 x, uint8 y) public {
        uint256 z = (x + y);
    }

    function test_mathy() external {
        math(0xfc, 0xfe);
    }
}
