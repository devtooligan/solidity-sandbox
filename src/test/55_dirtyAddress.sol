// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
import "forge-std/Test.sol";

contract Test55 is Test {

    function test(address to) public {}

    function test_dirtyAddress() external {
        // change highest byte to 1
        // ex. 0x0000000000000000000000007fa9385be102ac3eac297483dd6233d62b3e1496
        //  -> 0x1000000000000000000000007fa9385be102ac3eac297483dd6233d62b3e1496
        uint dirty = (uint(uint160(address(this))) + (1 << 252));

        // use assembly to cast to address leaving highest byte dirty
        address dirtyAddy;
        assembly {
            dirtyAddy := dirty
        }
        test(dirtyAddy); // internal call does not revert (dirty bits unchecked)

        (bool success,) = address(this).call(abi.encodeWithSignature("test(address)", dirty));
        assertFalse(success); // external call reverts due to dirty bits
    }
}
