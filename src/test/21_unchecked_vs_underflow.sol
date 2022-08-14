// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
import "forge-std/Test.sol";

contract Test21 is Test {

    error oh();

    uint public allow = 1;
    function testFail_unchecked_vs_underflow_revert1() external {
        uint amt = 2;
        uint allow_ = allow;
        uint start = gasleft();
        if (amt > allow_) {
            console.log(start - gasleft());
            revert oh();
        }
        unchecked {
            allow = allow_ - amt;
        }
    }

    function test_unchecked_vs_underflow_happy1() external {
        uint amt = 1;
        uint allow_ = allow;
        uint start = gasleft();
        if (amt > allow_) {
            console.log(start - gasleft());
            revert oh();
        }
        unchecked {
            allow = allow_ - amt;
        }
        console.log(start - gasleft());
    }
    function testFail_unchecked_vs_underflow_revert2() external {
        uint amt = 2;
        uint allow_ = allow;
        uint start = gasleft();
        allow = allow_ - amt;
    }
    function test_unchecked_vs_underflow_happy2() external {
        uint amt = 1;
        uint allow_ = allow;
        uint start = gasleft();
        allow = allow_ - amt;
        console.log(start - gasleft());
    }
}
