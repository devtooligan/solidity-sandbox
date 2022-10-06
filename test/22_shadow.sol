// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";

contract Test22 is Test {
    uint public myvar = 1;
    function shadow() public view returns (uint) {
        // uint myvar = 2; // commented out to remove warning
        console.log(myvar);
        return myvar;
    }
    function test_shadow() external view {
        console.log(shadow());
    }
}
