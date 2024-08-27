// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReputationSystem {
    mapping(address => uint256) public reputation;

    function updateReputation(address provider, uint256 score) external {
        reputation[provider] += score;
    }

    function getReputation(address provider) external view returns (uint256) {
        return reputation[provider];
    }
}
