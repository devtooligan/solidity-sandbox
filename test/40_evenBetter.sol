// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;
import "forge-std/Test.sol";

contract EmoContract {
    function initialize() public {
        require(address(this).code.length == 0, "has code");
        // initializey stuff
        console.log("HERE!");
    }
}

contract Spoofie {
    constructor(address target) {
        target.delegatecall(abi.encodeWithSelector(EmoContract.initialize.selector, ""));
    }
}

contract Test40 is Test {

    EmoContract public ec;

    function setUp() public {
        ec = new EmoContract();
    }


    function test_evenBetter2() external {
        vm.expectRevert(bytes("has code"));
        ec.initialize();

        new Spoofie(address(ec));
    }
}
