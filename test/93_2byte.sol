// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";

contract A {
    function f(bytes1 val) public  returns (bytes1) {
        console.log("1byte");
        return val;
    }

    function f(bytes2 val) public  returns (bytes2) {
        console.log("2byte");
        return val;
    }

}

contract Test93 is Test {

    function test_2byte() external {
        A a = new A();
        bytes1 val1 = bytes1(0x03);
        (bool success1, bytes memory retval1) = address(a).call(abi.encodeWithSignature("f(bytes1)", val1));
        require(success1);
        console.log(uint8(bytes1(retval1)));

        bytes2 val2 = bytes2(0x0004);
        (bool success2, bytes memory retval2) = address(a).call(abi.encodeWithSignature("f(bytes2)", val2));
        require(success2);
        console.log(uint16(bytes2(retval2)));
    }
}
