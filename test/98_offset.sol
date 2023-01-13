// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";

contract A {

    function testOffset(uint[] calldata x) public {
        uint os;
        // uint os = x.offset;
        assembly {
            os := x.offset
        }
        console.log(os);
    }
}

contract Test98 is Test {

    mapping(uint => uint) public xx;

    function test_offset() external {
        A a = new A();
        uint[] memory x = new uint[](4);

        a.testOffset(x);
        uint xx_ = xx[11];
        console.log(xx_);
    }
}
