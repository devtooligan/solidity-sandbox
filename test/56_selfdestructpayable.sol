// SPDselfdestructpayable-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";

contract Receiver {
    receive() payable external {
        console.log('received');
    }
}

contract Selfdestructpayable {
    function sd(address payable who) external {
        selfdestruct(who);
    }
}

contract Test56 is Test {
    Receiver public r;
    Selfdestructpayable public s;

    function setUp() public {
        r = new Receiver();
        s = new Selfdestructpayable();
        vm.deal(address(s), 10 ether);
    }
    function test_selfdestructpayable() external {
        s.sd(payable(address(r)));
    }
}
