*** Settings ***
Documentation    Phase-1: Heartynote Landing Page& Options checking
Library  SeleniumLibrary

*** Test Cases ***
Test-1: Opening the Browser
    open browser    ${URL}    ${Browser}
    ${title}=       get title
    title should be     Heartynote | Memorable social network | Online diary
    log to console     ${title}

Test-2: Click on TV & Verify the Trending page
    click on TV to move trending page
    ${cur_loc}=     get location
    log to console     ${cur_loc}
    should be equal     ${cur_loc}      https://heartynote.com/trending


Test-3: Hearty TV & Functionalities
    sleep                  3
    get the size of heartyTV


Test-4:PlayVideos on the TV
    sleep                  3
    Wait Until Element Is Visible    ${hearytTVLoad}
    @{locators}=     Get Webelements    ${hearytTVLoad}
    # Create a list and append app config values to list
    @{result}=       Create List
    :FOR   ${locator}   IN    @{locators}
        \       click element       ${locator}
        \       sleep               3
        \       ${shortlink}=       Get Location
        \       log to console      ${shortlink}
                FOR   ${sor}  IN          ${inside}
                    click element         ${sor}
                END

        \       sleep               3
        \       go back

    END




*** Keywords ***

click on TV to move trending page
    click element       //a[@href='/trending']


get the size of heartyTV
    ${size_TV}=  Get Element size        //video[@id='video']
    log to console    ${size_TV}


*** Variables ***

${URL}                    https://heartynote.com
${Browser}                Chrome


${hearytTVLoad}           //div[@id='trending-body']/a

${inside}                 //div[@class='video-wrapper']