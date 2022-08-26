// SPDX-License-Identifier: MIT
pragma solidity  0.8.0;
import "forge-std/Test.sol";


contract Tester {
    constructor() {
        console.log(msg.sender);
    }
}

contract Test36 is Test {

    ITester public c;

    constructor() {
        vm.startPrank(0x123);
        new Tester();
    }

    function setUp() public {
        c = new Tester();
    }
    function test_override() external {
        c.a();
    }
}
