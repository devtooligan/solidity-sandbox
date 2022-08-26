// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;
import "forge-std/Test.sol";


interface ITester {
    function a() external;
}

contract Tester is ITester {
    function a() external virtual {
        console.log('hello');
    }
}

contract Test36 is Test {

    ITester public c;

    function setUp() public {
        c = new Tester();
    }
    function test_override() external {
        c.a();
    }
}
