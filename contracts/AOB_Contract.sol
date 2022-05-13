// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract AobCoin is ERC20, Ownable, ERC20Burnable {
    event tokensBurned(address indexed owner, uint256 amount, string message);
    event tokensMinted(address indexed owner, uint256 amount, string message);
    event additionalTokensMinted(address indexed owner, uint256 amount, string message);


    constructor() ERC20("AoBCoin", "AOB") {
        _mint(msg.sender, 10000 * 10**decimals());
        emit tokensMinted(msg.sender, 10000*10**decimals(), "Initial Supply of Token Minted");
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
        emit additionalTokensMinted(msg.sender, amount, "Additional Token Minted");
    }

    function burn(uint256 amount) public override onlyOwner {
        _burn(msg.sender, amount);
        emit tokensBurned(msg.sender, amount, "Tokens Burned");
    }

}