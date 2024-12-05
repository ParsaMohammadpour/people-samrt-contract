// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "contracts/AbstractPerson.sol";

contract PeopleContract is PeopleAbstractContract {
    /*
    * This function is for adding new people to list.
    * (We even could check for having unique address
    * for each person) The name shouldn't be empty.
    */
    function AddPeople(string calldata name, uint favoritNumber) public override {
        Person memory newPerson = Person({addr:msg.sender, name: name, favoritNumber:favoritNumber});
        _people.push(newPerson);
        _nameToPerson[name] = newPerson;
        _addressToPerson[msg.sender] = newPerson;
    }

    
    /*
    * This function is for getting a person by its name.
    */
    function GetPersonByName(string calldata name) public override view returns (Person memory) {
        return _nameToPerson[name];
    }

    /*
    * This function is for getting a person by its address.
    */
    function GetPersonByAddress() public override view returns (Person memory) {
        return _addressToPerson[msg.sender];
    }
}