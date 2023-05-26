import { ethers } from "hardhat";

async function main() {
    const helloText = await ethers.getContractFactory("HelloText");
    const text = await helloText.deploy();

    await text.deployed();
    console.log("Contract adress:", text.address)
}
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});