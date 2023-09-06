// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import "forge-std/Test.sol";

contract Test50 is Test {
    event Log(bytes);

    function test_memtest2() external {
        bytes memory x = _myFunc();
        emit Log(x);
    }

    function _myFunc() internal returns (bytes memory z) {
        z = abi.encode(0x69);
        assembly {
            mstore(0x40, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff)
        }
    }
}
