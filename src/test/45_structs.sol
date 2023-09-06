// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
import "forge-std/Test.sol";

contract Test45 is Test {
    struct Ok {
        uint256 a;
        uint256 b;
    }

    mapping(address => Ok) public oks;

    function test_structs() external {
        Ok memory ok = Ok(1, 2);
        oks[msg.sender] = ok;
        assertEq(oks[msg.sender].a, 1);
        assertEq(oks[msg.sender].b, 2);
        assertEq(oks[address(this)].a, 0);
        assertEq(oks[address(this)].b, 0);
    }
}
