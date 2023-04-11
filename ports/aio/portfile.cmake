vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Hackerl/aio
        REF bdacb6f7eca9a8b76700201c1693405d84e37de6
        SHA512 714dcbbd94a93b1f2a00aedb57bc9eb4844d4ef04169af22d2975d74101220db6c0c6d29031895dda241ea6b5a5830a3c893703b56e98249dca4625eaaee0bfb
)

vcpkg_check_features(
        OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        INVERTED_FEATURES openssl AIO_DISABLE_SSL
)

vcpkg_configure_cmake(
        SOURCE_PATH "${SOURCE_PATH}"
        PREFER_NINJA
        OPTIONS
        ${FEATURE_OPTIONS}
        -DAIO_DISABLE_TESTS=ON
        -DAIO_DISABLE_SAMPLES=ON
)

vcpkg_install_cmake()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/${PORT})

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
