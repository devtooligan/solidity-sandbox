// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
import "forge-std/Test.sol";

contract Target {
    function moreThanOneGas() public {
        console.log(gasleft());
    }

}
contract Test78 is Test {

    function test_kurt() external {
        Target target = new Target();
        target.moreThanOneGas{gas: 300}();
        // target.moreThanOneGas{gas: 1}();
    }
}
