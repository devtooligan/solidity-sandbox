// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";


contract Core {

    uint public a;

    constructor(uint a_) {
        a = a_;
    }

    function setA(uint a_) public {
        a = a_;
    }
    function getA() public view returns (uint) {
        return a;
    }


}

contract CoverageTest is Core {

    constructor(uint a_) Core(a_) {}

    function fizzbuzz(uint x) public pure returns (bytes32) {
        if (x % 3 == 0 && x % 5 == 0) {
            return bytes32(bytes("fizzbuzz"));
        }
        if (x % 3 == 0) {
            return bytes32(bytes("fizz"));
        }
        if (x % 5 == 0) {
            return bytes32(bytes("buzz"));
        }
        return bytes32(bytes(""));

    }
}

contract Test38 is Test {

    function test_coverage() external {

    }
}
