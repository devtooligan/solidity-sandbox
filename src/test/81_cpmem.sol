// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
import "forge-std/Test.sol";

struct MyStruct {
    uint256 a;
    uint256 b;
    uint256 c;
    uint256 d;
    uint256 e;
}
contract Test81 is Test {
    function copier(MyStruct memory a) internal pure returns (MyStruct memory b) {
        assembly {
            b := a
        }
    }

    function test_cpmem() external {
        MyStruct memory a = MyStruct(1,2,3,4,5);
        MyStruct memory b = copier(a);
        console.log(b.b);
    }
}
