// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

contract SolutionTest is Test {
    address public solution;

    function setUp() public {
        solution = address(HuffDeployer.deploy("Solution"));
        console.log(  );
    }

    function testSolutionNoCalldata() public {
        (bool _success, bytes memory _returnData) = solution.call("");
        assertTrue(_success);
        assertEq(_returnData, "");
    }

    function testSolutionOneByteCalldata() public {
        (bool _success, bytes memory _returnData) = solution.call("a");
        assertTrue(_success);
        assertEq(_returnData, "a");
    }

    function testSolutionProperCalldata() public {
        (bool _success, bytes memory _returnData) = solution.call("abc");
        assertTrue(_success);
        assertEq(_returnData, "cba");
    }
}
