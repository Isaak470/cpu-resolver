$ftp = "ftp://ftpupload.net/htdocs/chat_mysql.php"
$user = "if0_38647141"
$pass = "oRMciSb8IKSr"
$dest = "C:\Users\Windows Lite BR\Desktop\BIBLIOTECA\FTPDownload\chat_mysql.php"

$webclient = New-Object System.Net.WebClient
$webclient.Credentials = New-Object System.Net.NetworkCredential($user, $pass)
$webclient.DownloadFile($ftp, $dest)