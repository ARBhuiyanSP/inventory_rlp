<!DOCTYPE html>
<html>
<head>
    <title>Simple Filter Test</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <style>
        body { font-family: Arial; padding: 20px; }
        .container { max-width: 800px; margin: 0 auto; }
        select { padding: 10px; margin: 20px 0; font-size: 16px; width: 300px; }
        .info-box { background: #ecf0f1; padding: 15px; margin: 10px 0; border-radius: 5px; }
        #chart { height: 400px; }
    </style>
</head>
<body>
    <div class="container">
        <h1>🧪 Simple Filter Test</h1>
        
        <h2>Test Warehouse Filter</h2>
        <select id="testWarehouseFilter">
            <option value="all">All Warehouses</option>
            <option value="1">Warehouse A</option>
            <option value="2">Warehouse B</option>
            <option value="3">Warehouse C</option>
        </select>
        
        <div class="info-box">
            <strong>Selected:</strong> <span id="selectedWH">-</span><br>
            <strong>Items:</strong> <span id="items">-</span><br>
            <strong>Value:</strong> ৳<span id="value">-</span>
        </div>
        
        <div id="chart"></div>
        
        <div style="background: #fff3cd; padding: 15px; margin-top: 20px; border-radius: 5px;">
            <h3>Console Output:</h3>
            <div id="console" style="background: white; padding: 10px; font-family: monospace; font-size: 12px;"></div>
        </div>
    </div>

    <script>
    // Sample data
    var testData = {
        '1': {name: 'Warehouse A', item_count: 25, stock_value: 100000},
        '2': {name: 'Warehouse B', item_count: 30, stock_value: 150000},
        '3': {name: 'Warehouse C', item_count: 20, stock_value: 80000}
    };
    
    var allData = [
        {name: 'Warehouse A', y: 100000},
        {name: 'Warehouse B', y: 150000},
        {name: 'Warehouse C', y: 80000}
    ];
    
    var myChart;
    
    function log(msg) {
        var consoleDiv = document.getElementById('console');
        consoleDiv.innerHTML += msg + '<br>';
        console.log(msg);
    }
    
    $(document).ready(function() {
        log('✓ Document ready');
        
        // Create chart
        myChart = Highcharts.chart('chart', {
            chart: { type: 'pie' },
            title: { text: 'Test Chart' },
            series: [{
                name: 'Value',
                data: allData
            }]
        });
        
        log('✓ Chart created');
        
        // Test if dropdown exists
        var dropdown = document.getElementById('testWarehouseFilter');
        log('✓ Dropdown found: ' + (dropdown ? 'YES' : 'NO'));
        
        // Attach event listener
        $('#testWarehouseFilter').on('change', function() {
            var selected = this.value;
            log('→ Dropdown changed to: ' + selected);
            
            document.getElementById('selectedWH').textContent = selected;
            
            if(selected === 'all') {
                var total = 0;
                var items = 0;
                for(var k in testData) {
                    total += testData[k].stock_value;
                    items += testData[k].item_count;
                }
                document.getElementById('items').textContent = items;
                document.getElementById('value').textContent = total.toLocaleString();
                myChart.series[0].setData(allData);
                log('✓ Chart updated with ALL data');
            } else {
                if(testData[selected]) {
                    document.getElementById('items').textContent = testData[selected].item_count;
                    document.getElementById('value').textContent = testData[selected].stock_value.toLocaleString();
                    myChart.series[0].setData([{
                        name: testData[selected].name,
                        y: testData[selected].stock_value
                    }]);
                    log('✓ Chart updated with: ' + testData[selected].name);
                }
            }
        });
        
        log('✓ Event listener attached');
        
        // Initialize
        $('#testWarehouseFilter').val('all').trigger('change');
        log('✓ Initialized with ALL');
        
        log('====================');
        log('READY! Try changing the dropdown above.');
        log('You should see chart update WITHOUT page refresh!');
    });
    </script>
</body>
</html>

