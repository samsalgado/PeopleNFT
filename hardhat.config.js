/**
 * @type import(‘hardhat/config’).HardhatUserConfig
 */

require("@nomiclabs/hardhat-ethers");
ALCHEMY_API_KEY = [{process.env}];

PRIVATE_KEY = "*************************************************************"
 module.exports = {
    solidity: "0.8.9",
    defaultNetwork: "mumbai",
    networks: {
      hardhat: {},
      mumbai: {
        url: ALCHEMY_API_KEY,
        accounts: [PRIVATE_KEY],
      },
    },
 };
