# Copyright (c) 2024-present The Bitcoin Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or https://opensource.org/license/mit/.

include_guard(GLOBAL)

function(bitcoincore_filter_flag_out flags_var flag)
  separate_arguments(${flags_var})
  list(FILTER ${flags_var} EXCLUDE REGEX "^[-/]${flag}$")
  list(JOIN ${flags_var} " " ${flags_var})
  set(${flags_var} "${${flags_var}}" PARENT_SCOPE)
endfunction()
