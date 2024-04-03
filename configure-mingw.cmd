set CMAKE=C:\cmake-3.29.0-windows-x86_64\bin\cmake.exe
set CMAKE_MAKE_PROGRAM=C:\mingw64\bin\mingw32-make.exe
set CC=C:\mingw64\bin\gcc.exe
rem Clean up prior build directory
rmdir /S /Q cmake-build-mingw
%CMAKE% -G "MinGW Makefiles" ^
    -DCMAKE_MAKE_PROGRAM=%CMAKE_MAKE_PROGRAM% ^
    -DOPENSSL_ROOT="C:\Program Files\OpenSSL-Win64" ^
    -S. -Bcmake-build-mingw