include(${CMAKE_CURRENT_LIST_DIR}/CPM.cmake)

function(SetupVcpkg)
  CPMAddPackage(NAME vcpkg GITHUB_REPOSITORY microsoft/vcpkg GIT_TAG 2023.01.09)

  set(VCPKG_DIR ${vcpkg_SOURCE_DIR})
  IF (WIN32)
      set(VCPKG_EXE_FILE ${VCPKG_DIR}/vcpkg.exe)
      set(VCPKG_INSTALL_FILE ${VCPKG_DIR}/bootstrap-vcpkg.bat)
  ELSE ()
      set(VCPKG_EXE_FILE ${VCPKG_DIR}/vcpkg)
      set(VCPKG_INSTALL_FILE ${VCPKG_DIR}/bootstrap-vcpkg.sh)
  ENDIF ()

  IF (NOT EXISTS "${VCPKG_EXE_FILE}")
      execute_process(COMMAND ${VCPKG_INSTALL_FILE} WORKING_DIRECTORY ${VCPKG_DIR})
  ENDIF()

  set(CMAKE_TOOLCHAIN_FILE ${VCPKG_DIR}/scripts/buildsystems/vcpkg.cmake PARENT_SCOPE)
endfunction()
