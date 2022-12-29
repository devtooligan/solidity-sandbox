// SPDX-License-Identifier: MIT
// pragma solidity ^0.4.25;
// import "forge-std/Test.sol";

// contract Uninitialized{
//     address public owner = msg.sender;

//     struct St{
//         uint a;
//     }

//     function func() public {
//         St storage st;
//         st.a = 0x0;
//     }
// }

// contract Test85 is Test {

//     function test_storagevar() external {
//         Uninitialized u = new Uninitialized();
//         console.log(u.owner());
//         u.func();
//         console.log(u.owner());
//     }
// }
