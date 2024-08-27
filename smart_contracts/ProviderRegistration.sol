// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProviderRegistration {
    struct Provider {
        string name;
        string contactInfo;
        uint256 providerId;
        string nodeInfo;
    }

    mapping(address => Provider) public providers;
    uint256 public providerCounter;

    function registerProvider(string calldata name, string calldata contactInfo, string calldata nodeInfo) external {
        require(bytes(providers[msg.sender].name).length == 0, "Provider already registered");

        providers[msg.sender] = Provider({
            name: name,
            contactInfo: contactInfo,
            providerId: providerCounter,
            nodeInfo: nodeInfo
        });

        providerCounter++;
    }

    function getProviderInfo(address provider) external view returns (Provider memory) {
        return providers[provider];
    }
}
