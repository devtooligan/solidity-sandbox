// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";

function min(uint x, uint y) pure returns (uint) {
    unchecked {
    return x < y ? y - x : x - y;

    }
}
// function min(uint a, uint b) pure returns (uint) {
//     return a < b ? a : b;
//     // [PASS] test_min() (gas: 5228)
//     // Logs:
//     // min 146
//     // min 153
// }
// function min(uint a, uint b) pure returns (uint) {
//     if (a < b) {
//         return a;
//     } else {
//         return b;
//
// [PASS] test_min() (gas: 5234)
// Logs:
//   min 159
//   min 146
//     }
// }

contract Test94 is Test {

    function test_min() external {
        uint start = gasleft();
        min(1, 2);
        console.log("min", start - gasleft());
        start = gasleft();
        min(2, 1);
        console.log("min", start - gasleft());
    }
}
