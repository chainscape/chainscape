// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract PlayerAccount {
    struct Player {
        address owner;
        AIEntity entity;
        uint256 totalDamageDealt;
    }

    struct AIEntity {
        uint256 health;
        bool isAlive;
    }

    mapping(address => Player) public players;

    event NewPlayer(address indexed owner, AIEntity entity);

    function createAccount() public {
        require(players[msg.sender].owner == address(0), "Account already exists");

        AIEntity memory newEntity = AIEntity({
            health: 100, // sample starting health
            isAlive: true
        });

        players[msg.sender] = Player({
            owner: msg.sender,
            entity: newEntity,
            totalDamageDealt: 0
        });

        emit NewPlayer(msg.sender, newEntity);
    }
}