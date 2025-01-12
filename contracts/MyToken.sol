// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "./CryptoRabbits.sol";

contract MyToken is ERC721, CryptoRabbits {
    uint mintCost = 0.001 ether;

    constructor() ERC721("CryptoRabbitsToken", "RABBITS") {}

    function mint(string memory _name) public payable {
        require(ownerRabbitsCount[msg.sender] == 0);
        require(msg.value == mintCost);
        _safeMint(_name, msg.sender);
    }

    function _safeMint(string memory _name, address _to) internal {
        _createRabbit(_name, _to);
    }
}
