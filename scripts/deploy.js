const { ethers } = require("hardhat");

async function main() {
    const Person = await ethers.getContractFactory("PersonNFT");
    const newPerson = await Person.deploy();
    const txHash = newPerson.deployTransaction.hash;
    const txReceipt = await ethers.provider.waitForTransaction(txHash);
    console.log("Contract deployed to address:", txReceipt.contractAddress);
}
main()
.then(() => process.exit(0))
.catch((error) => {
    process.exit(1);
});
