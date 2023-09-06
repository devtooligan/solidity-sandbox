// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
// import "forge-std/Test.sol";
// import "forge-std/console.sol";

interface IPuzzle {
    /// @notice Returns the puzzle's name.
    /// @return The puzzle's name.
    function name() external pure returns (string memory);

    /// @notice Generates the puzzle's starting position based on a seed.
    /// @dev The seed is intended to be `msg.sender` of some wrapper function or
    /// call.
    /// @param _seed The seed to use to generate the puzzle.
    /// @return The puzzle's starting position.
    function generate(address _seed) external returns (uint256);

    /// @notice Verifies that a solution is valid for the puzzle.
    /// @dev `_start` is intended to be an output from {IPuzzle-generate}.
    /// @param _start The puzzle's starting position.
    /// @param _solution The solution to the puzzle.
    /// @return Whether the solution is valid.
    function verify(uint256 _start, uint256 _solution) external returns (bool);
}
/// @title 2 × 4 = 8
/// @author fiveoutofnine

contract TwoTimesFourIsEight is IPuzzle {
    uint256 private constant CURTA = 0x400010005000000040001000500000004000100050000000422232227;

    uint256 private constant WATERFALL = 0x104104104104;

    uint256 private constant PRICING = 0x820820820820;

    uint256 private constant SHANEFANX = 0x104104504104;

    uint256 private constant FIVEOUTOFNINE = 0x1FE;

    /// @inheritdoc IPuzzle
    function name() external pure returns (string memory) {
        return unicode"2 × 4 = 8";
    }

    /// @inheritdoc IPuzzle
    function generate(address _seed) external pure returns (uint256) {
        uint256 seed = uint256(keccak256(abi.encodePacked(_seed)));
        uint256 puzzle;

        uint256 nineoutoffive = 1 << 64;
        uint256 j = 64;
        for (uint256 i = 1; i < 9;) {
            if (seed == 0) break;

            while ((nineoutoffive >> j) & 1 == 1 && seed != 0) {
                j = seed & 0x3F;
                seed >>= 6;
            }
            nineoutoffive |= 1 << j;

            puzzle |= (i << (j << 2));
            j = 64;
            unchecked {
                ++i;
            }
        }

        return puzzle;
    }


    /// @inheritdoc IPuzzle
    function verify(uint256 _start, uint256 _solution) public pure returns (bool) {
        for (uint256 i; i < 256;) {
            // console.log("******************************");
            // console.log("now at:", i);
            // console.log("_solution", _solution);
            // console.log("_solution & 0xF", _solution & 0xF);
            // console.log(_start & 0xF);
            if (_start & 0xF != 0 && _start & 0xF != _solution & 0xF) {
                return false;
            }
            // console.log("HEREHEREHEHRHEHHEHHEHHERHEHHERHE");
            uint256 followUs = (CURTA >> i) & 7;
            // console.log(1);
            if (followUs & 4 == 4 && !h(_solution, WATERFALL)) return false;
            // console.log("+ + file: 25_curta.sol:82 + followUs & 4:", followUs & 4);
            // console.log(22222222222222222222222222222222222222222);
            // console.log(22222222222222222222222222222222222222222);
            // console.log(22222222222222222222222222222222222222222);
            // console.log(22222222222222222222222222222222222222222);
            // console.log(22222222222222222222222222222222222222222);
            // console.log(22222222222222222222222222222222222222222);
            if (followUs & 2 == 2 && !h(_solution, PRICING)) return false;
            // console.log("+ + file: 25_curta.sol:90 + followUs & 2:", followUs & 2);
            // console.log(333333333333333333333333333333333);
            // console.log(333333333333333333333333333333333);
            // console.log(333333333333333333333333333333333);
            // console.log(333333333333333333333333333333333);
            // console.log(333333333333333333333333333333333);
            // console.log(333333333333333333333333333333333);
            if (followUs & 1 == 1 && !h(_solution, SHANEFANX)) return false;
            // console.log("+ + file: 25_curta.sol:98 + followUs & 1:", followUs & 1);
            // console.log(4444444444444444444444444444);
            // console.log(4444444444444444444444444444);
            // console.log(4444444444444444444444444444);
            // console.log(4444444444444444444444444444);
            // console.log(4444444444444444444444444444);
            // console.log(4444444444444444444444444444);
            _start >>= 4;
            _solution >>= 4;
            // console.log("******************************");
            // console.log("now shifted by:", i+4);
            // console.log("******************************");
            unchecked {
                i += 4;
            }
        }

        return true;
    }

    function h(uint256 _solution, uint256 _gitswitch) internal pure returns (bool) {
        uint256 solution = _solution;
        uint256 fiveoutofnine;
        // console.log("fiveoutofnine", fiveoutofnine);
        // console.log("solution", solution);
        // console.log("_gitswitch", _gitswitch);
        // console.log("******STARTING WHILE");

        uint256 counter = 0;
        while (_gitswitch != 0) {
            // console.log("counter", counter);
            // console.log("solution & 0xF", solution & 0xF);
            fiveoutofnine |= 1 << (solution & 0xF);
            // console.log("fiveoutofnine", fiveoutofnine);
            solution >>= (_gitswitch & 0x3F);
            // console.log("(to shift solution _gitswitch & 0x3F)", (_gitswitch & 0x3F));
            // console.log("new solution", solution);
            _gitswitch >>= 6;
            // console.log("new _gitswitch", _gitswitch);
            counter++;
        }

        // console.log("fiveoutofnine", fiveoutofnine);
        return fiveoutofnine == FIVEOUTOFNINE; // 0x1fe
    }

    uint256 constant start = 0x0000000300000000000600700500010000000000000000420080000000000000;
    function testRun(uint256 solution) public pure {

        // console.log("start", start);
        // uint256 solution =    0x1425768368731425231658747548213652648317873165424682375131574268;
        // uint256 solution =    0x8478255326356481611642734527813632467815785136425382176417645328;
        // uint2start =       0x0000000300000000000600700500010000000000000000420080000000000000;
        // uint256 solution = 0x8478275326356481618342774527813632467815785136427382176417645328;
        // uint256 solution0xcbagefrhcbagefrhcbagefrhcbage1r6cbagefn5cba182n23ba217n4176453n8;
        // t256 solution =    0x84782553263764816146xxxx4525xxxxzzzz7815785136425382176417645328;
        // uint2start =    0x00000003 00000000 00060070 05000100 00000000 00000042 00800000 00000000;

        bool pass = verify(start, solution);

        assert(!pass);
    }

}

