vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Hackerl/go-symbol
        REF 22e1b15bc7f81d9ed629471487957572627e84d9
        SHA512 5b213a18cba4a8813cb99abdbde9d1fa35b5abd6eba9135da2fea07f38fbfa547d2caaf5a3dcda6af3d96afe65a7f1004c84bf7d2217acb9e48edbe5105f33c8
)

vcpkg_configure_cmake(
        SOURCE_PATH "${SOURCE_PATH}"
        PREFER_NINJA
)

vcpkg_install_cmake()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/${PORT})

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
