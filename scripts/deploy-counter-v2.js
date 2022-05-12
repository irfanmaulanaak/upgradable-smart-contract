const { ethers, upgrades } = require("hardhat");

const PROXY = "0xb8F9E8D62353e3Df9F37497C0eedDefa6D78Ae34";

async function main() {
 const CounterV2 = await ethers.getContractFactory("CounterV2");
 console.log("Upgrading Counter...");
 await upgrades.upgradeProxy(PROXY, CounterV2);
 console.log("Counter upgraded successfully");
}

main();