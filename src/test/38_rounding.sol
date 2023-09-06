// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Test.sol";

contract Test38 is Test {
    function btcEthOracle() public pure returns (uint256, bool) {
        return (15e18, false);
    }

    function ethBtcOracle() public pure returns (uint256, bool) {
        return (uint(1e18) / 15, true);
    }

    function ethUsdOracle() public pure returns (uint256, bool) {
        return (2000e18, false);
    }

    function usdEthOracle() public pure returns (uint256, bool) {
        return (uint(1e36) / 2000e18, true);
    }

    function test_rounding_incorrect() public {
        (uint data, bool inverted) = ethBtcOracle();
        (uint oracleRes, bool inverted2) = usdEthOracle();
        if (inverted) {
            data = 10 ** 36 / data; // 10^36 (i.e., 1 with 18 decimals * 10^18) to get the inverse with 18 decimals.
                // 10**36 is automatically precomputed by the compiler, no explicit caching needed
        }

        if (inverted2) {
            data = 10 ** 36 / data * 10 ** 18 / oracleRes;
        } else {
            data = data * oracleRes / 10 ** 18;
        }
        console.log("data: %s", data);
    }


    function test_rounding_fixed_main() public {
        (uint data, bool inverted) = ethBtcOracle();
        (uint oracleRes, bool inverted2) = usdEthOracle();
        if (inverted) {
            data = 10 ** 36 / data; // 10^36 (i.e., 1 with 18 decimals * 10^18) to get the inverse with 18 decimals.
                // 10**36 is automatically precomputed by the compiler, no explicit caching needed
        }

        if (inverted2) {
            data = data * 10 ** 18 / oracleRes;
        } else {
            data = data * oracleRes / 10 ** 18;
        }
        console.log("data: %s", data);
    }

    function test_rounding_fixed_rounding() public {
        (uint oracleRes1, bool inverted) = ethBtcOracle();
        (uint oracleRes2, bool inverted2) = ethUsdOracle();
        uint data = oracleRes1;
        if (inverted) {
            data = 10 ** 36 / oracleRes1; // 10^36 (i.e., 1 with 18 decimals * 10^18) to get the inverse with 18 decimals.
                // 10**36 is automatically precomputed by the compiler, no explicit caching needed
        }

        if (inverted2) {
            data = data * 10 ** 18 / oracleRes2;
        } else {
            data = data * oracleRes2 / 10 ** 18;
        }
        console.log("data: %s", data);
        uint data2 = (1e36 * oracleRes2) / (1e18 * oracleRes1);
        console.log("data2: %s", data2);
    }

}
