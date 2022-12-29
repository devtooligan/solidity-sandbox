// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";

contract T {

    uint answer;
    function add(uint[] calldata nums) public returns (uint answer_) {
        answer = answer_ = nums[0] + nums[1];
    }

    function getAnswer(uint x) public view returns (uint answer_) {
        uint[] memory nums = new uint[](2);
        nums[0] = x;
        nums[1] = 1;
        answer_ = answer + x;
    }

}

contract Test87 is Test {

    function test_publicVSexternal() external {
        T t = new T();
        uint[] memory nums = new uint[](2);
        nums[0] = 1;
        nums[1] = 2;
        uint start  = gasleft();
        t.add(nums);
        console.log("add", start - gasleft());
    }
}
