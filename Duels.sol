// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Duels {
    struct Fighter {
        address account; 
        string name;  
        uint256 power; 
        uint256 fights; 
        uint256 victories;
        uint256 xp; 
        uint256 rank; 
        uint256 wager; 
    }

    mapping(address => Fighter) public fighters;

    event CombatOutcome(address indexed fighter1, address indexed fighter2, address victor);
    event Promotion(address indexed fighter, uint256 newRank);
    event WagerMade(address indexed bettor, address indexed opponent, uint256 amount);
    event Enrolled(address indexed fighter);
    event NameUpdated(address indexed fighter, string newName);

    function enroll(uint256 _power, string calldata _name) external {
        require(fighters[msg.sender].account == address(0), "Fighter already enrolled");
        fighters[msg.sender] = Fighter(msg.sender, _name, _power, 0, 0, 0, 1, 0); // initialize wager to 0
        emit Enrolled(msg.sender);
    }

    function placeWager(uint256 _amount, address _opponent) external payable {
        require(_amount > 0, "Wager amount must be greater than 0");
        require(_amount <= 500, "Wager amount must be less than or equal to 500");
        // require(msg.value == _amount, "Wager amount must match the sent Ether value");

        fighters[msg.sender].wager = _amount; // store the wager amount

        emit WagerMade(msg.sender, _opponent, _amount);

        // Automatically enroll player if they haven't already
        if (fighters[msg.sender].account == address(0)) {
            fighters[msg.sender] = Fighter(msg.sender, "Unnamed", 10, 0, 0, 0, 1, 0); // initialize wager to 0
            emit Enrolled(msg.sender);
        }

        // Automatically enroll opponent if they haven't already
        if (fighters[_opponent].account == address(0)) {
            fighters[_opponent] = Fighter(_opponent, "Unnamed", 10, 0, 0, 0, 1, 0); // initialize wager to 0
            emit Enrolled(_opponent);
        }
    }

    function engageInBattle(address _opponent) external {
        // Automatically enroll player if they haven't already
        if (fighters[msg.sender].account == address(0)) {
            fighters[msg.sender] = Fighter(msg.sender, "Unnamed", 10, 0, 0, 0, 1, 0); // initialize wager to 0
            emit Enrolled(msg.sender);
        }

        // Automatically enroll opponent if they haven't already
        if (fighters[_opponent].account == address(0)) {
            fighters[_opponent] = Fighter(_opponent, "Unnamed", 10, 0, 0, 0, 1, 0); // initialize wager to 0
            emit Enrolled(_opponent);
        }

        fighters[msg.sender].fights += 1;
        fighters[_opponent].fights += 1;

        address winner = _decideWinner(msg.sender, _opponent);
        fighters[winner].victories += 1;
        fighters[winner].xp += 10;

        if (fighters[winner].xp >= fighters[winner].rank * 100) {
            fighters[winner].rank += 1;
            fighters[winner].xp = 0;
            emit Promotion(winner, fighters[winner].rank);
        }

        emit CombatOutcome(msg.sender, _opponent, winner);
    }

    function _decideWinner(address _fighter1, address _fighter2) private view returns (address) {
        uint256 random = uint256(keccak256(abi.encodePacked(block.timestamp, _fighter1, _fighter2))) % 2;
        if (random == 0) {
            if (fighters[_fighter1].power > fighters[_fighter2].power) {
                return _fighter1;
            } else {
                return _fighter2;
            }
        } else {
            if (fighters[_fighter2].power > fighters[_fighter1].power) {
                return _fighter2;
            } else {
                return _fighter1;
            }
        }
    }

    function setName(string calldata _name) external {
        require(fighters[msg.sender].account != address(0), "Fighter not enrolled");
        fighters[msg.sender].name = _name;
        emit NameUpdated(msg.sender, _name);
    }

    function getFighter(address _fighter) external view returns (Fighter memory) {
        return fighters[_fighter];
    }
}
