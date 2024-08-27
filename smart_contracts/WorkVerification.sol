// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WorkVerification {
    struct Work {
        address provider;
        string workDetails;
        bool verified;
    }

    mapping(uint256 => Work) public works;
    uint256 public workCounter;

    function submitWork(string calldata workDetails) external {
        works[workCounter] = Work({
            provider: msg.sender,
            workDetails: workDetails,
            verified: false
        });

        workCounter++;
    }

    function getWork(uint256 workId) external view returns (Work memory) {
        return works[workId];
    }

    function verifyWork(uint256 workId) external {
        Work storage work = works[workId];
        require(work.provider != address(0), "Work does not exist");
        require(!work.verified, "Work already verified");

        // Implement work verification logic

        work.verified = true;
    }
}
