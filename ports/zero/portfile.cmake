vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Hackerl/zero
        REF 9c0cd29917673515caa428c74ed1b0d115491282
        SHA512 db6caa60f3df386ef4b6e3f475862561dd768151dda1d2b22c98e1d0c1e0b1afa0cfeec2e1acfc50d1adf51ba779855842125345285859e1006f0f4b765b772e
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
