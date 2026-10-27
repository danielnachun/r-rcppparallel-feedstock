set TBB_LIB=%LIBRARY_LIB:\=/%
set TBB_INC=%LIBRARY_INC:\=/%

copy %RECIPE_DIR%\Makevars.ucrt src

sed -i -e "s/void R_init_RcppParallel/__declspec(dllexport) void R_init_RcppParallel/" src/init.cpp
IF %ERRORLEVEL% NEQ 0 exit /B 1

"%R%" CMD INSTALL --build . %R_ARGS%
IF %ERRORLEVEL% NEQ 0 exit /B 1
