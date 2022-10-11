// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/console.sol";

contract Test65 is Test {
    struct S {
        uint256 a;
        uint256 b;
    }

    mapping(uint => S) public s;

    function test_deletestoragestruct() external {
        uint256 val1 = 0x69;
        uint256 val2 = 0x420;
        uint slot = 8;  // thanks forge inspect
        uint index = 1;

        s[index] = S({a: val1, b: val2});

        bytes32 slotA = keccak256(abi.encode(index, slot)); // this is for the 0th item in the struct
        bytes32 slotB = bytes32(uint(slotA) + 1); // add 1 to the slot to get the next item in the struct

        uint256 sloadA;
        uint256 sloadB;
        assembly {
            sloadA := sload(slotA)
            sloadB := sload(slotB)
        }
        assertEq(sloadA, val1); // yay values match
        assertEq(sloadB, val2);

        delete s[1]; // DELETE!

        assembly {
            sloadA := sload(slotA)
            sloadB := sload(slotB)
        }
        assertEq(sloadA, 0); // This was auto suggested by gh copilot, unbelieveable
        assertEq(sloadB, 0); // Ensure the values are zeroed out
    }
}
