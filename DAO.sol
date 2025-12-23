// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAO {
    mapping(address => uint) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint amount = balances[msg.sender];
        require(amount > 0, "No balance to withdraw");

        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "Failed to send Ether");

        balances[msg.sender] = 0;
    }

    // Helper to check DAO balance
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
