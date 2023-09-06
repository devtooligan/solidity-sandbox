// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
import "forge-std/Test.sol";

contract Test69 is Test {
     bytes internal _callbackResult;

    function test_deleteBoogers() external {
        _callbackResult = abi.encode("yoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomama");
        uint start = gasleft();
        delete _callbackResult;
        console.log("gas used: %d", start - gasleft());
        require(_callbackResult.length == 0, "length should be 0");

        _callbackResult = abi.encode("aaaayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomamayoyomama");
        start = gasleft();
        _callbackResult = "";
        console.log("gas used: %d", start - gasleft());
        require(_callbackResult.length == 0, "length should be 0");
    }
}
