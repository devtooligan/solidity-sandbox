// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";

contract delegatee {
    uint256 public x;
    function setX() public {
        console.log(gasleft());
        x = 11;
    }
}

contract Test89 is Test {

    function test_tangerine() external {
        console.log(gasleft());
        delegatee d = new delegatee();
        address(d).delegatecall(abi.encodeWithSignature("setX()"));

    }
}
