// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "../Contract.sol";
import "../PPs/implementation/DummyPoolKeeper.sol";

interface CheatCodes {
    function prank(address) external;

    function store(
        address account,
        bytes32 slot,
        bytes32 value
    ) external;
}

contract ContractTest is DSTest {
    Contract con;
    PoolKeeper keeper;
    CheatCodes cheats = CheatCodes(HEVM_ADDRESS);

    function setUp() public {
        con = new Contract();
        keeper = new PoolKeeper();
    }

    function testExample() public {
        address keeperAddress = address(keeper);
        bytes32 addressInBytes;
        assembly {
            addressInBytes := keeperAddress
        }
        cheats.store(address(con), 0, addressInBytes);
        address retVal = con.store();
        assertEq(retVal, keeperAddress);
        // con.upkeep();
    }
}
