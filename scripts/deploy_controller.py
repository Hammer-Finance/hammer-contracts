import brownie

from brownie import accounts

from brownie import (
    Controller,
)

def main():
    rewards = "0xbb255186c84eaec8c9ab9fa4b5f4121beca89ee4"
    acct = accounts.load('deploy')
    Controller.deploy(rewards, {'from': acct})
    