
                                   ##################################################################
                                   #                           KubeRocket v1                        #
                                   #                               By                               #
                                   #                       Abdullah Almutaywia                      #
                                   #                      mutaywia@hotmail.com                      #
                                   ##################################################################  



# functions --------------------------------------------------

    # to set kubectl shorthand 
        set-alias k kubectl

    # 1- to print kubeRocket Logo



            function kuberocket-logo {
            clear
            echo '                                                                                        

                        🟧🟨🟨 KubeRocket 
                🟧🟧🟨🟨🟨🟨 PowerShell
                🟥🟥🟧🟨🟨🟨🟨 Script v1
            🟧🟥🟥🟥🟧🟨🟨🟨🟨🟨🟨
                    🟥🟧🟨🟨🟨🟨🟨🟧 
                🟥🟥🟥🟧🟨🟨🟧🟨🟥
                🟥🟥🟥🟥🟧🟧🟥🟧🟨🟥
            🟧🟥🟥🟥🟥🟥🟥🟥🟥🟧🟥
                    🟥🟥🟥🟧🟥🟧
                    🟥🟥🟥  🟥🟥
                    🟥       🟥                                     
            '
            }

            kuberocket-logo




    # 2 - rocket icon function 

            Function Write-ColoredText {
                param (
                    [string]$Text,
                    [ConsoleColor]$ForegroundColor,
                    [ConsoleColor]$BackgroundColor
                )

                $TextArray = $Text.ToCharArray()

                foreach ($char in $TextArray) {
                    if ($char -eq " ") {
                        $icon = "🚀"
                        Write-Host $char$icon -NoNewline
                    } else {
                        Write-Host $char -ForegroundColor $ForegroundColor -BackgroundColor $BackgroundColor -NoNewline
                    }
                }
                Write-Host ""
            }



    
    # 3 - pods opreations 

        #pod get

            function pods-list {
                    $cns = kubectl config view --minify| Select-String namespace
                    $cns = $cns -replace '\s+', ''
                    Write-ColoredText "$cns"  -ForegroundColor Whit -BackgroundColor DarkYellow
                    Write-ColoredText "   --------------------------[Pods]----------------------------   "  -ForegroundColor Whit -BackgroundColor Red 
                    kubectl get po |select -Skip 1 | Select-String ' ' | Select-Object  LineNumber, Line| Format-Table -HideTableHeaders
            }         

            set-alias pod pods-list
        
        #pod exec

            function pod-exec { 

                    [int]$podnum = Read-Host "Enter pod number " 
                    [int]$b=1
                    $a=$podnum-$b
                    $podname = kubectl get po |  select -Skip 1| Foreach {($_ -split '\s+',4)[0..0]} | select -Index $a
                    "

                    ------------------ you will use [[  $podname  ]] pod ---------------------

                    "
                    kubectl exec -it $podname sh
                    kubectl exec -it $podname bash
            }         

            set-alias epod pod-exec

        #pod delete

            function pod-delete {
                    pod
                    [int]$podnum = Read-Host "Enter pod number " 
                    [int]$b=1
                    $a=$podnum-$b
                    $podname = kubectl get po |  select -Skip 1| Foreach {($_ -split '\s+',4)[0..0]} | select -Index $a
                    "

                    ------------------ you will delete [[  $podname  ]] pod ---------------------

                    "
                    kubectl delete po $podname 
                    
                    
            }         
                

            set-alias dpod pod-delete
        #pod edit

            function pod-edit {
                    pod
                    [int]$podnum = Read-Host "Enter pod number " 
                    [int]$b=1
                    $a=$podnum-$b
                    $podname = kubectl get po |  select -Skip 1| Foreach {($_ -split '\s+',4)[0..0]} | select -Index $a
                    "

                    ------------------ you will edit [[  $podname  ]] pod ---------------------

                    "
                    kubectl edit po $podname 
                    
                    
            }         
                

            set-alias edpod pod-edit
        #pod logs

            function pod-logs {
                    pod
                    [int]$podnum = Read-Host "Enter pod number " 
                    [int]$b=1
                    $a=$podnum-$b
                    $podname = kubectl get po |  select -Skip 1| Foreach {($_ -split '\s+',4)[0..0]} | select -Index $a
                    "

                    ------------------ you will get logs for [[  $podname  ]] pod ---------------------

                    "
                    kubectl logs $podname 
                    
                    
            }         
                

            set-alias lpod pod-logs

        #pod describe

            function pod-describe {
                    pod
                    [int]$podnum = Read-Host "Enter pod number " 
                    [int]$b=1
                    $a=$podnum-$b
                    $podname = kubectl get po |  select -Skip 1| Foreach {($_ -split '\s+',4)[0..0]} | select -Index $a
                    "

                    ------------------ you will describe  [[  $podname  ]] pod ---------------------

                    "
                    kubectl describe po $podname 
                    
                    
            }         
                

            set-alias depod pod-describe
        #pod events

            function pod-events {
                    pod
                    [int]$podnum = Read-Host "Enter pod number " 
                    [int]$b=1
                    $a=$podnum-$b
                    $podname = kubectl get pod |  select -Skip 1| Foreach {($_ -split '\s+',4)[0..0]} | select -Index $a
                   
                    
                    
                  
                    Write-Host "------------------ You will get events for [$($podname)] pod ---------------------"
                    
                   
                     
                        kubectl get events --field-selector "involvedObject.kind=Pod,involvedObject.name=$($podname)" 
                    
                    
                    
            }         
                

            set-alias evpod pod-events

    # 4 - deployment opreations 

        #deployment get

            function deployment-list {
                    $cns = kubectl config view --minify| Select-String namespace
                    $cns = $cns -replace '\s+', ''
                    Write-ColoredText "$cns"  -ForegroundColor Whit -BackgroundColor DarkYellow
                    Write-ColoredText "   --------------------------[deployment]----------------------------   "  -ForegroundColor Whit -BackgroundColor Red 
                    kubectl get deployment |select -Skip 1 | Select-String ' ' | Select-Object  LineNumber, Line| Format-Table -HideTableHeaders
            }         

            set-alias dep deployment-list

        #deployment delete

            function deployment-delete {
                    dep
                    [int]$depnum = Read-Host "Enter deployment number " 
                    [int]$b=1
                    $a=$depnum-$b
                    $depname = kubectl get deployment |  select -Skip 1| Foreach {($_ -split '\s+',4)[0..0]} | select -Index $a
                    "

                    ------------------ you will delete [[  $depname  ]] deployment ---------------------

                    "
                    kubectl delete deployment $depname 
                    
                    
            }         
                

            set-alias ddep deployment-delete

        #deployment edit

            function deployment-edit {
                    dep
                    [int]$depnum = Read-Host "Enter deployment number " 
                    [int]$b=1
                    $a=$depnum-$b
                    $depname = kubectl get deployment |  select -Skip 1| Foreach {($_ -split '\s+',4)[0..0]} | select -Index $a
                    "

                    ------------------ you will edit [[  $depname  ]] deployment ---------------------

                    "
                    kubectl edit deployment $depname 
                    
                    
            }         
                

            set-alias edep deployment-edit
        #deployment scale

            function deployment-scale {
                    dep
                    [int]$depnum = Read-Host "Enter deployment number " 
                    [int]$scalenum = Read-Host "Enter deployment scale number " 
                    [int]$b=1
                    $a=$depnum-$b
                    $depname = kubectl get deployment |  select -Skip 1| Foreach {($_ -split '\s+',4)[0..0]} | select -Index $a
                    "

                    ------------------ you will scale [[  $depname  ]] to $scalenum replicas  ---------------------

                    "
                    kubectl scale deployment $depname --replicas=$scalenum
                    
                    
            }         
                

            set-alias sdep deployment-scale
        #deployment logs

            function deployment-logs {
                    dep
                    [int]$depnum = Read-Host "Enter deployment number " 
                    [int]$b=1
                    $a=$depnum-$b
                    $depname = kubectl get deployment |  select -Skip 1| Foreach {($_ -split '\s+',4)[0..0]} | select -Index $a
                    "

                    ------------------ you will get logs for [[  $depname  ]] deployment  ---------------------

                    "
                    kubectl logs deployment/$depname 
                    
                    
            }         
                

            set-alias ldep deployment-logs
        #deployment describe

            function deployment-describe {
                    dep
                    [int]$depnum = Read-Host "Enter deployment number " 
                    [int]$b=1
                    $a=$depnum-$b
                    $depname = kubectl get deployment |  select -Skip 1| Foreach {($_ -split '\s+',4)[0..0]} | select -Index $a
                    "

                    ------------------ you will describe [[  $depname  ]] deployment  ---------------------

                    "
                    kubectl describe deployment/$depname 
                    
                    
            }         
                

            set-alias dedep deployment-describe
        #deployment events

            function deployment-events {
                    dep
                    [int]$depnum = Read-Host "Enter deployment number " 
                    [int]$b=1
                    $a=$depnum-$b
                    $depname = kubectl get deployment |  select -Skip 1| Foreach {($_ -split '\s+',4)[0..0]} | select -Index $a
                   
                    
                    
                  
                    Write-Host "------------------ You will get events for [$($depname)] deployment ---------------------"
                    
                   
                     
                        kubectl get events --field-selector "involvedObject.kind=Deployment,involvedObject.name=$($depname)" 
                    
                    
                    
            }         
                

            set-alias evdep deployment-events
            

    # 5 - statefulsets opreations 

        #statefulsets get

            function statefulsets-list {
                    $cns = kubectl config view --minify| Select-String namespace
                    $cns = $cns -replace '\s+', ''
                    Write-ColoredText "$cns"  -ForegroundColor Whit -BackgroundColor DarkYellow
                    Write-ColoredText "   --------------------------[statefulsets]----------------------------   "  -ForegroundColor Whit -BackgroundColor Red 
                    kubectl get statefulsets |select -Skip 1 | Select-String ' ' | Select-Object  LineNumber, Line| Format-Table -HideTableHeaders
            }         

            set-alias sts statefulsets-list

        #statefulsets delete

            function statefulsets-delete {
                    sts
                    [int]$stsnum = Read-Host "Enter statefulsets number " 
                    [int]$b=1
                    $a=$stsnum-$b
                    $stsname = kubectl get statefulsets |  select -Skip 1| Foreach {($_ -split '\s+',4)[0..0]} | select -Index $a
                    "

                    ------------------ you will delete [[  $stsname  ]] statefulsets ---------------------

                    "
                    kubectl delete statefulsets $stsname 
                    
                    
            }         
                

            set-alias dsts statefulsets-delete

        #statefulsets edit

            function statefulsets-edit {
                    sts
                    [int]$stsnum = Read-Host "Enter statefulsets number " 
                    [int]$b=1
                    $a=$stsnum-$b
                    $stsname = kubectl get statefulsets |  select -Skip 1| Foreach {($_ -split '\s+',4)[0..0]} | select -Index $a
                    "

                    ------------------ you will edit [[  $stsname  ]] statefulsets ---------------------

                    "
                    kubectl edit statefulsets $stsname 
                    
                    
            }         
                

            set-alias ests statefulsets-edit
            
        #statefulsets scale

            function statefulsets-scale {
                    sts
                    [int]$stsnum = Read-Host "Enter statefulsets number " 
                    [int]$scaleNumber = Read-Host "Enter statefulsets scale number " 
                    [int]$b=1
                    $a=$stsnum-$b
                    $stsname = kubectl get statefulsets |  select -Skip 1| Foreach {($_ -split '\s+',4)[0..0]} | select -Index $a
                    "

                    ------------------ you will scale [[  $stsname  ]] statefulsets to $scaleNumber replicas ---------------------

                    "
                    kubectl scale statefulsets $stsname --replicas=$scaleNumber 
                    
                    
            }         
                

            set-alias ssts statefulsets-scale
    
    # 6 - replicasets opreations
    # 7 - service opreations


        #service get

            function service-list {
                    $cns = kubectl config view --minify| Select-String namespace
                    $cns = $cns -replace '\s+', ''
                    Write-ColoredText "$cns"  -ForegroundColor Whit -BackgroundColor DarkYellow
                    Write-ColoredText "   --------------------------[service]----------------------------   "  -ForegroundColor Whit -BackgroundColor Red 
                    kubectl get svc |select -Skip 1 | Select-String ' ' | Select-Object  LineNumber, Line| Format-Table -HideTableHeaders
            }         

            set-alias svc service-list

        #service delete

            function service-delete {
                    svc
                    [int]$svcnum = Read-Host "Enter service number " 
                    [int]$b=1
                    $a=$svcnum-$b
                    $svcname = kubectl get svc |  select -Skip 1| Foreach {($_ -split '\s+',4)[0..0]} | select -Index $a
                    "

                    ------------------ you will delete [[  $svcname  ]] service ---------------------

                    "
                    kubectl delete svc $svcname 
                    
                    
            }         
                

            set-alias dsvc service-delete

        #service edit

            function service-edit {
                    svc
                    [int]$svcnum = Read-Host "Enter replicasets number " 
                    [int]$b=1
                    $a=$svcnum-$b
                    $svcname = kubectl get svc |  select -Skip 1| Foreach {($_ -split '\s+',4)[0..0]} | select -Index $a
                    "

                    ------------------ you will edit [[  $svcname  ]] service ---------------------

                    "
                    kubectl edit svc $svcname 
                    
                    
            }         
                

            set-alias esvc service-edit

    # 8 - ingress opreations

        #ingress get

            function ingress-list {
                    $cns = kubectl config view --minify| Select-String namespace
                    $cns = $cns -replace '\s+', ''
                    Write-ColoredText "$cns"  -ForegroundColor Whit -BackgroundColor DarkYellow
                    Write-ColoredText "   --------------------------[ingress]----------------------------   "  -ForegroundColor Whit -BackgroundColor Red 
                    kubectl get ing |select -Skip 1 | Select-String ' ' | Select-Object  LineNumber, Line| Format-Table -HideTableHeaders
            }         

            set-alias ing ingress-list

        #ingress delete

            function ingress-delete {
                    ing
                    [int]$ingnum = Read-Host "Enter ingress number " 
                    [int]$b=1
                    $a=$ingnum-$b
                    $ingname = kubectl get ing |  select -Skip 1| Foreach {($_ -split '\s+',4)[0..0]} | select -Index $a
                    "

                    ------------------ you will delete [[  $ingname  ]] ingress ---------------------

                    "
                    kubectl delete ing $ingname 
                    
                    
            }         
                

            set-alias ding ingress-delete

        #ingress edit
    # 9 - configMaps opreations

        #configMaps get

            function configMaps-list {
                    $cns = kubectl config view --minify| Select-String namespace
                    $cns = $cns -replace '\s+', ''
                    Write-ColoredText "$cns"  -ForegroundColor Whit -BackgroundColor DarkYellow
                    Write-ColoredText "   --------------------------[configMaps]----------------------------   "  -ForegroundColor Whit -BackgroundColor Red 
                    kubectl get cm |select -Skip 1 | Select-String ' ' | Select-Object  LineNumber, Line| Format-Table -HideTableHeaders
            }         

            set-alias cm configMaps-list

        #configMaps delete

            function configMaps-delete {
                    cm
                    [int]$cmnum = Read-Host "Enter configMaps number " 
                    [int]$b=1
                    $a=$cmnum-$b
                    $cmname = kubectl get cm |  select -Skip 1| Foreach {($_ -split '\s+',4)[0..0]} | select -Index $a
                    "

                    ------------------ you will delete [[  $cmname  ]] configMaps ---------------------

                    "
                    kubectl delete cm $cmname 
                    
                    
            }         
                

            set-alias dcm configMaps-delete

        #configMaps edit

            function configMaps-edit {
                    cm
                    [int]$cmnum = Read-Host "Enter configMaps number " 
                    [int]$b=1
                    $a=$cmnum-$b
                    $cmname = kubectl get cm |  select -Skip 1| Foreach {($_ -split '\s+',4)[0..0]} | select -Index $a
                    "

                    ------------------ you will edit [[  $cmname  ]] configMaps ---------------------

                    "
                    kubectl edit cm $cmname 
                    
                    
            }         
                

            set-alias ecm configMaps-edit


        


            
   



    
