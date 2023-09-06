// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
import "forge-std/Test.sol";

contract Target {}

contract Test63 is Test {

    function test_noEEETH() external {
        Target t = new Target();
        (bool success, bytes memory returndata) = address(t).call{value: 1 ether}("");
        console.logBytes(returndata);
        require(success, "call failed");
    }
}
