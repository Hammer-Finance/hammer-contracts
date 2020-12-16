import brownie

from brownie import accounts

from brownie import (
    StrategyBalancerBPT,
)

def main():
    controller = "0x32d2af6fb8dD42d06CC7A97DB84AD4C409c10103"
    acct = accounts.load('deploy')
    StrategyBalancerBPT.deploy(controller, {'from': acct})    
