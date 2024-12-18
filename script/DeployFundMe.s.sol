// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "@/FundMe.sol";
import {HelperConfig} from "@script/HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        // not a real tx, just a simulation
        HelperConfig helperConfig = new HelperConfig();
        address ethUsePriceFeed = helperConfig.activeNetworkConfig();
        // a real tx
        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethUsePriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}
