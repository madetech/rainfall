// require_relative 'rainfall'
//
// RSpec.describe 'Rainfall' do
//   it 'should calculate volumes correctly' do
//     expect(Rainfall.new.calculate([2, 1, 2])).to eq(1)
//     expect(Rainfall.new.calculate([1, 2])).to eq(0)
//     expect(Rainfall.new.calculate([5, 1])).to eq(0)
//     expect(Rainfall.new.calculate([2, 5, 1, 2, 3, 4, 7, 7, 6])).to eq(10)
//     expect(Rainfall.new.calculate([2, 5, 1, 3, 1, 2, 1, 7, 7, 6])).to eq(17)
//     expect(Rainfall.new.calculate([2, 7, 2, 7, 4, 7, 1, 7, 3, 7])).to eq(18)
//     expect(Rainfall.new.calculate([6, 7, 7, 4, 3, 2, 1, 5, 2])).to eq(10)
//     expect(Rainfall.new.calculate([2, 5, 1, 2, 3, 4, 7, 7, 6, 2, 7, 1, 2, 3, 4, 5, 5, 4])).to eq(26)
//   end
// end

var expect = require("chai").expect;

function expectNoWallsToReturnZeroVolume () {
  expect(getRainfallVolume([])).to.equal(0);
}

describe("the rainfall volume calculator", function(){
  describe("given there no walls", function(){
    it("returns zero volume", expectNoWallsToReturnZeroVolume)
  })

  describe('given there is one wall', function () {
    it('returns zero volume', expectNoWallsToReturnZeroVolume);
  });

  describe('given there are two walls separated by one of height 1', function () {
    it('should return one', function () {
      expect(getRainfallVolume([1, 0, 1])).to.equal(1);
    });
  });

  describe('given there are two walls of different height', function () {
    it('should return the lowest wall', function () {
      expect(getRainfallVolume([3, 0, 1])).to.equal(1);
    });
  });
})


function getRainfallVolume(walls){
  var totalVolume = 0;

  for(var i = 0; i < walls.length; i++){
    var thisWallHeight = walls[i];

    var previousHighestWallHeight = Math.max.apply(null, walls.slice(0, i));
    var nextHighestWallHeight = Math.max.apply(null, walls.slice(i, walls.length-i));
    var lowestOfTheHighest = Math.min(previousHighestWallHeight, nextHighestWallHeight);
    totalVolume += lowestOfTheHighest;
  }

  return totalVolume;
}
