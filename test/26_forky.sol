// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";


interface Forky {
    function convertBalanceToUnderlying(uint256 balance) external returns (uint256);
    function convertUnderlyingToBalance(uint256 underlyingAmount) external returns (uint256);
}

contract Test26 is Test {

    function testFail_forky() external {
        // supposed to be run on fork, change testFail to test
        address EDAI = 0xe025E3ca2bE02316033184551D4d3Aa22024D9DC;
        uint shares = 24616823692986978617466;
        console.log("eDai.convertBalanceToUnderlying(", "1e18", ")");
        uint rate = Forky(EDAI).convertBalanceToUnderlying(1e18);
        console.log(rate);
        console.log("convertBalanceToUnderlying(", shares, ")");
        uint base = Forky(EDAI).convertBalanceToUnderlying(shares);
        console.log(base);
        console.log("convertUnderlyingToBalance(", base, ")");
        uint newShares = Forky(EDAI).convertUnderlyingToBalance(base);
        console.log(newShares);
    }
}
