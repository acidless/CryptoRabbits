pragma solidity ^0.8.20;
// SPDX-License-Identifier: MIT

contract CryptoRabbits {
    struct Cooldown {
        uint64 lowerBound;
        uint64 upperBound;
    }

    //Cooldown[8] public cooldowns;
    // constructor() {
    //         Cooldown[8] memory tempCooldowns = [
    //         Cooldown(1 minutes, 1 minutes),
    //         Cooldown(2 minutes, 5 minutes),
    //         Cooldown(10 minutes, 30 minutes),
    //         Cooldown(1 hours, 2 hours),
    //         Cooldown(4 hours, 8 hours),
    //         Cooldown(16 hours, 24 hours),
    //         Cooldown(2 days, 4 days),
    //         Cooldown(1 weeks, 1 weeks)
    //     ];

    //     for (uint i = 0; i < tempCooldowns.length; i++) {
    //         cooldowns[i] = tempCooldowns[i];
    //     }
    // }

    struct Rabbit {
        string name;
        uint dna;
        uint birthday;
        uint8 generation;
        uint8 breedingCooldown;
    }

    Rabbit[] public rabbits;
    mapping (uint => address) public rabbitToOwner;
    mapping (address => uint) ownerRabbitsCount;

    function _createRabbit(string memory _name) internal {
        uint dna = uint(keccak256(abi.encodePacked(msg.sender)));
        rabbits.push(Rabbit(_name, dna, block.timestamp, 1, 0));
        uint id = rabbits.length - 1;
        rabbitToOwner[id] = msg.sender;
        ownerRabbitsCount[msg.sender] += 1;
    }
}