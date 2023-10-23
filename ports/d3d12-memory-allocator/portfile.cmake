vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO LunarGameTeam/D3D12MemoryAllocator 
    REF 5c879549dcdc4946291ad904bdccf4052ffefe37
    SHA512 32c5a88e366ff46cb547810677a09327565dff3cd4e71b930ebda55fc41a97be6b87549b44ed91f98931280624c19f0d19c749df68292969b7184b2b02f0197d
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
