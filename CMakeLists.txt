# Copyright (c) 2024-present The Bitcoin Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or https://opensource.org/license/mit/.

# Minimum required CMake versions across supported projects:
#  - Bitcoin Core: 3.22
#  - libsecp256k1: 3.13
cmake_minimum_required(VERSION 3.13)

project(test)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)

function(assert_equal var value)
  if(NOT ${var} STREQUAL "${value}")
    message("${var}: '${${var}}' is not equal to '${value}'")
    message(FATAL_ERROR "assert_equal FAILED.")
  endif()
endfunction()

include(FilterFlagOut)
set(flags_1 "-aa -aaa -bb -bbb -zzz -zz")
bitcoincore_filter_flag_out(flags_1 "aa")
assert_equal(flags_1 "-aaa -bb -bbb -zzz -zz")
bitcoincore_filter_flag_out(flags_1 "zz")
assert_equal(flags_1 "-aaa -bb -bbb -zzz")
bitcoincore_filter_flag_out(flags_1 "bb")
assert_equal(flags_1 "-aaa -bbb -zzz")
unset(flags_1)
set(flags_2 "/aa /aaa /bb /bbb /zzz /zz")
bitcoincore_filter_flag_out(flags_2 "aa")
assert_equal(flags_2 "/aaa /bb /bbb /zzz /zz")
bitcoincore_filter_flag_out(flags_2 "zz")
assert_equal(flags_2 "/aaa /bb /bbb /zzz")
bitcoincore_filter_flag_out(flags_2 "bb")
assert_equal(flags_2 "/aaa /bbb /zzz")
unset(flags_2)
