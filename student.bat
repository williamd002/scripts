CLS
$exitLoop = $false
#This script will reset the students profile
          
do
{
        write-host 'What is the Students username that you wish to reset?'
        $user = Read-host
        Write-Host 'what intake year is the student?'
        $intakeyear = Read-host
        $domain = "princethorpe.local"
        Write-Host -ForegroundColor yellow "This will remove" $user"'s" "folders from the students server!!!" 
        $confirmation = read-Host 'Are you sure that you wish to go ahead with this?'
        if ($confirmation -eq 'n') 
        {                
            Write-Host -f Red '======================================================='
            Write-Host -f Red '===== OPERATION: RESET CANCELLED & CLOSING PROGRAM====='
            Write-Host -f Red '======================================================='
            $exitLoop = $true
        }
        if ($confirmation -eq 'y') 
        {
            #Appdata&profile
#----------------------------------------------------------- CHECKING DIRECTORY-------------------------------------------------------------
                # Check  and set a variable to = true
                $VarTP_App = Test-Path C:\RemotetestD\USERS\Students\AppData\$user
                if ($VarTP_App -eq $true) 
                {
                    #$VarTP_App = Test-Path "C:\RemotetestD\USERS\Students\AppData\" + $user
                    Write-Host “**Users AppData Folder is present**”
                }
                Else 
                {
                    Write-Host -ForegroundColor yellow "Unable to locate" $user"'s" "AppData folder from the students server!!! Folder NOT Present! Please check username and try again."
                }
                #check to see if the profile folder is present
                $VarTP_Pro = Test-Path "D:\ROAMING\PROFILE\STUDENTPROFILE\RP"+$intakeyear+'\'+$user+'PROFILE.V2'
                if ($VarTP_Pro -eq $true) 
                {
                    Write-Host “**The Users' Profile Folder is present**”
                }
                Else 
                {
                    Write-Host -ForegroundColor yellow "Unable to locate" $user"'s" "Profile folder from the students server!!! Folder NOT Present! Please check username and try again."
                }

                $VarTP_TS = Test-Path D:\ROAMING\TSPROFILE\$user
                if ($VarTP_TS -eq $true) 
                {
                    Write-Host “**Users tsprofile Folder is present**”
                }
                Else 
                {
                    Write-Host -ForegroundColor yellow "Unable to locate" $user"'s" "tsprofile folder from the students server!!! Folder NOT Present! Please check username and try again."
                }
#-----------------------------------------------------------DELETING APPDATA AND PROFILE FOLDERS----------------------------------------------
                
                # if the variable is true to the above then run this
                If ($VarTP_App -eq $true) 
                {
                    #Write-Host “Users Folder is present” 
                    Write-Host -f yellow '=================================================================='
                    Write-Host -f yellow '===== OPERATION DELETE: APPDATA IS PRESENT! REMOVING FOLDER! ====='
                    Write-Host -f yellow '=================================================================='
                    Remove-Item D:\ROAMING\APPLICATIONDATA\STUDENTAPPLICATIONDATA\$user #-recurse <--this option deletes without popups
                }
                Else 
                {
                    Write-Host -f Red '========================================================================'
                    Write-Host -f Red '===== OPERATION DELETE: APPDATA IS NOT PRESENT! DELETION CANCELLED ====='
                    Write-Host -f Red '========================================================================'
                }

                If ($VarTP_Pro -eq $true) 
                {
       
                    Write-Host -f yellow '==========================================================='
                    Write-Host -f yellow '===== OPERATION: PROFILE IS PRESENT! REMOVING FOLDER! ====='
                    Write-Host -f yellow '==========================================================='
                    Remove-Item D:\ROAMING\PROFILE\STUDENTPROFILE\$user #-recurse
                }                
                Else 
                {
                    Write-Host -f Red '========================================================================'
                    Write-Host -f Red '===== OPERATION DELETE: PROFILE IS NOT PRESENT! DELETION CANCELLED ====='
                    Write-Host -f Red '========================================================================'
                }
                 
                 #Once this is completed then test the path to ensure that the directory is removed then display message removed successfully.
                $VarTP_AppRE = Test-Path D:\ROAMING\APPLICATIONDATA\STUDENTAPPLICATIONDATA\$user
                If ($VarTP_AppRE -eq $flase) 
                {
                    
                    Write-Host -f yellow '===================================================================='
                    Write-Host -f yellow '===== OPERATION: APPDATA IS NOT PRESENT! SUCCESSFULLY REMOVED! ====='
                    Write-Host -f yellow '===================================================================='
                }
                Else
                {
                    #$VarTP_AppRE = Test-Path C:\RemotetestD\USERS\Students\appdata\$user
                    Write-Host -f RED '========================================================================'
                    Write-Host -f RED '===== OPERATION: APPDATA IS STILL PRESENT! UNSUCCESSFULLY REMOVED! ====='
                    Write-Host -f RED '========================================================================'
                }

                If ($VarTP_ProRE -eq $flase) 
                {
                    $VarTP_ProRE = Test-Path D:\ROAMING\PROFILE\STUDENTPROFILE\$user
                    Write-Host -f yellow '===================================================================='
                    Write-Host -f yellow '===== OPERATION: PROFILE IS NOT PRESENT! SUCCESSFULLY REMOVED! ====='
                    Write-Host -f yellow '===================================================================='
                }
                
                elseif ($VarTP_ProRE -eq $true) 
                {
                    $VarTP_ProRE = Test-Path D:\ROAMING\PROFILE\STUDENTPROFILE\$user
                    Write-Host -f RED '========================================================================'
                    Write-Host -f RED '===== OPERATION: PROFILE IS STILL PRESENT! UNSUCCESSFULLY REMOVED! ====='
                    Write-Host -f RED '========================================================================'
                }

               
                #ELSE
                #if the varaiable is false then 
               # Write-Host -ForegroundColor yellow "Unable to remove" $user"'s" "from the students server!!! Please check username and try again." 

#-----------------------------------------------------------DELETING TSFOLDER FOLDERS----------------------------------------------      
            #TSProfile
            if ($ValTPTS = $true) 
            {
                $ValTPTS = Test-Path D:\ROAMING\TSPROFILE\$user
            }
            elseif ($ValTPTS = $true)
            {
                    Remove-Item D:\ROAMING\TSPROFILE\$user -recurse
            }
            else {
                Write-Host -f Red '===================================================================='
                Write-Host -f Red '===== OPERATION: TSPROFILE IS NOT PRESENT! NO DIRECTORY FOUND! ====='
                Write-Host -f Red '===================================================================='
            }

           $quit = read-Host 'Would you like to remove another student?'
            if ($quit -eq 'n') 
           {
              Write-Host -f Red '======================================='
              Write-Host -f Red '===== OPERATION: Program Quitting ====='
              Write-Host -f Red '======================================='
              return
           }
           else {
               $exitLoop = $false
           }

        }
        

        
} while($exitLoop -eq $false)