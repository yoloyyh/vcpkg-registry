vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Hackerl/asyncio
        REF 3ecd7e1c9142be0f4caf64d5ac9f14e01fd52b99
        SHA512 2f2e1d1b212ef768537ab2c4580d4817903d1a5d4be290da067cc1661fe3fd9386d441c67ffaf42e33600e2edea95db90427e74173707bf2750beda9ebe379ed
)

vcpkg_check_features(
        OUT_FEATURE_OPTIONS FEATURE_OPTIONS
	FEATURES embedded ASYNCIO_EMBED_CA_CERT
	INVERTED_FEATURES openssl ASYNCIO_DISABLE_SSL
)

vcpkg_configure_cmake(
        SOURCE_PATH "${SOURCE_PATH}"
        PREFER_NINJA
        OPTIONS
        ${FEATURE_OPTIONS}
	-DBUILD_TESTING=OFF
	-DASYNCIO_DISABLE_SAMPLES=ON
)

vcpkg_install_cmake()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/${PORT})

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
