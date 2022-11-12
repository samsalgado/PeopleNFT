const {expect} = require('chai');
describe("PassportDoc", function(){
    it("Deploy", async function(){
        const PassportDoc = await hre.ethers.getContractFactory("PassportDoc");
    const passportDeployed = await PassportDoc.deploy("PassportDoc");
    await passportDeployed.deployed();
    });
        it("should NOT mint if not admin", async () => {
            await expectRevert(token.mint({ from: accounts[4] }), "only admin");
          });
        
          it("should mint if admin", async () => {
            //const nextTokenId = parseInt(await token.nextTokenId());
            const balanceBefore = await token.balanceOf(admin);
            const tokenId = web3.utils.toBN(3);
            const receipt = await token.mint({ from: admin });
            await token.mint({ from: admin });
            const balanceAfter = await token.balanceOf(admin);
            assert(balanceAfter.sub(balanceBefore).toNumber() === 2);
            await expectEvent(receipt, "Transfer", {
              _from: "0x0000000000000000000000000000000000000000",
              _to: admin,
              _tokenId: tokenId,
            });
          });
    it("create Passport", async function(){
        const _id = 0;
        const _passportNumber = 843057798;
        const _name = "Abdul Mohammah";
        const _dob = "January 14, 1937";
        const born_location = "Yemen";
        const Passport = await Passport.new(_id,_passportNumber, _name,_dob,born_location);
   });
   it("should store passports", async() => {
    await Passport.getOrder(0, 843057798, "Abdul Mohammah", "January 14, 1937", "Yemen");
   })

})  