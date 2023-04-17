vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Hackerl/elf
        REF 35858fbeaaa13ca89acece1689981240bf6c4912
        SHA512 341b7994019ad4741b8403d953b95878829fb4adc963cdab80c29e7b3a128ef2080388e0eec448e8902fc90c2b74f541e2b9ed0fe2ec672f9da1b1df4848fede
)

vcpkg_configure_cmake(
        SOURCE_PATH "${SOURCE_PATH}"
        PREFER_NINJA
)

vcpkg_install_cmake()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/${PORT})

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
