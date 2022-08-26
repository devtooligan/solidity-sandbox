// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;
import "forge-std/Test.sol";

contract Testtarget {
    uint public a = 1;

    function setZero() public {
        a = 0;
    }
}

contract Test31 is Test {

    Testtarget public t;
    function setUp() public {
        t = new Testtarget();
    }

    function invariant() public view {
        require(t.a() <= 1);
    }

}
