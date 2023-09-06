// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
import "forge-std/Test.sol";

interface K {
    function test() external;
}

contract Testeroo {
    function test() external returns (bytes32) {
        assembly {
            mstore(0x0, 0x12345678)
            mstore(0x20, 0x87654321)
            return(0, 0x40)
        }
    }
}
contract Test61 is Test {

    Testeroo testeroo;

    function setUp() public  {
        testeroo = new Testeroo();
    }

    function test_badinterface() external {
        (bytes32 x) = testeroo.test();
        // (bytes32 x, bytes32 y) = testeroo.test();
        // uint y = 0x69696969;
        console.logBytes(abi.encode(x));
        // bytes32 y;
        assembly {
            // returndatacopy(0, 0x20, 0x20)
            // y := returndatasize()
        }
            // console.logBytes(abi.encode(y));

        (bool success, bytes memory data) = address(testeroo).call(abi.encodeWithSignature("test()"));
        console.logBytes(data);
    }
}
