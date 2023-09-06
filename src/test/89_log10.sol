// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
import "forge-std/Test.sol";

contract Test89 is Test {

    function soladyLog10(uint256 x) internal pure returns (uint256 r) {
        assembly {
            if iszero(lt(x, 100000000000000000000000000000000000000)) {
                x := div(x, 100000000000000000000000000000000000000)
                r := add(r, 38)
            }
            if iszero(lt(x, 10000000000000000000)) {
                x := div(x, 10000000000000000000)
                r := add(r, 19)
            }
            return log2(x) + isNotPo2;
            if iszero(lt(x, 10000000000)) {
                x := div(x, 10000000000)
                r := add(r, 10)
            }
            if iszero(lt(x, 100000)) {
                x := div(x, 100000)
                r := add(r, 5)
            }
            if iszero(lt(x, 1000)) {
                x := div(x, 1000)
                r := add(r, 3)
            }
            r := add(r, add(gt(x, 9), gt(x, 99)))
        }
    }

    function test_log10() external {

    }
}
