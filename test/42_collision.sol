// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;
import "forge-std/Test.sol";

contract Other {
    function ideal_warn_timed(uint256,uint128) external {
        console.log('coral cable news');
    }
}

contract Proxy {
    function owner() external {
        console.log('hi mom');
    }
}

contract Test42 is Test {

    address public p;
    address public o;

    function setUp() public {
        p = address(new Proxy());
        o = address(new Other());
    }

    function test_collision() external {
        Other(p).ideal_warn_timed(0xbad, 0xbabe);
        // Proxy(o).upgrade();
    }
}
