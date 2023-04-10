vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Hackerl/aio
        REF 6d2f3985e726d71256447b412ad6326bebe68df8
        SHA512 b66ba55ff3c3d6afc2941c8d459358b15a041ef50235cde8b5d351a46629a7972edf4860857762ca03f04066e6a9abe9da2614bc3f46dfc7803d4318f7c7ee0d
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
