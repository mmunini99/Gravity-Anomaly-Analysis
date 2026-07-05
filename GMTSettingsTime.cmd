@echo off

REM Decimal symbol
reg add "HKCU\Control Panel\International" /v sDecimal /t REG_SZ /d . /f

REM Thousands separator
reg add "HKCU\Control Panel\International" /v sThousand /t REG_SZ /d , /f

REM Digits after decimal
reg add "HKCU\Control Panel\International" /v iDigits /t REG_SZ /d 2 /f

REM Digit grouping (123,456,789)
reg add "HKCU\Control Panel\International" /v sGrouping /t REG_SZ /d 3;0 /f

REM Negative sign
reg add "HKCU\Control Panel\International" /v sNegativeSign /t REG_SZ /d - /f

REM Negative number format (-1.1)
reg add "HKCU\Control Panel\International" /v iNegNumber /t REG_SZ /d 1 /f

REM Leading zero (0.7 instead of .7)
reg add "HKCU\Control Panel\International" /v iLZero /t REG_SZ /d 1 /f

REM List separator
reg add "HKCU\Control Panel\International" /v sList /t REG_SZ /d , /f

REM U.S. measurement system
reg add "HKCU\Control Panel\International" /v iMeasure /t REG_SZ /d 1 /f

echo.
echo Regional number settings updated.
echo Sign out and back in for all applications to pick up the changes.
pause