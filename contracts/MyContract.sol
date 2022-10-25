// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.17;

contract MyContract is ERC721 {
    constructor(string memory name, string memory symbol)
        ERC721(name, symbol)
    {}
}
