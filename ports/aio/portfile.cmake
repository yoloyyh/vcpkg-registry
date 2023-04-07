vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Hackerl/aio
        REF 0fa02861999608067cec9e481f279d1a1da7d2c4
        SHA512 9f69deb8e7c033399b85a90b7e341a1a3ea83f6d47e97e77f49332f854e2593c8ee18bbf64e11984a53dd4b96aea31bac89e5daa25b1f70060ff5556d3f1e4b9
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
