cmake_minimum_required(VERSION 3.10)

# Set the minimum version of toolchain
set(CMAKE_C_STANDARD 99)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Set the name of project
project(lvgl_app C CXX)

add_executable(lvgl_test_app main.c)

find_package(PkgConfig REQUIRED)
pkg_check_modules(LIBDRM REQUIRED libdrm)
pkg_check_modules(LIBINPUT REQUIRED libinput)


# Set the include directories for lvgl subdirectory
target_include_directories(lvgl_test_app 
    PRIVATE 
        ${CMAKE_SYSROOT}/usr/include
        ${CMAKE_SYSROOT}/usr/include/lvgl
        ${LIBDRM_INCLUDE_DIRS}
        ${LIBINPUT_INCLUDE_DIRS}
)

target_link_directories(lvgl_test_app 
    PRIVATE 
        ${LIBDRM_LIBRARY_DIRS}
        ${LIBINPUT_LIBRARY_DIRS}
)

target_link_libraries(lvgl_test_app
    PRIVATE
        ${CMAKE_SYSROOT}/usr/lib/liblvgl.a
        ${CMAKE_SYSROOT}/usr/lib/liblvgl_demos.a
        ${CMAKE_SYSROOT}/usr/lib/liblvgl_examples.a
        ${CMAKE_SYSROOT}/usr/lib/liblvgl_thorvg.a
        -lstdc++
        ${LIBDRM_LIBRARIES}
        ${LIBINPUT_LIBRARIES}
        m pthread
)

install(TARGETS lvgl_test_app DESTINATION bin)