# -*- cmake -*-
include(Prebuilt)
include(Linking)

include_guard()
add_library( ll::libcurl INTERFACE IMPORTED )

use_system_binary(libcurl)
use_prebuilt_binary(curl)
if (WINDOWS)
    target_link_libraries(ll::libcurl INTERFACE
      debug ${ARCH_PREBUILT_DIRS_DEBUG}/libcurld.lib
      optimized ${ARCH_PREBUILT_DIRS_RELEASE}/libcurl.lib
      ll::openssl
      ll::nghttp2
      ll::zlib-ng
      Normaliz.lib
      Iphlpapi.lib
    )
    target_compile_definitions( ll::libcurl INTERFACE CURL_STATICLIB=1)
elseif(DARWIN)
    target_link_libraries(ll::libcurl INTERFACE
      debug ${ARCH_PREBUILT_DIRS_DEBUG}/libcurld.a
      optimized ${ARCH_PREBUILT_DIRS_RELEASE}/libcurl.a
      ll::openssl
      ll::nghttp2
      ll::zlib-ng
      resolv
    )
else ()
    target_link_libraries(ll::libcurl INTERFACE
      ${ARCH_PREBUILT_DIRS}/libcurl.a
      ll::openssl
      ll::nghttp2
      ll::zlib-ng
      )
endif ()
target_include_directories( ll::libcurl SYSTEM INTERFACE ${LIBS_PREBUILT_DIR}/include)
