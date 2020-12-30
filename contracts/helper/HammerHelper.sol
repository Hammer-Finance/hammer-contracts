pragma solidity ^0.5.17;

import "@openzeppelinV2/contracts/token/ERC20/IERC20.sol";
import "@openzeppelinV2/contracts/token/ERC20/ERC20.sol";
import "@openzeppelinV2/contracts/math/SafeMath.sol";
import "@openzeppelinV2/contracts/utils/Address.sol";
import "@openzeppelinV2/contracts/token/ERC20/SafeERC20.sol";

import "../../interfaces/hammer/IWeth.sol";
import "../../interfaces/hammer/IBPool.sol";
import "../../interfaces/yearn/IVault.sol";

contract HammerHelper {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;
    address public constant weth = address(0xd0A1E359811322d97991E03f863a0C30C2cF029C);
    
    function depositEthToBalancer(address balAndWethPoolAddress, uint256 minBptOut) payable public {
        require(msg.value > 0, "ERR: No ETH sent");
        uint256 bptAmount = supplyEthToBalancer(balAndWethPoolAddress, msg.value, minBptOut);
        IERC20(balAndWethPoolAddress).transfer(msg.sender, bptAmount);
    }
    
    function depositEthToHammer(address balAndWethPoolAddress, address hammerAddress, uint256 minBptOut) payable public {
        require(msg.value > 0, "ERR: No ETH sent");
        uint256 bptAmount = supplyEthToBalancer(balAndWethPoolAddress, msg.value, minBptOut);
        uint256 hbptAmount = supplyBptToHammer(balAndWethPoolAddress, hammerAddress, bptAmount);
        IERC20(balAndWethPoolAddress).transfer(msg.sender, hbptAmount);
    }
    
    function supplyEthToBalancer(address balAndWethPoolAddress, uint256 amount, uint256 minBptOut) private returns (uint256) {
        IWETH(weth).deposit.value(amount)();
        IERC20(weth).safeApprove(balAndWethPoolAddress, 0);
        IERC20(weth).safeApprove(balAndWethPoolAddress, amount);
        uint256 bptAmount = IBPool(balAndWethPoolAddress).joinswapExternAmountIn(weth, amount, minBptOut);
        return bptAmount;
    }
    
    function supplyBptToHammer(address balAndWethPoolAddress, address hammerAddress, uint256 amount) private returns (uint256){
        IERC20(balAndWethPoolAddress).safeApprove(hammerAddress, 0);
        IERC20(balAndWethPoolAddress).safeApprove(hammerAddress, amount);

        uint256 before = IERC20(hammerAddress).balanceOf(address(this));
        IVault(hammerAddress).deposit(amount);
        uint256 afterDeposit = IERC20(hammerAddress).balanceOf(address(this));
        uint256 diff = afterDeposit.sub(before);

        return diff;
    }

}