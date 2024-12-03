# Dynamics-365-Business-Central-Automated
Dynamics 365 Business Central Automated App Management Centralized Bulk Deployment PowerShell
Dynamics 365 Business Central Automated App Management Centralized Bulk Deployment PowerShell
Automated App Management in Microsoft Dynamics 365 Business Central Using a Centralized Folder: Bulk Deployment, Synchronization, and Installation

Introduction

In dynamic work environments relying on Microsoft Dynamics 365 Business Central, managing applications and extensions is critical for enhancing operational efficiency. When deploying and installing numerous applications, manual execution becomes a time-consuming and challenging task. To address this, we present an efficient solution using PowerShell and the NavAdminTool.ps1 script, enabling bulk deployment, synchronization, and installation of applications from a centralized folder.


---

Objective

This script is designed to streamline application management in Dynamics 365 Business Central environments via a centralized folder containing all application files (.app). By leveraging the script, all applications in the folder can be deployed, installed, and synchronized in one streamlined step, saving time and minimizing human error.


---

Key Script Steps

1. Setting Execution Policy
Enable unsigned script execution.


2. Importing the NavAdminTool.ps1 Module
Activate the tool that facilitates Dynamics 365 Business Central application management.


3. Defining the Centralized Folder
Specify the folder containing all application files as the central point for operations.


4. Performing Operations on Applications
Deploy, synchronize, and install all applications in bulk from the designated folder.




---

Customer-Centric Advisory Approach

This script provides full automation for application management by:

Deploying and installing all applications in a single folder.

Performing operations with precision and flexibility, eliminating the need for manual intervention.

Reducing repetitive effort, saving time, and boosting efficiency.



---

Benefits for Customers

1. Centralized Application Management
Easily manage all applications from a single folder.


2. Increased Efficiency
Speed up operations and minimize human errors.


3. Flexibility
Adapt the script to suit any work environment.


4. Automation
Eliminate manual execution, saving time and effort.




---

Advisory Approach

The script adopts best practices in automation, prioritizing efficiency and flexibility. From a consulting perspective, we aim to:

Save Time
Enable customers to deploy and install multiple applications in one go, removing the need for manual intervention in each step.

Minimize Human Errors
Automation significantly reduces errors associated with repetitive manual tasks.

Expand Scalability
The script can easily adapt to different environments—whether UAT or Production—by modifying paths and server names.

Customize Operations
Customers can tailor the script to align with specific policies, such as defining commands to execute on applications or excluding specific applications based on criteria.



---

Client Benefits


1. Improved Productivity
Automating deployment and installation enhances team productivity when managing Business Central applications.


2. Reduced Downtime
Streamlined processes save significant time compared to manual operations.


3. Enhanced Consistency
Ensure consistent management of applications across different systems.


4. Secure and Flexible Settings
Adjusting execution policies ensures continuity within a secure and adaptable environment.




---

Conclusion

This script is an invaluable tool for organizations using Microsoft Dynamics 365 Business Central that require automated application management. It allows customers to efficiently perform deployment, synchronization, and installation, saving time and effort while boosting overall system performance.

If you need to customize the script to meet specific requirements or integrate additional commands, it can be easily tailored to accommodate evolving project goals.


---

Hashtags

#Dynamics365BusinessCentral #AutomatedAppManagement #CentralizedDeployment #PowerShellAutomation #ITEfficiency #LearnDynamics365InArabic

#Dynamics365ArabicTraining

#ProfessionalDynamics365Arabic

#ArabicDynamics365Courses

#IT4YOU_MohamedHassan

#MedaSofit_BusinessTech

#MohamedHassan_IT4YOU

#TechChannel_MedaSofit

#Dynamics365_بالعربية

#دورات_Dynamics365_باحتراف

#Dynamics365_للمحترفين_بالعربي

#IT4YOU_محمد_حسن

#MedaSofit_تكنولوجيا_الأعمال

#MOHAMED_HASSAN_IT4YOU

#قناة_التكنولوجيا_محمد_حسن

For more details, check out: https://lnkd.in/d4MAdFcq

Install-NAVApp
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

Uninstall-NAVApp
# إعداد بيئة السكربت
Set-ExecutionPolicy Unrestricted -Force
Import-Module "C:\Program Files\Microsoft Dynamics 365 Business Central\210\Service\NavAdminTool.ps1"

# مسار المجلد الذي يحتوي على التطبيقات .app (إذا كنت بحاجة إليه لاحقًا)
$appsFolderPath = "C:\apps"

# تحديد أسماء التطبيقات يدويًا في هذه المساحة (مساحة مفتوحة لك لإضافة التطبيقات المطلوبة)
$appNames = @(
    "PDC_18",
    "Shaheen Finance",
    "Data Group By Month",
    "Supply Chain",
    "WHT",
    "ALProject1",
    "OLEOReport",
    "Application8",
    "Application9",
    "Application10",
    "Application11",
    "Application12",
    "Application13",
    "Application14",
    "Application15",
    "Application16",
    "Application17",
    "Application18",
    "Application19",
    "Application20",
    "Application21",
    "Application22",
    "Application23",
    "Application24",
    "Application25",
    "Application26",
    "Application27",
    "Application28",
    "Application29",
    "Application30",
    "Application31",
    "Application32",
    "Application33",
    "Application34",
    "Application35",
    "Application36",
    "Application37",
    "Application38",
    "Application39",
    "Application40",
    "Application41",
    "Application42",
    "Application43",
    "Application44",
    "Application45",
    "Application46",
    "Application47",
    "Application48",
    "Application49",
    "Application50"
)

# اسم المثيل الذي تستخدمه في Business Central
$serverInstance = "MOH"

# التكرار على كل تطبيق
foreach ($appName in $appNames) {
    Write-Host "Processing app: $appName"
    
    # التحقق من وجود التطبيق في "Extension Management"
    $extension = Get-NAVAppInfo -ServerInstance $serverInstance -Name $appName -ErrorAction SilentlyContinue

    if ($extension) {
        Write-Host "Uninstalling app: $appName"
        
        # إلغاء التثبيت
        Uninstall-NAVApp -ServerInstance $serverInstance -Name $appName -ErrorAction SilentlyContinue
        Write-Host "App uninstalled: $appName"
        
        # مزامنة التطبيق
        Sync-NavApp -ServerInstance $serverInstance -Name $appName -Mode ForceSync -ErrorAction SilentlyContinue
        Write-Host "App synced: $appName"
        
        # إلغاء النشر
        Unpublish-NAVApp -ServerInstance $serverInstance -Name $appName -ErrorAction SilentlyContinue
        Write-Host "App unpublished: $appName"
    } else {
        Write-Host "App not found: $appName. Skipping uninstall and unpublish."
    }
}
