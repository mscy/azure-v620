    # PerfLog.ps1
#   Variables
#------------

$ScriptPath       =   $MyInvocation.MyCommand.Path
$ScriptDir        =   Split-Path -Parent $ScriptPath
$CollectorSetName =   "PerfCY"

# Files for input and output
$DataFilePath     = $ScriptDir
$SrvListFile      = $DataFilePath + "\SrvList.csv"
$CountersFile     = $DataFilePath + "\CounterList.csv"

# get Servers and the Performance Counters list

$Counters         = Import-Csv -Path $CountersFile

$AllCountersList = @()


#   Main Program
#---------------
# create a new array for counters (with remote server names)
$hostname = hostname
    $SrvName = "\\" + $hostname
    foreach ($counter in $Counters)
      { $newCounter       = $SrvName + $counter.CntrPath
        $AllCountersList += $newCounter
      }


# Create a Data CollectorSet object
$datacollectorset = New-Object -COM Pla.DataCollectorSet
$datacollectorset.DisplayName = $CollectorSetName
$datacollectorset.Duration = 600                       # total logging duration in seconds
$datacollectorset.SubdirectoryFormat = 0              # alternate value = 1
$datacollectorset.SubdirectoryFormatPattern = $null   # alternate value = "yyyy\-MM"
$datacollectorset.RootPath = $ScriptDir + "\" + $CollectorSetName

# Create a Data Collector object and specify properties
$DataCollector = $datacollectorset.DataCollectors.CreateDataCollector(0)
$DataCollector.LogFileFormat = 0                      # formats are: 0- CSV, 1- TAB, 2- SQL, 3- BIN
$DataCollector.FileName = $CollectorSetName
$DataCollector.FileNameFormat = 0x1
$DataCollector.FileNameFormatPattern = "\-yyyy\-MM\-dd\_\_HH\-mm"
$DataCollector.SampleInterval = 2  # every 30 secs log data
$DataCollector.LogAppend = $false

# assign perf counters to the DataCollector
$DataCollector.PerformanceCounters = $AllCountersList

# specify credentials under which the collecto will operate
# if you're using a service account
# $datacollectorset.SetCredentials($global:U,$global:P)

    # DataCollector scheduling properties (if it is going to run on a schedule)
      #  $StartDate = [DateTime]('2022-07-01 07:00:00')
      #
      #  $NewSchedule = $datacollectorset.schedules.CreateSchedule()
      #  $NewSchedule.Days = 127
      #  $NewSchedule.StartDate = $StartDate
      #  $NewSchedule.StartTime = $StartDate

    # if a schedule is to be used, add the schedule!!! (disabled)
      #  $datacollectorset.schedules.Add($NewSchedule)
try
  {
    # Add the new DataCollector to the DataCollectorSet
    $datacollectorset.DataCollectors.Add($DataCollector)

    # commit the DataCollectorSet (should be visible in the Performance Mnitor mmc)
    $datacollectorset.Commit($CollectorSetName , $null , 0x0003) | Out-Null
    Write-Host "DataCollectorSet is comitted successfully for " + $CollectorSetName
  }
catch [Exception]
  { Write-Host "Exception Caught: " $_.Exception -ForegroundColor Red
  }
