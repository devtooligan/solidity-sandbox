// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";

function divUp(uint256 x, uint256 y) pure returns (uint256 z) {
    assembly {
        // Revert if y = 0
        if iszero(y) {
            revert(0, 0)
        }

        z := add(gt(mod(x, y), 0), div(x, y))
    }
}

function divUpRef(uint256 x, uint256 y) pure returns (uint256 ans) {
    unchecked {
        ans =  (x + y - 1) / y;
    }
}

contract Test35 is Test {
    function test_divup(uint x, uint y) external {
        vm.assume(y > 0);
        assertEq(divUpRef(x,y), divUp(x,y));
    }
    function test_divup2() external {
        uint x = 3;
        uint y = 2;
        assertEq(divUpRef(x,y), divUp(x,y));
        console.log(divUpRef(x,y));
        console.log(divUp(x,y));
    }
}
