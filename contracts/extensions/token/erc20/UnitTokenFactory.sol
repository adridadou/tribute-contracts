pragma solidity ^0.8.0;

// SPDX-License-Identifier: MIT

import "../../core/DaoConstants.sol";
import "../../core/DaoRegistry.sol";
import "../../core/CloneFactory.sol";
import "./UnitToken.sol";

/**
MIT License

Copyright (c) 2020 Openlaw

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
 */

contract UnitTokenFactory is CloneFactory, DaoConstants {
    address public identityAddress;

    event UnitTokenCreated(address nftCollAddress);

    constructor(address _identityAddress) {
        identityAddress = _identityAddress;
    }

    /**
     * @notice Create and initialize a new Unit Token Extension which is based on ERC20
     */
    function create(address dao, address bank) external {
        UnitTokenExtension extension =
            UnitTokenExtension(_createClone(identityAddress));
        extension.initialize(dao, bank);
        emit UnitTokenCreated(address(extension));
    }
}