Feature: JSON Check

  Scenario: Temperature calculate
    Given def temperature = {celsius: 100, fahrenheit: 212}
    Then match temperature contains {fahrenheit: '#? _ == $.celsius *1.8 + 32'}
    And match temperature == {celsius: '#number', fahrenheit: '#($.celsius *1.8 + 32)'}

  Scenario: Hotels Info
    Given def json =
	"""
	{
		"hotels": [
			{"roomInfo": [{"roomPrice":618}], "total":618},
			{"roomInfo": [{"roomPrice":500}], "total":500}
		]
	}
	"""
    Then match each json.hotels contains {total: '#? _ == _$.roomInfo[0].roomPrice'}
    And match each json.hotels == {roomInfo: '#array', total: '#(_$.roomInfo[0].roomPrice)'}