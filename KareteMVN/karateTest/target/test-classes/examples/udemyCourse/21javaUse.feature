Feature: Java use

  Scenario: Use Java
    * def myClock = Java.type('java.time.LocalDateTime')
    * def createDate = myClock.now() + ''
    * print createDate
    * def expiryDate = myClock.now().plusMinutes(1) + ''
    * print expiryDate
    * def testClock = {firstDate: '#(createDate)', secondDate: '#(expiryDate)'}
    * print testClock
