// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "solmate/utils/SignedWadMath.sol";
import "solmate/utils/FixedPointMathLib.sol";

contract Test99 is Test {

    function test_expMath() external {
        int yearWad = wadDiv(44 * 1e18, 365250000000000000000);
        console.log(uint(yearWad));
        console.log(uint(44 days));
        int rateWad = 67 * 1e18 / 1000;
        uint256 debtMultiplerWad = uint256(
            wadExp(wadMul(yearWad, rateWad))
        ); // exp(r * Δt). Cast to uint is safe here because result is always positive
        uint answer = FixedPointMathLib.mulWadUp(
            5000 * 1e18,
            debtMultiplerWad
        ); // Divides by WAD to bring result back to original unit
        console.log(answer/ 1e12);
    }
}
