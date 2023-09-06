// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Test.sol";

contract Test36 is Test {
    function test_arrlen(uint256 x) external {
        x = x % type(uint8).max;
        console.log("+ + file: 36_arrlen.sol:9 + test_arrlen + x:", x);
        uint256 nonStickySourceLength;
        uint256 targetArrayLength;
        uint256[] memory sourceArray = new uint[](x);
        if (sourceArray.length >= 8) {
            for (uint256 i = sourceArray.length; i >= 8;) {
                unchecked {
                    if (i % 8 == 0) {
                        nonStickySourceLength = i;
                        break;
                    }
                    --i;
                }
            }
        }
        if (sourceArray.length != nonStickySourceLength) {
            unchecked {
                targetArrayLength = (nonStickySourceLength / 8) + 1;
            }
        } else {
            unchecked {
                targetArrayLength = (nonStickySourceLength) / 8;
            }
        }

        uint256 expected = (sourceArray.length / 8) + (x % 8 == 0 ? 0 : 1);
        console.log("+ + file: 36_arrlen.sol:35 + test_arrlen + expected:", expected);

        console.log("+ + file: 36_arrlen.sol:38 + test_arrlen + targetArrayLength:", targetArrayLength);
        require(targetArrayLength == expected);
    }
}
