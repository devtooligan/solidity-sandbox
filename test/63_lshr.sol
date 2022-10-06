// SPDlshr-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";


contract Test63 is Test {
    uint public numMintedForReserves = 5;
    uint public numGobblersEach = 2;
    function test_lshr() external {
        uint start = gasleft();
        uint256 newNumMintedForReserves = numMintedForReserves += (numGobblersEach * 2);
        console.log(start - gasleft());
    }
}
