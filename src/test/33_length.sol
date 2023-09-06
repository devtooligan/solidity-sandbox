// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
import "forge-std/Test.sol";

contract Target {
    function length(uint[] calldata x) external returns (uint256 len) {
        uint gas = gasleft();
        unchecked{len = x.length;}
        console.log("gas used:", gas - gasleft());
    }
}

contract Test33 is Test {

    function test_length() external {
        uint[] memory x = new uint[](10);
        x[0] = 1;
        x[1] = 2;
        x[2] = 3;
        x[3] = 4;
        x[4] = 5;
        x[5] = 6;
        x[6] = 7;
        x[7] = 8;
        x[8] = 9;
        x[9] = 10;
        Target t = new Target();
        t.length(x);
    }
}
