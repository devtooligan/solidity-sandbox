// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
import "forge-std/Test.sol";

contract Test25 is Test {

    function hi() public pure returns (uint hello) {
        hello = 1;
        return hello;
    }
    function test_no_return_named_vars() external {
        assertEq(hi(), 1);
    }
}
