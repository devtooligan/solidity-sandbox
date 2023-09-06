// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "forge-std/console.sol";

contract Test28 is Test {
    function trimBytes(bytes memory input) internal pure returns (bytes memory output) {
        assembly {
            let length := mload(input)
            let value := mload(add(0x20, input))

            for {} 1 {} {
                let s := byte(0, value)

                switch iszero(s)
                case 0 { break }
                case 1 {
                    value := shl(8, value)
                    length := sub(length, 1)
                }
            }

            mstore(output, length)
            mstore(add(0x20, output), value)

        }
    }

    function test_byteCut() external {
        bytes memory output;
        bytes memory output2;
        bytes memory output3;
        bytes memory a = abi.encode(0x69696969696969);
        bytes memory b = abi.encode(0x420420420420);
        output = trimBytes(a);
        output3 = output;
        output2 = trimBytes(b);
        console.logBytes(output);
        console.logBytes(output2);
        console.logBytes(output3);
        // assertEq(output, hex"69696969696969");
        // assertEq(output2, hex"420420420420");

    }
}
