// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";

enum Boundary {
    High,
    Low
}

contract Test41 is Test {

    uint public x;

    function setX(uint x_) public {
        if (x_ == uint(1)) {
            x = 1;
        }
    }

    function test_boolVenum() external {
        uint start;
        start = gasleft();
        setX(uint(0));
        console.log(start - gasleft());

    }
}
