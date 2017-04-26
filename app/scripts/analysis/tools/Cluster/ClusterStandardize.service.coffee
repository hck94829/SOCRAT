'use strict'

BaseModuleDataService = require 'scripts/BaseClasses/BaseModuleDataService.coffee'

function getLength(data) {
    size = data.length;
    for (var i = 0; i < size; i++) {
        sum += data[i]*data[i];
    }
    return Math.sqrt(sum);
}

function standardDeviation(values){
    var avg = average(values);

    var squareDiffs = values.map(function(value){
        var diff = value - avg;
        var sqrDiff = diff * diff;
        return sqrDiff;
    });

    var avgSquareDiff = average(squareDiffs);

    var stdDev = Math.sqrt(avgSquareDiff);
    return stdDev;
}

function average(data){
    var sum = data.reduce(function(sum, value){
        return sum + value;
    }, 0);

    var avg = sum / data.length;
    return avg;
}

function standardize() {
    len = data.length;
    results = []
    sd = standardDeviation(data)
    mean = average(data)
	for (var j = 0; j < len; j++) {
        row = data[j];
        results.push(row - mean / sd);
    }
    return results;
};


function scale() {
    len = data.length;
    results = []
	for (var j = 0; j < len; j++) {
      row = data[j];
      results.push(row / getLength(row));
    }
    return results;
};
