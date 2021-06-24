pragma solidity >=0.4.22 <0.7.0;

contract manageKeys{
    address admin;
    mapping (address => bool) participants; //the bool is false is user has not registered/has been removed
    modifier onlyAdmin{
        require(msg.sender==admin);
        _;
    }
    constructor() public{
        admin=msg.sender;
    }
    function isValid(address pk) public view returns (bool){
        return participants[pk];
    }
    function addP(address pk) onlyAdmin internal returns (bool){
        if(participants[pk]) return false; //already registered
        else participants[pk] = true;
        return true; //success
    }
    function removeP(address pk) onlyAdmin internal returns (bool){
        if(participants[pk]==false) return false; //user has not been registered or has already been removed
        else participants[pk]=false;
        return true; //success
    }
}
