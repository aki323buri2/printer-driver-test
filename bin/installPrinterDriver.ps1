$ipaddress = '172.16.11.115'
$infPrinterName = 'FX DocuCentre-IV 7080'
$printerName = 'DocuCentre-IV 7080'
$infFilename = Join-Path $PSScriptRoot '..\x64\FXLV4JL.inf' 
$infFilename = Convert-Path $infFilename
echo $infFilename
$location =  'C:\Windows\System32\Printing_Admin_Scripts\ja-JP'
Set-Location $location

$portName = 'IP_' + $ipaddress
cscript prnport.vbs -a -r $portName -h $ipaddress -o raw -n 9100

$os = Get-WmiObject -Class Win32_OperatingSystem

if ( $os.OSarchitecture -eq '64 �r�b�g' )
{
    cscript prndrvr.vbs -a -m $infPrinterName -v 3 -i $infFilename
}

cscript prnmngr.vbs -d -p $printerName
cscript prnmngr.vbs -a -p $printerName -m $infPrinterName -r $portName