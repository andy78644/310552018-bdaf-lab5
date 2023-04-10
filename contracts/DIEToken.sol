// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DIEToken  is ERC20 {
    address _owner;
    modifier onlyOwner {
        require(
            msg.sender == _owner,
            "only owner can call this function"
        );
        _;
    }

    constructor() ERC20("Die", "DIE") {
        _owner = msg.sender;
    }
     function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) external onlyOwner {
        _burn(msg.sender, amount);
    }
    
    function transferOwnership(address newAddress) public onlyOwner {
        require(newAddress != address(0), "Invalid Address");
        _owner = newAddress;
    }
}