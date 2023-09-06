// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Test.sol";

contract Test27 is Test {
    // function test_whileLoop() external {
    //     uint256 runningScale = Maths.WAD; // Tracks scale(index_) as we move down Fenwick tree
    //     uint256 j = 8192; // bit that iterates from MSB to LSB
    //     uint256 index = 0; // build up sumIndex bit by bit

    //     // Used to terminate loop.  We don't need to consider final 0 bits of sumIndex_
    //     uint256 indexLSB = lsb(sumIndex_);

    //     while (j >= indexLSB) {
    //         // Skip considering indices outside bounds of Fenwick tree
    //         if (index + j > 8192) continue;

    //         index += j;
    //         j = j >> 1;
    //     }
    // }
}
