pragma solidity ^0.4.20;

import '../token/Burnable.sol';
import '../token/FreezableMintableToken.sol';
import '../token/Pausable.sol';





contract Consts {
    uint constant TOKEN_DECIMALS = 18;
    uint8 constant TOKEN_DECIMALS_UINT8 = 18;
    uint constant TOKEN_DECIMAL_MULTIPLIER = 10 ** TOKEN_DECIMALS;

    string constant TOKEN_NAME = "LEGALBLOCK";
    string constant TOKEN_SYMBOL = "XLK";
    bool constant PAUSED = false;
    address constant TARGET_USER = 0x6eb199595dD46f2122D86b1eD6b77d2D7ee292a5;
    
    uint constant START_TIME = 1527123600;
    
    bool constant CONTINUE_MINTING = true;
}



contract MainToken is Consts, FreezableMintableToken, BurnableToken, Pausable
    
{
    

    function name() pure public returns (string _name) {
        return TOKEN_NAME;
    }

    function symbol() pure public returns (string _symbol) {
        return TOKEN_SYMBOL;
    }

    function decimals() pure public returns (uint8 _decimals) {
        return TOKEN_DECIMALS_UINT8;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool _success) {
        require(!paused);
        return super.transferFrom(_from, _to, _value);
    }

    function transfer(address _to, uint256 _value) public returns (bool _success) {
        require(!paused);
        return super.transfer(_to, _value);
    }
}


