// SPDpacking-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";

contract Test58 is Test {

    function test_packing() external {
        address a = address(0xbabe);
        bytes4 sig = bytes4(0xc0dec0de);
        bytes32 r1;
        uint start = gasleft();
        r1 = bytes32(sig) >> 160 | bytes32(bytes20(a));
        console.log("shifting", start - gasleft());
        start = gasleft();
        abi.encodePacked(a, sig);

        console.log("shifting", start - gasleft());
    }
}
