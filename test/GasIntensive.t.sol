// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {GasIntensive} from "../src/GasIntensive.sol";

contract GasIntensiveTest is Test {
    GasIntensive public reader;

    function setUp() public {
        reader = new GasIntensive();
    }

    function test_call() public view {
        reader.intensiveRead(); // this results in 49867510 gas used
    }

    function test_storageRead() public view {
        reader.intensiveStorageRead(52_50); // this results in 48403025 gas used
    }

    function test_storageWrite() public {
        reader.intensiveStorageWrite(2_200); // this results in 48711386 gas used
    }

    function test_storedValue_read() public {
        reader.storedValue(); // this results in 7562 gas used
    }

    
}
