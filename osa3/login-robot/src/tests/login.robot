*** Settings ***
Resource  resource.robot
Test Setup  Create User  kalle  kalle123

*** Test Cases ***
Login With Correct Credentials
    Input Login Command
    Input Credentials  kalle  kalle123
    Run Application
    Output Should Contain  Logged in

Register With Valid Username And Password
    Input New Command
    Input Credentials  mikko  mikko123
    Run Application
    Output Should Contain  New user registered

Register With Already Taken Username And Valid Password
    Input New Command
    Input Credentials  kalle  kalle321
    Run Application
    Output Should Contain  User with username kalle already exists

Register With Too Short Username And Valid Password
    Input New Command
    Input Credentials  ka  ka123
    Run Application
    Output Should Contain  Username is too short

Register With Enough Long But Invalid Username And Valid Password
    Input New Command
    Input Credentials  kalle!  kalle!123
    Run Application
    Output Should Contain  Username has invalid characters

Register With Valid Username And Too Short Password
    Input New Command
    Input Credentials  timo  timo123
    Run Application
    Output Should Contain  Password is too short

Register With Valid Username And Long Enough Password Containing Only Letters
    Input New Command
    Input Credentials  aleksander  aleksander
    Run Application
    Output Should Contain  Password must have other characters
