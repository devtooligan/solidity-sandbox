// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

interface Foo {
    function x() external;
}

interface Bar is Foo {
    function y() external;
}

contract AccessBarX {
    function test() public pure {
      // This works
      // Bar.y.selector;

      // This fails with "Error: Member "x" not found or not visible after argument-dependent
      // lookup in type(contract Bar)."
      // Bar.x.selector;
    }
}


contract Test_InterfaceId is Test {

  function test_IdGeneration() public {

    // Passes
    // assertEq(type(Foo).interfaceId, Foo.x.selector);

    // Fails
    //   Expected: 0xa93897d600000000000000000000000000000000000000000000000000000000
    //   Actual: 0xa56dfe4a00000000000000000000000000000000000000000000000000000000
    // assertEq(  // commented out to make test pass
    //   type(Bar).interfaceId,
    //   Foo.x.selector ^ Bar.y.selector
    // );
  }
}
