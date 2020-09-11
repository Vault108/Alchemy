# -*- cmake -*-
include(Prebuilt)

set(EXPAT_FIND_QUIETLY ON)
set(EXPAT_FIND_REQUIRED ON)

if (USESYSTEMLIBS)
  include(FindEXPAT)
else (USESYSTEMLIBS)
    use_prebuilt_binary(expat)
    if (WINDOWS)
        set(EXPAT_LIBRARIES
            debug libexpatd.lib
            optimized libexpat.lib)
        set(EXPAT_COPY libexpat.dll)
    else (WINDOWS)
        set(EXPAT_LIBRARIES expat)
        if (DARWIN)
            set(EXPAT_COPY libexpat.1.dylib libexpat.dylib)
        else ()
            set(EXPAT_COPY libexpat.so.1 libexpat.so)
        endif ()
    endif (WINDOWS)
    set(EXPAT_INCLUDE_DIRS ${LIBS_PREBUILT_DIR}/include)
endif (USESYSTEMLIBS)
