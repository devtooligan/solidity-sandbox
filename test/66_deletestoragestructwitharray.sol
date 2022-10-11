// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

contract Test66 is Test {
    struct S2 {
        uint256 a2;
        uint256 b2;
    }

    struct S1 {
        uint256 a1;
        uint256[] b1;
        mapping(uint256 => S2) c1;
    }

    mapping(uint256 => S1) public m;

    function test_deletestoragestruct2() external {
        uint256 valA1 = 0x04;
        uint256 valA2 = 0x420;
        uint256 valB1_0 = 0x05;
        uint256 valB1_1 = 0x06;
        uint256 valB2 = 0x69;
        uint256 indexC1 = 0x01;
        uint256 slot = 8; // thanks forge inspect
        uint256 index = 1;

        S1 storage m1 = m[index];

        m1.a1 = valA1;
        m1.b1.push(valB1_0);
        m1.b1.push(valB1_1);
        m1.c1[indexC1] = S2(valA2, valB2);

        bytes32 slot_m_1 = keccak256(abi.encode(index, slot)); // m[1].a1
        bytes32 slot_m_1_b1 = bytes32(uint256(slot_m_1) + 1); // m[1].b1  == length
        bytes32 slot_m_1_b1_0 = keccak256(abi.encodePacked(slot_m_1_b1)); // m[1].b1[0]
        bytes32 slot_m_1_b1_1 = bytes32(uint256(slot_m_1_b1_0) + 1); // m[1].b1  == length
        bytes32 slot_m_1_c1 = bytes32(uint256(slot_m_1) + 2); // c1 mapping base slot
        bytes32 slot_m_1_c1_01 = keccak256(abi.encodePacked(uint(0x01), slot_m_1_c1)); // m[1].c1[0x01]

        console.log("slot_m_1", uint256(slot_m_1));
        console.log("slot_m_1_b1", uint256(slot_m_1_b1));
        console.log("slot_m_1_b1_0", uint256(slot_m_1_b1_0));
        console.log("slot_m_1_b1_1", uint256(slot_m_1_b1_1));
        console.log("slot_m_1_c1", uint256(slot_m_1_c1));

        // uint256 ret_m_1;
        // uint256 ret_m_1_b1;
        // uint256 ret_m_1_b1_0;
        // uint256 ret_m_1_b1_1;
        // uint ret4;
        uint ret_m_1_c1_01;
        // uint ret6;

        assembly {
            // ret_m_1 := sload(slot_m_1)
            // ret_m_1_b1 := sload(slot_m_1_b1)
            // ret_m_1_b1_0 := sload(slot_m_1_b1_0)
            // ret_m_1_b1_1 := sload(slot_m_1_b1_1)
            // ret4 := sload(slot4)
            ret_m_1_c1_01 := sload(slot_m_1_c1_01)
            // ret6 := sload(slot6)
        }

        // console.log("ret_m_1", ret_m_1);
        // console.log("ret_m_1_b1", ret_m_1_b1);
        // console.log("ret_m_1_b1_0", ret_m_1_b1_0);
        // console.log("ret_m_1_b1_1", ret_m_1_b1_1);
        // console.log("ret4", ret4);
        // console.log("ret5", ret5);
        // console.log("ret6", ret6);
        console.log("ret_m_1_c1_01", ret_m_1_c1_01);

        // uint256 slottie_m_1;
        // S1 storage m_1 = m[1];
        // uint256[] storage b1 = m_1.b1;
        // mapping(uint256 => S2) storage c1 = m_1.c1;
        // uint256 slottie_m_1_b1;
        // uint256 slottie_m_1_c1;
        // uint256 slottie_m1_b1_1;
        // uint256 slottie_c1_indexc1;

        // assembly {
        //     slottie_m_1 := m_1.slot
        //     slottie_m_1_b1 := b1.slot
        //     slottie_m_1_c1 := c1.slot
        // }

        // console.log("slottie_m_1", slottie_m_1);
        // console.log("slottie_m_1_b1", slottie_m_1_b1);
        // console.log("slottie_m_1_c1", slottie_m_1_c1);

        delete m[1]; // DELETE!

        assembly {
            // ret_m_1 := sload(slot_m_1)
            // ret_m_1_b1 := sload(slot_m_1_b1)
            // ret_m_1_b1_0 := sload(slot_m_1_b1_0)
            // ret_m_1_b1_1 := sload(slot_m_1_b1_1)
            // ret4 := sload(slot4)
            // ret5 := sload(slot5)
            // ret6 := sload(slot6)
            ret_m_1_c1_01 := sload(slot_m_1_c1_01)

        }
        console.log("ret_m_1_c1_01", ret_m_1_c1_01);

        // console.log("ret_m_1", ret_m_1);
        // console.log("ret_m_1_b1", ret_m_1_b1);
        // console.log("ret_m_1_b1_0", ret_m_1_b1_0);
        // console.log("ret_m_1_b1_1", ret_m_1_b1_1);

        //     uint256 sloadA;
        //     uint256 sloadB;

        //     assembly {
        //         sloadA := sload(slotA)
        //         sloadB := sload(slotB)
        //     }

        //     bytes32 slotA = keccak256(abi.encode(index, slot)); // this is for the 0th item in the struct
        //     bytes32 slotB = bytes32(uint(slotA) + 1); // add 1 to the slot to get the next item in the struct

        //     uint256 sloadA;
        //     uint256 sloadB;
        //     assembly {
        //         sloadA := sload(slotA)
        //         sloadB := sload(slotB)
        //     }
        //     assertEq(sloadA, val1); // yay values match
        //     assertEq(sloadB, val2);

        //     delete s[1]; // DELETE!

        //     assembly {
        //         sloadA := sload(slotA)
        //         sloadB := sload(slotB)
        //     }
        //     assertEq(sloadA, 0); // This was auto suggested by gh copilot, unbelieveable
        //     assertEq(sloadB, 0); // Ensure the values are zeroed out
    }
}
