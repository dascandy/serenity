# This file specifies the options used for building the Clang compiler, LLD linker and the compiler builtins library

set(CMAKE_BUILD_TYPE Release CACHE STRING "")

set(LLVM_TARGETS_TO_BUILD "X86;AArch64" CACHE STRING "")

set(LLVM_ENABLE_PROJECTS "llvm;clang;lld" CACHE STRING "")
set(LLVM_ENABLE_RUNTIMES "compiler-rt" CACHE STRING "")

set(LLVM_ENABLE_PER_TARGET_RUNTIME_DIR ON CACHE BOOL "")
set(LLVM_ENABLE_BINDINGS OFF CACHE BOOL "")
set(LLVM_INCLUDE_BENCHMARKS OFF CACHE BOOL "")
set(LLVM_BUILD_UTILS OFF CACHE BOOL "")
set(LLVM_INCLUDE_TESTS OFF CACHE BOOL "")
set(LLVM_BUILD_LLVM_DYLIB ON CACHE BOOL "")
set(LLVM_LINK_LLVM_DYLIB ON CACHE BOOL "")
set(LLVM_INSTALL_UTILS OFF CACHE BOOL "")
set(LLVM_INSTALL_TOOLCHAIN_ONLY ON CACHE BOOL "")
set(LLVM_INSTALL_BINUTILS_SYMLINKS OFF CACHE BOOL "")

set(CLANG_ENABLE_CLANGD OFF CACHE BOOL "")

set(compiler_flags "-nostdlib -nostdlib++")
foreach(target i686-pc-serenity;x86_64-pc-serenity;aarch64-pc-serenity)
    list(APPEND targets "${target}")

    set(RUNTIMES_${target}_CMAKE_BUILD_TYPE Release CACHE STRING "")
    set(RUNTIMES_${target}_CMAKE_SYSROOT ${SERENITY_${target}_SYSROOT} CACHE PATH "")
    set(RUNTIMES_${target}_CMAKE_C_FLAGS ${compiler_flags} CACHE STRING "")
    set(RUNTIMES_${target}_CMAKE_CXX_FLAGS ${compiler_flags} CACHE STRING "")
    set(RUNTIMES_${target}_COMPILER_RT_BUILD_CRT ON CACHE BOOL "")
    set(RUNTIMES_${target}_COMPILER_RT_BUILD_SANITIZERS OFF CACHE BOOL "")
    set(RUNTIMES_${target}_COMPILER_RT_BUILD_LIBFUZZER OFF CACHE BOOL "")
    set(RUNTIMES_${target}_COMPILER_RT_BUILD_MEMPROF OFF CACHE BOOL "")
    set(RUNTIMES_${target}_COMPILER_RT_BUILD_PROFILE OFF CACHE BOOL "")
    set(RUNTIMES_${target}_COMPILER_RT_BUILD_XRAY OFF CACHE BOOL "")
    set(RUNTIMES_${target}_COMPILER_RT_BUILD_ORC OFF CACHE BOOL "")

    set(BUILTINS_${target}_CMAKE_BUILD_TYPE Release CACHE STRING "")
    set(BUILTINS_${target}_CMAKE_SYSROOT ${SERENITY_${target}_SYSROOT} CACHE PATH "")
    set(BUILTINS_${target}_COMPILER_RT_EXCLUDE_ATOMIC_BUILTIN OFF CACHE BOOL "")
endforeach()

set(LLVM_TOOLCHAIN_TOOLS
        llvm-addr2line
        llvm-ar
        llvm-cov
        llvm-cxxfilt
        llvm-dwarfdump
        llvm-ifs
        llvm-lib
        llvm-nm
        llvm-objcopy
        llvm-objdump
        llvm-profdata
        llvm-rc
        llvm-ranlib
        llvm-readelf
        llvm-readobj
        llvm-size
        llvm-strings
        llvm-strip
        llvm-symbolizer
        CACHE STRING "")

set(LLVM_RUNTIME_TARGETS ${targets} CACHE STRING "")
set(LLVM_BUILTIN_TARGETS ${targets} CACHE STRING "")
