// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
import "forge-std/Test.sol";

contract Test88 is Test {

    function test_arrs() external {
        uint[] memory arr = new uint[](3);
        arr[0] = 1;
        arr[1] = 2;
        arr[2] = 3;
        console.log(arr[0]);
        console.log(arr[1]);
        console.log(arr[2]);
        arr = new uint[](1);
        console.log(arr[0]);
        arr[0] = 8;
        console.log(arr[0]);
        arr = new uint[](2);
        console.log(arr[0]);
        console.log(arr[1]);
        // console.log(arr[2]);
        arr[0] = 7;
        console.log(arr[0]);
        console.log(arr[1]);
        // console.log(arr[2]);



    }
}
