// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import "forge-std/Test.sol";

contract Test48 is Test {
    uint256[] public arr;

    function test_strage() external {
        arr.push(420);
        arr.push(69);

        uint256 slot;

        assembly {
            slot := arr.slot
        }

        bytes32 location = keccak256(abi.encode(slot));

        for (uint idx; idx < arr.length; idx++) {
            assembly {
                location := add(location, idx)
            }

            uint value;
            assembly {
                value := sload(location)
            }
            console.log(value);
        }
    }
}
