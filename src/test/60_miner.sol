// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "forge-std/console.sol";

contract Hook {
    uint256 internal var1;

    constructor(uint256 arg) {
        var1 = arg;
    }

    function setVar1(uint256 arg) external {
        var1 = arg;
    }

    function getVar1() external view returns (uint256) {
        return var1;
    }
}

contract Miner {
    function _validAddress(address addr, uint256 targetPrefix) internal returns (bool valid) {
        assembly {
            valid := eq(and(addr, 0x00ff00000000000000000000000000000000000000), targetPrefix)
        }
    }

    // Basically idea is to set memory up. then only update the salt in memory
    function mineSalt(bytes memory initCode, uint256 prefix)
        external
        returns (uint256 salt, address newAddress)
    {
        // uint freeMemPtr;
        // uint zeroSlot;
        // assembly {
        //     freeMemPtr := mload(0x40)
        //     zeroSlot := mload(0x60)
        //     mstore8(0x0, shl(248, 255))
        //     mstore(0x01, shl(96, address()))
        //     mstore(0x21, salt)
        //     let _12 := 85
        //     mstore(add(expr_mpos, _12), expr)
        //     mstore(expr_mpos, _12)
        //     var_newAddress :=  expr_mpos, sub(shl(160, 1), 1))
        //     if eq(var_salt, not(0))
        //     {
        //         mstore(_3, shl(224, 0x4e487b71))
        //         mstore(_2, 0x11)
        //         revert(_3, _7)
        //     }
        //     var_salt := add(var_salt, 1)
        // }
        while (!_validAddress(newAddress, prefix)) {
            newAddress = address(
                uint160(uint256(keccak256(abi.encodePacked(bytes1(0xff), address(this), salt, keccak256(initCode)))))
            );
            salt++;
        }
    }
}

contract Test60 is Test {
    function _validAddress(address addr, uint256 targetPrefix) internal returns (bool valid) {
        assembly {
            valid := eq(and(addr, 0x00ff00000000000000000000000000000000000000), targetPrefix)
        }
    }

    function _mineSalt(bytes memory initCode, uint256 prefix) internal returns (uint256 salt, address newAddress) {
        while (!_validAddress(newAddress, prefix)) {
            newAddress = address(
                uint160(uint256(keccak256(abi.encodePacked(bytes1(0xff), address(this), salt, keccak256(initCode)))))
            );
            salt++;
        }
        // console.log(newAddress);
        // console.log(salt);
    }
    function test_miner2() external {
            uint prefix = 1 << 152;
            bytes memory initCode = abi.encode(0x420420420420);
            // bytes memory initCode = abi.encodePacked(type(Hook).creationCode, abi.encode(0x69));
            (uint salt, address newAddress) = _mineSalt(initCode, prefix);
    }

    function test_miner() external {
        Miner miner = new Miner();
        uint min = type(uint256).max;
        uint max;
        uint minGas = type(uint256).max;
        uint maxGas;
        uint salt;
        address newAddress;
        uint start;
        uint used;
        for (uint256 prefix = 1 << 152; prefix < (256 << 152); prefix += 1 << 152) {
            bytes memory initCode = abi.encodePacked(type(Hook).creationCode, abi.encode(0x69));
            start = gasleft();
            (salt, newAddress) = _mineSalt(initCode, prefix);
            used = start - gasleft();
            if (used > maxGas) {
                maxGas = used;
            }
            if (used < minGas) {
                minGas = used;
            }
            if (salt > max) {
                max = salt;
            }
            if (salt < min) {
                min = salt;
            }

        }
        console.log("minGas", minGas);
        console.log("min salt", min);
        console.log("maxGas", maxGas);
        console.log("max salt", max);
    }
}
