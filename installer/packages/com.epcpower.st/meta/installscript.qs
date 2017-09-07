function Component()
{
    // default constructor
}

Component.prototype.createOperations = function()
{
    try {
        // call the base create operations function
        component.createOperations();
        if (systemInfo.productType == "windows") { 
            try {
                if (parseInt(systemInfo.productVersion.split(" ", 1)) == 7) {
                    component.addOperation(
                        "Copy",
                        "@TargetDir@/api-ms-win-core-synch-l1-2-0.dll.win7",
                        "@TargetDir@/api-ms-win-core-synch-l1-2-0.dll"
                    );
                }
                component.addOperation("CreateShortcut", "@TargetDir@/maintenancetool.exe", "@StartMenuDir@/Uninstall.lnk",
                    "workingDirectory=@TargetDir@", "iconPath=%SystemRoot%/system32/SHELL32.dll",
                    "iconId=2");
                component.addOperation("CreateShortcut", "@TargetDir@/source/designer.vbs", "@StartMenuDir@/EPyQ - Designer.lnk",
                    "workingDirectory=@TargetDir@/source", "iconPath=@TargetDir@/EPyQ.exe",
                    "iconId=0");
                component.addOperation("CreateShortcut", "@TargetDir@/EPyQ.exe", "@StartMenuDir@/EPyQ.lnk",
                    "workingDirectory=@TargetDir@", "iconPath=@TargetDir@/EPyQ.exe",
                    "iconId=0");

                component.addOperation("CreateShortcut", "@TargetDir@/EPyQ.exe", "@DesktopDir@/EPyQ.lnk",
                    "workingDirectory=@TargetDir@", "iconPath=@TargetDir@/EPyQ.exe",
                    "iconId=0");
                   
                component.addOperation("RegisterFileType",
                                       "epc",
                                       "@TargetDir@/EPyQ.exe '%1'",
                                       "EPyQ device configuration file",
                                       "text/plain",
                                       "@TargetDir@/EPyQ.exe,0",
                                       "ProgId=com.epcpower.epyq.epc");
                component.addOperation("RegisterFileType",
                                       "epz",
                                       "@TargetDir@/EPyQ.exe '%1'",
                                       "EPyQ zipped device configuration package",
                                       "application/zip",
                                       "@TargetDir@/EPyQ.exe,0",
                                       "ProgId=com.epcpower.epyq.epz");
            } catch (e) {
                // Do nothing if key doesn't exist
            }
        }
    } catch (e) {
        print(e);
    }
}
