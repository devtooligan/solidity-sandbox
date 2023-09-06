// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
import "forge-std/Test.sol";

uint constant CONST = 0x1;

contract Test59 is Test {

    function _check(address a) internal pure returns (bool) {
    return uint(uint160(a)) & CONST != 0;
    }

    function _checkAssembly(address a) internal pure returns (bool ret) {
        assembly {
            ret := gt(and(a, CONST), 0)
        }
    }

    function test_checkeroo() external {
        uint start = gasleft();
        bool checked1 = _check(address(this));
        console.log("gas", start - gasleft());
        console.log("checked1", checked1);
        start = gasleft();
        bool checked2 = _checkAssembly(address(this));
        console.log("gas", start - gasleft());
        console.log("checked2", checked2);

    }
}
