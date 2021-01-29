import brownie

from brownie import accounts

from brownie import (
    yVault,
)

def main():
    controller = "0x66df62aa6c8f0b9c30f9a5f3993c8dec557201b6"
    # BAL/ETH 80/20
    # bpt = "0xc5935ea0ad3645d37b7c545a3e603b24ee149e0c"
    # BAL/ETH 66/33
    bpt = "0x9dDE0b1d39d0d2C6589Cde1BFeD3542d2a3C5b11"

    acct = accounts.load('deploy')
    yVault.deploy(bpt, controller, {'from': acct})    
