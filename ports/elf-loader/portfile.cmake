if ("anonymous" IN_LIST FEATURES)
    vcpkg_from_github(
            OUT_SOURCE_PATH SOURCE_PATH
            REPO Hackerl/elf-loader
            REF f08a01101841fae151636d27f1a1bc31f8f4eab5
            SHA512 3fecfbeabd441bb30b87ff42434ef3f18ce9f4da824a36a88111ad75f82114cee42d48605c74d3d4e72d454170d39c7a954aefd90a5ddf6b0c69f5a6f3179698
    )
else ()
    vcpkg_from_github(
            OUT_SOURCE_PATH SOURCE_PATH
            REPO Hackerl/elf-loader
            REF b898418cb0f349a99f947bd813fcd287a4decf96
            SHA512 e15a23fc04e52197fc7ad31ad33c5ef00079b3d0cb82e54cd133041407da244999ded4fcde4227382ab1c36b98f0838b396b98d5ba8afbe57695a696766b261f
    )
endif ()

vcpkg_configure_cmake(
        SOURCE_PATH "${SOURCE_PATH}"
        PREFER_NINJA
)

vcpkg_install_cmake()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/${PORT})

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
