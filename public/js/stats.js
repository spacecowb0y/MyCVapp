var chart;
$(document).ready(function() {
	Highcharts.setOptions({
	    colors: ['#e4f2f9']
	});
   chart = new Highcharts.Chart({
      chart: {
         renderTo: 'stats',
         defaultSeriesType: 'area',
		style: {
			fontFamily: '"Helvetica Neue", Helvetica, Arial, sans-serif', // default font
			fontSize: '12px'
		},
		marginTop: 0
      },
      credits: {
         enabled: false
      },
      legend: {
         enabled: false
      },
      title: {
         text: ''
      },
      subtitle: {
         text: ''
      },
      xAxis: {
         categories: ['Nov 1', 'Nov 2', 'Nov 3', 'Nov 4', 'Nov 5', 'Nov 6 ', 'Nov 7'],
         tickmarkPlacement: 'on',
         title: {
            enabled: false
         },
		gridLineWidth: 1
      },
      yAxis: {
         title: {
            text: ''
         },
         labels: {
            formatter: function() {
               return this.value / 10;
            }
         }
      },
      tooltip: {
         formatter: function() {
            return ''+
                this.x +': '+ Highcharts.numberFormat(this.y, 0, ',') +' millions';
         }
      },
      plotOptions: {
		series: {
            lineColor: '#007dc6',
			marker: {
                fillColor: '#007dc6',
                lineWidth: 1,
                lineColor: null // inherit from series
            }         
        }
      },
      series: [{
         name: 'Visits',
         data: [100, 100, 300, 947, 1402, 3634, 5268],
      }]
   });
});