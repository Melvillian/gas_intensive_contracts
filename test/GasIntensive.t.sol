// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {GasIntensive} from "../src/GasIntensive.sol";

contract GasIntensiveTest is Test {
    GasIntensive public reader;

    function setUp() public {
        reader = new GasIntensive();
    }

    function test_call() public {
        reader.intensiveRead();
    }
}
