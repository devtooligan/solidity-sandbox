// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Test.sol";

address constant EXCHANGE = address(0xdead1);
address constant SWAP = address(0xdead2);

contract Pool {
    function transferFrom(address from, address to, uint256 value) public returns (bool) {
        if (msg.sender != EXCHANGE && msg.sender != SWAP) {
            revert();
        }
        return true;
    }
}

contract TestDoesNotRevert is Test {


    function test_doesNotRevert() external {
        Pool pool = new Pool();
        vm.prank(EXCHANGE);
        pool.transferFrom(address(0xdead2), address(0xdead3), 69);
        console.log("does not revert when msg.sender == EXCHANGE");
        vm.prank(SWAP);
        pool.transferFrom(address(0xdead3), address(0xdead4), 69);
        console.log("does not revert when msg.sender == SWAP");
        vm.expectRevert();
        pool.transferFrom(address(0xdead2), address(0xdead3), 69);
        console.log("reverts for anyone else");
    }
}
