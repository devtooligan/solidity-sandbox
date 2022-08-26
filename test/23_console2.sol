// SPDX-License-Identifier: MIT
pragma solidity  0.8.0;
import "forge-std/Test.sol";
import "forge-std/console.sol";
import "forge-std/console2.sol";

contract Test23 is Test {

    function testFail_console2() external view {
        console.log("this is console.log");
        console2.log("this is console2.log");
        revert();
    }
}
