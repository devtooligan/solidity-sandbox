// SPDX-License-Identifier: MIT
pragma solidity  0.8.0;
import "forge-std/Test.sol";

contract Pool {
    uint256 public immutable var1;
    uint256 public var2;

    constructor(uint256 var1_) {
        var1 = var1_;
        var2 = var1_ * var1_;
    }

    function doStuff() public {}

    function doOtherStuff() public {}
}

abstract contract TestBase is Test {
    Pool public p;

    function invariant() public {
        require(p.var1() == p.var2());
    }
}

contract PoolTestSuite1 is TestBase {
    function setUp() public {
        p = new Pool(0x1);
    }

    function test_1() public {
        p.doStuff();
    }
}

contract PoolTestSuite2 is TestBase {
    function setUp() public {
        p = new Pool(0x2);
    }

    function test_2() public {
        p.doOtherStuff();
    }
}
