// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
import "forge-std/Test.sol";

contract Test84 is Test {

    function test_gs() external {
        uint x;
        uint y;
        uint z;
        assembly {
            x := gas()
            y := gas()
            z := gas()
        }
        console.log(x - y);
        console.log(y - z);
    }
}
