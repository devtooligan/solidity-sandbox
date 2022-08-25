// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
import "forge-std/Test.sol";

contract Test27 is Test {

    uint[] public a;

    function setUp() public {
        a = [uint(1),2,3,4,5,6,7,8,9,10];
    }
    function test_viair1() public view returns (uint sum) {
        uint start = gasleft();
        uint[] memory a_copy = a;
        for (uint x;x < a.length; x++) {
            sum += a_copy[x];
        }
        console.log("gas used", start - gasleft());
        return sum;
    }

    function test_viair2() public view returns (uint sum) {
        uint start = gasleft();
        for (uint x;x < a.length; x++) {
            sum += a[x];
        }
        console.log("gas used", start - gasleft());
    }
}
