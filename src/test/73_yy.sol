// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
// import "forge-std/Test.sol";

contract Targ {

    fallback() external {
    // copy to memory for assembly access
    address next = address(0xb0ffedbabe);
    // copied directly from OZ's Proxy contract
    assembly {
      // Copy msg.data. We take full control of memory in this inline assembly
      // block because it will not return to Solidity code. We overwrite the
      // Solidity scratch pad at memory position 0.
      calldatacopy(0, 0, calldatasize())

      // Call the next contract.
      // out and outsize are 0 because we don't know the size yet.
      let result := delegatecall(gas(), next, 0, calldatasize(), 0, 0)

      // Copy the returned data.
      returndatacopy(0, 0, returndatasize())

      switch result
      // delegatecall returns 0 on error.
      case 0 {
        revert(0, returndatasize())
      }
      default {
        return(0, returndatasize())
      }
    }
  }

}

// contract Test73 is Test {

//     function test_yy() external {

//     }
// }
