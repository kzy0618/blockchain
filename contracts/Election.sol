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

	//Store accounts that have voted

	mapping(address => bool) public voters;
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

	//create transaction -> if it does not pass the condition only the gas spent on the require part are costed others will be refunded
	function vote (uint _candidateId) public{
		//reuquire that they haven't voted before
		//accept condition -> if true execute rest of the codes, other wise stop
		require(!voters[msg.sender]);

		//require a valid candidate
		require(_candidateId > 0 && _candidateId <= candidatesCount);

		//record that voter has voted
		//sender -> account from which this message sent
		//app.vote(1,{from: web3.eth.accounts[0]}) -> from parameter is where solidity read as msg.sender
		voters[msg.sender] = true;

		//update candidate vote Count
		candidates[_candidateId].voteCount ++;
	}


}
