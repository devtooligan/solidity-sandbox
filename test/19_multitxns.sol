// SPDX-License-Identifier: MIT
pragma solidity  0.8.0;
import "forge-std/Test.sol";

contract B {
    function blockie() external view returns (uint, uint) {
        return (block.number, block.timestamp);
    }
}

contract Test19 is Test {

    B public b;

    function setUp() public {
        b = new B();
    }
    function test_multitxns() external {
        (uint aa, uint bb) = b.blockie();
        console.log(aa, bb);
        skip(1000);
        (aa, bb) = b.blockie();
        console.log(aa, bb);
    }
}
