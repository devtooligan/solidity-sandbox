// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
import "forge-std/Test.sol";

contract Test76 is Test {
    function onFlashLoan(uint)
        external
        returns (bytes memory)
    {
        return abi.encode("balls");
    }

    function fnReturner() external returns (function(uint256) external returns (bytes memory) callback) {
        return this.onFlashLoan;
    }

    function test_ok() external {
        (, bytes memory res) = address(this).call(abi.encodeWithSelector(this.fnReturner.selector));
        console.logBytes(res);
        console.log(address(this));
        console.logBytes(abi.encode(this.onFlashLoan.selector));

    }
}
