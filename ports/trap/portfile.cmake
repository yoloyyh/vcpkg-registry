vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Hackerl/trap
        REF 0c025e66ba4d680fe42d6e51f8256b314d40792e
        SHA512 5726e2dae187ebd33e5ee252df468d6c2e1807a298a0755dd4cf6c7bf66a10327478652bdca45ea74cb40793c144f4356b6972f864dc6b8faca36e231794d179
)

vcpkg_configure_cmake(
        SOURCE_PATH "${SOURCE_PATH}"
        PREFER_NINJA
        OPTIONS
        -DTRAP_DISABLE_SAMPLES=ON
)

vcpkg_install_cmake()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/${PORT})

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
