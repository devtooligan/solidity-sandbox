// SPDX-License-Identifier: MIT
pragma solidity  0.8.0;
import "forge-std/Test.sol";

/// A proxy contract inspired by
/// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/proxy/Proxy.sol
///
/// Only the owner can call the contract, where owner is an immutable variable set during the
/// construction.
///
/// The implementation will be set to a deployment of `Implementation.sol`.
contract Proxy {
    mapping(uint => uint) public slot0;

    address public immutable implementation;

    constructor(address _implementation) {
        slot0[0] = uint(0x69);
        slot0[1] = uint(0x420);
        implementation = _implementation;
    }

    fallback() external payable {
        address _implementation = implementation;
        assembly {
            calldatacopy(0, 0, calldatasize())

            // delegatecall the implementation.
            // out and outsize are 0 because we don't know the size yet.
            let success := delegatecall(gas(), _implementation, 0, calldatasize(), 0, 0)

            // copy the returned data.
            returndatacopy(0, 0, returndatasize())

            switch success
            // delegatecall returns 0 on error.
            case 0 {
                revert(0, returndatasize())
            }
            default {
                return(0, returndatasize())
            }
        }
    }

    receive() external payable {
    }
}

contract Implementation {
    uint public slot0;

    function overwriteSlot0() external returns (uint slt_) {
        slot0 = uint(uint(0x69));
        uint slot0_;
        assembly {
            slt_ := slot0.slot
            slot0_ := sload(slt_)
        }
        console.log("from imple, slot0.slot", slot0_);

    }
}

contract Test24 is Test {

    address payable public p;
    Implementation public i;

    function setUp() public {
        i = new Implementation();
        p = payable(address(new Proxy(address(i))));
    }

    function test_overwrite_slot() external {
        // console.log(Proxy(p).slot0);
        // console.log(Proxy(p).slot0(0));
        // console.log(Proxy(p).slot0(1));
        // uint slot0_;
        // assembly {
        //     slot0_ := sload(0)
        // }
        // console.log("sload(0)", slot0_);
        console.log('slot0[0]', Proxy(p).slot0(0));
        console.log('slot0[1]', Proxy(p).slot0(1));
        console.log('slot0', Implementation(p).slot0());
        Implementation(p).overwriteSlot0();
        console.log('slot0[0]', Proxy(p).slot0(0));
        console.log('slot0[1]', Proxy(p).slot0(1));
        console.log('slot0', Implementation(p).slot0());
        // console.log('slot returned from imple', slt0);
        // assembly {
        //     slot0_ := sload(0)
        // }
        // console.log("sload(0)", slot0_);
        // uint slot0__;

        // assembly {
        //     slot0__ := sload(slt0)
        // }
        // console.log("sload slot returned from call", slot0__);

        // console.log(Proxy(p).slot0);
        // console.log(Proxy(p).slot0(0));
        // console.log(Proxy(p).slot0(1));

    }
}
