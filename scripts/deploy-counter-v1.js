const { ethers, upgrades } = require("hardhat");

const SLICES = 8;
async function main() {
 const Counter = await ethers.getContractFactory("Counter");

 console.log("Deploying Counter...");

 const counter = await upgrades.deployProxy(Counter, [], {
   initializer: "initialize",
 });
 await counter.deployed();

 console.log("Counter deployed to:", counter.address);
}

main();