// SPDX-License-Identifier: MIT

pragma solidity ^0.5.17;

interface IBPool {
    function joinswapExternAmountIn(
        address tokenIn,
        uint256 tokenAmountIn,
        uint256 minPoolAmountOut
    ) external payable returns (uint256 poolAmountOut);

    function isBound(address t) external view returns (bool);

    function getFinalTokens() external view returns (address[] memory tokens);

    function totalSupply() external view returns (uint256);

    function getDenormalizedWeight(address token)
        external
        view
        returns (uint256);

    function getTotalDenormalizedWeight() external view returns (uint256);

    function getSwapFee() external view returns (uint256);

    function calcPoolOutGivenSingleIn(
        uint256 tokenBalanceIn,
        uint256 tokenWeightIn,
        uint256 poolSupply,
        uint256 totalWeight,
        uint256 tokenAmountIn,
        uint256 swapFee
    ) external pure returns (uint256 poolAmountOut);

    function getBalance(address token) external view returns (uint256);
}