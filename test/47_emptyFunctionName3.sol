// SPDemptyFunctionName3-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "forge-std/console.sol";

contract EmptyFunctionName3 {
    receive() payable external {
        console.log("I got eth!");
        console.log(msg.value);
    }
}

contract Test47 is Test {

    EmptyFunctionName3 public e;

    function setUp() public {
        e = new EmptyFunctionName3();
    }

    function test_emptyFunctionName3() external {
        vm.deal(address(this), 20 ether);
        address(e).call{value: 10 ether}("");
    }
}
