async function main() {
  const NFTMarketplace = await ethers.getContractFactory("NFTMarketplace");
  const contract = await NFTMarketplace.deploy();

  await contract.waitForDeployment();
  console.log("Contract deployed to:", contract.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
