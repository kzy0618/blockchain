pragma solidity ^0.4.11;

contract Election{ 
	// Read candidate
	// Store candidate
	// string public candidate; 
	// // Constuctor
	// // run when we deploy contract on blockchain
	// function Election() public {
	// 	candidate = "Candidate 1";
	// 	//state variable, accessable inside contract;
	// }

	//Model a Candidate
	struct Candidate{
		uint id;
		string name;
		uint voteCount;
	}

	//Store Candidate
	//Fetch Candidate

	//any key does not set value will return blank as default
	//no way to get the size of the map -> uses candidatesCount
	mapping(uint => Candidate) public candidates;
	//Store Candidate Constuctor
	uint public candidatesCount;

	function  Election () public {
		addCandidate("Candidate 1");
		addCandidate("Candidate 2");
	}

	//_name -> local variable
	function addCandidate (string _name) private {
		candidatesCount ++;
		candidates[candidatesCount] = Candidate(candidatesCount,_name,0);
	}

}
