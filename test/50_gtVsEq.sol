// SPDgtVsEq-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";

contract GtVsEq {
    function iffer1(uint x) external returns(uint) {

        uint y = 1;
        uint start = gasleft();
        if (x > 0) {
            y = 1;
        } else {
            y = 2;
        }
        console.log(start - gasleft());
        return y;
    }
    function iffer2(uint x) external returns(uint) {

        uint y = 1;
        uint start = gasleft();
        if (x != 0) {
            y = 1;
        } else {
            y = 2;
        }
        console.log(start - gasleft());
        return y;
    }
    function iffer3(uint x) external returns(uint) {

        uint y = 1;
        uint start = gasleft();

        require(x > 0);
        console.log(start - gasleft());

        return y;
    }
    function iffer4(uint x) external returns(uint) {

        uint y = 1;
        uint start = gasleft();

        require(x != 0);
        console.log(start - gasleft());

        return y;
    }
    function iffer5(uint x) external returns(uint) {

        uint y = 1;
        uint start = gasleft();
        y = x > 0 ? 2 : 1;
        console.log(start - gasleft());

        start = gasleft();
        y = x != 0 ? 2 : 1;
        console.log(start - gasleft());

        return y;
    }
}

contract Test50 is Test {

    GtVsEq public g = new GtVsEq();

    function test_gtVsEq1() external {
        g.iffer1(0);
        g.iffer1(1);
    }
    function test_gtVsEq2() external {
        g.iffer2(0);
        g.iffer2(1);
    }
    function test_gtVsEq3() external {
        g.iffer3(1);
    }
    function test_gtVsEq4() external {
        g.iffer4(1);
    }
    function testFail_gtVsEq3fail() external {
        g.iffer3(0);
    }
    function testFail_gtVsEq4fail() external {
        g.iffer4(0);
    }
    function test_gtVsEq5zero() external {
        g.iffer5(0);
    }
    function test_gtVsEq5one() external {
        g.iffer5(1);
    }
}
