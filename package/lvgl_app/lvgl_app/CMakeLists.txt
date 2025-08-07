cmake_minimum_required(VERSION 3.10)

# Set the minimum version of toolchain
set(CMAKE_C_STANDARD 99)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Set the name of project
project(lvgl_app)

add_executable(lvgl_test_app main.c)

find_package(PkgConfig REQUIRED)
pkg_check_modules(LIBDRM REQUIRED libdrm)


# Set the include directories for lvgl subdirectory
target_include_directories(lvgl_test_app 
    PUBLIC 
        ${CMAKE_SYSROOT}/usr/include
        ${CMAKE_SYSROOT}/usr/include/lvgl
        ${LIBDRM_INCLUDE_DIRS}
)

target_link_directories(lvgl_test_app PRIVATE ${LIBDRM_LIBRARY_DIRS})

target_link_libraries(lvgl_test_app
    PRIVATE
        lvgl
        lvgl_demos
        lvgl_examples
        lvgl_thorvg
        ${LIBDRM_LIBRARIES}
        m pthread  
)

install(TARGETS lvgl_test_app DESTINATION bin)