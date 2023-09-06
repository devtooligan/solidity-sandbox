// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import "forge-std/Test.sol";
import "forge-std/console.sol";

contract Test54 is Test {
    enum Role
    // No oracle role has been set for address a
    {
        Unset,
        // Signing address for the s_oracles[a].index'th oracle. I.e., report
        // signatures from this oracle should ecrecover back to address a.
        Signer,
        // Transmission address for the s_oracles[a].index'th oracle. I.e., if a
        // report is received by OCR2Aggregator.transmit in which msg.sender is
        // a, it is attributed to the s_oracles[a].index'th oracle.
        Transmitter
    }

    struct Oracle {
        uint8 index; // Index of oracle in s_signers/s_transmitters
        Role role; // Role of the address which mapped to this struct
    }

    mapping(address => Oracle) public s_oracles;

    function test_deleteStruct() external {
        s_oracles[address(this)] = Oracle(7, Role.Signer);
        console.log(s_oracles[address(this)].index);
        console.log(uint(s_oracles[address(this)].role));
        delete s_oracles[address(this)];
        console.log(s_oracles[address(this)].index);
        console.log(uint(s_oracles[address(this)].role));

    }
}
