// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
import "forge-std/Test.sol";

contract Test20 is Test {
    uint public t;
    uint public u;
    function test_warm1() external {
        uint z;
        uint start = gasleft();
        z = t;
        console.log(start - gasleft());
        u = z;
    }
    function test_warm2() external {
        uint z;
        z = t + 1;
        uint start = gasleft();
        z = t;
        console.log(start - gasleft());
        u = z;
    }
    function test_warm3() external {
        uint z;
        t = 3;

        uint start = gasleft();
        z = t;
        console.log(start - gasleft());
        u = z;
    }
}
