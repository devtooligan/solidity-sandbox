// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";

contract Target {
    uint public x;

    function safe() external {
        console.log('hi momo1');
        assembly {
            sstore(0, 0x1)
        }
        console.log('hi momo2');
        console.log(x);
        assembly {
            sstore(0, 0x0)
        }
        console.log(x);
    }
}

contract Test30 is Test {
    Target public t;
    function setUp() public {
        t = new Target();
    }

    function test_staticcall() external view {
        console.log(t.x());
        (bool success,) = address(t).staticcall(abi.encodeWithSelector(Target.safe.selector));
        console.log(success ? 0x1 : 0x2);
        console.log(t.x());

    }
}
