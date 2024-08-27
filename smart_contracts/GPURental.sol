// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./GPUToken.sol";

contract GPURental {
    GPUToken public gpuToken;

    struct RentalAgreement {
        address renter;
        address provider;
        uint256 amount;
        uint256 startTime;
        uint256 endTime;
        bool completed;
    }

    mapping(uint256 => RentalAgreement) public rentals;
    uint256 public rentalCounter;

    constructor(address _gpuTokenAddress) {
        gpuToken = GPUToken(_gpuTokenAddress);
    }

    function createRentalAgreement(address provider, uint256 amount, uint256 duration) external {
        require(gpuToken.balanceOf(msg.sender) >= amount, "Insufficient balance");
        
        gpuToken.transferFrom(msg.sender, address(this), amount);
        
        rentals[rentalCounter] = RentalAgreement({
            renter: msg.sender,
            provider: provider,
            amount: amount,
            startTime: block.timestamp,
            endTime: block.timestamp + duration,
            completed: false
        });
        
        rentalCounter++;
    }

    function completeRental(uint256 rentalId) external {
        RentalAgreement storage rental = rentals[rentalId];
        require(msg.sender == rental.renter || msg.sender == rental.provider, "Not authorized");
        require(block.timestamp >= rental.endTime, "Rental period not ended");
        require(!rental.completed, "Rental already completed");

        rental.completed = true;
        gpuToken.transfer(rental.provider, rental.amount);
    }
}
