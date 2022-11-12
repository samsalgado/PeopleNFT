// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
pragma experimental ABIEncoderV2;
 import "../node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol";
 import "../node_modules/@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";
 import "../node_modules/@openzeppelin/contracts/utils/Counters.sol";


 contract PassportDoc is ERC721 {
  using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;
    constructor() ERC721("Passport", "PP") {

    }
    uint256 public passportId;
    struct Passport{
        uint256 id;
        uint256 passportNumber;
        string name;
        string dob;
        string born_location;
    }

    Passport[] private passports;
    mapping(address => uint256) private passportIncites;
    mapping(uint256 => address) private passportIdMapping;
    event PassportCreated(address owner,
    uint PassportId,
    string name,
    string dob,
    string _born_location);
    function _createPassport(address owner,uint256 _ID,
        uint256 _passportNumber,
        string memory _name,
        string memory _dob,
        string memory _born_location
       ) external returns (uint256) {
           
         Passport memory _passports = Passport({
             id:_ID,
             passportNumber: _passportNumber,
             name: string(_name),
             dob: string (_dob),
             born_location: string (_born_location)
             });
             
          passports.push(_passports);
          uint256 newPassportId=passports.length - 1;
          emit PassportCreated(owner,newPassportId, _name, _dob, _born_location);
          passportId++;
          return newPassportId;  

    }
  
    function getPassports(uint256 _id) external view returns(
        uint256 id,
        uint256 passportNumber,
        string memory name,
        string memory dob,
        string memory born_location
    ) {
        return (
            passports[_id].id,
            passports[_id].passportNumber,
            passports[_id].name,
            passports[_id].dob,
            passports[_id].born_location


        );
    } 
    function getId() public view returns (uint256) {
        uint256 newPassportId=passports.length - 1;
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