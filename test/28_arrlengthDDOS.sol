// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
import "forge-std/Test.sol";

// does a putting an array in storage instead of memory save gas?
contract Test28 is Test {

    uint[500] public a;

    function setUp() public {
        for (uint x; x < 500; x++) {
            a[x]= x;
        }
    }

    function test_arrlengthDDOS1() external view returns (uint[500] memory sum) {

        uint start = gasleft();
        uint[500] memory a_copy = a;
        for (uint x; x < a.length; x++) {
            sum[x] = a[x];
        }
        console.log(start - gasleft());
        a_copy[0];
    }
    function test_arrlengthDDOS2() external view returns (uint[500] memory sum) {
        uint start = gasleft();
        uint[500] storage a_copy = a;
        for (uint x; x < a.length; x++) {
            sum[x] = a[x];
        }
        console.log(start - gasleft());
        a_copy[0];
    }

    function test_arrlengthDDOS3() external view returns (uint[500] memory sum) {
        uint start = gasleft();
        for (uint x; x < a.length; x++) {
            sum[x] = a[x];
        }
        console.log(start - gasleft());

    }
}
