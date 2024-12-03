<#
    ***************************************
    Copyright Information: 
    This script was developed by:
    Mohamed Hassan
    Functional Consultant - Microsoft Dynamics 365 Business Central & LS Retail
    Techno-functional Consultant for Microsoft Dynamics 365 Business Central & LS Retail
    Phone: 01025329288
    LinkedIn: https://www.linkedin.com/in/mohamed-hassan-3158b9b1/
    YouTube: https://www.youtube.com/@Medasofit
    ***************************************
#>

Write-Host "***************************************"
Write-Host "Copyright (c) 2007-2024 Mohamed Hassan" -ForegroundColor Yellow
Write-Host "Functional Consultant - Microsoft Dynamics 365 Business Central & LS Retail" -ForegroundColor Yellow
Write-Host "Contact: 01025329288" -ForegroundColor Yellow
Write-Host "LinkedIn: https://www.linkedin.com/in/mohamed-hassan-3158b9b1/" -ForegroundColor Yellow
Write-Host "YouTube: https://www.youtube.com/@Medasofit" -ForegroundColor Yellow
Write-Host "All rights reserved." -ForegroundColor Yellow




# 1. إعداد سياسة التنفيذ للسماح بتشغيل السكربتات غير الموقعة
Set-ExecutionPolicy Unrestricted -Force

# 2. استيراد وحدة إدارة تطبيقات Dynamics 365 Business Central
Import-Module "C:\Program Files\Microsoft Dynamics 365 Business Central\210\Service\NavAdminTool.ps1"

# 3. تحديد مسار المجلد الذي يحتوي على تطبيقات .app
$appsFolderPath = "C:\apps"

# 4. الحصول على جميع التطبيقات (.app) في المجلد
$apps = Get-ChildItem -Path $appsFolderPath -Filter *.app

# 5. حلقة لتكرار جميع التطبيقات ونشرها، مزامنتها، ثم تثبيتها
foreach ($app in $apps) {
    # استخراج اسم التطبيق من المسار الكامل
    $appName = $app.Name

    # طباعة رسالة توضح اسم التطبيق الذي سيتم نشره
    Write-Host "Publishing app: $appName"

    # 6. نشر التطبيق
    Publish-NAVApp -ServerInstance moh -Path $app.FullName -SkipVerification

    # 7. استخراج اسم التطبيق بدون الإصدار (من خلال تقسيم الاسم)
    $cleanAppName = $appName.Split('_')[1..($appName.Split('_').Length-2)] -join '_'

    # طباعة رسالة توضح اسم التطبيق الذي سيتم مزامنته
    Write-Host "Syncing app: $cleanAppName"

    # 8. مزامنة التطبيق
    Sync-NAVApp -ServerInstance moh -Name $cleanAppName

    # طباعة رسالة توضح اسم التطبيق الذي سيتم تثبيته
    Write-Host "Installing app: $cleanAppName"

    # 9. تثبيت التطبيق
    Install-NAVApp -ServerInstance moh -Name $cleanAppName
}

Write-Host "All apps have been published, synced, and installed successfully!"
