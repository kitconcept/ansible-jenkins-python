*** Variables ***

${HOSTNAME}             127.0.0.1
${PORT}                 8080
${SERVER}               http://${HOSTNAME}:${PORT}
${BROWSER}              firefox
${FF_PROFILE_DIR}       ${CURDIR}/etc/ff_profile_dir


*** Settings ***

Documentation   Ansible Role Jenkins Plone
Library         Selenium2Library  timeout=10  implicit_wait=0
Library         DebugLibrary
Suite Setup     Open Browser  ${SERVER}  ${BROWSER}
Suite Teardown  Close Browser


*** Keywords ***


*** Test Cases ***

Test Jenkins Is Up and Running
  Go To  ${SERVER}
  Wait until page contains  Jenkins
  Page Should Contain  Jenkins

Test Jenkins Home Setting
  Go To  ${SERVER}/configure
  Wait until page contains element  xpath=//input[@name='_.url']
  Page should contain  /var/lib/jenkins

Test Jenkins Xvfb Plugin is installed
  Go to  ${SERVER}/pluginManager/installed
  Wait until page contains element  css=#plugins
  Page should contain  Xvfb plugin
  Page should contain element  xpath=//a[@href='http://wiki.jenkins-ci.org/display/JENKINS/Xvfb+Plugin']

Test Jenkins Green Balls Plugin is installed
  Go to  ${SERVER}/pluginManager/installed
  Wait until page contains element  css=#plugins
  Page should contain  Green Balls
  Page should contain element  xpath=//a[@href='http://wiki.jenkins-ci.org/display/JENKINS/Green+Balls']

Test Jenkins Robot Framework Plugin is installed
  Go to  ${SERVER}/pluginManager/installed
  Wait until page contains element  css=#plugins
  Page should contain  Robot Framework plugin
  Page should contain element  xpath=//a[@href='http://wiki.jenkins-ci.org/display/JENKINS/Robot+Framework+Plugin']

Test Jenkins Git Plugin is installed
  Go to  ${SERVER}/pluginManager/installed
  Wait until page contains element  css=#plugins
  Page should contain  Git plugin
  Page should contain element  xpath=//a[@href='http://wiki.jenkins-ci.org/display/JENKINS/Git+Plugin']

Test Jenkins Pipeline Plugin is installed
  Go to  ${SERVER}/pluginManager/installed
  Wait until page contains element  css=#plugins
  Page should contain  Pipeline
  Page should contain element  xpath=//a[@href='https://wiki.jenkins-ci.org/display/JENKINS/Pipeline+Plugin']

Test Pipeline Job can be created
  Go to  ${SERVER}/newJob
  Wait until page contains element  css=#name
  Page should contain  Pipeline

Test Jenkins Violations Plugin is installed
  Go to  ${SERVER}/pluginManager/installed
  Wait until page contains element  css=#plugins
  Page should contain  Violations

Test Jenkins URL Setting
  Go To  ${SERVER}/configure
  Wait until page contains element  xpath=//input[@name='_.url']
  Textfield value should be  xpath=//input[@name='_.url']  jenkins.kitconcept.com

Test Jenkins Admin E-mail Address Setting
  Go To  ${SERVER}/configure
  Wait until page contains element  xpath=//input[@name='_.adminAddress']
  Textfield value should be  xpath=//input[@name='_.adminAddress']  info@kitconcept.com

Test Jenkins Mail SMTP Server Settings
  Go To  ${SERVER}/configure
  Wait until page contains element  xpath=//input[@name='_.smtpServer']
  Textfield value should be  xpath=//input[@name='_.smtpServer']  localhost

Test Jenkins Mail Default Suffix Setting
  Go To  ${SERVER}/configure
  Wait until page contains element  xpath=//input[@name='_.smtpServer']
  Textfield value should be  xpath=//input[@name='_.defaultSuffix']  @localhost

Test Jenkins SMTP Auth Setting
  Go To  ${SERVER}/configure
  Wait until page contains element  xpath=//input[@name='_.smtpServer']
  Checkbox Should Be Selected  xpath=//input[@name='useSMTPAuth']

Test Jenkins SMTP Auth Username Setting
  Go To  ${SERVER}/configure
  Wait until page contains element  xpath=//input[@name='_.smtpServer']
  Textfield value should be  xpath=//input[@name='_.smtpAuthUserName']  stollenwerk@kitconcept.com

Test Jenkins SMTP Port Setting
  Go To  ${SERVER}/configure
  Wait until page contains element  xpath=//input[@name='_.smtpServer']
  Textfield value should be  xpath=//input[@name='_.smtpPort']  25

Test Jenkins SMTP Reply-To Setting
  Go To  ${SERVER}/configure
  Wait until page contains element  xpath=//input[@name='_.smtpServer']
  Textfield value should be  xpath=//input[@name='_.replyToAddress']  no-reply@localhost

Test Jenkins SMTP SSL Enabled Setting
  Go To  ${SERVER}/configure
  Wait until page contains element  xpath=//input[@name='_.smtpServer']
  Checkbox Should Not Be Selected  xpath=//input[@name='_.useSsl']

Test Jenkins Number of executors to 1
  Go To  ${SERVER}/configure
  Wait until page contains element  xpath=//input[@name='_.numExecutors']
  Page should contain element  xpath=//input[@name='_.numExecutors' and @value='1']

Test Jenkins Job Builder
  Go to  ${SERVER}
  Wait until page contains  Jenkins
  Page should contain  Fancy job name
#  Click link  Fancy job name
#  Wait until page contains  xpath=//input[@name='name']
#  Page should contain  Pipeline name
#  Page should contain  Pipeline DSL Reference
