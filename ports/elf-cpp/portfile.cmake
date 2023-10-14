vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Hackerl/elf
        REF 73ca432e8ba65325f8486720ecf9b822a19ffa20
        SHA512 a337bc5ce9af1e3d6c30571f4758031eb8cbe2e2cf698019def4e9b390b1f99334cccbf03d3255af8e95595cca19e41798ef36f19b07c2719481dfe3adb509e6
)

vcpkg_configure_cmake(
        SOURCE_PATH "${SOURCE_PATH}"
        PREFER_NINJA
)

vcpkg_install_cmake()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/${PORT})

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
