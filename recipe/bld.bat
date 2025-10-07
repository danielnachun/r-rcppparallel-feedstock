set TBB_LIB=%LIBRARY_PREFIX%\lib
set TBB_INC=%LIBRARY_PREFIX%\include
sed -i 's?-Ltbb/build/lib_release??' src/Makevars.in

"%R%" CMD INSTALL --build . %R_ARGS%
IF %ERRORLEVEL% NEQ 0 exit /B 1
