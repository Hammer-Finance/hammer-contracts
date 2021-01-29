import brownie

from brownie import accounts

from brownie import (
    StrategyBalancerBPT,
)

def main():
    controller = "0x66df62aa6c8f0b9c30f9a5f3993c8dec557201b6"
    acct = accounts.load('deploy')
    StrategyBalancerBPT.deploy(controller, {'from': acct})    
