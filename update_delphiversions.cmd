:<<"::CMDLITERAL"
@ECHO OFF
:: ------------------------------------------------------------------
:: This is a polygot script that works in PowerShell, CMD, and Bash.
:: More informaiton: https://github.com/jimmckeeth/DelphiVersions/
:: ------------------------------------------------------------------

GOTO :CMDSCRIPT
::CMDLITERAL

# -----------------------------------------------------------------------------
# BASH IMPLEMENTATION (Runs in Git Bash, WSL, Linux, macOS)
# -----------------------------------------------------------------------------

REPO_URL="https://github.com/jimmckeeth/DelphiVersions.git"
FOLDER="DelphiVersions"

echo "--- [Bash] Checking for $FOLDER submodule ---"

if [ -d "$FOLDER/.git" ]; then
    echo "[INFO] Submodule already exists."
else
    echo "[INFO] Initializing new submodule..."
    # Add submodule
    git submodule add "$REPO_URL" "$FOLDER" || { echo "[ERROR] Failed to add submodule"; exit 1; }
fi

echo "[INFO] Updating $FOLDER..."
git submodule update --remote --merge "$FOLDER"

echo ""
echo "[SUCCESS] The $FOLDER folder contains the latest DelphiVersions.inc
exit 0

:CMDSCRIPT
:: -----------------------------------------------------------------------------
:: BATCH IMPLEMENTATION (Runs in CMD and PowerShell)
:: -----------------------------------------------------------------------------

setlocal
set "REPO_URL=https://github.com/jimmckeeth/DelphiVersions.git"
set "FOLDER_NAME=DelphiVersions"

echo --- [CMD] Checking for %FOLDER_NAME% submodule ---

IF EXIST "%FOLDER_NAME%\.git" (
    echo [INFO] Submodule already exists.
) ELSE (
    echo [INFO] Initializing new submodule...
    git submodule add %REPO_URL% %FOLDER_NAME%
    IF ERRORLEVEL 1 (
        echo [ERROR] Failed to add submodule.
        pause
        exit /b 1
    )
)

echo [INFO] Updating %FOLDER_NAME%...
git submodule update --remote --merge %FOLDER_NAME%

echo.
echo [SUCCESS] The %FOLDER_NAME% folder contains the latest DelphiVersions.inc
timeout /t 10 
