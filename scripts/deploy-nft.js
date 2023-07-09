const hre = require("hardhat");

const CONTRACT_ADDRESS = "0xB79CbC2f3e4C9d18bCC0DCfA43bCFe55C5D781cF";

async function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

async function main() {
  // Deploy the CryptoDevs Contract
  const nftContract = await hre.ethers.deployContract("CryptoDevs", [
    CONTRACT_ADDRESS,
  ]);

  // wait for the contract to deploy
  await nftContract.waitForDeployment();

  // print the address of the deployed contract
  console.log("NFT contract address: ", nftContract.target);

  // Sleep for 30 seconds while Etherscan indexes the new contract deployment
  await sleep(30 * 1000); // 30s = 30 * 1000 milliseconds

  // Verify the contract on etherscan
  await hre.run("verify:verify", {
    address: nftContract.target,
    constructorArguments: [CONTRACT_ADDRESS],
  });
}

// Call the main function and catch if there is any error
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
