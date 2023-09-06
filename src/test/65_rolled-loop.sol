// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Test.sol";

contract UnrolledLoopTest is Test {
    function _transfer1(uint256 counter) internal returns (uint256) {
        // token.transfer(addressList[counter], amount);
        return counter + 1;
    }

    function _transfer2(uint256 counter) internal returns (uint256) {
        return _transfer1(_transfer1(counter));
    }

    function _transfer4(uint256 counter) internal returns (uint256) {
        return _transfer2(_transfer2(counter));
    }

    function _transfer8(uint256 counter) internal returns (uint256) {
        return _transfer4(_transfer4(counter));
    }

    function _transfer16(uint256 counter) internal returns (uint256) {
        return _transfer8(_transfer8(counter));
    }

    function testUnrolledLoop(uint8 target) external {
        uint256 counter;
        uint256 remaining = target;
        while (remaining > 0) {
            if (remaining >= 16) {
                counter = _transfer16(counter);
                remaining -= 16;
            }
            if (remaining >= 8) {
                counter = _transfer8(counter);
                remaining -= 8;
            }
            if (remaining >= 4) {
                counter = _transfer4(counter);
                remaining -= 4;
            }
            if (remaining >= 2) {
                counter = _transfer2(counter);
                remaining -= 2;
            }
            if (remaining >= 1) {
                counter = _transfer1(counter);
                remaining -= 1;
            }
        }
        require(counter == target);
    }
}
