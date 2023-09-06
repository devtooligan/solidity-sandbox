// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
import "forge-std/Test.sol";
import "forge-std/console.sol";
import "forge-std/console2.sol";

contract Test41 is Test {

    uint public s;
    uint internal ss;

    function one() public view returns (uint256) {
        console.log("one");
        console2.log("one");
        return 1;
    }
    function two() public view returns (uint256) {
        console.log("two");
        console2.log("two");
        return 2;
    }

    function test_cl() external {
        assertEq(one(), 1);
        assertEq(two(), 2);
    }
}
