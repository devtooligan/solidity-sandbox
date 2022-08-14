// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
import "forge-std/Test.sol";

contract Test22 is Test {
    uint public myvar = 1;
    function shadow() public returns (uint) {
        uint myvar = 2;
        console.log(myvar);
        return myvar;
    }
    function test_shadow() external {
        console.log(shadow());
    }
}
