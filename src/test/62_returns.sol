// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import "forge-std/Test.sol";
import "forge-std/console.sol";

interface ITarget {
    function test_returnTrue() external returns (bool);
    function test_return1() external returns (bool);
    function test_return10() external returns (bool);
}

contract target {
    function test_returnTrue() external returns (bool) {
        return true;
    }

    function test_return1() external returns (uint256) {
        return 1;
    }

    function test_return10() external returns (uint256) {
        return 10;
    }
}

contract Test62 is Test {
    function test_returns() external {
        ITarget i = ITarget(address(new target()));

        require(i.test_returnTrue());  // success
        require(i.test_return1()); // success

        i.test_return10(); // this reverts
    }
}
