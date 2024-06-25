# Copyright (c) 2024-present The Bitcoin Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or https://opensource.org/license/mit/.

include_guard(GLOBAL)
include(${CMAKE_CURRENT_LIST_DIR}/FilterFlagOut.cmake)

function(bitcoincore_delete_ndebug_from_all_configs language)
  foreach(config IN LISTS CMAKE_BUILD_TYPE CMAKE_CONFIGURATION_TYPES)
    if(NOT config STREQUAL "")
      string(TOUPPER "${config}" config)
      bitcoincore_filter_flag_out(CMAKE_${language}_FLAGS_${config} DNDEBUG)
      set(CMAKE_${language}_FLAGS_${config} "${CMAKE_${language}_FLAGS_${config}}" PARENT_SCOPE)
    endif()
  endforeach()
endfunction()
