// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./GPUToken.sol";

contract Governance {
    GPUToken public gpuToken;

    struct Proposal {
        string description;
        uint256 voteCount;
        bool executed;
    }

    mapping(uint256 => Proposal) public proposals;
    uint256 public proposalCounter;

    mapping(uint256 => mapping(address => bool)) public votes;

    constructor(address _gpuTokenAddress) {
        gpuToken = GPUToken(_gpuTokenAddress);
    }

    function createProposal(string calldata description) external {
        proposals[proposalCounter] = Proposal({
            description: description,
            voteCount: 0,
            executed: false
        });

        proposalCounter++;
    }

    function vote(uint256 proposalId) external {
        require(!votes[proposalId][msg.sender], "Already voted");
        require(!proposals[proposalId].executed, "Proposal already executed");

        votes[proposalId][msg.sender] = true;
        proposals[proposalId].voteCount += gpuToken.balanceOf(msg.sender);
    }

    function executeProposal(uint256 proposalId) external {
        Proposal storage proposal = proposals[proposalId];
        require(!proposal.executed, "Proposal already executed");

        // Implement execution logic based on your requirements
        proposal.executed = true;
    }
}
