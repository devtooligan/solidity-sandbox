// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
import "forge-std/Test.sol";

contract Target {
    function test(uint[] calldata x) external pure returns (uint[] calldata y) {
        return _test(x);
    }

    function _test(uint[] calldata x) internal pure returns (uint[] calldata y) {
        y = x;
    }
}

contract Test31 is Test {



    function test_cdata() external {
        Target target = new Target();
        uint[] memory x = new uint[](2);
        x[0] = 1;
        x[1] = 2;
        uint[] memory y = target.test(x);
        assertEq(y[0], 1);
    }
}
