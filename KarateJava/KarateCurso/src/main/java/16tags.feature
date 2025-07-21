@version=3.4
Feature: use tags

Scenario: test of tags
	* def tags = karate.tags
	* print karate.tags
	* match tags == ['version=3.4']
	* def vals = karate.tagValues
	* print karate.tagValues
	* match vals == { version: ['3.4']}
	
@foo
Scenario: test feature and scenario tag
	* def tags = karate.tags
	* print karate.tags
	* match tags == ['version=3.4','foo']
	* def vals = karate.tagValues
	* print karate.tagValues
	* match vals == { version: ['3.4'], foo: []}
	
@foo=bar
Scenario: test feature and scenario tag
	* def tags = karate.tags
	* print karate.tags
	* match tags == ['foo=bar','version=3.4']
	* def vals = karate.tagValues
	* print karate.tagValues
	* match vals == { version: ['3.4'], foo: ['bar']}

@version=5.6	
Scenario: test feature and scenario tag
	* def tags = karate.tags
	* print karate.tags
	* match tags contains ['version=5.6','version=3.4']
	* def vals = karate.tagValues
	* print karate.tagValues
	* match vals == { version: ['5.6'] }
	
@foo=bar,baz
Scenario: test feature and scenario tag
	* def tags = karate.tags
	* print karate.tags
	* match tags contains ['foo=bar,baz']
	* def vals = karate.tagValues
	* print karate.tagValues
	* match vals == { version: ['3.4'], foo: ['bar', 'baz']}
