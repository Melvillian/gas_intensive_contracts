// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {GasIntensive} from "../src/GasIntensive.sol";

contract GasIntensiveScript is Script {
    GasIntensive public reader;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        reader = new GasIntensive();

        vm.stopBroadcast();
    }
}
