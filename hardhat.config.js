/**
 * @type import(‘hardhat/config’).HardhatUserConfig
 */

require("@nomiclabs/hardhat-ethers");
ALCHEMY_API_KEY = "WDx_Z8DYzJ2lyAOwr7CHfL647hhPEqnF";

PRIVATE_KEY = "7ef15be65184ed5a15c82dd11aa5fdf5fe93b59e05d2c66c2d59186918a628eb"
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
