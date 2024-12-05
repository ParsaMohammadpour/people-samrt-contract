// SPDX-License-Identifier: GPL-3.0
        
pragma solidity >=0.4.22 <0.9.0;

// This import is automatically injected by Remix
import "remix_tests.sol"; 

// This import is required to use custom transaction context
// Although it may fail compilation in 'Solidity Compiler' plugin
// But it will work fine in 'Solidity Unit Testing' plugin
import "remix_accounts.sol";
import "../contracts/FavoriteNumber.sol";

// importing for converting uints to strings for error messages in asserts
import "@openzeppelin/contracts/utils/Strings.sol";

// File name has to end with '_test.sol', this file can contain more than one testSuite contracts
contract testSuite {

    FavoriteNumber public favNum;

    /// 'beforeAll' runs before all other tests
    /// More special functions are: 'beforeEach', 'beforeAll', 'afterEach' & 'afterAll'
    function beforeAll() public {
        // <instantiate contract>
        Assert.equal(uint(1), uint(1), "1 should be equal to 1");

        favNum = new FavoriteNumber();
    }

    function SimpleOneInsertion1() public {
        uint a = uint(1);
        favNum.store(a);
        Assert.equal(a, favNum.retrieve(), "Favourite number should be 1");
    }

    function SimpleOneInsertion2() public {
        uint a = uint(123);
        favNum.store(a);
        Assert.equal(a, uint(favNum.retrieve()), "Favourite number should be 1");
    }

    function SimpleOneInsertion3() public {
        uint a = uint(123456);
        favNum.store(a);
        Assert.equal(a, favNum.retrieve(), "Favourite number should be 1");
    }


    function SimpleTenInsertion1() public {
        // we only need to specify the first element because otherwise it wouldn't recognize the 
        // type and gets error: cannot implicitly convert uint24 to uint256. So we have to define the type first.
        uint[10] memory numbers = [uint(1234), 1234, 34645, 5467, 23400, 234234, 456, 7568, 1345, 25346];
        for (uint i = 0; i<numbers.length; i++) 
        {
            favNum.store(numbers[i]);
            string memory error = string.concat("Favourite number should be ", Strings.toString(numbers[i]));
            Assert.equal(numbers[i], favNum.retrieve(), error);
        }
    }

    function SimpleTenInsertion2() public {
        // we only need to specify the first element because otherwise it wouldn't recognize the 
        // type and gets error: cannot implicitly convert uint24 to uint256. So we have to define the type first.
        uint[10] memory numbers = [uint(1234), 1234, 34645, 5467, 23400, 234234, 456, 7568, 1345, 25346];
        for (uint i = 0; i<numbers.length; i++) 
        {
            favNum.store(numbers[i]);
        }
        string memory error = string.concat("Favourite number should be ", Strings.toString(numbers[numbers.length - 1]));
        Assert.equal(numbers[numbers.length - 1], favNum.retrieve(), error);
    }

    function SimpleRandomTenInsertion1() public {
        // generating ten random uint number
        uint[10] memory numbers;
        for (uint i = 0; i < numbers.length; i++) 
        {
            numbers[i] = uint(keccak256(abi.encodePacked(block.timestamp,msg.sender,uint(0))));
        }
        for (uint i = 0; i<numbers.length; i++) 
        {
            favNum.store(numbers[i]);
            string memory error = string.concat("Favourite number should be ", Strings.toString(numbers[i]));
            Assert.equal(numbers[i], favNum.retrieve(), error);
        }
    }

    function SimpleRandomTenInsertion2() public {
        // generating ten random uint number
        uint[10] memory numbers;
        for (uint i = 0; i < numbers.length; i++) 
        {
            numbers[i] = uint(keccak256(abi.encodePacked(block.timestamp,msg.sender,uint(0))));
        }
        for (uint i = 0; i<numbers.length; i++) 
        {
            favNum.store(numbers[i]);
        }
        string memory error = string.concat("Favourite number should be ", Strings.toString(numbers[numbers.length - 1]));
        Assert.equal(numbers[numbers.length - 1], favNum.retrieve(), error);
    }
}
    