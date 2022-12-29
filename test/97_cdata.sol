// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";

contract A {
    struct B {
        uint x;
        uint y;
    }

    function cd(B calldata b) external pure returns (uint) {
        return b.x + b.y;
    }
    function mem(B memory b) external pure returns (uint) {
        return b.x + b.y;
    }
}
contract Test97 is Test {

    function test_cdata() external {
        console.log("test_cdata");
        A a = new A();
        A.B memory b = A.B(42, 69);
        uint start = gasleft();
        a.cd(b);
        console.log("cd", start - gasleft());

        start = gasleft();
        a.mem(b);
        console.log("mem", start - gasleft());
    }
}