// // contract Test25 is Test {
// contract Test25  {

//     function testRun(uint256 solution) external {
//         TwoTimesFourIsEight puzzle = new TwoTimesFourIsEight();
//         uint256 start = puzzle.generate(address(0xE7aa7AF667016837733F3CA3809bdE04697730eF));
//         // console.log("start", start);
//         // uint256 solution =    0x1425768368731425231658747548213652648317873165424682375131574268;
//         // uint256 solution =    0x8478255326356481611642734527813632467815785136425382176417645328;
//         // uint2start =       0x0000000300000000000600700500010000000000000000420080000000000000;
//         // uint256 solution = 0x8478275326356481618342774527813632467815785136427382176417645328;
//         // uint256 solution0xcbagefrhcbagefrhcbagefrhcbage1r6cbagefn5cba182n23ba217n4176453n8;
//         // t256 solution =    0x84782553263764816146xxxx4525xxxxzzzz7815785136425382176417645328;
//         // uint2start =    0x00000003 00000000 00060070 05000100 00000000 00000042 00800000 00000000;

//         assert(puzzle.verify(start, solution));
//     }

//10000000100001111001100001000000000000000001010001010010010010010100001000110011010101000101010110011000001110010001010000001000001100001000001101101001001001000000011100101000001001100101000000011001011010000011001000010100100001101000001001100000100001000111011000010110

// uint256 solution = 0x7828782866776677555655563444344122332234111211134321876587654312;

// uint256 solution = 0x888788806776677055655560444344202332234011211134321876587654321;
// uint256 solution = 0x88788800776677005655560044344200332234001211134321876587654321;
// uint256 solution = 0x8788800076677000655560004344200032234000211134321876587654321;
// uint256 solution = 0x788800006677000055560000344200002234000011130000876587654321;
// uint256 solution = 0x8800000077000000560000004200000034000000130000876587654321;
// 1000011110001000100000000000000001110110011001110111000000000000011001010101010101100000000000000100001101000100001000000000000000110010001000110100000000000000001000010001000100110000000000000001100001110110010110000111011001010100001100100001
// 1000011110001000100000000000000001110110011001110111000000000000011001010101010101100000000000000100001101000100001000000000000000110010001000110100000000000000001000010001000100110100001100100001100001110110010110000111011001010100001100100001
// 10001000011110001000100000000000011101110110011001110111000000000101011001010101010101100000000001000100001101000100001000000000001100110010001000110100000000000001001000010001000100110100001100100001100001110110010110000111011001010100001100100001
// 100010001000011110001000100000000110 01110111011001100111011100000101 01010110010101010101011000000100 01000100001101000100001000000010 00110011001000100011010000000001 00010010000100010001001101000011 00100001100001110110010110000111 011001010100001100100001
// 100010001000011110001000100000000110011101110110011001110111000001010101011001010101010101100000010001000100001101000100001000000010001100110010001000110100000000010001001000010001000100110100001100100001100001110110010110000111011001010100001100100001
// 011110001000100001111000100010000110 01100111011101100110011101110101 01010101011001010101010101100011 01000100010000110100010000100010 00100011001100100010001101000001 00010001001000010001000100110100 00110010000110000111011001011000 0111011001010100001100100001
// 011110001000100001111000100010000110011001110111011001100111011101010101010101100101010101010110001101000100010000110100010000100010001000110011001000100011010000010001000100100001000100010011010000110010 0001100001110110010110000111011001010100001100100001
// 011110000010 10000111100010001000011001100111 01110110011001110111010101010101 01100101010101010110001101000100 01000011010001000010001000100011 00110010001000110100000100010001 00100001000100010011010000111000 0001100001110110010110000111011001010100001100100001
// 0111100000101000011110001000100001100110011101110110011001110111010101010101011001010101010101100011010001000100001101000100001000100010001100110010001000110100000100010001001000010001000100110100001110000001100001110110010100100111011001010100001110000001
// 111100000101000011110000010100001100110011101110110011001110111010101010101011001010101010101100011010001000100001101000100000100100010001100110010001000110100000100010001001000010001000100110100001100100001100001110110010110000111011001010100001100010010

// }
