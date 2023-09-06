// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
import "forge-std/Test.sol";

contract Test66 is Test {
    bytes constant CODE = hex"60";

    function test_garay() external {
        console.logBytes(CODE);
    }
}
