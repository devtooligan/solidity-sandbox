// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;
import "forge-std/Test.sol";

contract Target {}

contract Spoofer is Test {
    address public target;

    function setUp() public {
        target = address(new Target());
    }

    /// external func used instead of internal to get 100% on test coverage 🤸‍♀️🤸‍♀️🤸‍♀️
    function hasCode(address x) external returns (bool) {
        return x.code.length > 0;
    }

    function initialize() public {
        require(!this.hasCode(address(this)), "has code!");
        // do initializey stuff
    }

    function test_codelength() external {

        // unmocked, target has code
        assertTrue(this.hasCode(target));

        vm.mockCall(
            address(this),
            abi.encodeWithSelector(this.hasCode.selector, target),
            abi.encode(bool(false))
        );

        // mocked, it does not
        assertFalse(this.hasCode(target));
    }
}
