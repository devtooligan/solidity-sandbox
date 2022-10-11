// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";

contract Test67 is Test {
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

    function test_deleteStructWDynamicArray() external {
        uint256 valB1_0 = 0x05;
        uint256 valB1_1 = 0x06;

        S1 storage m1 = m[1];

        m1.b1.push(valB1_0);
        m1.b1.push(valB1_1);

        bytes32 slot_m_1 = keccak256(abi.encode(1, 8)); // m[1].a1
        bytes32 slot_m_1_b1 = bytes32(uint256(slot_m_1) + 1); // m[1].b1  == length
        bytes32 slot_m_1_b1_0 = keccak256(abi.encodePacked(slot_m_1_b1)); // m[1].b1[0]
        bytes32 slot_m_1_b1_1 = bytes32(uint256(slot_m_1_b1_0) + 1); // m[1].b1[1]

        uint256 ret_m_1_b1_0;
        uint256 ret_m_1_b1_1;

        assembly {
            ret_m_1_b1_0 := sload(slot_m_1_b1_0)
            ret_m_1_b1_1 := sload(slot_m_1_b1_1)
        }

        assertEq(ret_m_1_b1_0, valB1_0);
        assertEq(ret_m_1_b1_1, valB1_1);

        delete m[1]; // DELETE!

        assembly {
            ret_m_1_b1_0 := sload(slot_m_1_b1_0)
            ret_m_1_b1_1 := sload(slot_m_1_b1_1)
        }

        assertEq(ret_m_1_b1_0, 0);
        assertEq(ret_m_1_b1_1, 0);

    }
}
