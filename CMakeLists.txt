cmake_minimum_required(VERSION 3.18)
set(LLVM_MOS_PLATFORM sim)
find_package(llvm-mos-sdk REQUIRED)
project(smoke-test)
include(CTest)

add_executable(hello hello.c)

find_program(SIM mos-sim REQUIRED)
add_test(NAME test
  COMMAND ${CMAKE_COMMAND}
          -DSIM=${SIM}
          -DHELLO=$<TARGET_FILE:hello>
          -DEXPECTED=${CMAKE_CURRENT_SOURCE_DIR}/expected
          -P ${CMAKE_CURRENT_SOURCE_DIR}/test.cmake
)
