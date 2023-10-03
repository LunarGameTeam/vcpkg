if(VCPKG_TARGET_IS_WINDOWS)
    vcpkg_check_linkage(ONLY_STATIC_LIBRARY)
endif()

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO LunarGameTeam/glTF-SDK
    REF 863c0e822aa776586f4e991d819348904e336a4c # 28-06-2022
    SHA512 e3aefa490bdf3983a2fa9e938805b140392ebd0bd40f6e2bbbe60509e4c521d9cd8c5e0f972b7197857694b313fac390ef46c1e1c4732c074365b5789dddf575
    HEAD_REF master
)

# note: Test/Sample executables won't be installed
vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        test    ENABLE_UNIT_TESTS
        samples ENABLE_SAMPLES
)

# note: Platform-native buildsystem will be more helpful to launch/debug the tests/samples.
# note: The PDB file path is making Ninja fails to install.
#       For Windows, we rely on /MP. The other platforms should be able to build with PREFER_NINJA.
vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    WINDOWS_USE_MSBUILD
    OPTIONS
        ${FEATURE_OPTIONS}
)
vcpkg_cmake_install()
vcpkg_copy_pdbs()

if(VCPKG_LIBRARY_LINKAGE STREQUAL "static")
    file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/bin" "${CURRENT_PACKAGES_DIR}/debug/bin")
endif()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
