// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./GPUToken.sol";

contract PaymentProcessor {
    GPUToken public gpuToken;
    mapping(address => uint256) public balances;

    constructor(address _gpuTokenAddress) {
        gpuToken = GPUToken(_gpuTokenAddress);
    }

    function deposit(uint256 amount) external {
        require(gpuToken.balanceOf(msg.sender) >= amount, "Insufficient balance");
        gpuToken.transferFrom(msg.sender, address(this), amount);
        balances[msg.sender] += amount;
    }

    function withdraw(uint256 amount) external {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        gpuToken.transfer(msg.sender, amount);
    }

    function makePayment(address recipient, uint256 amount) external {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
    }

    function getBalance(address user) external view returns (uint256) {
        return balances[user];
    }
}
