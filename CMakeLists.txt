# Copyright (c) 2024-present The Bitcoin Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or https://opensource.org/license/mit/.

# Minimum required CMake versions across supported projects:
#  - Bitcoin Core: 3.22
#  - libsecp256k1: 3.13
cmake_minimum_required(VERSION 3.13)

project(test)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
