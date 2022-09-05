// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;
import "forge-std/Test.sol";

// modern version of solidity do not require you to override fns inherited from interface

interface ITester {
    function protocolFee() external returns (uint256);
}

contract Tester is ITester {
    uint256 public protocolFee;
}

contract Test43 is Test {

    function test_overrideInterface() external {

    }
}
