// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
import "forge-std/Test.sol";

contract Test74 is Test {

    modifier AlwaysDies() {
        _;
        revert("alwaysDies");
    }

    uint public s;

    function one() internal AlwaysDies {
        s = 1;
    }

    function two() public {
        one();
    }

    function test_bb() external {
        console.log("trying two as an internal call:");
        two();

    }
}
