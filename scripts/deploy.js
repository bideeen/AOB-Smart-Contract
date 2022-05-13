const hre = require("hardhat");

async function main() {

  const [owner] = await hre.ethers.getSigners();
  const contractFactory = await hre.ethers.getContractFactory("AobCoin");
  const contract = await contractFactory.deploy();
  await contract.deployed();

  console.log("AobCoin Contract deployed to:", contract.address);
  console.log("AobCoin Contract owner address:", owner.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
