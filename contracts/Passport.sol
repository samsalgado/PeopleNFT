// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
pragma experimental ABIEncoderV2;
 import "../node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol";
 import "../node_modules/@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";
 import "../node_modules/@openzeppelin/contracts/utils/Counters.sol";


 contract PassportDoc is ERC721 {
  using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;
    constructor() ERC721("tb", "PP") {

    }
    uint256 public passportId;
    struct Passport{
        uint256 id;
        string name;
        string dob;
        string born_location;
    }

    Passport[] private passportNumber;
    mapping(address => uint256) private passportIncites;
    mapping(uint256 => address) private passportIdMapping;
    event PassportCreated(address owner,
    uint PassportId,
    string name,
    string dob,
    string _born_location);
    function _createPassport(address owner,uint256 _ID,
        string memory _name,
        string memory _dob,
        string memory _born_location
       ) external returns (uint256) {
           
         Passport memory _passportNumber = Passport({
             id:_ID,
             name: string(_name),
             dob: string (_dob),
             born_location: string (_born_location)
             });
             
          passportNumber.push(_passportNumber);
          uint256 newPassportId=passportNumber.length - 1;
          emit PassportCreated(owner,newPassportId, _name, _dob, _born_location);
          passportId++;
          return newPassportId;  

    }
  
    function getPassports(uint256 _id) external view returns(
        uint256 id,
        string memory name,
        string memory dob,
        string memory born_location
    ) {
        return (
            passportNumber[_id].id,
            passportNumber[_id].name,
            passportNumber[_id].dob,
            passportNumber[_id].born_location


        );
    } 
    function getOrderId() public view returns (uint256) {
        uint256 newPassportId=passportNumber.length - 1;
        return newPassportId;
    }
        function _baseURI() internal pure override returns (string memory){
            return "./metadata.js";
        }
        function mint(address to) public returns (uint256) {
            require(_tokenIdCounter.current() < 3);
            _tokenIdCounter.increment();
            _safeMint(to, _tokenIdCounter.current());
            return _tokenIdCounter.current();
        }
 }