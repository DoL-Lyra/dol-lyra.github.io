@echo off
setlocal enabledelayedexpansion

REM Define the gender folders
set "genders=male female"

REM Define the skin tone folders
set "tones=dark pale"

echo Starting file copy and rename...

REM --- Main Loop: Iterate through Gender folders (male, female) ---
for %%G in (%genders%) do (
    
    REM Determine the prefix for the final filename (m or f)
    set "gender_prefix="
    if "%%G"=="male" (
        set "gender_prefix=m"
    ) else if "%%G"=="female" (
        set "gender_prefix=f"
    )

    REM --- Nested Loop: Iterate through Skin Tone folders (dark, pale) ---
    for %%T in (%tones%) do (
        
        REM Determine the middle part of the final filename (black or white)
        set "tone_suffix="
        if "%%T"=="dark" (
            set "tone_suffix=black"
        ) else if "%%T"=="pale" (
            set "tone_suffix=white"
        )
        
        REM Construct the full path to the source file (1.png)
        set "source_file=%%G\%%T\1.png"
        
        REM Construct the new target filename (e.g., base_white_f.png)
        set "target_name=base_!tone_suffix!_!gender_prefix!.png"
        
        REM --- Copy the file and rename it ---
        if exist "!source_file!" (
            copy "!source_file!" "!target_name!"
            echo Copied: !source_file! to !target_name!
        ) else (
            echo Warning: Source file not found: !source_file!
        )
    )
)

echo.
echo All files processed.
endlocal
pause