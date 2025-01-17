/**
 * SPDX-License-Identifier: MIT
 **/

pragma solidity =0.8.17;
pragma experimental ABIEncoderV2;

/**
 * @title IPump defines the interface for a Pump.
 *
 * @dev
 * Pumps are on-chain oracles that are updated upon each interaction with a {IWell}.
 * When reading a Pump, always verify the Pump's functionality.
 */
interface IPump {

    /**
     * @notice Attaches the Pump to a Well.
     * @param n The number of tokens in the Well
     * @param data Pump data provided on every call
     * @dev Should be called by a Well during construction. See {Well-constructor}.
     * `msg.sender` should be assumed to be the Well address.
     */
    function attach(uint n, bytes calldata data) external;

    /**
     * @notice Updates the Pump with the given reserves.
     * @param reserves The previous reserves of the tokens in the Well.
     * @param data Pump data provided on every call
     * @dev Pumps are updated every time a user swaps, adds liquidity, or
     * removes liquidity from a Well.
     */
    function update(uint[] calldata reserves, bytes calldata data) external;

    /**
     * @notice Reads Pump data related to an attached Well.
     * @param well The address of the Well
     * @param readData The data to be read by the Pump
     * @return data The data read from the Pump
     */
    function read(address well, bytes calldata readData) view external returns (bytes memory data);
} 