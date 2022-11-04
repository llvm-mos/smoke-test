cmake_minimum_required(VERSION 3.18)
set(LLVM_MOS_PLATFORM sim)
find_package(llvm-mos-sdk REQUIRED)
project(smoke-test)
add_executable(hello hello.c)

find_program(SIM mos-sim REQUIRED)
add_test(NAME test
  COMMAND ${CMAKE_COMMAND}
          -DSIM=${SIM}
          -DHELLO=$<TARGET_FILE:hello>
          -P test.cmake
)
