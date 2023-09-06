// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "abdk-libraries-solidity/ABDKMath64x64.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";
contract Test24 is Test {
    // function test_abdk() external {
    //     (int128 x64, int128 y64) = (ABDKMath64x64.fromInt(0), ABDKMath64x64.fromInt(-1));
    //     int128 avg_ = ABDKMath64x64.avg(x64, y64);
    //     assert(ABDKMath64x64.mul(avg_, ABDKMath64x64.fromUInt(2)) == ABDKMath64x64.add(x, y));
    // }
    // function test_abdk() external {
    //     int128 testPrecision = ABDKMath64x64.fromUInt(1e12);
    //     int128 x = 6;
    //     int128 x64 = ABDKMath64x64.fromInt(x);
    //     console.log("x: %s", uint128(x64));
    //     console.log("ABDKMath64x64.inv(x64): %s", uint128(ABDKMath64x64.inv(x64)));
    //     console.log("ABDKMath64x64.inv(ABDKMath64x64.inv(x64)): %s", uint128(ABDKMath64x64.inv(ABDKMath64x64.inv(x64))));
    //     int128 diff = ABDKMath64x64.sub(ABDKMath64x64.inv(ABDKMath64x64.inv(x64)), x64);
    //     console.log("diff", uint128(diff));
    //     assert(ABDKMath64x64.abs(diff) < testPrecision);
    // }
    // function test_abdk() external {
    //     int128 testPrecision = ABDKMath64x64.fromUInt(1e12);
    //     int128 x = 6;
    //     int128 x64 = ABDKMath64x64.fromInt(x);
    //     console.log("x: %s", uint128(x64));
    //     console.log("ABDKMath64x64.inv(x64): %s", uint128(ABDKMath64x64.inv(x64)));
    //     console.log("ABDKMath64x64.inv(ABDKMath64x64.inv(x64)): %s", uint128(ABDKMath64x64.inv(ABDKMath64x64.inv(x64))));
    //     int128 diff = ABDKMath64x64.sub(ABDKMath64x64.inv(ABDKMath64x64.inv(x64)), x64);
    //     console.log("diff", uint128(diff));
    //     int128 scaled = ABDKMath64x64.toInt(ABDKMath64x64.mul(diff, testPrecision));
    //     console.log("scaled", uint128(scaled));
    //     assert(scaled == 0);
    // }
}
