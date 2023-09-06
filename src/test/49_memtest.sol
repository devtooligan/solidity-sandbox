// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import "forge-std/Test.sol";

contract hiMom {
    fallback(bytes calldata) external returns (bytes memory) {
        bytes memory z = new bytes(300);
        for (uint256 idx; idx < 300; idx++) {
            z[idx] = bytes1(uint8(uint256(0x69)));
        }
        return z;
    }
}

contract Test49 is Test {
    event Log(bytes);

    address public hm = address(new hiMom());

    function test_memtest() external {
        bytes memory x = _myFunc();
        emit Log(x);
    }

    uint16 public constant MAX_RET_BYTES = 4 + 4 * 32;
    uint public h;
    function _myFunc() internal returns (bytes memory z) {
        bytes memory data = abi.encode("ipsa scientia potestas estipsa scientia potestas estipsa scientia potestas estipsa scientia potestas estipsa scientia potestas estipsa scientia potestas estipsa scientia potestas estipsa scientia potestas estipsa scientia potestas estipsa scientia potestas estipsa scientia potestas estipsa scientia potestas estipsa scientia potestas estipsa scientia potestas estipsa scientia potestas estipsa scientia potestas estipsa scientia potestas estipsa scientia potestas estipsa scientia potestas est");
        bytes memory x = abi.encode(uint256(8));
        address hmaddy = hm;
        assembly {
            mstore(0x0, 0x1)
            mstore(0x20, 0x2)
            // mstore(0x40, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff)
            // mstore(0x60, 0x4)
            let success := call(gas(), hmaddy, 0, add(data, 0x20), mload(data), 0, 0)
            let toCopy := returndatasize()
            if gt(toCopy, MAX_RET_BYTES) { toCopy := MAX_RET_BYTES }
            // Store the length of the copied bytes
            mstore(z, toCopy)
            // copy the bytes from retData[0:_toCopy]
            returndatacopy(add(z, 0x20), 0, toCopy)
        }
        h = 0x69;
    }
}
