// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/** 
 * This is abstract smart contract for person just to
 * specify it's functionality.
 */
abstract contract PeopleAbstractContract {

    /*
    * defining a list of people. It is private in order
    * to be hidden from others and only work with them 
    * using some functions.
    */
    Person[] internal _people;

    /*
    * This is the mapping that is going to map person's name
    * to its person struct.
    */
    mapping (string => Person) internal _nameToPerson;
    mapping (address => Person) internal _addressToPerson;

    struct Person {
        // address could be added in porder to have single person per address
        address addr;
        string name;
        uint favoritNumber;
    }

    /*
    * This function is for adding new people to list.
    * (We even could check for having unique address
    * for each person) The name shouldn't be empty.
    */
    function AddPeople(string calldata name, uint favoriteNumber) public virtual;

    
    /*
    * This function is for getting a person by its name.
    */
    function GetPersonByName(string calldata name) public virtual view returns (Person memory);

    /*
    * This function is for getting a person by its address.
    */
    function GetPersonByAddress() public virtual view returns (Person memory);
}