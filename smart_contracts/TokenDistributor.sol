// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./GPUToken.sol";

contract TokenDistributor {
    GPUToken public gpuToken;

    constructor(address _gpuTokenAddress) {
        gpuToken = GPUToken(_gpuTokenAddress);
    }

    function distribute(address[] calldata recipients, uint256[] calldata amounts) external {
        require(recipients.length == amounts.length, "Mismatched inputs");

        for (uint256 i = 0; i < recipients.length; i++) {
            gpuToken.transfer(recipients[i], amounts[i]);
        }
    }
}
