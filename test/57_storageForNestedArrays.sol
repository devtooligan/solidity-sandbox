// SPDstorageForNestedArrays-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";


// contract Test57 is Test {
//     enum State {UNPLANNED, PLANNED, EXECUTED}
//     struct Permission {
//         uint param1;
//         bytes4 sig; // @audit needed?
//         uint other;
//     }

//     // //************ CURRENT PLAN
//     struct CurrentPlan {
//         State state;
//         Permission[] permissions;
//         mapping(bytes32 => uint) index;
//     }
//     mapping(address => CurrentPlan) public currentPlans;


//     //************ AlternatePlan PLAN
//     struct AlternatePlan {
//         State state;
//         bytes32[] ids;
//         mapping(bytes32 => Permission) permissions;
//     }

//     mapping(address => AlternatePlan) public alternatePlans;

//     address public someUser = address(0x1);
//     bytes32 public someId = bytes32(0x11111111);
//     bytes32 public newId = bytes32(0x22222222);

//     constructor() {
//         Permission memory somePermission = Permission(420, someId, 69);
//         currentPlans[someUser].permissions.push(somePermission);
//         currentPlans[someUser].index[someId] = 0;
//         currentPlans[someUser].state = State.PLANNED;
//         alternatePlans[someUser].ids.push(someId);
//         alternatePlans[someUser].permissions[someId] = somePermission;
//         alternatePlans[someUser].state = State.PLANNED;
//     }

//     function test_storageForNestedArrays() external {
//         Permission memory p;
//         bytes4 sig = someId;
//         uint start = gasleft();
//         p = currentPlans[someUser].permissions[currentPlans[someUser].index[someId]];
//         console.log("read currentPlans", start - gasleft());
//         start = gasleft();
//         p = alternatePlans[someUser].permissions[sig];
//         console.log("read alternatePlans", start - gasleft());
//         start = gasleft();
//         currentPlans[someUser].permissions.push(Permission(240, newId, 96));
//         currentPlans[someUser].index[newId] = 1;
//         currentPlans[someUser].state = State.PLANNED;
//         console.log("write currentPlans", start - gasleft());
//         start = gasleft();
//         alternatePlans[someUser].ids.push(someId);
//         alternatePlans[someUser].permissions[newId] = Permission(240, newId, 96);
//         alternatePlans[someUser].state = State.PLANNED;
//         console.log("write alternatePlans", start - gasleft());





//     }
// }
