// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Test.sol";

contract Contract {
    uint[] public array;
    function _validate(uint i) view internal {
      require(i < array.length);
    }
    function read(uint i) external view returns(uint) {
      _validate(i);
      return array[i];
    } // read the value at index i
    function insert(uint val) external {
      array.push(val);
    } // val is the new value to insert into the array
    function update(uint i, uint val) external {
      _validate(i);
      array[i] = val;
    } // update the value at index i to value val.
    function remove(uint i) external {
      _validate(i);
      // why is there no comment for this one?!?
      uint arrlength =  array.length;
      for (uint idx; idx < arrlength; ++idx) {
        if (idx == arrlength - 1) {
          array.pop();
          break;
        }
        if (idx >= i) {
          array[idx] = array[idx + 1];
        }
        }

    }
}
contract Test35 is Test {
    function test_arr() external {
        Contract c = new Contract();
        c.insert(1);
        c.insert(2);
        c.insert(69);
        c.update(0, 69);
        c.update(1, c.read(1));
        c.remove(1);
        console.log(c.read(0));
        console.log(c.read(1));
    }
}
