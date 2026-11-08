// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title MessageBoard
/// @notice A tiny on-chain message board used for MG3012 Assignment 2.
/// @dev Anyone can post a message; the contract remembers who posted last,
///      how many updates have happened, and who deployed it.
contract MessageBoard {
    string private message;
    address public owner;
    address public lastUpdater;
    uint256 public updateCount;

    event MessageUpdated(address indexed updater, string newMessage, uint256 updateCount);

    constructor() {
        owner = msg.sender;
        message = "Hello, Sepolia!";
    }

    // ---------- READ functions (free, no gas) ----------

    /// @notice Returns the current message.
    function getMessage() public view returns (string memory) {
        return message;
    }

    /// @notice Returns the number of times the message has been updated.
    function getUpdateCount() public view returns (uint256) {
        return updateCount;
    }

    /// @notice Returns the address that posted the latest message.
    function getLastUpdater() public view returns (address) {
        return lastUpdater;
    }

    // ---------- WRITE function (costs gas, needs MetaMask confirmation) ----------

    /// @notice Replaces the current message.
    /// @param newMessage The new text (1 to 280 bytes).
    function updateMessage(string calldata newMessage) public {
        require(bytes(newMessage).length > 0, "Message cannot be empty");
        require(bytes(newMessage).length <= 280, "Message too long (max 280)");
        message = newMessage;
        lastUpdater = msg.sender;
        updateCount += 1;
        emit MessageUpdated(msg.sender, newMessage, updateCount);
    }
}
