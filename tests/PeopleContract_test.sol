// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.22 <0.9.0;

// This import is automatically injected by Remix
import "remix_tests.sol"; 

// This import is required to use custom transaction context
// Although it may fail compilation in 'Solidity Compiler' plugin
// But it will work fine in 'Solidity Unit Testing' plugin
import "remix_accounts.sol";
import "../contracts/PeopleContract.sol";
import "../contracts/PeopleAbstractContract.sol";

// importing for converting uints to strings for error messages in asserts
import "@openzeppelin/contracts/utils/Strings.sol";

// File name has to end with '_test.sol', this file can contain more than one testSuite contracts
contract PersonTest {

    PeopleAbstractContract public person;
    address[4] public accounts;

    /// 'beforeAll' runs before all other tests
    /// More special functions are: 'beforeEach', 'beforeAll', 'afterEach' & 'afterAll'
    function beforeAll() public {
        // <instantiate contract>
        Assert.equal(uint(1), uint(1), "1 should be equal to 1");

        person = new PeopleContract();
        
        for (uint i = 0; i<accounts.length; i++) 
        {
            accounts[i] = TestsAccounts.getAccount(i);
        }
    }

    function AddPersonAndGet1() public {
        string memory name = "ParsaMohammadpour";
        uint favoritNumber = 10;
        person.AddPeople(name, favoritNumber);
        PeopleAbstractContract.Person memory res = person.GetPersonByName(name);
        Assert.equal(name, res.name, "name is not the same");
        Assert.equal(favoritNumber, res.favoritNumber, "favoritNumber is not the same");
        // we are using address(this) in order to get our own address, because for the person smart contract,
        // we are the one who is calling it, so it should save our address. But if we set msg.sender, we are 
        // actually saying the address of the code or person who has called our test smart contract.
        Assert.equal(address(this), res.addr, "address is not the same");
    }

    function AddPersonAndGet2() public {
        string memory name = "David";
        uint favoritNumber = 20;
        person.AddPeople(name, favoritNumber);
        PeopleAbstractContract.Person memory res = person.GetPersonByName(name);
        Assert.equal(name, res.name, "name is not the same");
        Assert.equal(favoritNumber, res.favoritNumber, "favoritNumber is not the same");
        Assert.equal(address(this), res.addr, "address is not the same");
    }

    function AddPersonAndGet3() public {
        string memory name = "Jack";
        uint favoritNumber = 100;
        person.AddPeople(name, favoritNumber);
        PeopleAbstractContract.Person memory res = person.GetPersonByName(name);
        Assert.equal(name, res.name, "name is not the same");
        Assert.equal(favoritNumber, res.favoritNumber, "favoritNumber is not the same");
        Assert.equal(address(this), res.addr, "address is not the same");
    }

    function AddPersonAndGet4() public {
        string memory name = "ParsaMohammadpour";
        uint favoritNumber = 10;
        person.AddPeople(name, favoritNumber);
        PeopleAbstractContract.Person memory res = person.GetPersonByAddress();
        Assert.equal(name, res.name, "name is not the same");
        Assert.equal(favoritNumber, res.favoritNumber, "favoritNumber is not the same");
        Assert.equal(address(this), res.addr, "address is not the same");
    }

    function AddPersonAndGet5() public {
        string memory name = "David";
        uint favoritNumber = 20;
        person.AddPeople(name, favoritNumber);
        PeopleAbstractContract.Person memory res = person.GetPersonByAddress();
        Assert.equal(name, res.name, "name is not the same");
        Assert.equal(favoritNumber, res.favoritNumber, "favoritNumber is not the same");
        Assert.equal(address(this), res.addr, "address is not the same");
    }

    function AddPersonAndGet6() public {
        string memory name = "Jack";
        uint favoritNumber = 100;
        person.AddPeople(name, favoritNumber);
        PeopleAbstractContract.Person memory res = person.GetPersonByAddress();
        Assert.equal(name, res.name, "name is not the same");
        Assert.equal(favoritNumber, res.favoritNumber, "favoritNumber is not the same");
        Assert.equal(address(this), res.addr, "address is not the same");
    }


    function AddPersonAndGetTen1() public {
        string[10] memory names = ["AaBb111", "AaBb222", "AaBb333", "AaBb444", "AaBb555", "AaBb666", "AaBb777", "AaBb888", "AaBb999", "AaBb101010"];
        uint[10] memory numbers;
        for (uint i = 0; i < 10; i++) 
        {
            numbers[i] = uint(keccak256(abi.encodePacked(block.timestamp,msg.sender,uint(0))));
        }
        for (uint i = 0; i < 10; i++) 
        {
            person.AddPeople(names[i], numbers[i]);
            PeopleAbstractContract.Person memory res = person.GetPersonByName(names[i]);
            Assert.equal(names[i], res.name, "name is not the same");
            Assert.equal(numbers[i], res.favoritNumber, "favoritNumber is not the same");
            Assert.equal(address(this), res.addr, "address is not the same");
        }
    }

    function AddPersonAndGetTen2() public {
        string[10] memory names = ["AaBb111", "AaBb222", "AaBb333", "AaBb444", "AaBb555", "AaBb666", "AaBb777", "AaBb888", "AaBb999", "AaBb101010"];
        uint[10] memory numbers;
        for (uint i = 0; i < 10; i++) 
        {
            numbers[i] = uint(keccak256(abi.encodePacked(block.timestamp,msg.sender,uint(0))));
        }
        for (uint i = 0; i < 10; i++) 
        {
            person.AddPeople(names[i], numbers[i]);
        }
        PeopleAbstractContract.Person memory res = person.GetPersonByName(names[names.length - 1]);
        Assert.equal(names[numbers.length - 1], res.name, "name is not the same");
        Assert.equal(numbers[numbers.length - 1], res.favoritNumber, "favoritNumber is not the same");
        Assert.equal(address(this), res.addr, "address is not the same");
    }

    function AddPersonAndGetTen3() public {
        string[10] memory names = ["AaBb111", "AaBb222", "AaBb333", "AaBb444", "AaBb555", "AaBb666", "AaBb777", "AaBb888", "AaBb999", "AaBb101010"];
        uint[10] memory numbers;
        for (uint i = 0; i < 10; i++) 
        {
            numbers[i] = uint(keccak256(abi.encodePacked(block.timestamp,msg.sender,uint(0))));
        }
        for (uint i = 0; i < 10; i++) 
        {
            person.AddPeople(names[i], numbers[i]);
            PeopleAbstractContract.Person memory res = person.GetPersonByAddress();
            Assert.equal(names[i], res.name, "name is not the same");
            Assert.equal(numbers[i], res.favoritNumber, "favoritNumber is not the same");
            Assert.equal(address(this), res.addr, "address is not the same");
        }
    }

    function AddPersonAndGetTen4() public {
        string[10] memory names = ["AaBb111", "AaBb222", "AaBb333", "AaBb444", "AaBb555", "AaBb666", "AaBb777", "AaBb888", "AaBb999", "AaBb101010"];
        uint[10] memory numbers;
        for (uint i = 0; i < 10; i++) 
        {
            numbers[i] = uint(keccak256(abi.encodePacked(block.timestamp,msg.sender,uint(0))));
        }
        for (uint i = 0; i < 10; i++) 
        {
            person.AddPeople(names[i], numbers[i]);
        }
        PeopleAbstractContract.Person memory res = person.GetPersonByAddress();
        Assert.equal(names[numbers.length - 1], res.name, "name is not the same");
        Assert.equal(numbers[numbers.length - 1], res.favoritNumber, "favoritNumber is not the same");
        Assert.equal(address(this), res.addr, "address is not the same");
    }
}
    