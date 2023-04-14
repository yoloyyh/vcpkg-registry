vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Hackerl/aio
        REF 5c855b5af5efe356273bc96438c1fac978674bbe
        SHA512 f9dafc501013e26615234b5fd97fd05bcd100baa340e28fa0255828a8857974041c5bbb7ff249020155ec8cef85ac670b77c41ff9b44c574aedb6788c6d7715f
)

vcpkg_check_features(
        OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES embedded AIO_EMBED_CA_CERT
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
