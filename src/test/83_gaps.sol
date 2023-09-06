// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
import "forge-std/Test.sol";

contract A {
    uint256[50] private __gap;
}

contract B is A {
    uint256[50] private __gap;
}

contract C is B {
    uint public i;
    uint256[50] private __gap;

    function hi() external returns (uint slot) {
        assembly {
            slot := i.slot
        }
    }
}

contract Test83 is Test {

    function test_gaps() external {
        C c = new C();
        console.log(c.hi());

    }
}
