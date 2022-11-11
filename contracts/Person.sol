// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;
import "../node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

import "../node_modules/@openzeppelin/contracts/utils/Counters.sol";
import "../node_modules/@openzeppelin/contracts/access/Ownable.sol";

contract PersonNFT is ERC1155, Ownable {
     using Counters for Counters.Counter;
     uint256 public population;
     Counters.Counter private _tokenIds;
     mapping(uint256 => string) private _tokenURIs;
     constructor() ERC1155("") {}
     struct Person{
        uint256 id;
        uint256 age;
        string name;
        uint256 national_number;
     }
     Person[] public People;
     function _newPerson(uint256 _id, uint256 _age, string memory _name, uint256 the_national_number) external returns(uint256) {
        Person memory _person = Person({
            id: _id,
            age: uint64(_age),
            name: string(_name),
            national_number: uint32(the_national_number)
        });
        People.push(_person);
        uint256 newpeopleId = People.length -1;
        population++;
        return newpeopleId;
     }
     function _setTokenURI(uint256 tokenId, string memory _tokenURI)
     internal
     virtual
     {
        _tokenURIs[tokenId] = _tokenURI;
     }
     function mintNFT(address recipient, string memory _tokenURI)
     public onlyOwner
     returns (uint256)
     {
       _tokenIds.increment();
       uint256 newItemId = _tokenIds.current();
       _mint(recipient, newItemId, 1, "");
       _setTokenURI(newItemId, _tokenURI);
       return newItemId;
     }
}
