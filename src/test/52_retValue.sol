// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import "forge-std/Test.sol";

uint16 constant MAX_RET_BYTES = 4 + 4 * 32;

contract Reverter {
    fallback() external {
        revert();
    }
}

bytes32 constant MESSAGE_ID = bytes32(uint(0x69));


contract X {
    event MessageExecuted(bytes32 indexed messageId, bool success, bytes data);

    function routeMessage(bytes calldata message, uint16 gasForCallExactCheck, uint256 gasLimit, address receiver)
        external
        returns (bool)
    {
        // We encode here instead of the offRamps to constrain specifically what functions
        // can be called from the router.
        // (bool success, bytes memory retBytes) = _callWithExactGas(gasForCallExactCheck, gasLimit, receiver, message);
        (bool success, bytes memory retBytes) = _callWithExactGasFixed(gasForCallExactCheck, gasLimit, receiver, message);
        // Execution message is emitted here so clients have a static address to monitor for results,
        // for example to detect failures and retry manually or to notify upon success.
        emit MessageExecuted(MESSAGE_ID, success, retBytes);
        return success;
    }

    function _callWithExactGas(uint16 gasForCallExactCheck, uint256 gasAmount, address target, bytes memory data)
        internal
        returns (bool success, bytes memory retData)
    {
        // solhint-disable-next-line no-inline-assembly
        assembly {
            let g := gas()
            // Compute g -= gasForCallExactCheck and check for underflow
            // The gas actually passed to the callee is _min(gasAmount, 63//64*gas available).
            // We want to ensure that we revert if gasAmount >  63//64*gas available
            // as we do not want to provide them with less, however that check itself costs
            // gas. gasForCallExactCheck ensures we have at least enough gas to be able
            // to revert if gasAmount >  63//64*gas available.
            if lt(g, gasForCallExactCheck) { revert(0, 0) }
            g := sub(g, gasForCallExactCheck)
            // if g - g//64 <= gasAmount, revert
            // (we subtract g//64 because of EIP-150)
            if iszero(gt(sub(g, div(g, 64)), gasAmount)) { revert(0, 0) }
            // solidity calls check that a contract actually exists at the destination, so we do the same
            if iszero(extcodesize(target)) { revert(0, 0) }
            // call and return whether we succeeded. ignore return data
            // call(gas,addr,value,argsOffset,argsLength,retOffset,retLength)
            success := call(gasAmount, target, 0, add(data, 0x20), mload(data), 0, 0)
            // limit our copy to MAX_RET_BYTES bytes
            let toCopy := returndatasize()
            if gt(toCopy, MAX_RET_BYTES) { toCopy := MAX_RET_BYTES }
            // Store the length of the copied bytes
            mstore(retData, toCopy)
            // copy the bytes from retData[0:_toCopy]
            returndatacopy(add(retData, 0x20), 0, toCopy)
        }
        return (success, retData);
    }

    function _callWithExactGasFixed(uint16 gasForCallExactCheck, uint256 gasAmount, address target, bytes memory data)
        internal
        returns (bool, bytes memory)
    {
        bytes memory retData = new bytes(MAX_RET_BYTES);
        bool success;

        // solhint-disable-next-line no-inline-assembly
        assembly {
            let g := gas()
            // Compute g -= gasForCallExactCheck and check for underflow
            // The gas actually passed to the callee is _min(gasAmount, 63//64*gas available).
            // We want to ensure that we revert if gasAmount >  63//64*gas available
            // as we do not want to provide them with less, however that check itself costs
            // gas. gasForCallExactCheck ensures we have at least enough gas to be able
            // to revert if gasAmount >  63//64*gas available.
            if lt(g, gasForCallExactCheck) { revert(0, 0) }
            g := sub(g, gasForCallExactCheck)
            // if g - g//64 <= gasAmount, revert
            // (we subtract g//64 because of EIP-150)
            if iszero(gt(sub(g, div(g, 64)), gasAmount)) { revert(0, 0) }
            // solidity calls check that a contract actually exists at the destination, so we do the same
            if iszero(extcodesize(target)) { revert(0, 0) }
            // call and return whether we succeeded. ignore return data
            // call(gas,addr,value,argsOffset,argsLength,retOffset,retLength)
            success := call(gasAmount, target, 0, add(data, 0x20), mload(data), 0, 0)
            // limit our copy to MAX_RET_BYTES bytes
            let toCopy := returndatasize()
            if gt(toCopy, MAX_RET_BYTES) { toCopy := MAX_RET_BYTES }
            // Store the length of the copied bytes
            mstore(retData, toCopy)
            // copy the bytes from retData[0:_toCopy]
            returndatacopy(add(retData, 0x20), 0, toCopy)
        }
        return (success, retData);
    }
}

uint16 constant amount = type(uint16).max;

contract Test52 is Test {
    Reverter reverter;
    X x;

    function setUp() public {
        reverter = new Reverter();
        x = new X();
    }

    function test_retValue() external {
        bytes memory message = abi.encode("yomamma");
        bool success = x.routeMessage(message, amount, amount, address(reverter));
        if (success) {
            console.log("success");
        } else {
            console.log("failure");
        }
    }
}
