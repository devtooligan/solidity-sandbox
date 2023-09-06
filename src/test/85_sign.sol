// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import "forge-std/Test.sol";

contract Test85 is Test {
    function test_sign() external {
        uint alicePk = uint(0x69);
        address alice = vm.addr(alicePk);
        bytes32 hash = keccak256("Signed by Alice");
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(alicePk, hash);
        address signer = ecrecover(hash, v, r, s);
        assertEq(alice, signer); // [PASS]
    }
}
