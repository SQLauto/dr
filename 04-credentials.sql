CREATE CREDENTIAL [https://acme.blob.core.windows.net/muhbackups] WITH IDENTITY = N'SHARED ACCESS SIGNATURE', SECRET = N'%2Fakezz5MZemwzg%3F'
CREATE CREDENTIAL [acme] WITH IDENTITY = N'acme', SECRET = N'xyz'
CREATE CREDENTIAL [AzureCredential] WITH IDENTITY = N'acme', SECRET = N'Fak3z5MXemw'
CREATE CREDENTIAL [PowerShell Proxy Account] WITH IDENTITY = N'base\powershell', SECRET = N'e=2Fakezz5MXemwzgZ'
