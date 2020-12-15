import brownie

from brownie import accounts

from brownie import (
    yVault,
)

def main():
    controller = "0x32d2af6fb8dD42d06CC7A97DB84AD4C409c10103"
    bpt = "0xc5935ea0ad3645d37b7c545a3e603b24ee149e0c"
    acct = accounts.load('deploy')
    yVault.deploy(bpt, controller, {'from': acct})    
