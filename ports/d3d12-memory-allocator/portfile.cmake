vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO LunarGameTeam/D3D12MemoryAllocator 
    REF a936da058cc658da13dbd759732b1622488adf78
    SHA512 8c9164d5d58263cf26936db48468bdb9b24c0967e747007b98eaa1bb74edccaf40a57b51c13cbeb1e028178b137cc602395870c0e107d9324c852e86ce646c02
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
     WINDOWS_USE_MSBUILD
    OPTIONS
        ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()
vcpkg_copy_pdbs()
vcpkg_cmake_config_fixup(CONFIG_PATH cmake/)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
