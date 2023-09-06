// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
import "forge-std/Test.sol";

contract Test72 is Test {

    function test_hi() external {
        (bool success, bytes memory result) = address(0xb0ffedbadbabe).call("");
        require(success, "call failed");
        // (bool upkeepNeeded, bytes memory performData) = abi.decode(result, (bool, bytes));
        // console.log("upkeepNeeded: %s", upkeepNeeded);
        console.logBytes(result);
    }
}
