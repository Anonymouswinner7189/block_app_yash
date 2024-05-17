// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CollegeBlockchain {
    struct Block {
        uint index;
        bytes32 previousHash;
        uint timestamp;
        string data;
        bytes32 hash;
    }

    struct Department {
        string name;
        Block[] blocks;
    }

    mapping(string => Department) public departments;
    string[] public departmentList;

    // Create a genesis block for a department
    function createGenesisBlock(
        string memory deptName,
        string memory data
    ) public {
        require(
            departments[deptName].blocks.length == 0,
            "Genesis block already exists"
        );

        Block memory genesisBlock = Block({
            index: 0,
            previousHash: 0,
            timestamp: block.timestamp,
            data: data,
            hash: keccak256(abi.encodePacked(data, block.timestamp))
        });

        departments[deptName].name = deptName;
        departments[deptName].blocks.push(genesisBlock);
        departmentList.push(deptName);
    }

    // Add a block to a department's chain
    function addBlock(string memory deptName, string memory data) public {
        require(
            departments[deptName].blocks.length > 0,
            "Genesis block does not exist"
        );

        Block memory lastBlock = departments[deptName].blocks[
            departments[deptName].blocks.length - 1
        ];
        Block memory newBlock = Block({
            index: lastBlock.index + 1,
            previousHash: lastBlock.hash,
            timestamp: block.timestamp,
            data: data,
            hash: keccak256(
                abi.encodePacked(data, block.timestamp, lastBlock.hash)
            )
        });

        departments[deptName].blocks.push(newBlock);
    }

    // Get all blocks for a department
    function getDepartmentBlocks(
        string memory deptName
    ) public view returns (Block[] memory) {
        return departments[deptName].blocks;
    }
}
