local Llama = require("@sam/Llama-Herder")

-- Handler for the "Send-Prompt" action
Handlers.add(
    "Send-Prompt-Handler", -- the name of the handler
    { Action = "Send-Prompt-Handler" }, -- The action this handler responds to 
    function(msg)
        -- Set the number of tokens for the AI response
        -- Tokens in Llama 
        -- 20 tokens will generate about 13-15 English words
        -- Significantly based on complexity and vocabulary
        local outputTokens = 20
        
        -- Call the Llama AI Model
        Llama.run(
            -- Pass the user's message as a prompt
            msg.data,
            -- Specify the number of tokens to use for the response
            outputTokens,
            -- Callback function 
            function(generatedText) 
                -- Send AI response to user
                Handlers.utils.reply(msg, generatedText) 

                print("AI sent a message: " .. generatedText)
            end
        )
    end
)
