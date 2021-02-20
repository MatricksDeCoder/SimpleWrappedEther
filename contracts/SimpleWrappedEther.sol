pragma solidity ^0.7.3;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


/**
 * @title SimpleWrappedEther
 * @dev   ERC20 version of Ether by wrapping and unwrapping Ether at some ratio
 */
 
contract SimpleWrappedEther is ERC20 {
    
    event WrapEther(address indexed _wrapper, uint indexed _amount);
    event UnWrapEther(address indexed _unwarapper, uint indexed _amount);
    
    constructor() ERC20('SimpleWrappedEther', 'SWETH') {}
    
    // deposit ether (wrap ether) to convert to Simple Wrapped Ether
    function deposit() external payable {
        // at 1: 1 ratio can be any ratio based on something...e.g some token engineering
        _mint(msg.sender, msg.value);
        emit WrapEther(msg.sender, msg.value);
    }
    
    // withdraw (unwrap ether) to get back Ether by burning Simple Wrapped Ether amount
    function withdraw(uint _amount) external {
        require(_amount <= balanceOf(msg.sender), 'Insufficient balance');
        // at 1:1 ration can be any ratio based on something... e.g some token engineering
        _burn(msg.sender, _amount);
        msg.sender.transfer(_amount);
        emit UnWrapEther(msg.sender, _amount);
    }
    
}