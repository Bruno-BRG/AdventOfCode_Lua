-- Function to extract the first digit from a string
local function extractFirstDigit(str)
    local digit = str:match("%d")
    return digit or ""
end

-- Open the file in read mode
local file = io.open("input.txt", "r")

-- Table to store concatenated digits
local concatenatedDigits = {}

if file then
    for line in file:lines() do
        -- Get the first digit from the beginning of the line
        local firstDigitFromStart = extractFirstDigit(line)

        -- Get the first digit from the end of the line
        local reversedLine = string.reverse(line)
        local firstDigitFromEnd = extractFirstDigit(reversedLine)

        -- Concatenate the digits and store in the table
        local concatenated = firstDigitFromStart .. firstDigitFromEnd
        table.insert(concatenatedDigits, concatenated)

        -- Print the concatenated result
        print(concatenated)
    end

    -- Close the file
    file:close()

    -- Calculate the sum of concatenated digits
    local sum = 0
    for _, digit in ipairs(concatenatedDigits) do
        sum = sum + tonumber(digit)
    end

    print("Sum of concatenated digits:", sum)
else
    print("Failed to open the file")
end
