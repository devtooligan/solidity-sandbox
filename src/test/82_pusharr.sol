// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
import "forge-std/Test.sol";

contract Test82 is Test {
    uint[] x;

    function test_pusharr() external {
        // console.logBytes(abi.encode(x));
        x.push(0x69);
        // console.logBytes(abi.encode(x));
        x.push() = (0x70);
        // console.logBytes(abi.encode(x));
        uint z = x.push();
        console.logBytes(abi.encode(x));
        z = 1;
        console.logBytes(abi.encode(x));
    }
}
