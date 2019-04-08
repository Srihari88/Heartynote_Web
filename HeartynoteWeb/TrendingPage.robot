*** Settings ***
Documentation    Phase-1: Heartynote Landing Page& Options checking
Library  SeleniumLibrary

*** Test Cases ***
Test-1: Opening the Browser
    open browser    ${URL}    ${Browser}
    ${title}=       get title
    title should be     Heartynote | Memorable social network | Online diary
    log to console     ${title}


Test-2:Username of the opened link
    ${Uname}=   get text    //a[@class='username']
    log to console     ${Uname}

Test-3:Comment&link of the opening link
    ${link_comment}=   get text    //div[@class='stats']
    log to console      ${link_comment}


Test-4:Video Views
    ${Video_views}=     Get text        ${Views}
    log to console      Video views of the video is: ${Video_views}

Test-5: Options
    click element       //a[@class='options']
    ${text_options}=     get text            //div[@class='options-data show']
    log to console       ${text_options}

Test-6: Options for videos
    Wait Until Element Is Visible       ${Options}
    @{locators}=     Get Webelements    ${Options}
    # Create a list and append app config values to list
    @{result}=       Create List
    :FOR   ${locator}   IN    @{locators}
        \       ${opt}=    get text       ${locator}
        \       log to console    ${opt}
    END




Test-7: Close Browser
    close browser




#Test-4:Clicking the User profiles
#    Wait Until Element Is Visible    ${Usersname_link}
#    @{locators}=     Get Webelements    ${Usersname_link}
#    # Create a list and append app config values to list
#    @{result}=       Create List
#    :FOR   ${locator}   IN    @{locators}
#        \       Open Context Menu       ${locator}
#        \       Type With Keys Down     Down
#        \       Click element           ${locator}
#        \       sleep        5
#        \       go back
#        \       sleep        5
#    END

*** Keywords ***
Trending clicking elements
    click element       //div[@class='trending-content']/a


*** Variables ***

${URL}                    https://heartynote.com/n/GiEIIsj283140
${Browser}                Chrome
${Usersname_link}         //div[@class='star-users-content']/a
${Views}                  //div[@class='jsx-3197201476 views']
${Options}                //div[@class='options-data show']/ul/li/a
