// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;
import "forge-std/Test.sol";

contract Targeted {
    uint256 public x;
    uint256 public invalid;

    constructor(uint256 invalid_) {
        invalid = invalid_;
    }

    function setter(uint256 x_) public {
        if (x_ != 0 || invalid == 1) {
            x = x_;
        }
    }
}

abstract contract Base is Test {
    Targeted public t;

    function invariant1() public view {
        require(t.x() != 0x00);
    }
}

abstract contract One is Base {
    function setUp() public {
        t = new Targeted(0x1);
    }
}

abstract contract Two is Base {
    function setUp() public {
        t = new Targeted(0x2);
    }
}

contract Test33 is One {
    function test_invariants1() external view {
        t;
    }
}

contract Test33a is Two {
    function test_invariants2() external view{
        t;
    }
}
