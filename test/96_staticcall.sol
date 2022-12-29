// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";

contract ViewMe {
    uint public x = 42;
    uint public y = 69;
}

contract Test96 is Test {

    function test_staticcally() external {
        ViewMe viewMe = new ViewMe();
        uint start = gasleft();
        (, bytes memory data) = address(viewMe).staticcall(abi.encodeWithSignature("x()"));
        (, data) = address(viewMe).staticcall(abi.encodeWithSignature("y()"));
        uint x = abi.decode(data, (uint));
        uint y = abi.decode(data, (uint));
        console.log("staticcall x()", start - gasleft());

        start = gasleft();
        x = viewMe.x();
        y = viewMe.y();
        console.log("read x()", start - gasleft());

    }
}
