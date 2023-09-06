// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
import "forge-std/Test.sol";

contract Test57 is Test {

    function test_memFukt() external {
        assembly {
            // mstore(0x00, 0x6969696969696969696969696969696969696969696969696969696969696969)
            // mstore(0x20, 0x6969696969696969696969696969696969696969696969696969696969696969)
            // mstore(0x40, 0x6969696969696969696969696969696969696969696969696969696969696969)
            mstore(0x60, 0x69)
        }
        // bytes memory bts = abi.encode(0x69);
        uint[] memory arr = new uint[](5);
        for (uint x; x< 5; x++) {
            console.log("arr[%s] = %s", x, arr[x]);
        }

    }
}
