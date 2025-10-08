set TBB_LIB=%LIBRARY_PREFIX%\lib
set TBB_INC=%LIBRARY_PREFIX%\include
sed -i 's?tbb/build/lib_release?%LIBRARY_PREFIX%\bin?' src/Makevars.in

"%R%" CMD INSTALL --build . %R_ARGS%
IF %ERRORLEVEL% NEQ 0 exit /B 1
