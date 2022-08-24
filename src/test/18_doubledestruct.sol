// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
import "forge-std/Test.sol";

contract Destructor {
    constructor() {
        selfdestruct(payable(address(0xBADBABE)));
    }
}

contract Test18 is Test {
    function shortlived() public {
        bytes memory initCode = abi.encodePacked(type(Destructor).creationCode);
        uint256 salt = 0xB0FFED;
        address addr;
        uint start = gasleft();
        assembly {
            let codeSize := mload(initCode) // get size of initCode
            addr := create2(
                0, // 0 wei
                add(initCode, 32), // the bytecode starts at the second slot. The first slot contains array length.
                codeSize, // size of init_code
                salt // salt from function arguments
            )
        }
        uint gasused = start - gasleft() - 3;
        require(gasused < 9000000000000000000, "Out of gas");
    }

    function test_singledestruct() external {
        shortlived();
    }

    function testFail_doubledestruct() external {
        shortlived();
        shortlived();
    }
}
