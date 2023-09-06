// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
import "forge-std/Test.sol";


contract Proxy {
    address impl;
    uint money;
    constructor(address impl_) {
        impl = impl_;
    }
    fallback(bytes calldata data_) external payable returns (bytes memory) {
        (bool success, bytes memory data) = impl.delegatecall(msg.data);
        require(success);
        return data;
    }
}

contract Impl {
    address impl;
    function validate(address newImpl) external returns (bool){
        impl = newImpl;
        return true;
    }
}

contract NewImpl {
    uint a;
    uint b;
    function steal() external {
        b = 0;
        console.log("stolen");
    }
}

contract Test86 is Test {
    Impl impl;
    NewImpl impl2;
    address proxy;
    function setUp() public {
        impl = new Impl();
        impl2 = new NewImpl();
        proxy = address(new Proxy(address(impl)));
    }

    function test_upgrademe() external {
        require(Impl(proxy).validate(address(new NewImpl())));
        NewImpl(proxy).steal();
    }
}
