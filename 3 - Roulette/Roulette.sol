// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;


contract Roulette {
    uint betRed;
    uint betBlack;
    string lastWinningColour;

    constructor() public payable {
        require(msg.value > 2 ether, "Funds must be given to the roulette for paying winners! (Min. 2 ethers)");
    }

    modifier checkBet() {
        require(address(this).balance > 0, "It looks like this roulette is empty.. refer to the owner for a refill!");
        require(msg.value > 0, "An amount must be paid in order to bet!");
        require(msg.value  <= address(this).balance, "Your bet is too high, use getMaximumBet to check for the limit!");
        _;
    }

    modifier checkPlay() {
        require(betRed > 0 || betBlack > 0, "At least one bet has to be done to play!");
        _;
    }

    function betOnRed() public payable checkBet {
        betRed += msg.value;
    }

    function betOnBlack() public payable checkBet { 
        betBlack += msg.value;
    }

    function playRoulette() public checkPlay returns (string memory) {
        uint winningColour = uint256(keccak256(abi.encodePacked(block.number - 4, now))) % 2;
        if (winningColour == 0) {
            msg.sender.transfer(betRed * 2);
            betRed = 0;
            betBlack = 0;
            lastWinningColour = "Red";
            return "Red colour bets are the lucky ones this time!";
        }
        else {
            msg.sender.transfer(betBlack * 2);
            betRed = 0;
            betBlack = 0;
            lastWinningColour = "Black";
            return "Black colour bets are the lucky ones this time!";
        }
    }

    function getTotalMaximumBet() public view returns (uint) {
        return (address(this).balance - betRed - betBlack);
    }

    function getLastWinningColour() public view returns (string memory) {
        bytes memory stringTest = bytes (lastWinningColour);
        require(stringTest.length > 0, "No game has been played yet!");
        return lastWinningColour;
    }

    function getRedBets() public view returns (uint) {
        return betRed;
    }

    function getBlackBets() public view returns (uint) {
        return betBlack;
    }

}