// SPDstorageForNestedArrays-License-Identifier: MIT
pragma solidity ^0.8.15;
import "forge-std/Test.sol";


contract Test57 is Test {
    enum State {UNPLANNED, PLANNED, EXECUTED}
    struct Permission {
        uint param1;
        bytes4 sig; // @audit needed?
        uint other;
    }

    // //************ CURRENT PLAN
    struct CurrentPlan {
        State state;
        Permission[] permissions;
        mapping(bytes4 => uint) index;
    }
    mapping(address => CurrentPlan) public currentPlans;


    //************ AlternatePlan PLAN
    struct AlternatePlan {
        State state;
        bytes4[] sigs;
        mapping(bytes32 => Permission) permissions;
    }

    mapping(address => AlternatePlan) public alternatePlans;

    address public someUser = address(0x1);
    bytes4 public someSig = 0x11111111;
    bytes4 public newSig = 0x22222222;

    constructor() {
        Permission memory somePermission = Permission(420, someSig, 69);
        currentPlans[someUser].permissions.push(somePermission);
        currentPlans[someUser].index[someSig] = 0;
        currentPlans[someUser].state = State.PLANNED;
        alternatePlans[someUser].sigs.push(someSig);
        alternatePlans[someUser].permissions[someSig] = somePermission;
        alternatePlans[someUser].state = State.PLANNED;
    }

    function test_storageForNestedArrays() external {
        Permission memory p;
        bytes4 sig = someSig;
        uint start = gasleft();
        p = currentPlans[someUser].permissions[currentPlans[someUser].index[someSig]];
        console.log("read currentPlans", start - gasleft());
        start = gasleft();
        p = alternatePlans[someUser].permissions[sig];
        console.log("read alternatePlans", start - gasleft());
        start = gasleft();
        currentPlans[someUser].permissions.push(Permission(240, newSig, 96));
        currentPlans[someUser].index[newSig] = 1;
        currentPlans[someUser].state = State.PLANNED;
        console.log("write currentPlans", start - gasleft());
        start = gasleft();
        alternatePlans[someUser].sigs.push(someSig);
        alternatePlans[someUser].permissions[newSig] = Permission(240, newSig, 96);
        alternatePlans[someUser].state = State.PLANNED;
        console.log("write alternatePlans", start - gasleft());





    }
}
