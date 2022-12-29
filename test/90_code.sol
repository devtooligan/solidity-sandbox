// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";

contract A {
    function add() external returns (uint answer_) {
        answer_ = 1;
    }
}

contract B {
    uint internal immutable a;

    constructor(uint a_) {
        a = a_;
    }
    function add() external returns (uint) {
        return a;
    }
}

contract Test90 is Test {

    function run() external returns (bytes memory) {
        A a = new A();
        B b = new B(uint(0x69696969));
        bytes memory acode = address(a).code;
        bytes memory bcode = address(b).code;
        console.log(uint(0x123456789));
        bcode = acode;
        acode = bcode;
        return acode;
    }
}
