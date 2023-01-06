:: Compile the library using GFortran. The LIBRARY_BIN
:: variable is available on Windows (Library/bin) and
:: Conda adds this to os.environ['PATH'], so this is the
:: best place to install DLLs into
gfortran -shared .\src\pyf\quadratic.f90 -o "%LIBRARY_BIN%/quadratic.dll"
if errorlevel 1 exit 1

:: Install the Python package, but without dependencies,
:: because Conda takes care of that
%PYTHON% -m pip install . --no-deps --ignore-installed --no-cache-dir -vvv
if errorlevel 1 exit 1