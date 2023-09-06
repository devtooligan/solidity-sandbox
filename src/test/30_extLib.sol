// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
import "forge-std/Test.sol";
contract Impl {
    function test() external pure returns (uint) {
        return 1;
    }
}
library Deploy {
    function deploy() external returns (Impl) {
        return new Impl();
    }
}

contract Test30 is Test {

    function test_extLib() external {
        Impl impl = Deploy.deploy();
        assertEq(impl.test(), 1);
    }
}
