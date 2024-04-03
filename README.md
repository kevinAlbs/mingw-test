Building with MinGW and CMake 3.29.0 appears unable to find the OpenSSL package installed with `choco`.

I reproduced this error using Windows 10 with CMake 3.29.0.

I downloaded `Win64` `Zip archive` `without LLVM/Clang/LLD/LLDB` link from https://winlibs.com/#download-release, unzipped, and placed into `C:\mingw64`.

I installed OpenSSL with `choco install openssl`.

I then created a project with this CMakeLists.txt:

```cmake
cmake_minimum_required (VERSION 3.29)
project (TestFindOpenSSL)
find_package(OpenSSL)
```

And configured in a with `Developer Command Prompt for VS 2017`:
```cmd
set CMAKE=C:\cmake-3.29.0-windows-x86_64\bin\cmake.exe
set CMAKE_MAKE_PROGRAM=C:\mingw64\bin\mingw32-make.exe
set CC=C:\mingw64\bin\gcc.exe
rem Clean up prior build directory
rmdir /S /Q cmake-build-mingw
%CMAKE% -G "MinGW Makefiles" ^
    -DCMAKE_MAKE_PROGRAM=%CMAKE_MAKE_PROGRAM% ^
    -DOPENSSL_ROOT="C:\Program Files\OpenSSL-Win64" ^
    -S. -Bcmake-build-mingw
```

Shows this output:
```
-- Could NOT find OpenSSL, try to set the path to OpenSSL root folder in the system variable OPENSSL_ROOT_DIR (missing: OPENSSL_CRYPTO_LIBRARY) (found version "3.2.1")
```

This may be related to https://gitlab.kitware.com/cmake/cmake/-/issues/25702