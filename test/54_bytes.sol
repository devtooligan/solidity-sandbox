// SPDbytes-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";

contract Test54 is Test {
    mapping(uint256 => mapping(uint256 => uint256)) public things;

    function setSomething() external {
        things[0x11111111][0x22222222] = uint256(0xbabe);
    }

    function test_bytes() external {
        uint256 start = gasleft();
        bytes32 a = bytes32(abi.encode("hello"));
        uint256 stop = gasleft();
        console.log('bytes32(abi.encode("hello"))', start - stop);

        start = gasleft();
        bytes32 b = bytes32("hello");
        stop = gasleft();
        console.log('bytes32("hello")', start - stop);

        // start = gasleft();
        // bytes32 b = bytes32("hello");
        // stop = gasleft();
        // console.log('bytes32("hello")', start - stop);
    }
}
