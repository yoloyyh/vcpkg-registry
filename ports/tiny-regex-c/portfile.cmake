vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Hackerl/tiny-regex-c
        REF 2193b195147fb6b1efd7e542f5ef2c390ed71cc4
        SHA512 9c76203c3fc937bc83debd34307b144d65e6c377c8a9751569489428e5bd516cef01dcabeb341779af42978c415bd42c367bfb4a71966a557bed8b34352a0812
)

vcpkg_configure_cmake(
        SOURCE_PATH "${SOURCE_PATH}"
        PREFER_NINJA
)

vcpkg_install_cmake()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/${PORT})

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
