# cd D:\exotic-industries\exotic-industries_dev
# powershell -ExecutionPolicy Bypass -File build_mod.ps1

$param1 = $args[0]

function Write-ColorOutput($ForegroundColor)
{
    # save the current color
    $fc = $host.UI.RawUI.ForegroundColor

    # set the new color
    $host.UI.RawUI.ForegroundColor = $ForegroundColor

    # output
    if ($args) {
        Write-Output $args
    }
    else {
        $input | Write-Output
    }

    # restore the original color
    $host.UI.RawUI.ForegroundColor = $fc
}

function make_both {
    Write-ColorOutput green ("Building source mod...")

    $FactorioFolder = "C:\Users\A\AppData\Roaming\Factorio\mods\"

    # Find both mods in folder above

    Write-ColorOutput darkgreen ("Searching files.")

    $LocationPath = (Get-Location).path
    $ParentPath = (get-item $LocationPath ).parent.FullName

    Write-ColorOutput darkgreen ("Checking files.")

    $SourceArray = Get-ChildItem -Path $ParentPath -Recurse | Where {$_.Name -match 'exotic-industries_'} | %{$_.FullName}
    $GraphicalArray = Get-ChildItem -Path $ParentPath -Recurse | Where {$_.Name -match 'exotic-industries-graphics_'} | %{$_.FullName}

    # --> kommt nicht hierhin

    # check if both arrays only have one element, throw error otherwise

    Write-ColorOutput darkgreen ("Done checking files.")

    if ($SourceArray.count -eq 1) 
    {
        $SourceFolder = $SourceArray     
    }
    else
    {
        throw "There is more then one uniqe exotic-industries folder in this repository."
    }

    if ($GraphicalArray.count -eq 1) 
    {
        $GraphicalFolder = $GraphicalArray     
    }
    else
    {
        throw "There is more then one uniqe exotic-industries-graphics folder in this repository."
    }

    # Get new version numbers for source and graphic mod from info.json

    Write-ColorOutput darkgreen ("Searching for version numbers.")

    [string]$SourceVersion = (Get-Content (Join-Path -Path $SourceFolder -ChildPath "\info.json") -Raw | ConvertFrom-Json).version
    [string]$GraphicalVersion = (Get-Content (Join-Path -Path $GraphicalFolder -ChildPath "\info.json") -Raw | ConvertFrom-Json).version

    # Make targets with version numbers

    $SourceTarget = Join-Path -Path $FactorioFolder -ChildPath (-join("exotic-industries_", $SourceVersion))
    $GraphicalTarget = Join-Path -Path $FactorioFolder -ChildPath (-join("exotic-industries-graphics_", $GraphicalVersion))

    # copy all updated filed using xcopy

    Write-ColorOutput darkgreen ("Copying.")

    xcopy $SourceFolder $SourceTarget /s /d /e /f /y /i
    xcopy $GraphicalFolder $GraphicalTarget /s /d /e /f /y /i
}

function start_factorio {
    # look if factorio is running, if so, restart it

    $FactorioProcess = Get-Process factorio -ErrorAction SilentlyContinue
    if($FactorioProcess -eq $null)
    {
        # start factorio
        Write-ColorOutput blue ("Starting factorio.")
        Start-Process -FilePath "D:\SteamLibrary\steamapps\common\Factorio\bin\x64\factorio.exe" -Wait
    }
    else
    {   
        Write-ColorOutput blue ("Restarting factorio.")

        # be nice first
        $FactorioProcess.CloseMainWindow()

        # then kill it
        Sleep 5
        if (!$FactorioProcess.HasExited)
        {
            $FactorioProcess | Stop-Process -Force
        }

        # start factorio
        Start-Process -FilePath "C:\Program Files (x86)\Steam\steamapps\common\Factorio\bin\x64\factorio.exe" -Wait
    }
}


# select action
switch ($param1)
{
    1 {
        make_both
        start_factorio
    }

    2 {
        make_both
    }

    default {
        Write-ColorOutput yellow ("False parameter")
    }
}

exit 0