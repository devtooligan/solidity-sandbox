// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";

contract B {
    constructor() {
        console.log("from b const, msg.owner", msg.sender);
    }
}

contract A {
    B public b;
    constructor() {
        console.log("from a const address this", address(this));
        console.log("from a const msg.sender", address(msg.sender));
        b = new B();
    }
}

contract Test37 is Test {
    A public aa;
    function setUp() public {
        console.log(address(this));
        aa = new A();
        console.log("address a per setup", address(aa));
    }

    function test_owner() external {
        aa;
    }
}
