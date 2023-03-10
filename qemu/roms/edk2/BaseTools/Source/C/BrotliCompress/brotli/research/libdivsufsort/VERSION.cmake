set(PROJECT_VERSION_MAJOR "2")
set(PROJECT_VERSION_MINOR "0")
set(PROJECT_VERSION_PATCH "2")
set(PROJECT_VERSION_EXTRA "-1")
set(PROJECT_VERSION "${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}")
set(PROJECT_VERSION_FULL "${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}.${PROJECT_VERSION_PATCH}${PROJECT_VERSION_EXTRA}")

set(LIBRARY_VERSION "3.0.1")
set(LIBRARY_SOVERSION "3")

## Git revision number ##
if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/.git")
  execute_process(COMMAND git describe --tags HEAD
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
    OUTPUT_VARIABLE GIT_DESCRIBE_TAGS ERROR_QUIET)
  if(GIT_DESCRIBE_TAGS)
    string(REGEX REPLACE "^v(.*)" "\\1" GIT_REVISION "${GIT_DESCRIBE_TAGS}")
    string(STRIP "${GIT_REVISION}" GIT_REVISION)
    if(GIT_REVISION)
      set(PROJECT_VERSION_FULL "${GIT_REVISION}")
    endif(GIT_REVISION)
  endif(GIT_DESCRIBE_TAGS)
endif(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/.git")
