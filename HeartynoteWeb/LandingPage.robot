*** Settings ***
Documentation    Phase-1: Heartynote Landing Page& Options checking
Library  SeleniumLibrary

*** Test Cases ***
Test-1: Opening the Browser
    open browser    ${URL}    ${Browser}
    ${title}=       get title
    title should be     Heartynote | Memorable social network | Online diary
    log to console     ${title}


Test-2: Verify the Goolge playstore link
    click element     ${Playstore}
    ${GoolgeApp_Link}=   get location
    log to console      ${GoolgeApp_Link}
    sleep               2
    should be equal     ${GoolgeApp_Link}      ${link_playstore}
    go back

Test-3: Verify Facebook Link
    click element      ${Facebook}
    ${Fb_Location}=     get location
    log to console      ${Fb_Location}
    should be equal     ${Fb_Location}           ${FB_link}
    sleep               2
    go back

Test-4: Verify Instagram Link
    click element    ${Instragram}
    ${Insta_Location}=     get location
    log to console      ${Insta_Location}
    should be equal     ${Insta_Location}       ${Instagram}
    sleep               3
    go back

Test-5: Verify private policy link
    click element          ${Privicy policy}
    ${pricate_policy}=     get location
    log to console         ${private_policy}
    should be equal        ${private_policy}       ${private_policy}
    sleep                  5
    ${Text_Verification}=     Get text      ${Privacy_text}
    log to console         ${Text_Verification}
    go back
    sleep                  3

Test-6: Hearty TV,Hub,Status Images Hight & Width comparsions verification
    ${status_image_height}=     Get Element size    ${Status_Img}
    log to console      ${status_image_height}

    ${hug_image_height}=     Get Element size    ${Hug_image}
    log to console      ${hug_image_height}

    ${TV_image_height}=     Get Element size    ${Hearty_TV}
    log to console      ${hug_image_height}


Test-7: Text Verifications for Hub,TV and Status
    ${Verify_Status}=    Get text    ${Text_Hearty}
    log to console    ${Verify_Status}
    should be equal  ${Verify_Status}       Let hearty people know what you are feeling now or currently occupied with.

    ${Hub_Status}=    Get text    ${Text_Hub}
    log to console    ${Hub_Status}
    should be equal  ${Hub_Status}       A place to store your notes. Save all your notes in different hubs according to your convenience.

    ${TV_Status}=    Get text    ${Text_TV}
    log to console    ${TV_Status}
    should be equal  ${TV_Status}       A place to watch most interesting videos recommended especially for you.


Test-8: Blog & About link verification
    click element       ${Blog}
    ${Bog_link}=    Get location
    log to console      ${Bog_link}
    should be equal     ${Bog_link}         http://blog.heartynote.com/
    sleep               2
    go back

    click element       ${About}
    ${About_link}=    Get location
    log to console      ${About_link}
    should be equal     ${About_link}         http://blog.heartynote.com/
    sleep               2
    go back








#Test: Close the browser
#    close browser

*** Keywords ***
Provided precondition



*** Variables ***

${URL}                    https://heartynote.com/
${Browser}                Chrome

${Playstore}              //img[@class='download']

${link_playstore}         https://play.google.com/store/apps/details?id=com.heartynote.mobileapp.heartynote

${FB_link}                https://www.facebook.com/heartynote

${Instagram}              https://www.instagram.com/heartynote.official/
${private_policy}         https://heartynote.com/privacy_policy.html

${Facebook}               //a[contains(text(),'Facebook')]

${Instragram}             //a[contains(text(),'Instagram')]

${Privicy policy}         //a[contains(text(),'Privacy policy')]

${Privacy_text}           //p[@align='JUSTIFY']

${Status_Img}             //img[@src='/_next/static/images/status-0b68c2ebfb23087aaa90d75c0a60617a.png']

${Hug_image}              //img[@src='/_next/static/images/hub-e20c2afbc587b8cb0fe23af40f192bfc.png']

${Hearty_TV}               //img[@src='/_next/static/images/heartytv-ea61fd7ea2c0cdec4d1fb39f7e3e2dda.png']

${Text_Hearty}             //span[text()='Let hearty people know what you are feeling now or currently occuiped with.']
${Text_Hub}                //span[text()='A place to store your notes. Save all your notes in different hubs according to your convenience.']
${Text_TV}                 //span[text()='A place to watch most interesting videos recommended espcially for you.']

${Blog}                    //a[contains(text(),'Blog')]
${About}                    //a[contains(text(),'About')]