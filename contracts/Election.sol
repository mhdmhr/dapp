pragma solidity ^0.4.2;

contract Election {

// model a candidate
  struct Candidate {
    uint id;
    string name;
    uint voteCount;
  }

  mapping (address => bool) public voters;

  mapping (uint => Candidate) public candidates;

  uint public candidatesCount ;

event voted (
  uint indexed _candidateId
);

//constructor
  function Election () public {
    addcandidate("Joueur 1");
    addcandidate("Joueur 2");
    addcandidate("Joueur 3");
    addcandidate("Joueur 4");
    addcandidate("Joueur 5");
  }

  function addcandidate (string _name) private {
    candidatesCount ++;
    candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
  }

  function vote (uint _candidateId) public {
    // requiert que cette adresse ne soit pas dans le mapping "voters"
    require(!voters[msg.sender]);
    require(_candidateId > 0 && _candidateId <= candidatesCount);
    voters[msg.sender] = true;
    candidates[_candidateId].voteCount ++;
    voted(_candidateId);
  }

}
