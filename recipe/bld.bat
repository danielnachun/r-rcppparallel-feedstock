set TBB_LIB=%LIBRARY_PREFIX%\lib
set TBB_INC=%LIBRARY_PREFIX%\include
sed -i 's?tbb/build/lib_release?%LIBRARY_PREFIX:\=/%/bin?' src/Makevars.in
IF %ERRORLEVEL% NEQ 0 exit /B 1

sed -i 's/PKG_CXXFLAGS = /PKG_CXXFLAGS = -DNOMINMAX /g' src/Makevars.in
IF %ERRORLEVEL% NEQ 0 exit /B 1

sed -i -e "s/void R_init_RcppParallel/__declspec(dllexport) void R_init_RcppParallel/" src/init.cpp
IF %ERRORLEVEL% NEQ 0 exit /B 1

"%R%" CMD INSTALL --build . %R_ARGS%
IF %ERRORLEVEL% NEQ 0 type src/Makevars
