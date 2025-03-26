@echo off
setlocal enabledelayedexpansion

REM ---------------------------------------------------
REM 1) Read each line of config.txt into environment
REM ---------------------------------------------------
for /f "usebackq tokens=1,* delims==" %%A in ("config.txt") do (
    if "%%A" NEQ "" (
        if /i not "%%A:~0,3"=="REM" (
            set "%%A=%%B"
        )
    )
)

echo [INFO] FFBIN_PATH=%FFBIN_PATH%
echo [INFO] MEDIA_PATH=%MEDIA_PATH%
echo [INFO] EXTRA_ARGUMENTS=%EXTRA_ARGUMENTS%
echo [INFO] TEST_NAMES=%TEST_NAMES%
echo [INFO] EXTENSION_PAIRS=%EXTENSION_PAIRS%
echo.

REM ---------------------------------------------------
REM 2) Outer loop: For each test script name
REM ---------------------------------------------------
for %%T in (%TEST_NAMES%) do (
    echo [INFO] === Running Test Script: %%T.cmd ===
    REM Create subdirectory
    if not exist "%%T" mkdir "%%T"

    REM -----------------------------------------------
    REM 3) Inner loop: for each extension:format pair
    REM -----------------------------------------------
    for %%P in (%EXTENSION_PAIRS%) do (
    
        echo [INFO]   P = "%%P"

        REM First separate extension from the rest (format and params)
        
        for /f "tokens=1* delims=:" %%I in ("%%~P") do (
            set "EXTENSION=%%I"
            set "OUTPUT_FORMAT=%%J"

            REM OUTPUT_FORMAT can now safely contain equal signs (=) and additional params

            REM Compose the output file: <TestName>\<TestName>.<extension>
            set "OUTPUT_FILE=%%T\%%T.!EXTENSION!"

            echo [INFO]   OUTPUT_FILE = !OUTPUT_FILE!
            echo [INFO]   OUTPUT_FORMAT = !OUTPUT_FORMAT!
            echo.

            REM Expose these as environment variables:
            set "OUTPUT_FILE=!OUTPUT_FILE!"
            set "OUTPUT_FORMAT=!OUTPUT_FORMAT!"

            REM Call your test script (no arguments needed)
            call "%%T.cmd"
        )
    )
    
    REM -----------------------------------------------------------------
    REM 4) Save a ".command" file for reference
    REM -----------------------------------------------------------------
    echo [INFO] Creating "%%T.command" with placeholders...
    if exist "%%T.command" del "%%T.command"

    setlocal
        set FFBIN_PATH=echo ffmpeg 
        set "OUTPUT_FILE=^<graph_file^>" 
        set "OUTPUT_FORMAT=^<output_format^>"
        call "%%T.cmd" > "%%T\%%T.command"
    endlocal

    echo [INFO]   => Generated: %%T\%%T.command
    echo [INFO]   => FFBIN_PATH: !FFBIN_PATH!
    echo.    
)

echo.

endlocal
