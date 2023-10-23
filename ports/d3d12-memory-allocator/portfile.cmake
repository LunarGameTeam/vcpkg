vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO LunarGameTeam/D3D12MemoryAllocator 
    REF 50652df0dd5e2bec0442ed9bd059804328c36fa8
    SHA512 dc49dc091dce9e59f817e0369b1fb24ff2a1aea852a51887d9b8ff467ddd3e0f9076a1a04d5f909a59cd45ba9d526a354f4ead43f51f195f7a6d4494eeb844da
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
     WINDOWS_USE_MSBUILD
    OPTIONS
        ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/d3d12-memory-allocator)
vcpkg_fixup_pkgconfig()
vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
