// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserRegistration {
    struct User {
        string name;
        string contactInfo;
        uint256 userId;
    }

    mapping(address => User) public users;
    uint256 public userCounter;

    function registerUser(string calldata name, string calldata contactInfo) external {
        require(bytes(users[msg.sender].name).length == 0, "User already registered");

        users[msg.sender] = User({
            name: name,
            contactInfo: contactInfo,
            userId: userCounter
        });

        userCounter++;
    }

    function getUserInfo(address user) external view returns (User memory) {
        return users[user];
    }
}
