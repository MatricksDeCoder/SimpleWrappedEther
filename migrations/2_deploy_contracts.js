const SimpleWrappedEther  = artifacts.require('SimpleWrappedEther')


module.exports = async function(deployer) {

  await deployer.deploy(SimpleWrappedEther)

};