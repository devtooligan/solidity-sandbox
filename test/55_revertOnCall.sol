// SPDrevertOnCall-License-Identifier: MIT
pragma solidity ^0.8.15;
import "forge-std/Test.sol";

contract RevertOnCall {
    function balanceOf() public {
        revert("sucker");
    }
}

contract Test55 is Test {
    RevertOnCall public r;


    function test_revertOnCall() external {
        r = new RevertOnCall();
        console.log('hi1');
        r.balanceOf();
        console.log('hi2');
        assert(1 == 2);

    }
}
