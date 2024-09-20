^j:: {  ; This hotkey will trigger the script. Ctrl + J

    interactionCount := 0  ; Initialize interaction counter

    ; Updated coordinates of the captcha
    captchaX := 85  ; X coordinate
    captchaY := 315  ; Y coordinate

    while true {  ; Main loop to continuously send messages and search for new strangers

        ; Send the copied message quickly
        Send("^v")  ; Ctrl+V to paste the copied message
        Send("{Enter}")  ; Press Enter to send the message
        
        ; Press Esc 3 times quickly to search for a new stranger
        Send("{Esc}")
        Sleep(100)  ; Short delay
        Send("{Esc}")
        Sleep(100)
        Send("{Esc}")
        Sleep(100)

        ; Increment interaction counter
        interactionCount += 1

        ; Click the captcha at every 20 messages
        if (interactionCount = 20 || interactionCount = 50) {
            Click(captchaX, captchaY)
            Sleep(500)  ; Brief delay after clicking the captcha
        }

        ; Refresh the page and reset after 50 messages
        if (interactionCount = 50) {
            interactionCount := 0  ; Reset counter

            ; Refresh the page (F5)
            Send("{F5}")
            Sleep(10000)  ; Wait 10 seconds for the captcha to appear

            ; Click the captcha after refreshing
            Click(captchaX, captchaY)
            Sleep(3000)  ; Optional wait after solving the captcha to ensure the page loads
        }

        ; Ensure the page is ready before starting the next interaction
        Sleep(500)  ; Short delay before starting the next interaction
    }
}
