cmake_minimum_required(VERSION 3.14)
project(test_get_next_line)

# GoogleTest requires at least C++14
set(CMAKE_CXX_STANDARD 14)

include(FetchContent)
FetchContent_Declare(
  googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG release-1.12.1
)
# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

enable_testing()

include_directories("..")

add_executable(
  runtests
  get_next_line.cc
  ../get_next_line.c
  ../get_next_line_utils.c
)
target_link_libraries(
  runtests
  GTest::gtest_main
)

include(GoogleTest)
gtest_discover_tests(runtests)
