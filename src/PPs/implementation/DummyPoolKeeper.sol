//SPDX-License-Identifier: CC-BY-NC-ND-4.0
pragma solidity 0.8.10;

import "../interface/IPoolKeeper.sol";

contract PoolKeeper is IPoolKeeper {
    uint256 LOOP = 100;
    address store;

    function isUpkeepRequiredSinglePool(address pool)
        external
        view
        override
        returns (bool)
    {
        return true;
    }

    function checkUpkeepMultiplePools(address[] calldata pools)
        external
        view
        override
        returns (bool)
    {
        return true;
    }

    function performUpkeepSinglePool(address pool) public override {
        uint256 hello = 123;
        LOOP = 101;
        store = pool;
    }

    function performUpkeepMultiplePools(address[] calldata pools)
        external
        override
    {
        for (uint256 i = 0; i < LOOP; ) {
            performUpkeepSinglePool(pools[i]);
            unchecked {
                ++i;
            }
        }
    }
}
