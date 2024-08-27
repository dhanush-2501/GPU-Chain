// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./GPUToken.sol";

contract StakingManager {
    GPUToken public gpuToken;
    mapping(address => uint256) public stakes;

    constructor(address _gpuTokenAddress) {
        gpuToken = GPUToken(_gpuTokenAddress);
    }

    function stake(uint256 amount) external {
        require(gpuToken.balanceOf(msg.sender) >= amount, "Insufficient balance");
        gpuToken.transferFrom(msg.sender, address(this), amount);
        stakes[msg.sender] += amount;
    }

    function unstake(uint256 amount) external {
        require(stakes[msg.sender] >= amount, "Not enough staked");
        stakes[msg.sender] -= amount;
        gpuToken.transfer(msg.sender, amount);
    }

    function getStake(address user) external view returns (uint256) {
        return stakes[user];
    }
}
