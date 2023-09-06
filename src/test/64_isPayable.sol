// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Test.sol";

contract Utility {
    error BadCalldata();
    error NonPayable();
    error Payable();
    error NoCode();

    function isPayable(address addr, bytes memory data, uint256 value) public returns (bool) {

        require((address(this).balance > 0) && (address(this).balance >= value), "flashloan not implemented");

        (, bytes memory returnData) =
            address(this).call(abi.encodeWithSignature("_isPayable(address,bytes,uint256)", addr, data, value));
        if (bytes4(returnData) == Utility.Payable.selector) {
            return true;
        } else if (bytes4(returnData) == Utility.NonPayable.selector) {
            return false;
        } else if (bytes4(returnData) == Utility.NoCode.selector) {
            revert NoCode();
        } else if (bytes4(returnData) == Utility.BadCalldata.selector) {
            revert BadCalldata();
        } else {
            revert("unknown error");
        }
    }

    function _isPayable(address addr, bytes memory data, uint256 value) external returns (bool) {
        if (addr.code.length == 0) revert NoCode();
        require(msg.sender == address(this), "only callable from this contract");

        (bool success,) = addr.call{value: value > 0 ? value : 1}(data);
        if (success) {
            // if it works with this calldata and value provided, it's payable
            revert Payable();
        } else {
            // try again without value
            (success,) = addr.call(data);

            // if it succeeds without value, it's probably not payable
            if (success) revert NonPayable();

            // otherwise there's something wrong with the calldata
            revert BadCalldata();
        }
    }
}

contract IsPayable is Test {
    Utility public utility = new Utility();

    function setUp() external {
        vm.deal(address(utility), 100 ether);
    }

    // functions for testing
    function payableFunction() external payable {}
    function nonPayableFunction() external {}
    function deposit(uint256 amount) external payable {
        require(msg.value == amount, "amount != msg.value");
    }

    function test_isPayable() external {
        // assert `payableFunction` is payable
        assert(utility.isPayable(address(this), abi.encodeWithSelector(IsPayable.payableFunction.selector, ""), 0));

        // assert `nonPayableFunction` is notpayable
        assert(!utility.isPayable(address(this), abi.encodeWithSelector(IsPayable.nonPayableFunction.selector, ""), 0));

        // expect EOA address reverts NoCode()
        vm.expectRevert(Utility.NoCode.selector);
        address payable eoa = payable(address(0xbadbabe));
        utility.isPayable(eoa, abi.encodeWithSelector(bytes4(uint32(0xbadbabe))), 0);

        // expect random calldata reverts BadCallData() with improper calldata and value sent
        vm.expectRevert(Utility.BadCalldata.selector);
        utility.isPayable(address(this), abi.encodeWithSelector(bytes4(uint32(0xbadbabe))), 0);

        // expect `deposit` reverts with BadCallData() when incorrect calldata is sent with value
        vm.expectRevert(Utility.BadCalldata.selector);
        utility.isPayable(address(this), abi.encodeWithSelector(IsPayable.deposit.selector), 1 ether);

        // assert `deposit` is payable with correct calldata
        assert(utility.isPayable(address(this), abi.encodeWithSelector(IsPayable.deposit.selector, 1 ether), 1 ether));
    }
}
