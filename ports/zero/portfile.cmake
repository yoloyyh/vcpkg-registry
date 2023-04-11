vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Hackerl/zero
        REF c9996f42d0f9fed51bf23b7d56af79994dec00fb
        SHA512 22c7d526771d3aa2eca60d3158bf8645aca7cef806dbd074f665f63c634a5a4b46841cfd378a72bf1c5021a793e7260f7a28e8613b4166e22f96f2610421988e
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
