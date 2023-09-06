// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
import "forge-std/Test.sol";

contract Test67 is Test {

    event Evt(address indexed start, address indexed start1);
    address constant START = address(0x987);
    address constant START1 = address(0x1987);
    function test_hop() external {
        uint start = gasleft();
        emit Evt(START, START1);
        console.log("gas used: %d", start - gasleft());
        console.log(1227 - 846);
        console.log(1608 - 846);
    }
}
