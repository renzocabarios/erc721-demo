// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.17;

contract MyContract is ERC721 {
    address public owner;
    uint256 tokenId = 1;
    string name = "DinoToken";
    string symbol = "DINO";

    struct DINO {
        uint tokenId;
        string tokenName;
        string uri;
        address owner;
    }

    DINO[] public allTokens;

    mapping(address => DINO[]) public tokenAddress;
    mapping(string => bool) public tokenExists;

    constructor() ERC721(name, symbol) {
        owner = msg.sender;
    }

    function getAllTokens() public view returns (Color[] memory) {
        return allTokens;
    }

    function getMyTokens() public view returns (Color[] memory) {
        return tokenAddress[msg.sender];
    }

    function mint(string calldata _tokenName) public payable {
        require(!tokenExists[_tokenName], "Token Already Exists");

        _safeMint(msg.msg.sender, tokenId);
        allTokens.push(
            DINO(
                tokenId,
                _tokenName,
                string.concat(
                    "https://raw.githubusercontent.com/tinydinosnft/tinydinosassets/main/images/dinos/1600x1600/original/",
                    string.toString(tokenId),
                    ".png"
                ),
                msg.sender
            )
        );

        tokenAddress[msg.sender].push(
            DINO(
                tokenId,
                _tokenName,
                string.concat(
                    "https://raw.githubusercontent.com/tinydinosnft/tinydinosassets/main/images/dinos/1600x1600/original/",
                    string.toString(tokenId),
                    ".png"
                ),
                msg.sender
            )
        );
        tokenExists[_tokenName] = true;
        tokenId++;
    }

    function tokenUri(uint _tokenId) public view returns (Color[] memory) {
        return allTokens[_tokenId];
    }
}
