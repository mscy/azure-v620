# Create a Data CollectorSet object
$CollectorSetName =   "PerfCY"  # this should match the previously created DataColSet name
$dcs = New-Object -COM Pla.DataCollectorSet
# get ( query) DataCollectorSet
# which should return the configured DataCollectorSet object properties
$dcs.Query( $CollectorSetName, $null )

# then, to start the logging
$dcs.Start($false)
