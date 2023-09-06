// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
import "forge-std/Test.sol";

contract A {
    function yo() public {
        console.log(gasleft());
    }
}

contract Solver {
    A a = new A();

    function solve() external {

        // If you don't specify, the called context gets all but 63/64 of the gas
        // which changes each call.
        console.log("63/64");
        a.yo();
        a.yo();
        a.yo();

        // If you specify, the called context gets only the allotted amount but
        // the same every time (until it goes under minium)
        console.log("gas set");
        address(a).call{gas: 10000}(abi.encodeWithSelector(a.yo.selector));
        address(a).call{gas: 10000}(abi.encodeWithSelector(a.yo.selector));
        address(a).call{gas: 10000}(abi.encodeWithSelector(a.yo.selector));
        address(a).call{gas: 10000}(abi.encodeWithSelector(a.yo.selector));
    }
}

contract Puzzle {
    function callSolve(address solver) external {
        require(gasleft() > 100_000, "not enough gas");
        solver.call{gas: 100_000}(abi.encodeWithSelector(Solver.solve.selector));
    }
}
contract Test77 is Test {
    Solver solver = new Solver();
    function test_gasleft() external {
        Puzzle puzzle = new Puzzle();
        puzzle.callSolve{gas: 20000}(address(solver));

    }
}

// user calls curta -> puzzle -> huff -> solutioncontract
