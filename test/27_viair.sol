// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

contract Test27 is Test {
    uint256[] public a;

    function setUp() public {
        a = [uint256(1), 2, 3, 4, 5, 6, 7, 8, 9, 10];
    }

    function test_viair1() public view returns (uint256 sum) {
        uint256 start = gasleft();
        uint256[] memory a_copy = a;
        for (uint256 x; x < a.length; x++) {
            sum += a_copy[x];
        }
        console.log("gas used", start - gasleft());
        return sum;
    }

    function test_viair2() public view returns (uint256 sum) {
        uint256 start = gasleft();
        for (uint256 x; x < a.length; x++) {
            sum += a[x];
        }
        console.log("gas used", start - gasleft());
    }
}
