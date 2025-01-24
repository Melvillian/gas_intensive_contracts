// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GasIntensive {
    uint256 public storedValue;

    constructor() {
        storedValue = 1;
    }


    /// Performs an intensive storage read operation, consuming just under 50 million gas.
    /// The function reads the `storedValue` and performs a series of arithmetic operations
    /// on it, resulting in a final value that is returned.
    function intensiveRead() public view returns (uint256) {
        uint256 result = storedValue;

        // perform just under 50 million gas of work (specifically 49_867_498 gas)
        for (uint256 i = 0; i < 148_000; i++) {
            result = result + storedValue;

            // Additional gas-consuming operations
            if (result > 100) {
                result = result / 2;
            } else {
                result = result * 2;
            }
        }

        return result;
    }

    /// Performs an intensive storage read operation, where the amount of gas consumed can be
    /// controlled by the caller using the `numSlotsToRead` parameter. We use sload because
    /// reading from storage is one of the most resource-intensive non-write operations in Solidity
    ///
    /// @notice From manual testing, 48_403_025 gas is consumed for 22_500 slots
    function intensiveStorageRead(uint256 numSlotsToRead) public view returns (uint256) {
        uint256 value;
        for (uint256 i = 0; i < numSlotsToRead; i++) {
            assembly {
                value := sload(i)
            }
        }

        return value;
    }

    /// Performs an intensive storage write operation, where the amount of gas consumed can be
    /// controlled by the caller using the `numSlotsToWrite` parameter. We use sstore
    /// because writing to storage is one of the most resource-intensive operations in Solidity.
    ///
    /// @notice From manual testing, 48_711_386 gas is consumed for 2_200 slots
    function intensiveStorageWrite(uint256 numSlotsToWrite) public {
        for (uint256 i = 0; i < numSlotsToWrite; i++) {
            assembly {
                sstore(i, i) // it doesn't matter what we store here, just that we store something
            }
        }
    }
}
