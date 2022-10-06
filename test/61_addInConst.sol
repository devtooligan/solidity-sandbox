// SPDaddInConst-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";

uint constant MYCONSTANT = 5;
function mult(uint a) pure returns (uint ret) {
    uint xx = 1e18;
    assembly {
        ret := mul(xx, a)
    }
}
contract AddInConst1 {

    uint public x;
    constructor() {
        x = MYCONSTANT * 1e18;
    }

}
contract AddInConst2 {

    uint public x;
    constructor() {
        x = mult(MYCONSTANT);
    }

}

contract Test61 is Test {

    function test_addInConst() external {
        uint start = gasleft();
        new AddInConst1();
        console.log(start - gasleft());
        start = gasleft();
        new AddInConst2();
        console.log(start - gasleft());

    }
}
