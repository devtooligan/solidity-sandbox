// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
import "forge-std/Test.sol";

contract D {
    function bye() external payable returns (bytes memory data){
        data = abi.encodePacked("bye");
        selfdestruct(payable(msg.sender));
    }
}

contract Test71 is Test {

    function test_sd() external {
        D d = new D();

        (bool succ, bytes memory data) = address(d).call(abi.encodeWithSignature("bye()"));
        console.log("succ", succ ? "true" : "false");
        console.logBytes(data);
    }
}
