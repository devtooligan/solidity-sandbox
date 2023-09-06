// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
import "forge-std/Test.sol";

contract Test70 is Test {
    uint[] public arr;

    function setUp() public {
        arr.push(1);
        arr.push(2);
        arr.push(3);
    }

    function test_arrayfun() external {
        console.log("arr.length", arr.length);
        console.log("arr[0]", arr[0]);
        console.log("arr[1]", arr[1]);
        console.log("arr[2]", arr[2]);
        delete arr;
        console.log("arr.length", arr.length);
        // console.log("arr[0]", arr[0]);
        // console.log("arr[1]", arr[1]);
        // console.log("arr[2]", arr[2]);
    }
}
