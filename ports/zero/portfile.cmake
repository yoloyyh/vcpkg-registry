vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Hackerl/zero
        REF 18ac73d2ebd0592a6c3d95cb09ace8e4a88df215
        SHA512 a63002aa5d7d56ee4465271761256f0294d0e23391ebc9591e66117c0c4e76e0e5faef56c80f95959e6b67a6142de5b7f54f83bfdd60e366d6fb0062fa86f953
)

vcpkg_configure_cmake(
        SOURCE_PATH "${SOURCE_PATH}"
        PREFER_NINJA
        OPTIONS
        -DZERO_DISABLE_TESTS=ON
)

vcpkg_install_cmake()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/${PORT})

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
