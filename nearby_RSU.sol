pragma solidity >=0.4.22 <0.7.0;

contract neighbour{
	address admin;
	struct nbr_addr{
		address rsu1;
		address rsu2;
		address rsu3;
		address rsu4;
	}

	modifier onlyAdmin{
        require(msg.sender==admin);
        _;
    }
    mapping (address => nbr_addr) mymap;

    constructor() public{
    	admin=msg.sender;
    }

    function addN(address rsu,address rsuAdd) onlyAdmin internal returns (bool){
        if(mymap[rsu].rsu1==address(0))
        {
        	mymap[rsu].rsu1 = rsuAdd;
        	return true;	
        }
        else if(mymap[rsu].rsu2==address(0))
        {
        	mymap[rsu].rsu2 = rsuAdd;
        	return true;
        }
        else if(mymap[rsu].rsu3==address(0))
        {
        	mymap[rsu].rsu3 = rsuAdd;
        	return true;
        }
        else if(mymap[rsu].rsu4==address(0))
        {
        	mymap[rsu].rsu4 = rsuAdd;
        	return true;
        }
        else return false;
    }

    function delN(address rsu,address rsuDel) onlyAdmin internal returns (bool){
    	if(mymap[rsu].rsu1==rsuDel)
        {
        	mymap[rsu].rsu1 = address(0);
        	return true;
        }
        else if(mymap[rsu].rsu2==rsuDel)
        {
        	mymap[rsu].rsu2 = address(0);
        	return true;
        }
        else if(mymap[rsu].rsu3==rsuDel)
        {
        	mymap[rsu].rsu3 = address(0);
        	return true;
        }
        else if(mymap[rsu].rsu4==rsuDel)
        {
        	mymap[rsu].rsu4 = address(0);
        	return true;
        }
        else return false; //address not found
    }

}