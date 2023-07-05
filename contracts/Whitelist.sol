// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Whitelist {
    // Number of whitelist addresses allowed
    uint8 public maxWhitelistAddresses;

    // Is address whitelisted
    mapping(address => bool) public whitelistedAddress;

    // Total number of addresses whitelisted till now
    uint8 public totalWhitelistedAddresses;

    constructor(uint8 _maxWhitelistAddresses) {
        maxWhitelistAddresses = _maxWhitelistAddresses;
    }

    function addAddressToWhitelist(address _addr) public {
        // Check if user/address is already whitelisted
        require(!whitelistedAddress[_addr], "Address is already whitelisted.");

        // Check if number of user/whitelisted address has reached max count
        require(
            totalWhitelistedAddresses < maxWhitelistAddresses,
            "Limit reached, more addresses cannot be added."
        );

        // Updated whitelist address and increase count
        whitelistedAddress[_addr] = true;
        totalWhitelistedAddresses += 1;
    }
}
