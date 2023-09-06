// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
import "forge-std/Test.sol";

contract pureConsole {
    event Event();
    /*********************
     * string + uint256
     ********************/

    function log(string memory errorMessage, uint256 value) internal pure {
        _castToPureStringUint(_logStringUint)(errorMessage, value);
    }

    function _castToPureStringUint(function(string memory, uint256) internal fnIn)
        internal
        pure
        returns (function(string memory, uint256) pure fnOut)
    {
        assembly {
            fnOut := fnIn
        }
    }

    function _logStringUint(string memory errorMessage, uint256 value) internal {
        console.log(errorMessage, value);
        emit Event();

    }

    /*********************
     * uint256 only
     ********************/

    function log(uint256 value) internal pure {
        _castToPureUint(_logUint)(value);
    }

    function _castToPureUint(function(uint256) internal view fnIn)
        internal
        pure
        returns (function(uint256) pure fnOut)
    {
        assembly {
            fnOut := fnIn
        }
    }

    function _logUint(uint256 value) internal view {
        console.log(value);
    }

    /*********************
     * string only
     ********************/

    function log(string memory value) internal pure {
        _castToPureString(_logString)(value);
    }

    function _castToPureString(function(string memory) internal view fnIn)
        internal
        pure
        returns (function(string memory) pure fnOut)
    {
        assembly {
            fnOut := fnIn
        }
    }

    function _logString(string memory value) internal view {
        console.log(value);
    }


}

contract Test43 is Test {
    event Event();
    pureConsole pc;
    function setUp() public {
        pc = new pureConsole();
    }
    function test_pureLog() external {
        // vm.expectEmit();
        address(pc).delegatecall(abi.encodeWithSignature("log(string,uint256)", "z0age is goated", 420));
        // pureConsole.log("z0age is goated");
        // pureConsole.log("Message:", 420);

    }
}
