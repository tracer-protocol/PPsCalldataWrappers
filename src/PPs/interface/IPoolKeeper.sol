//SPDX-License-Identifier: CC-BY-NC-ND-4.0
pragma solidity 0.8.10;

/// @title The manager contract interface for multiple markets and the pools in them
interface IPoolKeeper {
    function isUpkeepRequiredSinglePool(address pool)
        external
        view
        returns (bool);

    function checkUpkeepMultiplePools(address[] calldata pools)
        external
        view
        returns (bool);

    function performUpkeepSinglePool(address pool) external;

    function performUpkeepMultiplePools(address[] calldata pools) external;
}
