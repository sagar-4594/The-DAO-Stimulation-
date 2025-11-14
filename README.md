# The-DAO-Stimulation

# Smart Contract Security: Re-entrancy Attack Simulation

This project demonstrates a classic re-entrancy attack on a vulnerable Ethereum smart contract written in Solidity. It includes two contracts: a victim (`DAO.sol`) and an attacker (`Attacker.sol`).

## The Vulnerability

The `DAO.sol` contract is vulnerable because it violates the "Checks-Effects-Interactions" pattern. It sends Ether (an external interaction) *before* updating its internal state (the effect), allowing the attacker's contract to re-enter the `withdraw` function repeatedly.

## Contracts

- **`DAO.sol`**: A simple smart contract that acts as a bank, allowing users to deposit and withdraw Ether. It contains the critical flaw in its `withdraw` function.
- **`Attacker.sol`**: A malicious contract designed to exploit the vulnerability. Its `receive()` fallback function creates a recursive loop to drain all funds from the victim contract.

## How to Run the Simulation

1.  Open both contracts in an Ethereum IDE like [Remix](https://remix.ethereum.org/).
2.  Deploy the `DAO.sol` contract.
3.  Deploy the `Attacker.sol` contract, providing the address of the deployed `DAO` in the constructor.
4.  Call the `initiateAttack()` function on the `Attacker` contract with at least 1 Ether. This will begin the process of draining the funds from the victim contract.
