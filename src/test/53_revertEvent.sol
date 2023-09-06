// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Test.sol";

contract Reverter {
    event Test();

    function emitAndRevert() external {
        emit Test();
        revert();
    }
}

contract TestEmitRevert is Test {
    event Test();

    Reverter reverter = new Reverter();

    function test_revertEvent() external {
        vm.expectEmit();
        emit Test();
        address(reverter).call(abi.encodeWithSignature("emitAndRevert()"));
    }
}
